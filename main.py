from contextlib import asynccontextmanager
from pydantic import BaseModel
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from typing import Literal
from psycopg.errors import UniqueViolation

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
    context: str
    session_id: str
    response_time_ms: int | None = None


@app.post("/responses")
async def create_response(payload: ResponseIn):
    data = payload.model_dump()

    async with db.pool.connection() as con:
        await con.execute(queries.INSERT_RESPONSE, data)
        await con.execute(
            queries.RECOMPUTE_FOR_ITEM,
            {"student_id": data["student_id"], "item_id": data["item_id"]},
        )

        if payload.context in NO_FEEDBACK or payload.option_id is None:
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