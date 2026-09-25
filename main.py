import logging
from contextlib import asynccontextmanager
from pydantic import BaseModel
from fastapi import Depends, FastAPI, HTTPException, Response
from fastapi.middleware.cors import CORSMiddleware
from typing import Literal
from psycopg.errors import UniqueViolation
from datetime import datetime, timedelta, timezone

import db
import queries
from auth import get_current_student

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    await db.open_pool()
    yield
    await db.close_pool()


app = FastAPI(lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "https://paes-backend.vercel.app"],
    allow_origin_regex=r"https://.*\.vercel\.app",
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


@app.get("/nodes/{node_code}")
async def get_node(node_code: str, student_id: str = Depends(get_current_student)):
    async with db.pool.connection() as con:
        cur = await con.execute(queries.NODE_BY_CODE, {"node_code": node_code})
        node = await cur.fetchone()

    if node is None:
        raise HTTPException(status_code=404, detail="node_not_found")

    return {"code": node["code"], "name": node["name"]}


# Modes without immediate feedback: no remediation lane is possible
# there (sessions.mode: "there is no remediation mode — remediation is
# a stretch WITHIN a session with immediate feedback"), so it's never
# even queried. Used by both /next (to skip that branch) and
# /responses (to skip computing VERDICT or touching the lane).
NO_FEEDBACK = {"diagnostic", "mock_exam"}


@app.get("/nodes/{node_code}/next")
async def next_item(
    node_code: str,
    session_id: str,
    device_id: str,
    student_id: str = Depends(get_current_student),
):
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.SESSION_BY_ID, {"session_id": session_id}
        )
        session = await cur.fetchone()

        # Same checks as POST /responses: exists, is in_progress, is
        # yours. This endpoint didn't validate that — gap noted in
        # bitacora-2026-09-15-next-item.md — and it's no longer
        # acceptable now that someone else's session_id could also
        # silence another student's lane (bitacora-2026-09-17-carril-next.md §2.3).
        if session is None:
            raise HTTPException(status_code=404, detail="session_not_found")
        if session["status"] != "in_progress":
            raise HTTPException(
                status_code=409, detail="session_not_in_progress"
            )
        if str(session["student_id"]) != student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")
        # Same session, different device (e.g. opened on a second
        # device, or never claimed by anyone yet — active_device_id
        # starts NULL and only a NULL never blocks, so a session that
        # predates this check can't lock its own device out).
        if session["active_device_id"] is not None and session["active_device_id"] != device_id:
            raise HTTPException(status_code=403, detail="session_taken_over")

        # A node in revisit blocks EVERY item — pool or lane — until
        # lesson_viewed fires. Checked before either query runs: this
        # codebase never trusts the client to self-gate (see how
        # mode/context are always server-derived), and it can't be
        # folded into NEXT_ITEM/NEXT_LANE_ITEM's WHERE without changing
        # what "no item found" means for every other caller.
        cur = await con.execute(
            queries.NODE_MASTERY_STATUS_BY_CODE,
            {"student_id": student_id, "node_code": node_code},
        )
        node_mastery = await cur.fetchone()
        if node_mastery is not None and node_mastery["status"] == "revisit":
            raise HTTPException(status_code=409, detail="node_in_revisit")

        item = None
        source = "pool"
        if session["mode"] not in NO_FEEDBACK:
            cur = await con.execute(
                queries.NEXT_LANE_ITEM,
                {
                    "student_id": student_id,
                    "session_id": session_id,
                    "node_code": node_code,
                },
            )
            item = await cur.fetchone()
            if item is not None:
                source = "lane"

        if item is None:
            cur = await con.execute(
                queries.NEXT_ITEM,
                {"session_id": session_id, "node_code": node_code},
            )
            item = await cur.fetchone()

    if item is None:
        raise HTTPException(status_code=404, detail="sin_items")

    result = {
        "id": item["id"],
        "code": item["code"],
        "stem": item["stem"],
        "figure": None if item["figure_code"] is None else {
            "code": item["figure_code"],
            "svg": item["figure_svg"],
        },
        "author_difficulty": item["author_difficulty"],
        "options": item["options"],
        "source": source,
    }
    # Data only, no prebuilt text: the frontend decides what to say.
    # Omitted when the lane item turns out to be from the same node —
    # nothing to explain there.
    if source == "lane" and item["node_code"] != node_code:
        result["item_node_code"] = item["node_code"]
        result["item_node_name"] = item["item_node_name"]

    return result


