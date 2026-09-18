"""SQL lives here. When item selection moves to IRT,
the diff is this file, not the endpoints."""

NEXT_ITEM = """
select i.id,
       i.code,
       i.stem,
       i.author_difficulty,
       json_agg(
         json_build_object('id', o.id, 'label', o.label, 'body', o.body)
         order by o.label
       ) as options
from items i
join node_items ni on ni.item_id = i.id
join nodes n       on n.id = ni.node_id
join item_options o on o.item_id = i.id
where n.code = %(node_code)s
  and i.status = 'active'
  and not exists (
    select 1 from responses r
    where r.item_id = i.id
      and r.session_id = %(session_id)s
  )
group by i.id, i.code, i.stem, i.author_difficulty
order by i.author_difficulty, i.code
limit 1;
"""

INSERT_RESPONSE = """
insert into responses
  (student_id, item_id, option_id, context, session_id, response_time_ms)
values
  (%(student_id)s, %(item_id)s, %(option_id)s, %(context)s,
   %(session_id)s, %(response_time_ms)s)
returning id;
"""

VERDICT = """
select coalesce(o.is_correct, false) as is_correct,
       m.id    as misconception_id,
       m.code  as misconception_code,
       m.name  as misconception_name,
       r.code  as remediation_code,
       r.title as remediation_title,
       r.body  as remediation_body,
       co.id    as correct_option_id,
       co.label as correct_option_label
from item_options o
left join misconceptions m on m.id = o.misconception_id
left join remediations r   on r.misconception_id = m.id
                          and r.status = 'active'
join item_options co on co.item_id = o.item_id and co.is_correct = true
where o.id = %(option_id)s;
"""

RECOMPUTE_FOR_ITEM = """
select recompute_node_mastery(%(student_id)s::uuid, ni.node_id)
from node_items ni
where ni.item_id = %(item_id)s::uuid
"""

# ---------------------------------------------------------------------
# Remediation lane (student_misconceptions)
# ---------------------------------------------------------------------

# Which lane has the turn: the oldest 'active' one by entered_at
# (tie-broken by misconception_id, so it's deterministic on a
# timestamp tie that in practice never happens). A shared fragment,
# not a standalone query — ACTIVE_LANE_ITEM and NEXT_LANE_ITEM
# concatenate it so the "whose turn is it" logic isn't duplicated.
# Returns entered_at, not position: position no longer lives in this
# table, the next item is derived from responses (see NEXT_LANE_ITEM)
# and entered_at is the cutoff that separates "this pass" from "a
# previous pass".
_CARRIL_EN_TURNO = """
with carril_en_turno as (
  select sm.misconception_id, sm.entered_at
  from student_misconceptions sm
  where sm.student_id = %(student_id)s::uuid
    and sm.status = 'active'
  order by sm.entered_at, sm.misconception_id
  limit 1
)
"""

# Does the item just answered belong to the remediation of the lane in
# turn? It no longer has to match one specific position — any
# remediation_item of that remediation counts as a lane response,
# because any of them can now be served depending on the node. If the
# one that matches belongs to a newer lane still waiting its turn,
# this query must return nothing, and it does, because
# _CARRIL_EN_TURNO never looks at it.
ACTIVE_LANE_ITEM = _CARRIL_EN_TURNO + """
select ct.misconception_id, ct.entered_at
from carril_en_turno ct
join remediations rem     on rem.misconception_id = ct.misconception_id
join remediation_items ri on ri.remediation_id = rem.id
                          and ri.item_id = %(item_id)s::uuid
"""

# The item to serve from GET /next when there's a lane in turn: the
# first remediation_item of that remediation the student has NOT
# answered in this pass (created_at >= entered_at of the lane in
# turn — a new pass starts with a clean list, failures from a
# previous pass don't count), preferring the ones that belong to the
# session's node and tie-breaking by remediation_items.position (the
# order curated by content, no longer an advance pointer), and finally
# by item id so the result is deterministic on any remaining tie.
# Same two rules NEXT_ITEM applies to any item — status = 'active' and
# not repeated in this session — so if NO remediation_item passes
# them, this query returns nothing and /next falls back to the node's
# pool without touching the lane's state: it's retried next time an
# item is requested.
# n.code always travels along, even when it matches the session's
# node: the decision to show it only when it differs belongs to
# main.py (source + item_node_code in the response), not to this
# query. node_items.item_id is unique (026, un_nodo_por_item), so the
# join doesn't duplicate rows.
NEXT_LANE_ITEM = _CARRIL_EN_TURNO + """
select i.id,
       i.code,
       i.stem,
       i.author_difficulty,
       n.code as node_code,
       n.name as item_node_name,
       json_agg(
         json_build_object('id', o.id, 'label', o.label, 'body', o.body)
         order by o.label
       ) as options
from carril_en_turno ct
join remediations rem     on rem.misconception_id = ct.misconception_id
join remediation_items ri on ri.remediation_id = rem.id
join items i               on i.id = ri.item_id
                          and i.status = 'active'
join node_items ni          on ni.item_id = i.id
join nodes n                on n.id = ni.node_id
join item_options o        on o.item_id = i.id
where not exists (
  -- already answered in this pass of the lane
  select 1 from responses r
  where r.item_id = i.id
    and r.student_id = %(student_id)s::uuid
    and r.created_at >= ct.entered_at
)
and not exists (
  -- don't repeat within this session (same rule as always, unchanged)
  select 1 from responses r
  where r.item_id = i.id
    and r.session_id = %(session_id)s
)
group by i.id, i.code, i.stem, i.author_difficulty, n.code, n.name, ri.position
order by (n.code = %(node_code)s) desc, ri.position asc, i.id asc
limit 1
"""

