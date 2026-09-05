from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

import db


@asynccontextmanager
async def lifespan(app: FastAPI):
    await db.abrir_pool()
    yield
    await db.cerrar_pool()


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
        estado_db = "ok"
    except Exception as e:
        estado_db = f"error: {type(e).__name__}"
    return {"status": "ok", "db": estado_db}