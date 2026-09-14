-- =====================================================================
-- SIMULACIÓN DEL CRITERIO DE DOMINIO
-- =====================================================================
-- Pregunta que responde: ¿el criterio RECHAZA?
--
-- Cuatro alumnos sintéticos, uno por cada condición del criterio.
-- Tres DEBEN quedar in_progress. Uno DEBE quedar mastered.
--
-- Todo corre dentro de una transacción que termina en ROLLBACK.
-- No deja nada en la base. Correr SIN -1:
--   psql -X -v ON_ERROR_STOP=1 -f sim_criterio_dominio.sql "$DATABASE_URL"
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 0. Contra qué estamos probando
-- ---------------------------------------------------------------------
select 'CRITERIO ACTIVO' as bloque, version, p_threshold,
       min_items, min_difficulty, min_hard_correct
from mastery_config where is_active;

-- La 026 borró purpose/role de node_items. Esto muestra la función REAL
-- de hoy: si todavía filtra por esas columnas, el script va a fallar acá
-- y eso ya es el hallazgo.
select pg_get_functiondef('recompute_node_mastery'::regproc) as funcion_actual;


-- ---------------------------------------------------------------------
-- 1. Elegir un nodo con munición suficiente
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
      'Ningún nodo tiene 8 ítems bajo el piso de dificultad + 2 sobre el piso. '
      'Eso no es un problema del script: es que ningún alumno puede llegar a '
      'mastered en ese nodo, o no se puede armar el caso de rechazo.';
  end if;
end $$;

select 'NODO ELEGIDO' as bloque, n.code, n.name
from sim_node sn join nodes n on n.id = sn.node_id;


-- ---------------------------------------------------------------------
-- 2. Pool de ítems del nodo, partido por el piso de dificultad
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
-- 3. Los cuatro alumnos y lo que se espera de cada uno
-- ---------------------------------------------------------------------
create temp table sim_students (
  code       text primary key,
  student_id uuid,
  session_id uuid,
  ataca      text,
  espera     text
) on commit drop;

insert into sim_students values
 ('A-solo-faciles', '00000000-0000-4000-8000-00000000000a',
                    '00000000-0000-4000-8000-0000000000fa',
  'min_hard_correct', 'in_progress'),
 ('B-pocos-items',  '00000000-0000-4000-8000-00000000000b',
                    '00000000-0000-4000-8000-0000000000fb',
  'min_items',       'in_progress'),
 ('C-tasa-baja',    '00000000-0000-4000-8000-00000000000c',
                    '00000000-0000-4000-8000-0000000000fc',
  'p_threshold',     'in_progress'),
 ('D-cumple',       '00000000-0000-4000-8000-00000000000d',
                    '00000000-0000-4000-8000-0000000000fd',
  'ninguna',         'mastered');

-- Si students tiene columnas NOT NULL sin default, agregarlas acá.
insert into students (id) select student_id from sim_students;

-- sessions puede no existir todavía según el estado de la 027.
do $$
begin
  if to_regclass('public.sessions') is not null then
    execute $q$
      insert into sessions (id, student_id, mode, started_at)
      select ss.session_id, ss.student_id, 'practice', now()
      from sim_students ss
    $q$;
  end if;
end $$;


-- ---------------------------------------------------------------------
-- 4. Plan de respuestas
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

insert into responses (student_id, item_id, option_id, session_id, context, created_at)
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
-- 5. Recalcular
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
-- 6. Veredicto
-- ---------------------------------------------------------------------
select st.code,
       st.ataca                  as condicion_probada,
       nm.items_answered         as respondidos,
       nm.items_correct          as correctos,
       nm.hard_correct           as dificiles_ok,
       nm.p_correct,
       st.espera                 as esperado,
       nm.status                 as obtenido,
       case when nm.status = st.espera
            then 'PASA'
            else '*** FALLA ***' end as veredicto
from sim_students st
cross join sim_node sn
left join node_mastery nm
       on nm.student_id = st.student_id and nm.node_id = sn.node_id
order by st.code;

rollback;
