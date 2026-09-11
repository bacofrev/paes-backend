-- =====================================================================
-- 029_sessions.sql
-- Crea la unidad de trabajo del producto: la sesión de estudio.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- El editor SQL de Supabase NO respeta begin/commit ni muestra notices.
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 1. sessions
-- ---------------------------------------------------------------------
create table sessions (
  id                 uuid primary key default gen_random_uuid(),
  student_id         uuid not null references students(id) on delete cascade,
  mode               text not null
                     check (mode in ('diagnostic','mock_exam','study',
                                     'practice','review')),
  target_node_id     bigint references nodes(id),
  planned_item_count integer check (planned_item_count > 0),
  status             text not null default 'in_progress'
                     check (status in ('in_progress','completed','abandoned')),
  started_at         timestamptz not null default now(),
  ended_at           timestamptz,

  -- una sesión está abierta si y solo si no tiene cierre
  constraint sessions_cierre_coherente
    check ((status = 'in_progress') = (ended_at is null))
);

comment on table sessions is
  'Bloque de estudio con un propósito único. NO es una sesión de login: '
  'esa vive en auth.sessions y la maneja Supabase. Un ingreso a la app '
  'puede contener varias sesiones de estudio.';

comment on column sessions.mode is
  'Interruptor de comportamiento, no metadato. Define de dónde salen los '
  'ítems, si el feedback es inmediato o diferido, y cómo termina. '
  'diagnostic y mock_exam difieren el feedback porque miden; '
  'study, practice y review responden al tiro porque enseñan. '
  'No existe modo remediation: la remediación es un tramo DENTRO de '
  'una sesión de feedback inmediato, disparado por un error.';

comment on column sessions.target_node_id is
  'NULL = la sesión cruza varios nodos (diagnostic, mock_exam, review). '
  'Sin check por modo a propósito: review puede ser de uno o de varios.';

comment on column sessions.planned_item_count is
  'Cuántos ítems se pensaba servir. Permite calcular omitidas como '
  'planned - count(responses) sin llevar un contador que se '
  'desincroniza en cada GET /next. NULL en modos abiertos (practice).';

-- Una sola sesión abierta por estudiante.
-- Sin esto se acumulan sesiones zombis y el reporte no sabe cuál mirar.
create unique index sessions_una_abierta_por_student
  on sessions (student_id) where status = 'in_progress';

create index sessions_student_started on sessions (student_id, started_at desc);


-- ---------------------------------------------------------------------
-- 2. Backfill
-- ---------------------------------------------------------------------
-- Los session_id que hay en responses son UUID inventados a mano para
-- desbloquear pruebas con curl. No apuntan a nada y no tienen valor:
-- uno de ellos quedó compartido entre dos estudiantes, que es imposible
-- en el modelo real.
--
-- Por eso NO se preservan. Se agrupa por (session_id, student_id,
-- context) y cada grupo recibe un uuid nuevo. Un session_id compartido
-- se parte en dos sesiones, una por estudiante, que es lo correcto.

create temp table backfill_map on commit drop as
select r.session_id                              as viejo,
       r.student_id,
       case when r.context = 'remediation' then 'practice'
            else r.context end                   as mode,
       min(r.created_at)                         as ini,
       max(r.created_at)                         as fin,
       gen_random_uuid()                         as nuevo
from responses r
group by r.session_id, r.student_id,
         case when r.context = 'remediation' then 'practice'
              else r.context end;

insert into sessions (id, student_id, mode, status, started_at, ended_at)
select nuevo, student_id, mode, 'completed', ini, fin
from backfill_map;

update responses r
set session_id = m.nuevo
from backfill_map m
where r.student_id = m.student_id
  and r.session_id is not distinct from m.viejo
  and (case when r.context = 'remediation' then 'practice'
            else r.context end) = m.mode;


-- ---------------------------------------------------------------------
-- 3. La conexión que faltaba
-- ---------------------------------------------------------------------
alter table responses
  alter column session_id set not null;

alter table responses
  add constraint responses_session_fk
  foreign key (session_id) references sessions(id) on delete cascade;

comment on column responses.session_id is
  'Obligatorio. Toda respuesta pertenece a una sesión: sin ella no hay '
  'reporte, no hay modo, y no se puede distinguir un ensayo de práctica '
  'suelta.';


-- ---------------------------------------------------------------------
-- 4. Validación de cierre — aborta si algo quedó suelto
-- ---------------------------------------------------------------------
do $$
declare
  huerfanas int;
  abiertas  int;
  incoher   int;
begin
  select count(*) into huerfanas
  from responses r
  left join sessions s on s.id = r.session_id
  where s.id is null;
  if huerfanas > 0 then
    raise exception 'respuestas sin sesión: %', huerfanas;
  end if;

  select count(*) into abiertas
  from sessions where status = 'in_progress';
  if abiertas > 0 then
    raise exception 'el backfill dejó % sesiones abiertas', abiertas;
  end if;

  -- ninguna sesión puede tener respuestas de otro estudiante
  select count(*) into incoher
  from responses r
  join sessions s on s.id = r.session_id
  where s.student_id <> r.student_id;
  if incoher > 0 then
    raise exception 'respuestas cuyo student_id no calza con su sesión: %',
      incoher;
  end if;

  raise notice 'OK — sessions creada, % filas, % respuestas ligadas',
    (select count(*) from sessions),
    (select count(*) from responses);
end $$;

commit;
