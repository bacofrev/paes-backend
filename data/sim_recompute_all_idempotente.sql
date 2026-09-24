-- =====================================================================
-- sim_recompute_all_idempotente.sql
-- ¿recompute_all_mastery() reconstruye node_mastery igual a lo que hay
-- hoy, con 'revisit' ya adentro del cálculo?
--
-- Snapshotea node_mastery real, la borra entera dentro de la
-- transacción, corre recompute_all_mastery(), compara fila por fila
-- contra el snapshot. Termina en ROLLBACK pase o falle — nunca toca
-- producción, ni siquiera cuando pasa.
--
--   psql -X -v ON_ERROR_STOP=1 -f sim_recompute_all_idempotente.sql "$DATABASE_URL"
-- =====================================================================

begin;

create temp table snapshot_node_mastery on commit drop as
select * from node_mastery;

select count(*) as filas_antes from snapshot_node_mastery;

delete from node_mastery;

select recompute_all_mastery() as pares_recalculados;

-- computed_at y first_mastered_at quedan afuera de la comparación a
-- propósito:
--   computed_at   lleva now(); va a diferir siempre entre la fila
--                 original (escrita en una transacción pasada) y la
--                 recién recalculada (now() de ESTA transacción).
--   first_mastered_at  tiene una falla conocida y no tocada por la 036:
--                 el `case when status='mastered' then ... end` no
--                 tiene `else`, así que al reconstruir TODO desde cero
--                 v_prev_mastered siempre es null (no hay fila previa
--                 que leer, se acaba de borrar la tabla entera) — un
--                 alumno mastered desde hace tiempo va a quedar con
--                 first_mastered_at = la última respuesta, no la
--                 fecha real en que dominó. Preexistente a esta
--                 migración, fuera de alcance arreglarlo acá.
select 'DIFERENCIAS' as bloque,
       coalesce(a.student_id, b.student_id) as student_id,
       coalesce(a.node_id, b.node_id)       as node_id,
       a.status as status_antes,  b.status as status_despues,
       a.p_correct as p_antes,    b.p_correct as p_despues,
       a.items_answered as answered_antes, b.items_answered as answered_despues,
       a.hard_correct as hard_antes,       b.hard_correct as hard_despues,
       a.config_version as version_antes,  b.config_version as version_despues
from snapshot_node_mastery a
full outer join node_mastery b
  on a.student_id = b.student_id and a.node_id = b.node_id
where a.status          is distinct from b.status
   or a.p_correct        is distinct from b.p_correct
   or a.items_answered   is distinct from b.items_answered
   or a.items_correct    is distinct from b.items_correct
   or a.hard_correct     is distinct from b.hard_correct
   or a.last_response_at is distinct from b.last_response_at
   or a.config_version   is distinct from b.config_version;

do $verif$
declare
  n_diff int;
begin
  select count(*) into n_diff
  from snapshot_node_mastery a
  full outer join node_mastery b
    on a.student_id = b.student_id and a.node_id = b.node_id
  where a.status          is distinct from b.status
     or a.p_correct        is distinct from b.p_correct
     or a.items_answered   is distinct from b.items_answered
     or a.items_correct    is distinct from b.items_correct
     or a.hard_correct     is distinct from b.hard_correct
     or a.last_response_at is distinct from b.last_response_at
     or a.config_version   is distinct from b.config_version;

  if n_diff > 0 then
    raise exception '*** FALLA ***: % filas de node_mastery no coinciden tras recompute_all_mastery()', n_diff;
  end if;
end;
$verif$;

select 'PASA: recompute_all_mastery() es idempotente (excluyendo computed_at/first_mastered_at)' as veredicto;

rollback;