class ResponseIn(BaseModel):
    item_id: str
    option_id: str | None = None
    session_id: str
    response_time_ms: int | None = None
    device_id: str


async def _active_lane_item(con, student_id, item_id):
    """Does the answered item belong to the remediation of this
    student's lane in turn (the oldest 'active' one by entered_at)? It
    no longer has to be one specific remediation_item: any item from
    that remediation counts, because NEXT_LANE_ITEM can now serve any
    of them depending on the node. Used both to decide
    responses.context and to advance the lane — a single query, not
    two, so the two reads can never disagree."""
    cur = await con.execute(
        queries.ACTIVE_LANE_ITEM,
        {"student_id": student_id, "item_id": item_id},
    )
    return await cur.fetchone()


async def _advance_lane(con, student_id, lane, is_correct):
    """The answered item belongs to the remediation of the lane in
    turn: resolves or locks ITS misconception depending on whether it
    was correct and whether any remediation_item is still unanswered
    in this pass. There's no pointer to move anymore — if at least one
    item is still unanswered, the lane stays 'active' with no write at
    all; the next item to serve is recomputed from scratch on the next
    NEXT_LANE_ITEM call. Decides nothing about other misconceptions —
    that's _trigger_misconception's job, separately."""
    misconception_id = lane["misconception_id"]

    if is_correct:
        await con.execute(
            queries.LANE_RESOLVE,
            {"student_id": student_id, "misconception_id": misconception_id},
        )
        return

    cur = await con.execute(
        queries.LANE_HAS_UNANSWERED_ITEM,
        {
            "student_id": student_id,
            "misconception_id": misconception_id,
            "entered_at": lane["entered_at"],
        },
    )
    has_unanswered = (await cur.fetchone()) is not None
    if not has_unanswered:
        await con.execute(
            queries.LANE_LOCK,
            {"student_id": student_id, "misconception_id": misconception_id},
        )


async def _trigger_misconception(con, student_id, misconception_id):
    """A named error triggers its own lane, no matter which item it
    appeared on — even if that same item was the current-turn lane
    item for ANOTHER misconception and was already handled in
    _advance_lane. LANE_TRIGGER decides on its own whether to insert,
    re-enter, or do nothing (see queries.py) for THIS specific
    misconception."""
    cur = await con.execute(
        queries.MISCONCEPTION_REMEDIATION_READY,
        {"misconception_id": misconception_id},
    )
    ready = (await cur.fetchone()) is not None

    if not ready:
        # A content signal, not a bug: the misconception exists and is
        # being diagnosed, but nobody has written its remediation yet
        # (or wrote it and never published it). Without this log
        # there's no way to know which remediation is missing until
        # someone notices by hand.
        logger.warning(
            "misconception %s triggered with no active remediation "
            "and items: not creating/re-entering the lane",
            misconception_id,
        )
        return

    await con.execute(
        queries.LANE_TRIGGER,
        {"student_id": student_id, "misconception_id": misconception_id},
    )


async def _update_misconception_lane(con, student_id, verdict, lane):
    """A student can have several 'active' lanes at once, one per
    misconception: failing the current-turn item of one doesn't stop
    the chosen distractor from triggering another, different one, in
    parallel. That's why the two things are independent — the second
    doesn't depend on whether there was a lane in turn or which
    misconception it belonged to. Does nothing on its own with
    p_correct/node_mastery: that's still derived by
    recompute_node_mastery from responses, without distinguishing by
    context."""
    if lane is not None:
        await _advance_lane(con, student_id, lane, verdict["is_correct"])

    if verdict["is_correct"] or verdict["misconception_id"] is None:
        return

    await _trigger_misconception(con, student_id, verdict["misconception_id"])


@app.post("/responses")
async def create_response(
    payload: ResponseIn, student_id: str = Depends(get_current_student)
):
    data = payload.model_dump()
    data["student_id"] = student_id

    async with db.pool.connection() as con:
        # We need the mode server-side either way: to not trust the
        # client (a mock_exam can't answer as practice to dodge
        # deferred feedback) and because it decides whether the
        # remediation lane needs to be checked further down.
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
        if str(session["student_id"]) != student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")
        if (
            session["active_device_id"] is not None
            and session["active_device_id"] != payload.device_id
        ):
            raise HTTPException(status_code=403, detail="session_taken_over")

        # context isn't client input either, at this point: it's
        # 'remediation' if the served item is the one that belongs to
        # an active lane for some misconception, otherwise the
        # session's mode. NO_FEEDBACK (diagnostic/mock_exam) has no
        # immediate feedback, so no lane is possible there and it's
        # never even queried.
        lane = None
        if session["mode"] not in NO_FEEDBACK:
            lane = await _active_lane_item(
                con, data["student_id"], data["item_id"]
            )
        data["context"] = "remediation" if lane is not None else session["mode"]

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

        await _update_misconception_lane(con, data["student_id"], v, lane)

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
            "figures": v["remediation_figures"],
        },
        "correct_option": {
            "id": v["correct_option_id"],
            "label": v["correct_option_label"],
        },
    }


