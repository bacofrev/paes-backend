-- =====================================================================
-- 031_student_misconceptions.sql
--
-- Carril de remediación: estado por (alumno, misconception), no por
-- nodo. Una misconception cruza nodos (POT-CONC-MULT aparece en 8, ver
-- bitacora-2026-09-14-criterio.md) — node_mastery no sirve porque está
-- atado a un nodo.
--
-- Decisiones de producto de esta migración (bitácoras del 2026-09-17):
--
--   - Los ítems de remediation_items SÍ cuentan para p_correct del nodo
--     al que pertenecen, igual que cualquier ítem activo.
--     recompute_node_mastery NO se toca. responses.context =
--     'remediation' se sigue guardando para análisis, sin ponderar
--     distinto.
--   - "Trabada" es "no queda ningún remediation_item sin responder en
--     el pase actual", no un número fijo: remediation_items no tiene
--     tope de cantidad por remediation.
--   - resolved -> active es el camino esperado, no una excepción.
--   - locked NO reactiva por volver a caer. Sale solo revisando la
--     clase del nodo donde se trabó — mecanismo no construido todavía.
--     Transición documentada, sin disparador (ver comentario de status).
--   - Preferencia de nodo: entre los remediation_items sin responder
--     del carril en turno, se prefiere el que pertenece al nodo de la
--     sesión que pregunta; desempate por remediation_items.position
--     (el orden curado por contenido). Se recalcula en cada llamada a
--     /next, no se fija en el momento del disparo.
--   - Esta tabla NO guarda qué ítem toca servir ni cuál fue el último:
--     eso se deriva de responses (created_at >= entered_at de la fila)
--     en el momento de cada consulta, igual que este dominio ya evita
--     contadores que se puedan desincronizar (ver bitácora del 11 de
--     septiembre sobre `answered`, `p_correct`). Por eso no hay una
--     columna `position` acá — el "position" que importa para elegir
--     ítem es el de `remediation_items`, el orden curado, no un
--     puntero de esta tabla.
--
-- Correr:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- Sin begin/commit: psql -1 ya abre la transacción (regla desde la 030).
-- =====================================================================

create table student_misconceptions (
  student_id       uuid not null references students(id) on delete cascade,
  misconception_id bigint not null references misconceptions(id),
  status           text not null default 'active'
                     check (status in ('active', 'resolved', 'locked')),
  times_triggered  smallint not null default 1,
  entered_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),

  constraint student_misconceptions_pkey primary key (student_id, misconception_id)
);

comment on table student_misconceptions is
  'Estado del carril de remediación por (alumno, misconception). No '
  'cuelga de node_mastery: la misconception cruza nodos y el carril es '
  'uno solo, sin importar en qué nodo se disparó. Un alumno puede tener '
  'varias filas ''active'' a la vez, una por misconception distinta: '
  'un error con nombre dispara su carril sin importar en qué ítem '
  'apareció. Solo una sirve ítems a la vez — la de entered_at más '
  'antiguo; las demás esperan su turno.';

comment on column student_misconceptions.status is
  'active: queda al menos un remediation_item de esta misconception '
  'sin responder en el pase actual (ver entered_at); cuál se sirve '
  'primero se decide en cada GET /next, prefiriendo el nodo de la '
  'sesión y desempatando por remediation_items.position. resolved: '
  'acertó uno de esos ítems y salió; puede volver a active si la '
  'misconception se dispara de nuevo — es el caso esperado. locked: '
  'respondió todos los remediation_items disponibles en este pase sin '
  'acertar ninguno; deja de generar carril aunque el alumno siga '
  'cayendo en ella. La única salida de locked pensada hoy es que el '
  'alumno vuelva al nodo donde se trabó y revise la clase — ese '
  'disparador no existe todavía en el backend, así que locked no '
  'tiene salida automática por ahora.';

comment on column student_misconceptions.times_triggered is
  'Disparos separados del carril en el tiempo: la primera vez, y cada '
  'reingreso desde resolved. No cuenta las respuestas dentro de un '
  'mismo pase activo — eso se deriva de responses, no se guarda acá.';

comment on column student_misconceptions.entered_at is
  'Cuándo arrancó el pase actual del carril (inserción o el último '
  'reingreso desde resolved). Dos roles: (1) decide el turno cuando '
  'hay más de una fila active para el mismo alumno — sirve ítems la '
  'de entered_at más antiguo; (2) es el corte que separa "respondido '
  'en este pase" de "respondido en un pase anterior" al calcular qué '
  'remediation_items quedan sin probar (responses.created_at >= '
  'entered_at). Se resetea en cada reingreso a propósito: un pase '
  'nuevo arranca con la lista de ítems limpia.';

create index student_misconceptions_status on student_misconceptions (status);
