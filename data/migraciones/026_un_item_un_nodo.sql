-- =====================================================================
-- 026_un_item_un_nodo.sql
--
-- Elimina node_items.pool y node_items.role.
--
-- Por qué:
--   pool  — distinguía 'curated' de 'generated'. No existe generador ni
--           procedimiento de promoción: las 105 filas son 'curated'. Es
--           una columna de cero filas distintas. Además, curado o no
--           curado es propiedad del ÍTEM, no de la relación nodo-ítem:
--           un ítem no puede estar curado respecto de un nodo y sin
--           curar respecto de otro.
--
--   role  — 'secondary' marcaba nodos que el ítem "toca". Nadie lo lee:
--           recompute_node_mastery() filtra role='primary', o sea que
--           la columna existía para marcar filas que el sistema
--           descarta. El enrutamiento entre nodos ya lo hace
--           misconceptions.nodo, que además dice QUÉ error, no solo
--           dónde.
--
-- La regla queda: un ítem mide un nodo. Los errores que detecta se
-- derivan de item_options.misconception_id -> misconceptions.nodo.
--
-- IMPORTANTE: pensada para correrse en el editor de Supabase, que NO
-- respeta begin/commit. Por eso el orden es tal que cualquier estado
-- intermedio queda consistente. Correr los bloques EN ORDEN.
-- =====================================================================


-- ---------------------------------------------------------------------
-- PASO 1 — la función, sin pool ni role
-- ---------------------------------------------------------------------
-- Va PRIMERO a propósito. Postgres no rastrea dependencias dentro de
-- plpgsql: si se borraran las columnas antes, la función quedaría rota
-- sin ningún error visible hasta que alguien responda un ítem.
create or replace function recompute_node_mastery(
  p_student uuid,
  p_node    bigint
) returns void
language plpgsql as $$
declare
  cfg             mastery_config%rowtype;
  v_answered      smallint := 0;
  v_correct       smallint := 0;
  v_hard          smallint := 0;
  v_last          timestamptz;
  v_p             numeric(5,4);
  v_status        text;
  v_prev_mastered timestamptz;
begin
  select * into cfg from mastery_config where is_active;
  if not found then
    raise exception 'No hay mastery_config activa';
  end if;

  select first_mastered_at into v_prev_mastered
  from node_mastery
  where student_id = p_student and node_id = p_node;

  -- Una fila por ítem distinto: la respuesta más reciente.
  -- Un ítem mide un nodo: no hay pool ni role que filtrar.
  with ultimas as (
    select distinct on (r.item_id)
           r.item_id,
           r.option_id,
           r.created_at,
           i.author_difficulty
    from responses r
    join node_items ni on ni.item_id = r.item_id
                      and ni.node_id = p_node
    join items i on i.id = r.item_id
    where r.student_id = p_student
    order by r.item_id, r.created_at desc
  ),
  evaluadas as (
    select u.created_at,
           u.author_difficulty,
           coalesce(o.is_correct, false) as correcta   -- omitida = incorrecta
    from ultimas u
    left join item_options o on o.id = u.option_id
  )
  select count(*)::smallint,
         count(*) filter (where correcta)::smallint,
         count(*) filter (where correcta
                            and author_difficulty >= cfg.min_difficulty)::smallint,
         max(created_at)
  into v_answered, v_correct, v_hard, v_last
  from evaluadas;

  -- Suavizado Beta: 3 de 3 da 0.80, no 1.00
  if v_answered > 0 then
    v_p := (v_correct + cfg.prior_alpha)
           / (v_answered + cfg.prior_alpha + cfg.prior_beta);
  else
    v_p := null;
  end if;

  if v_answered = 0 then
    v_status := 'not_started';
  elsif v_p        >= cfg.p_threshold
    and v_answered >= cfg.min_items
    and v_hard     >= cfg.min_hard_correct then
    v_status := 'mastered';
  else
    v_status := 'in_progress';
  end if;

  insert into node_mastery (
    student_id, node_id, p_correct, items_answered, items_correct,
    hard_correct, status, first_mastered_at, last_response_at,
    config_version, computed_at
  ) values (
    p_student, p_node, v_p, v_answered, v_correct,
    v_hard, v_status,
    case when v_status = 'mastered'
         then coalesce(v_prev_mastered, v_last) end,
    v_last, cfg.version, now()
  )
  on conflict (student_id, node_id) do update set
    p_correct         = excluded.p_correct,
    items_answered    = excluded.items_answered,
    items_correct     = excluded.items_correct,
    hard_correct      = excluded.hard_correct,
    status            = excluded.status,
    first_mastered_at = excluded.first_mastered_at,
    last_response_at  = excluded.last_response_at,
    config_version    = excluded.config_version,
    computed_at       = now();
