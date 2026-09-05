"""Conexión a Postgres. El pool se crea una vez al arrancar la app
y se cierra al apagarla."""

import os
from psycopg_pool import AsyncConnectionPool
from psycopg.rows import dict_row
from dotenv import load_dotenv

load_dotenv()

DATABASE_URL = os.environ["DATABASE_URL"]

pool: AsyncConnectionPool | None = None


async def abrir_pool() -> None:
    global pool
    pool = AsyncConnectionPool(
        conninfo=DATABASE_URL,
        min_size=1,
        max_size=4,
        open=False,
        kwargs={
            "row_factory": dict_row,
            "prepare_threshold": None,
        },
    )
    await pool.open(wait=True, timeout=10)


async def cerrar_pool() -> None:
    if pool is not None:
        await pool.close()