# ---------------------------------------------------------------------
# Node events (revisit streak window)
# ---------------------------------------------------------------------

EVENT_TYPES = Literal["lesson_viewed", "remediation_read", "streak_reset"]

# Only these two change what counts as "inside the streak window" —
# remediation_read is recorded for content analytics only and never
# touches node_mastery. Recomputing synchronously in the same
# transaction as the event insert is what prevents a deadlock: /next
# blocks every item while status='revisit', and answering items is the
# only other place recompute_node_mastery runs — so if lesson_viewed
# didn't also recompute inline, nothing would ever clear the status.
WINDOW_RESETTING_EVENTS = {"lesson_viewed", "streak_reset"}


class NodeEventIn(BaseModel):
    event_type: EVENT_TYPES
    session_id: str
    device_id: str
    lesson_code: str | None = None
    remediation_code: str | None = None


@app.post("/nodes/{node_code}/events", status_code=201)
async def create_node_event(
    node_code: str,
    payload: NodeEventIn,
    student_id: str = Depends(get_current_student),
):
    # Shape of the content fields per event_type, checked before
    # touching the DB.
    if payload.event_type == "lesson_viewed":
        if payload.lesson_code is None or payload.remediation_code is not None:
            raise HTTPException(status_code=422, detail="lesson_code_required")
    elif payload.event_type == "remediation_read":
        if payload.remediation_code is None or payload.lesson_code is not None:
            raise HTTPException(status_code=422, detail="remediation_code_required")
    else:  # streak_reset
        if payload.lesson_code is not None or payload.remediation_code is not None:
            raise HTTPException(status_code=422, detail="streak_reset_takes_no_content")

    async with db.pool.connection() as con:
        # Same checks as POST /responses and GET /next: exists, is
        # open, is yours, is this device.
        cur = await con.execute(queries.SESSION_BY_ID, {"session_id": payload.session_id})
        session = await cur.fetchone()

        if session is None:
            raise HTTPException(status_code=404, detail="session_not_found")
        if session["status"] != "in_progress":
            raise HTTPException(status_code=409, detail="session_not_in_progress")
        if str(session["student_id"]) != student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")
        if (
            session["active_device_id"] is not None
            and session["active_device_id"] != payload.device_id
        ):
            raise HTTPException(status_code=403, detail="session_taken_over")

        cur = await con.execute(queries.NODE_ID_BY_CODE, {"node_code": node_code})
        node = await cur.fetchone()
        if node is None:
            raise HTTPException(status_code=404, detail="node_not_found")
        node_id = node["id"]

        lesson_id = lesson_version = remediation_id = remediation_version = None

        if payload.lesson_code is not None:
            cur = await con.execute(
                queries.LESSON_ID_VERSION_BY_CODE, {"lesson_code": payload.lesson_code}
            )
            lesson = await cur.fetchone()
            if lesson is None:
                raise HTTPException(status_code=404, detail="lesson_not_found")
            lesson_id, lesson_version = lesson["id"], lesson["version"]

        if payload.remediation_code is not None:
            cur = await con.execute(
                queries.REMEDIATION_ID_VERSION_BY_CODE,
                {"remediation_code": payload.remediation_code},
            )
            remediation = await cur.fetchone()
            if remediation is None:
                raise HTTPException(status_code=404, detail="remediation_not_found")
            remediation_id, remediation_version = remediation["id"], remediation["version"]

        # Only door while NOT in revisit; once there, lesson_viewed is
        # the only way out. Depends on node_mastery.status at this
        # moment, a different table, so it can't be a constraint.
        if payload.event_type == "streak_reset":
            cur = await con.execute(
                queries.NODE_MASTERY_STATUS_BY_ID,
                {"student_id": student_id, "node_id": node_id},
            )
            mastery = await cur.fetchone()
            if mastery is not None and mastery["status"] == "revisit":
                raise HTTPException(status_code=409, detail="cannot_reset_in_revisit")

        await con.execute(
            queries.INSERT_NODE_EVENT,
            {
                "student_id": student_id,
                "node_id": node_id,
                "event_type": payload.event_type,
                "lesson_id": lesson_id,
                "lesson_version": lesson_version,
                "remediation_id": remediation_id,
                "remediation_version": remediation_version,
            },
        )

        if payload.event_type in WINDOW_RESETTING_EVENTS:
            await con.execute(
                queries.RECOMPUTE_FOR_NODE,
                {"student_id": student_id, "node_id": node_id},
            )

        cur = await con.execute(
            queries.NODE_MASTERY_STATUS_BY_ID,
            {"student_id": student_id, "node_id": node_id},
        )
        mastery = await cur.fetchone()

    return {
        "recorded": True,
        "event_type": payload.event_type,
        "node_status": mastery["status"] if mastery is not None else "not_started",
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
    mode: MODES
    node_code: str | None = None
    planned_item_count: int | None = None
    device_id: str


@app.post("/sessions", status_code=201)
async def create_session(
    payload: SessionIn, student_id: str = Depends(get_current_student)
):
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
            queries.CURRENT_SESSION, {"student_id": student_id}
        )
        open_session = await cur.fetchone()

        if open_session is not None:
            # Whoever calls POST /sessions — first contact from a second
            # device, or "Retomar acá" from one that got locked out —
            # becomes the active device for this session. No separate
            # claim endpoint: this IS the claim. Committed explicitly —
            # the HTTPException raised right below would otherwise leave
            # this write inside the same transaction and roll it back
            # when the connection's context manager exits on exception.
            await con.execute(
                queries.CLAIM_SESSION,
                {"session_id": open_session["id"], "device_id": payload.device_id},
            )
            await con.commit()
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
                    "student_id": student_id,
                    "mode": payload.mode,
                    "target_node_id": target_node_id,
                    "planned_item_count": payload.planned_item_count,
                    "device_id": payload.device_id,
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


