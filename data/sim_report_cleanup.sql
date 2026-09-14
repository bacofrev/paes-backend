-- =====================================================================
-- sim_report_cleanup.sql
-- Borra los cuatro alumnos sintéticos de sim_report_escalera.sql y todo
-- lo que cuelga de ellos. Se corre DOS veces: antes de sim_report_escalera
-- (para no arrancar sobre una corrida anterior a medio commitear) y
-- después (para no dejar nada).
--
-- Orden de FK: hijos antes que padres.
--   node_mastery  (student_id, node_id)      -> students, nodes
--   responses     (student_id, item_id, session_id) -> students, items, sessions
--   sessions      (student_id)               -> students
--   students      (id)
--
-- Idempotente: si no hay filas, borra cero y no falla.
--
--   psql -X -v ON_ERROR_STOP=1 -f sim_report_cleanup.sql "$DATABASE_URL"
-- =====================================================================

begin;

delete from node_mastery
where student_id in (
  '00000000-0000-4000-8000-00000000000a',
  '00000000-0000-4000-8000-00000000000b',
  '00000000-0000-4000-8000-00000000000c',
  '00000000-0000-4000-8000-00000000000d'
);

delete from responses
where student_id in (
  '00000000-0000-4000-8000-00000000000a',
  '00000000-0000-4000-8000-00000000000b',
  '00000000-0000-4000-8000-00000000000c',
  '00000000-0000-4000-8000-00000000000d'
);

delete from sessions
where student_id in (
  '00000000-0000-4000-8000-00000000000a',
  '00000000-0000-4000-8000-00000000000b',
  '00000000-0000-4000-8000-00000000000c',
  '00000000-0000-4000-8000-00000000000d'
);

delete from students
where id in (
  '00000000-0000-4000-8000-00000000000a',
  '00000000-0000-4000-8000-00000000000b',
  '00000000-0000-4000-8000-00000000000c',
  '00000000-0000-4000-8000-00000000000d'
);

select 'VERIFICACION' as bloque,
  (select count(*) from node_mastery where student_id::text like '00000000-0000-4000-8000-00000000000%') as node_mastery,
  (select count(*) from responses    where student_id::text like '00000000-0000-4000-8000-00000000000%') as responses,
  (select count(*) from sessions     where student_id::text like '00000000-0000-4000-8000-00000000000%') as sessions,
  (select count(*) from students     where id::text like '00000000-0000-4000-8000-00000000000%') as students;

commit;
