-- =====================================================================
-- 036_revisit_racha_eventos.sql
--
-- Cuarto valor de node_mastery.status: 'revisit'. Se dispara cuando un
-- alumno acumula N respuestas incorrectas consecutivas en un nodo
-- (racha de corte), leídas en orden cronológico real, sin colapsar por
-- ítem (a diferencia del cálculo de p_correct, que sigue igual: ver
-- 031_student_misconceptions.sql). Gana sobre 'mastered' a propósito
-- — 5 aciertos seguidos de 3 fallas en la misma ventana NO debe leer
-- como dominado.
--
-- Trae también la tabla de eventos que corta la ventana de la racha:
-- lesson_viewed, remediation_read, streak_reset. Node-scoped: cada fila
-- lleva su node_id explícito, decidido por quien llama al endpoint — no
-- hay fan-out automático vía lesson_nodes. "La clase como agrupador"
-- sigue sin resolverse, a propósito.
--
-- Consecuencia que obliga a tocar main.py en el mismo cambio (no acá,
-- pero documentada porque nace de esta migración): node_mastery.status
-- solo se actualiza cuando corre recompute_node_mastery, y hoy eso solo
-- pasa desde POST /responses. Si GET /next bloquea TODO ítem mientras
-- status='revisit', y la única salida es lesson_viewed, el endpoint que
-- inserta ese evento tiene que llamar a recompute_node_mastery en la
-- misma transacción o el alumno queda trabado sin poder responder nada
-- que lo saque de revisit.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- El editor SQL de Supabase NO respeta begin/commit ni muestra notices.
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- PASO 1 — mastery_config.revisit_streak (N de la racha)
--
-- ALTER simple, no una fila nueva versionada: esto introduce el eje por
-- primera vez, no cambia un umbral existente (eso sí exigiría una fila
-- nueva con is_active, como cualquier otro cambio a esta tabla). Mismo
-- patrón que prior_alpha/prior_beta: NOT NULL con default, para que la
-- única fila activa hoy quede con un valor válido sin necesitar un
-- seed aparte.
-- ---------------------------------------------------------------------

alter table mastery_config
  add column revisit_streak smallint not null default 3
    constraint mastery_config_revisit_streak_check check (revisit_streak > 0);

comment on column mastery_config.revisit_streak is
  'N de respuestas incorrectas consecutivas (sin colapsar por ítem, '
  'context <> ''remediation'', dentro de la ventana abierta por el '
  'último lesson_viewed/streak_reset del nodo) que disparan '
  'node_mastery.status = ''revisit''. Gana sobre el criterio de '
  'dominio: se evalúa antes que mastered en recompute_node_mastery. '
  'Cambiar N sí exige una fila nueva versionada, como cualquier otro '
  'umbral de esta tabla — el default de esta columna es solo para no '
  'dejar la fila activa actual sin valor.';

-- ---------------------------------------------------------------------
-- PASO 2 — node_mastery.status admite 'revisit'
-- ---------------------------------------------------------------------

alter table node_mastery drop constraint node_mastery_status_check;

alter table node_mastery
  add constraint node_mastery_status_check
  check (status = any (array['not_started', 'in_progress', 'mastered', 'revisit']));

comment on column node_mastery.status is
  'lapsed NO se guarda acá: caduca por paso del tiempo, no por un '
  'evento nuevo. Se calcula al leer, en v_node_mastery. revisit SÍ se '
  'guarda: lo dispara una racha de respuestas (ver '
  'mastery_config.revisit_streak), no el tiempo, y gana sobre mastered '
  'en recompute_node_mastery. Eje independiente de lapsed: un nodo '
  'puede entrar en revisit sin haber estado nunca mastered.';

-- ---------------------------------------------------------------------
-- PASO 3 — student_node_events
--
-- Tres tipos, todos escritos solo por el servidor (nunca desde el
-- cliente, igual que context/mode). Node-scoped explícito: node_id
-- siempre lo decide quien llama, sin fan-out por lesson_nodes.
-- ---------------------------------------------------------------------