# Got the lane item right: exits, back to the node's normal flow.
LANE_RESOLVE = """
update student_misconceptions
set status = 'resolved', updated_at = now()
where student_id = %(student_id)s::uuid
  and misconception_id = %(misconception_id)s
  and status = 'active'
"""

# Is there any remediation_item of this remediation still unanswered
# in the current pass (created_at >= entered_at)? Filters
# i.status = 'active' for the same reason as NEXT_LANE_ITEM: a draft
# item is never served, so it can't be a reason to keep the lane
# 'active' waiting on it forever — without this filter an unpublished
# item would leave the lane hanging, never 'locked', never 'resolved'.
LANE_HAS_UNANSWERED_ITEM = """
select 1
from remediations rem
join remediation_items ri on ri.remediation_id = rem.id
join items i               on i.id = ri.item_id
                          and i.status = 'active'
where rem.misconception_id = %(misconception_id)s
  and not exists (
    select 1 from responses r
    where r.student_id = %(student_id)s::uuid
      and r.item_id = ri.item_id
      and r.created_at >= %(entered_at)s::timestamptz
  )
limit 1
"""

# Failed and no remediation_item is left unanswered in this pass: it
# locks. ("None of them was correct" doesn't need a separate check —
# if any had been, LANE_RESOLVE would already have taken the row out
# of 'active' before reaching here, and a re-entry resets entered_at,
# so a correct answer from a previous pass can't sneak in.)
# Stops generating a lane until a trigger exists to exit locked (not
# built yet — see the comment on migration 031).
LANE_LOCK = """
update student_misconceptions
set status = 'locked', updated_at = now()
where student_id = %(student_id)s::uuid
  and misconception_id = %(misconception_id)s
  and status = 'active'
"""

# Is there a published remediation with at least one item for this
# misconception? Position no longer matters — any item is enough for
# the lane to have something to serve. Checked BEFORE LANE_TRIGGER, in
# Python, so the "nowhere to send it" case can be logged with its
# misconception_id — if the guard lived only inside the insert there'd
# be no way to tell "wasn't created because there's no remediation"
# apart from "wasn't created because it was already active/locked",
# which isn't a content gap.
MISCONCEPTION_REMEDIATION_READY = """
select 1
from remediations rem
join remediation_items ri on ri.remediation_id = rem.id
where rem.misconception_id = %(misconception_id)s
  and rem.status = 'active'
"""

# This specific misconception was triggered — whether from the normal
# flow or from the distractor of an item that also belonged to the
# lane of ANOTHER misconception (a named error always counts, no
# matter which item it appeared on). No row -> first trigger. Row
# 'resolved' -> expected re-entry, counts as a new trigger, and
# entered_at resets so the next NEXT_LANE_ITEM/LANE_HAS_UNANSWERED_ITEM
# doesn't count items from a previous pass as "already answered". Row
# 'active' or 'locked' -> does nothing: for THIS misconception
# 'active' is already in progress (doesn't increment within the same
# lane) and 'locked' doesn't generate another lane. This isn't a
# limitation to "one lane at a time": this same row can coexist with
# other 'active' rows for other misconceptions just fine, because the
# PK is per misconception.
# Only called once MISCONCEPTION_REMEDIATION_READY has already
# returned true — see _update_misconception_lane in main.py.
LANE_TRIGGER = """
insert into student_misconceptions
  (student_id, misconception_id, status, times_triggered)
values (%(student_id)s::uuid, %(misconception_id)s, 'active', 1)
on conflict (student_id, misconception_id) do update set
  status          = 'active',
  times_triggered = student_misconceptions.times_triggered + 1,
  entered_at      = now(),
  updated_at      = now()
where student_misconceptions.status = 'resolved'
"""

SESSION_BY_ID = """
select id, student_id, mode, status, started_at, ended_at,
       planned_item_count
from sessions
where id = %(session_id)s::uuid
"""

CURRENT_SESSION = """
select s.id, s.mode, s.status, s.started_at, s.target_node_id,
       n.code as node_code,
       count(r.id) as answered
from sessions s
left join nodes n on n.id = s.target_node_id
left join responses r on r.session_id = s.id
where s.student_id = %(student_id)s::uuid
  and s.status = 'in_progress'
group by s.id, n.code
"""

NODE_ID_BY_CODE = """
select id from nodes where code = %(node_code)s and status = 'active'
"""

NODE_BY_CODE = """
select code, name from nodes where code = %(node_code)s and status = 'active'
"""

CREATE_SESSION = """
insert into sessions (student_id, mode, target_node_id, planned_item_count)
values (%(student_id)s::uuid, %(mode)s, %(target_node_id)s,
        %(planned_item_count)s)
returning id, mode, status, started_at
"""

CLOSE_SESSION = """
update sessions
set status = %(status)s, ended_at = now()
where id = %(session_id)s::uuid
  and status = 'in_progress'
returning id, student_id, mode, status, started_at, ended_at,
          planned_item_count
"""

SESSION_RESPONSE_COUNT = """
select count(*) as answered
from responses
where session_id = %(session_id)s::uuid
"""

SESSION_REPORT_NODES = """
select n.id as node_id,
       n.code as node_code,
       n.name as node_name,
       nm.status,
       nm.p_correct,
       nm.items_answered,
       nm.items_correct,
       nm.hard_correct,
       mc.min_items,
       mc.p_threshold,
       mc.min_hard_correct
from (
    select distinct ni.node_id
    from responses r
    join node_items ni on ni.item_id = r.item_id
    where r.session_id = %(session_id)s::uuid
) touched
join nodes n on n.id = touched.node_id
left join node_mastery nm
    on nm.student_id = %(student_id)s::uuid and nm.node_id = n.id
left join mastery_config mc
    on mc.version = nm.config_version
"""