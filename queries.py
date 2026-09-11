"""SQL lives here. When item selection moves to IRT,
the diff is this file, not the endpoints."""

NEXT_ITEM = """
select i.id,
       i.code,
       i.stem,
       i.author_difficulty,
       ni.pool,
       json_agg(
         json_build_object('id', o.id, 'label', o.label, 'body', o.body)
         order by o.label
       ) as options
from items i
join node_items ni on ni.item_id = i.id
join nodes n       on n.id = ni.node_id
join item_options o on o.item_id = i.id
where n.code = %(node_code)s
  and ni.role = 'primary'
  and i.status = 'active'
  and not exists (
    select 1 from responses r
    where r.item_id = i.id
      and r.student_id = %(student_id)s
  )
group by i.id, i.code, i.stem, i.author_difficulty, ni.pool
order by (ni.pool = 'generated'), i.author_difficulty, i.code
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
       m.code  as misconception_code,
       m.name  as misconception_name,
       r.code  as remediation_code,
       r.title as remediation_title,
       r.body  as remediation_body
from item_options o
left join misconceptions m on m.id = o.misconception_id
left join remediations r   on r.misconception_id = m.id
                          and r.status = 'active'
where o.id = %(option_id)s;
"""

RECOMPUTE_FOR_ITEM = """
select recompute_node_mastery(%(student_id)s::uuid, ni.node_id)
from node_items ni
where ni.item_id = %(item_id)s::uuid
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

CREATE_SESSION = """
insert into sessions (student_id, mode, target_node_id, planned_item_count)
values (%(student_id)s::uuid, %(mode)s, %(target_node_id)s,
        %(planned_item_count)s)
returning id, mode, status, started_at
"""