@app.get("/sessions/current", status_code=200)
async def current_session(
    response: Response, student_id: str = Depends(get_current_student)
):
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
async def end_session(
    session_id: str,
    response: Response,
    student_id: str = Depends(get_current_student),
):
    async with db.pool.connection() as con:
        cur = await con.execute(
            queries.SESSION_BY_ID, {"session_id": session_id}
        )
        session = await cur.fetchone()

        if session is None:
            response.status_code = 404
            return {"reason": "session_not_found"}
        if str(session["student_id"]) != student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")

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


def node_report(row) -> dict:
    status = row["status"] or "in_progress"
    blocked_by = None

    if status == "in_progress":
        if row["min_items"] is None or (row["items_answered"] or 0) < row["min_items"]:
            blocked_by = "min_items"
        elif row["p_correct"] is not None and row["p_correct"] < row["p_threshold"]:
            blocked_by = "p_threshold"
        elif (row["hard_correct"] or 0) < row["min_hard_correct"]:
            blocked_by = "min_hard_correct"

    return {
        "node_id": row["node_id"],
        "node_code": row["node_code"],
        "node_name": row["node_name"],
        "status": status,
        "p_correct": row["p_correct"],
        "items_answered": row["items_answered"],
        "items_correct": row["items_correct"],
        "hard_correct": row["hard_correct"],
        "blocked_by": blocked_by,
    }


@app.get("/sessions/{session_id}/report")
async def session_report(
    session_id: str, student_id: str = Depends(get_current_student)
):
    async with db.pool.connection() as con:
        cur = await con.execute(queries.SESSION_BY_ID, {"session_id": session_id})
        session = await cur.fetchone()

        if session is None:
            raise HTTPException(status_code=404, detail="session_not_found")
        if str(session["student_id"]) != student_id:
            raise HTTPException(status_code=403, detail="session_not_yours")

        cur = await con.execute(
            queries.SESSION_RESPONSE_COUNT, {"session_id": session_id}
        )
        answered = (await cur.fetchone())["answered"]

        cur = await con.execute(
            queries.SESSION_REPORT_NODES,
            {"session_id": session_id, "student_id": session["student_id"]},
        )
        rows = await cur.fetchall()

    return {
        **serialize_session(session),
        "planned_item_count": session["planned_item_count"],
        "answered": answered,
        "nodes": [node_report(row) for row in rows],
    }