end;
$$;


-- ---------------------------------------------------------------------
-- PASO 2 — la vista, sin pool
-- ---------------------------------------------------------------------
-- Se recrea con drop porque cambia un nombre de columna, y
-- create or replace view no permite renombrar.
--
-- Arregla de paso un desacuerdo que existía desde siempre: la vista
-- contaba las filas 'secondary' dentro de curated_items sin filtrar por
-- role, mientras recompute_node_mastery() sí las descartaba. O sea, la
-- vista que dice "este nodo está listo" y la función que decide
-- 'mastered' no contaban lo mismo. Ahora sí, porque no hay dos tipos
-- de fila.
drop view if exists v_node_coverage;

create view v_node_coverage as
select n.code,
       n.name,
       u.code       as unit_code,
       n.exam_level,
       count(distinct ni.item_id)          as items,
       count(distinct ln.lesson_id)        as lessons,
       count(distinct io.misconception_id) as covered_misconceptions
from nodes n
join units u                on u.id = n.unit_id
left join node_items ni     on ni.node_id = n.id
left join lesson_nodes ln   on ln.node_id = n.id
left join item_options io   on io.item_id = ni.item_id
                           and io.misconception_id is not null
group by n.code, n.name, u.code, n.exam_level;


-- ---------------------------------------------------------------------
-- PASO 3 — borrar las filas secondary
-- ---------------------------------------------------------------------
-- 22 filas. Destructivo. El respaldo re-insertable se sacó antes con la
-- query de 'restaurar'.
delete from node_items where role = 'secondary';


-- ---------------------------------------------------------------------
-- PASO 4 — borrar las columnas
-- ---------------------------------------------------------------------
alter table node_items drop column role;
alter table node_items drop column pool;


-- ---------------------------------------------------------------------
-- PASO 5 — la regla, hecha cumplir por la base
-- ---------------------------------------------------------------------
-- Sin esto, "un ítem, un nodo" es un acuerdo de conversación y el
-- próximo cargador con un bug vuelve a meter filas duplicadas en
-- silencio. Con esto, la base lo rechaza.
alter table node_items add constraint un_nodo_por_item unique (item_id);


-- ---------------------------------------------------------------------
-- PASO 6 — reprocesar el mastery
-- ---------------------------------------------------------------------
-- La función cambió de definición: hay que rederivar.
select recompute_all_mastery() as filas_recalculadas;


-- ---------------------------------------------------------------------
-- PASO 7 — verificación (select, no raise notice)
-- ---------------------------------------------------------------------
select 'columnas de node_items' as que,
       string_agg(column_name, ', ' order by ordinal_position) as valor,
       'node_id, item_id' as esperado
from information_schema.columns
where table_name = 'node_items'

union all

select 'filas en node_items', count(*)::text, '105'
from node_items

union all

select 'items con mas de un nodo', count(*)::text, '0'
from (select item_id from node_items
      group by item_id having count(*) > 1) x

union all

select 'nodos NUM-POT con menos de 8 items activos', count(*)::text, '0'
from (select n.id
      from nodes n
      join units u on u.id = n.unit_id
      left join node_items ni on ni.node_id = n.id
      left join items i on i.id = ni.item_id and i.status = 'active'
      where u.code = 'NUM-POT'
      group by n.id having count(i.id) < 8) y

union all

select 'la funcion todavia menciona pool o role', count(*)::text, '0'
from pg_proc
where proname = 'recompute_node_mastery'
  and pg_get_functiondef(oid) ~ '\m(pool|role)\M';
