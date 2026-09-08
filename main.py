from contextlib import asynccontextmanager
from pydantic import BaseModel

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware

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
