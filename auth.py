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


def _student_from_token(authorization: str | None) -> str:
    """Validates the bearer JWT against Supabase's published JWKS
    (asymmetric ES256 — no shared secret to leak) and returns the uuid
    from its `sub` claim, which is students.id after migration 033.
    Touches no database."""
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

    return payload["sub"]


def _reject_deleted(row) -> None:
    # A valid token doesn't mean an active student: deleted_at survives
    # the token's own expiry window, and students_id_fkey no longer
    # cascades a delete away (migration 035) — soft delete is now the
    # only door, and this is what makes it mean something.
    if row is not None and row["deleted_at"] is not None:
        raise HTTPException(status_code=403, detail="student_deleted")


async def get_current_student(authorization: str | None = Header(default=None)) -> str:
    """FastAPI dependency: the source of student identity for every
    endpoint that writes. JWT first, then the soft-delete check, on a
    read connection (one round trip, no BEGIN/COMMIT around it)."""
    student_id = _student_from_token(authorization)

    async with db.read_connection() as con:
        cur = await con.execute(
            queries.STUDENT_DELETED_AT, {"student_id": student_id}
        )
        _reject_deleted(await cur.fetchone())

    return student_id


class StudentReads:
    """What a read-only endpoint gets instead of a bare student_id: the
    identity from the token, and fetch(), which runs the soft-delete
    check TOGETHER with the endpoint's own queries in a single round
    trip (pipeline, autocommit). The check still decides first — if the
    student is deleted, nothing fetched is returned. An endpoint on this
    dependency must read only through fetch(); that's what keeps the
    soft delete enforced without paying a round trip of its own."""

    def __init__(self, student_id: str):
        self.student_id = student_id

    async def fetch(self, *reads: tuple[str, dict]) -> list[list[dict]]:
        async with db.read_connection() as con:
            async with con.pipeline():
                deleted = await con.execute(
                    queries.STUDENT_DELETED_AT, {"student_id": self.student_id}
                )
                cursors = [await con.execute(sql, params) for sql, params in reads]
            _reject_deleted(await deleted.fetchone())
            return [await cur.fetchall() for cur in cursors]


async def read_as_student(authorization: str | None = Header(default=None)) -> StudentReads:
    """FastAPI dependency for endpoints that only read: see StudentReads."""
    return StudentReads(_student_from_token(authorization))