create table student_node_events (
  id                   bigint generated always as identity primary key,
  student_id           uuid not null references students(id) on delete cascade,
  node_id              bigint not null references nodes(id),
  event_type           text not null
                          check (event_type in ('lesson_viewed', 'remediation_read', 'streak_reset')),
  lesson_id            bigint references lessons(id),
  lesson_version       integer,
  remediation_id       bigint references remediations(id),
  remediation_version  integer,
  created_at           timestamptz not null default now(),

  constraint student_node_events_content_check check (
    case event_type
      when 'lesson_viewed' then
        lesson_id is not null and lesson_version is not null
        and remediation_id is null and remediation_version is null
      when 'remediation_read' then
        remediation_id is not null and remediation_version is not null
        and lesson_id is null and lesson_version is null
      when 'streak_reset' then
        lesson_id is null and lesson_version is null
        and remediation_id is null and remediation_version is null
    end
  )
);

comment on table student_node_events is
  'Eventos server-side que acotan la ventana de la racha de revisit y '
  'miden contenido versionado. Node-scoped a propósito: cada fila lleva '
  'su node_id explícito, decidido por quien llama al endpoint. Una '
  'clase que cubre 3 nodos (lesson_nodes) exige 3 llamadas separadas si '
  'la intención es salir de revisit en las 3 — no hay fan-out '
  'automático. "La clase como agrupador" sigue sin resolverse.';

comment on column student_node_events.event_type is
  'lesson_viewed: terminó el contenido de la clase del nodo (botón '
  'explícito de fin de clase, nunca scroll/tiempo). Única forma de '
  'salir de revisit. remediation_read: terminó de leer una remediación '
  '— se guarda solo para analítica de versión de contenido, NO corta '
  'la ventana de la racha. streak_reset: pide reiniciar la ventana sin '
  'tocar responses/p_correct; solo permitido si el nodo NO está en '
  'revisit hoy (chequeo server-side contra node_mastery.status antes '
  'de aceptar el evento — no hay manera de expresar esto como '
  'constraint de esta tabla sola, porque depende del estado en OTRA '
  'tabla en el momento del insert).';

comment on column student_node_events.lesson_version is
  'Snapshot de lessons.version al momento del evento, no una FK: '
  'lessons no tiene una fila por versión, la versión vive como columna '
  'mutable en la misma fila. Guardarla acá es lo que permite medir si '
  'reescribir una clase cambió el resultado, aunque lessons.version '
  'siga avanzando después.';

comment on column student_node_events.remediation_version is
  'Mismo criterio que lesson_version: snapshot de remediations.version '
  'al momento del evento.';

-- Ventana de la racha: max(created_at) sobre lesson_viewed/streak_reset
-- para (student_id, node_id). Es la consulta caliente de
-- recompute_node_mastery, corre en cada POST /responses.
create index student_node_events_window
  on student_node_events (student_id, node_id, event_type, created_at desc);

-- Analítica de contenido: "¿mejoró el resultado al reescribir esta
-- clase/remediación?" agrupa por (id, version). Parciales porque la
-- mayoría de las filas no tiene el uno o el otro.
create index student_node_events_lesson
  on student_node_events (lesson_id, lesson_version) where lesson_id is not null;

create index student_node_events_remediation
  on student_node_events (remediation_id, remediation_version) where remediation_id is not null;

-- ---------------------------------------------------------------------
-- PASO 4 — recompute_node_mastery: agrega la racha, sin tocar el
-- cálculo de p_correct/hard_correct (sigue colapsando por ítem e
-- ignorando context, a propósito — ver 031). La racha usa una lectura
-- CRUDA aparte, sin distinct on, porque colapsar destruye justo el
-- dato que la racha necesita. Precedencia: not_started (sin cambios) ->
-- revisit (nuevo, gana sobre mastered) -> mastered -> in_progress.
-- ---------------------------------------------------------------------

create or replace function public.recompute_node_mastery(p_student uuid, p_node bigint) returns void
    language plpgsql
    as $$
