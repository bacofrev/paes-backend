-- =====================================================================
-- sim_report_escalera.sql
-- Prueba la escalera de guardias de GET /sessions/{id}/report contra el
-- server real, por HTTP. Por eso, a diferencia de sim_criterio_dominio.sql,
-- termina en COMMIT: si terminara en rollback, el server no vería nada
-- que responder.
--
-- Mismo nodo, mismo pool partido por dificultad, mismo plan de
-- respuestas que sim_criterio_dominio.sql — no se reinventa, se reusa.
-- Único cambio real: los cuatro casos ahora apuntan a las cuatro ramas
-- de la escalera (min_hard_correct, min_items, p_threshold, mastered),
-- no a "in_progress" genérico.
--
-- Correr:
--   psql -X -v ON_ERROR_STOP=1 -f sim_report_escalera.sql "$DATABASE_URL"
-- Después de hacer los curl, limpiar con:
--   psql -X -v ON_ERROR_STOP=1 -f sim_report_cleanup.sql "$DATABASE_URL"
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 0. Limpieza — antes de insertar nada, por si quedó una corrida previa
--    a medio commitear. Mismo orden que sim_report_cleanup.sql.
-- ---------------------------------------------------------------------
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


-- ---------------------------------------------------------------------
-- 1. Contra qué estamos probando
-- ---------------------------------------------------------------------
select 'CRITERIO ACTIVO' as bloque, version, p_threshold,
       min_items, min_difficulty, min_hard_correct
from mastery_config where is_active;


-- ---------------------------------------------------------------------
-- 2. Elegir un nodo con munición suficiente (idéntico a
--    sim_criterio_dominio.sql: NUM-POT-PROD, 14 ítems)
-- ---------------------------------------------------------------------
create temp table sim_node on commit drop as
select ni.node_id
from node_items ni
join items i on i.id = ni.item_id
cross join (select * from mastery_config where is_active) cfg
group by ni.node_id, cfg.min_difficulty
having count(*) filter (where i.author_difficulty <  cfg.min_difficulty) >= 8
   and count(*) filter (where i.author_difficulty >= cfg.min_difficulty) >= 2
order by count(*) desc
limit 1;

do $$
begin
  if not exists (select 1 from sim_node) then
    raise exception
      'Ningún nodo tiene 8 ítems bajo el piso de dificultad + 2 sobre el piso.';
  end if;
end $$;

select 'NODO ELEGIDO' as bloque, n.code, n.name
from sim_node sn join nodes n on n.id = sn.node_id;


-- ---------------------------------------------------------------------
-- 3. Pool de ítems del nodo, partido por el piso de dificultad
-- ---------------------------------------------------------------------
create temp table sim_pool on commit drop as
select i.id as item_id,
       (i.author_difficulty >= cfg.min_difficulty) as dificil,
       row_number() over (
         partition by (i.author_difficulty >= cfg.min_difficulty)
         order by i.id
       ) as seq
from sim_node sn
join node_items ni on ni.node_id = sn.node_id
join items i       on i.id = ni.item_id
cross join (select * from mastery_config where is_active) cfg;


-- ---------------------------------------------------------------------
-- 4. Los cuatro alumnos y la guardia que debería cortar cada uno
-- ---------------------------------------------------------------------
create temp table sim_students (
  code       text primary key,
  student_id uuid,
  session_id uuid,
  espera_status     text,
  espera_blocked_by text
) on commit drop;

insert into sim_students values
 ('A-solo-faciles', '00000000-0000-4000-8000-00000000000a',
                    '00000000-0000-4000-8000-0000000000fa',
  'in_progress', 'min_hard_correct'),
 ('B-pocos-items',  '00000000-0000-4000-8000-00000000000b',
                    '00000000-0000-4000-8000-0000000000fb',
  'in_progress', 'min_items'),
 ('C-tasa-baja',    '00000000-0000-4000-8000-00000000000c',
                    '00000000-0000-4000-8000-0000000000fc',
  'in_progress', 'p_threshold'),
 ('D-cumple',       '00000000-0000-4000-8000-00000000000d',
                    '00000000-0000-4000-8000-0000000000fd',
  'mastered', null);

insert into students (id) select student_id from sim_students;

insert into sessions (id, student_id, mode, started_at)
select ss.session_id, ss.student_id, 'practice', now()
from sim_students ss;


-- ---------------------------------------------------------------------
-- 5. Plan de respuestas — idéntico a sim_criterio_dominio.sql
-- ---------------------------------------------------------------------
--  A: 8 fáciles, todas correctas   → answered 8, hard 0, p 0.90
--  B: 3 fáciles + 2 difíciles, ok  → answered 5, hard 2, p 0.857
--  C: 6 fáciles (2 ok) + 2 dif ok  → answered 8, hard 2, p 0.50
--  D: 6 fáciles (5 ok) + 2 dif ok  → answered 8, hard 2, p 0.80
create temp table sim_plan on commit drop as
    select 'A-solo-faciles'::text as code, item_id, true as correcta
      from sim_pool where not dificil and seq <= 8
  union all
    select 'B-pocos-items', item_id, true
      from sim_pool where not dificil and seq <= 3
  union all
    select 'B-pocos-items', item_id, true
      from sim_pool where dificil and seq <= 2
  union all
    select 'C-tasa-baja', item_id, seq <= 2
      from sim_pool where not dificil and seq <= 6
  union all
    select 'C-tasa-baja', item_id, true
      from sim_pool where dificil and seq <= 2
  union all
    select 'D-cumple', item_id, seq <= 5
      from sim_pool where not dificil and seq <= 6
  union all
    select 'D-cumple', item_id, true
      from sim_pool where dificil and seq <= 2;

insert into responses
  (student_id, item_id, option_id, session_id, context, created_at)
select st.student_id,
       p.item_id,
       o.id,
       st.session_id,
       'practice',
       now() - ((row_number() over ()) || ' seconds')::interval
from sim_plan p
join sim_students st on st.code = p.code
join lateral (
  select io.id
  from item_options io
  where io.item_id = p.item_id
    and io.is_correct = p.correcta
  order by io.id
  limit 1
) o on true;


-- ---------------------------------------------------------------------
-- 6. Recalcular dominio
-- ---------------------------------------------------------------------
do $$
declare r record;
begin
  for r in select st.student_id, sn.node_id
           from sim_students st cross join sim_node sn
  loop
    perform recompute_node_mastery(r.student_id, r.node_id);
  end loop;
end $$;


-- ---------------------------------------------------------------------
-- 7. Veredicto en SQL, antes de probar por HTTP
-- ---------------------------------------------------------------------
select st.code,
       nm.items_answered as respondidos,
       nm.items_correct  as correctos,
       nm.hard_correct   as dificiles_ok,
       nm.p_correct,
       st.espera_status,
       nm.status         as obtenido_status,
       case when nm.status = st.espera_status
            then 'PASA' else '*** FALLA ***' end as veredicto_status
from sim_students st
cross join sim_node sn
left join node_mastery nm
       on nm.student_id = st.student_id and nm.node_id = sn.node_id
order by st.code;


-- ---------------------------------------------------------------------
-- 8. Session IDs para el curl — quedan commiteados, el server los ve
-- ---------------------------------------------------------------------
select code, session_id, espera_status, espera_blocked_by
from sim_students
order by code;

commit;
