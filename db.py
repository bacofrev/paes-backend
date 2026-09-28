"""Postgres connection. The pool is created once on startup
and closed on shutdown."""

import os
from contextlib import asynccontextmanager
from psycopg_pool import AsyncConnectionPool
from psycopg.rows import dict_row
from dotenv import load_dotenv

load_dotenv()

DATABASE_URL = os.environ["DATABASE_URL"]

pool: AsyncConnectionPool | None = None


async def open_pool() -> None:
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


async def close_pool() -> None:
    if pool is not None:
        await pool.close()

@asynccontextmanager
async def read_connection():
    """A pooled connection in autocommit, for requests that only read.

    The database is far away (Supabase us-west-1; ~200 ms per round trip
    from Chile), so round trips are what a request costs, not the queries.
    A normal pool.connection() pays two extra ones just for being a
    transaction: BEGIN before the first statement and COMMIT on the way
    out. In autocommit neither is sent, and combined with con.pipeline()
    several statements travel together: one round trip in total.

    Only for reads — anything that writes more than one statement needs
    the transaction. autocommit is restored before the connection goes
    back to the pool, so the next borrower gets the usual behavior."""
    async with pool.connection() as con:
        await con.set_autocommit(True)
        try:
            yield con
        finally:
            await con.set_autocommit(False)
