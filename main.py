from contextlib import asynccontextmanager
from pydantic import BaseModel
from fastapi import FastAPI, HTTPException, Response
from fastapi.middleware.cors import CORSMiddleware
from typing import Literal
from psycopg.errors import UniqueViolation
from datetime import datetime, timedelta, timezone

import db
import queries


@asynccontextmanager
async def lifespan(app: FastAPI):
    await db.open_pool()
    yield
    await db.close_pool()


app = FastAPI(lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://paes-frontend.vercel.app",
    ],
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
async def health():
    try:
        async with db.pool.connection() as con:
            await con.execute("select 1")
        db_status = "ok"
    except Exception as e:
        db_status = f"error: {type(e).__name__}"
    return {"status": "ok", "db": db_status}


@app.get("/students/{student_id}/nodes/{node_code}/next")
async def next_item(student_id: str, node_code: str):
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.NEXT_ITEM,
            {"student_id": student_id, "node_code": node_code},
        )
        item = await cur.fetchone()

    if item is None:
        raise HTTPException(status_code=404, detail="sin_items")

    return item


NO_FEEDBACK = {"diagnostic", "mock_exam"}


class ResponseIn(BaseModel):
    student_id: str
    item_id: str
    option_id: str | None = None
    session_id: str
    response_time_ms: int | None = None


@app.post("/responses")
async def create_response(payload: ResponseIn):
    data = payload.model_dump()

    async with db.pool.connection() as con:
        # context is not client input: it is the session's mode, read
        # server-side so a client can't open mock_exam and answer as
        # practice to dodge deferred feedback.
        cur = await con.execute(
            queries.SESSION_BY_ID, {"session_id": payload.session_id}
        )
        session = await cur.fetchone()

        # Ordered on purpose: does it exist, is it open, is it yours.
        # Each question assumes the previous one passed.
        if session is None:
            raise HTTPException(status_code=404, detail="session_not_found")
        if session["status"] != "in_progress":
            raise HTTPException(
                status_code=409, detail="session_not_in_progress"
            )
        if str(session["student_id"]) != payload.student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")

        data["context"] = session["mode"]

        try:
            await con.execute(queries.INSERT_RESPONSE, data)
        except UniqueViolation:
            raise HTTPException(
                status_code=409, detail="item_already_answered_in_session"
            )

        await con.execute(
            queries.RECOMPUTE_FOR_ITEM,
            {"student_id": data["student_id"], "item_id": data["item_id"]},
        )

        if session["mode"] in NO_FEEDBACK or payload.option_id is None:
            return {"recorded": True}

        cur = await con.execute(
            queries.VERDICT, {"option_id": payload.option_id}
        )
        v = await cur.fetchone()

    return {
        "recorded": True,
        "is_correct": v["is_correct"],
        "misconception": None if not v["misconception_code"] else {
            "code": v["misconception_code"],
            "name": v["misconception_name"],
        },
        "remediation": None if not v["remediation_code"] else {
            "code": v["remediation_code"],
            "title": v["remediation_title"],
            "body": v["remediation_body"],
        },
    }


# ---------------------------------------------------------------------
# Sessions
# ---------------------------------------------------------------------

MODES = Literal["diagnostic", "mock_exam", "study", "practice", "review"]

# Modes that target a single node and cannot serve items without one.
NODE_REQUIRED = {"study", "practice"}

# How long a session stays resumable. Measuring modes expire sooner:
# resuming a mock exam the next day measures something else.
SESSION_TTL = {
    "practice": timedelta(hours=24),
    "study": timedelta(hours=24),
    "review": timedelta(hours=24),
    "mock_exam": timedelta(hours=3),
    "diagnostic": timedelta(hours=3),
}


def serialize_session(row) -> dict:
    return {
        "session_id": str(row["id"]),
        "mode": row["mode"],
        "status": row["status"],
        "started_at": row["started_at"],
        "ended_at": row["ended_at"],
    }


class SessionIn(BaseModel):
    student_id: str
    mode: MODES
    node_code: str | None = None
    planned_item_count: int | None = None


