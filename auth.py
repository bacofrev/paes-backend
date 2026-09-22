"""Student identity, derived from a Supabase Auth JWT — never from the
client's request body or query params. See get_current_student."""

import logging
import os

import jwt
from fastapi import Header, HTTPException
from jwt import PyJWKClient

import db
import queries

logger = logging.getLogger(__name__)

SUPABASE_JWKS_URL = os.environ["SUPABASE_JWKS_URL"]

# PyJWKClient caches the fetched key set in-process (default lifespan
# 300s) and only refetches on cache miss/expiry, so a request doesn't
# round-trip to Supabase to validate a token. One client for the
# process lifetime, same pattern as db.pool.
_jwk_client = PyJWKClient(SUPABASE_JWKS_URL)


async def get_current_student(authorization: str | None = Header(default=None)) -> str:
    """FastAPI dependency: the only source of student identity for every
    endpoint. Validates the bearer JWT against Supabase's published
    JWKS (asymmetric ES256 — no shared secret to leak) and returns the
    uuid from its `sub` claim, which is students.id after migration 033.
    """
    if authorization is None or not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="missing_token")

    token = authorization.removeprefix("Bearer ").strip()

    try:
        signing_key = _jwk_client.get_signing_key_from_jwt(token)
        payload = jwt.decode(
            token,
            signing_key.key,
            algorithms=["ES256"],
            audience="authenticated",
        )
    except jwt.PyJWTError as e:
        logger.info("token rejected: %s", type(e).__name__)
        raise HTTPException(status_code=401, detail="invalid_token")

    student_id = payload["sub"]

    # A valid token doesn't mean an active student: deleted_at survives
    # the token's own expiry window, and students_id_fkey no longer
    # cascades a delete away (migration 035) — soft delete is now the
    # only door, and this is what makes it mean something.
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.STUDENT_DELETED_AT, {"student_id": student_id}
        )
        row = await cur.fetchone()

    if row is not None and row["deleted_at"] is not None:
        raise HTTPException(status_code=403, detail="student_deleted")

    return student_id