declare
  cfg             mastery_config%rowtype;
  v_answered      smallint := 0;
  v_correct       smallint := 0;
  v_hard          smallint := 0;
  v_last          timestamptz;
  v_p             numeric(5,4);
  v_status        text;
  v_prev_mastered timestamptz;
  v_window_start  timestamptz;
  v_streak_hit    boolean;
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
  -- SIN CAMBIOS respecto de antes de la 036: sigue ignorando context a
  -- propósito (ver 031_student_misconceptions.sql). No confundir con
  -- la lectura de la racha más abajo, que sí filtra por context y NO
  -- colapsa a la última respuesta por ítem.
  with ultimas as (
    select distinct on (r.item_id)
           r.item_id, r.option_id, r.created_at, i.author_difficulty
    from responses r
    join node_items ni on ni.item_id = r.item_id and ni.node_id = p_node
    join items i on i.id = r.item_id
    where r.student_id = p_student
    order by r.item_id, r.created_at desc
  ),
  evaluadas as (
    select u.created_at, u.author_difficulty,
           coalesce(o.is_correct, false) as correcta   -- omitida = incorrecta
    from ultimas u
    left join item_options o on o.id = u.option_id
  )
  select count(*)::smallint,
         count(*) filter (where correcta)::smallint,
         count(*) filter (where correcta and author_difficulty >= cfg.min_difficulty)::smallint,
         max(created_at)
  into v_answered, v_correct, v_hard, v_last
  from evaluadas;

  if v_answered > 0 then
    v_p := (v_correct + cfg.prior_alpha) / (v_answered + cfg.prior_alpha + cfg.prior_beta);
  else
    v_p := null;
  end if;

  -- Racha de N incorrectas consecutivas. Lectura CRUDA de responses,
  -- sin distinct on: la racha se mide en el orden real en que ocurrió,
  -- colapsar a la última respuesta por ítem destruiría el dato. context
  -- <> 'remediation': los ítems del carril no cuentan. Ventana: todo lo
  -- posterior al lesson_viewed/streak_reset más reciente de este
  -- (alumno, nodo); sin ninguno, la ventana es todo el historial.
  -- "Las últimas N son todas incorrectas" es equivalente a "la racha
  -- final de incorrectas consecutivas mide >= N": si las últimas N son
  -- todas incorrectas, la racha final mide al menos N; si la racha
  -- final mide >= N, en particular las últimas N (subconjunto de esa
  -- racha) son incorrectas. Por eso alcanza con mirar las últimas N.
  select max(created_at) into v_window_start
  from student_node_events
  where student_id = p_student
    and node_id = p_node
    and event_type in ('lesson_viewed', 'streak_reset');

  with racha as (
    select coalesce(o.is_correct, false) as correcta
    from responses r
    join node_items ni on ni.item_id = r.item_id and ni.node_id = p_node
    left join item_options o on o.id = r.option_id
    where r.student_id = p_student
      and r.context <> 'remediation'
      and (v_window_start is null or r.created_at > v_window_start)
    order by r.created_at desc
    limit cfg.revisit_streak
  )
  select coalesce(count(*) = cfg.revisit_streak and bool_and(not correcta), false)
  into v_streak_hit
  from racha;

  if v_answered = 0 then
    v_status := 'not_started';
  elsif v_streak_hit then
    v_status := 'revisit';
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
    p_correct = excluded.p_correct, items_answered = excluded.items_answered,
    items_correct = excluded.items_correct, hard_correct = excluded.hard_correct,
    status = excluded.status, first_mastered_at = excluded.first_mastered_at,
    last_response_at = excluded.last_response_at, config_version = excluded.config_version,
    computed_at = now();
end;
$$;

-- ---------------------------------------------------------------------
-- PASO 5 — Verificación (SELECT, no RAISE NOTICE)
-- ---------------------------------------------------------------------

select column_name, data_type, column_default
from information_schema.columns
where table_schema = 'public' and table_name = 'mastery_config' and column_name = 'revisit_streak';

select conname, pg_get_constraintdef(oid) as definicion
from pg_constraint
where conname in ('node_mastery_status_check', 'student_node_events_content_check',
                   'mastery_config_revisit_streak_check');

select table_name, column_name
from information_schema.columns
where table_schema = 'public' and table_name = 'student_node_events'
order by ordinal_position;

select pg_get_functiondef('recompute_node_mastery'::regproc) as funcion_actual;

commit;