@app.post("/sessions", status_code=201)
async def create_session(payload: SessionIn):
    if payload.mode in NODE_REQUIRED and payload.node_code is None:
        raise HTTPException(
            status_code=422,
            detail={"reason": "node_code_required", "mode": payload.mode},
        )

    async with db.pool.connection() as con:
        # A student may only have one open session at a time.
        # This pre-check turns the common case into a readable 409 that
        # carries enough data for the frontend to offer "resume or drop".
        cur = await con.execute(
            queries.CURRENT_SESSION, {"student_id": payload.student_id}
        )
        open_session = await cur.fetchone()

        if open_session is not None:
            raise HTTPException(
                status_code=409,
                detail={
                    "reason": "session_already_open",
                    "session_id": str(open_session["id"]),
                    "mode": open_session["mode"],
                    "node_code": open_session["node_code"],
                    "answered": open_session["answered"],
                },
            )

        # node_code is optional: diagnostic and mock_exam span many nodes.
        # When present it must resolve, otherwise the caller sent a code
        # that does not exist and deserves a 404, not a silent null.
        target_node_id = None
        if payload.node_code is not None:
            cur = await con.execute(
                queries.NODE_ID_BY_CODE, {"node_code": payload.node_code}
            )
            node = await cur.fetchone()
            if node is None:
                raise HTTPException(status_code=404, detail="node_not_found")
            target_node_id = node["id"]

        # The pre-check above loses to a race between two concurrent
        # requests. The unique index is the real guarantee; catching the
        # violation keeps that case a 409 instead of a 500.
        try:
            cur = await con.execute(
                queries.CREATE_SESSION,
                {
                    "student_id": payload.student_id,
                    "mode": payload.mode,
                    "target_node_id": target_node_id,
                    "planned_item_count": payload.planned_item_count,
                },
            )
            session = await cur.fetchone()
        except UniqueViolation:
            raise HTTPException(
                status_code=409,
                detail={"reason": "session_already_open"},
            )

    return {
        "session_id": str(session["id"]),
        "mode": session["mode"],
        "status": session["status"],
        "started_at": session["started_at"],
        "node_code": payload.node_code,
    }


@app.get("/students/{student_id}/sessions/current", status_code=200)
async def current_session(student_id: str, response: Response):
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.CURRENT_SESSION, {"student_id": student_id}
        )
        session = await cur.fetchone()

        if session is None:
            response.status_code = 204
            return

        # Stale sessions are closed here rather than resumed: the unique
        # index would otherwise leave the student locked out forever.
        age = datetime.now(timezone.utc) - session["started_at"]
        if age > SESSION_TTL[session["mode"]]:
            await con.execute(
                queries.CLOSE_SESSION, {"session_id": session["id"], "status": "abandoned"}
            )
            response.status_code = 204
            return

    return {
        "session_id": str(session["id"]),
        "mode": session["mode"],
        "node_code": session["node_code"],
        "started_at": session["started_at"],
        "answered": session["answered"],
    }

@app.post("/sessions/{session_id}/end")
async def end_session(session_id: str, response: Response):
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.SESSION_BY_ID, {"session_id": session_id}
        )
        session = await cur.fetchone()

        if session is None:
            response.status_code = 404
            return {"reason": "session_not_found"}

        # A retry after a timeout is indistinguishable from a double click,
        # and the client's next move is the same either way.
        if session["status"] != "in_progress":
            return serialize_session(session)

        # The button can arrive on a session that expired hours ago. Both
        # doors must agree on how it closed, so the TTL decides here too.
        age = datetime.now(timezone.utc) - session["started_at"]
        status = "abandoned" if age > SESSION_TTL[session["mode"]] else "completed"

        cur = await con.execute(
            queries.CLOSE_SESSION, {"session_id": session_id, "status": status}
        )
        closed = await cur.fetchone()

        # Lost a race against another end. Re-read instead of 500.
        if closed is None:
            cur = await con.execute(
                queries.SESSION_BY_ID, {"session_id": session_id}
            )
            closed = await cur.fetchone()

    return serialize_session(closed)