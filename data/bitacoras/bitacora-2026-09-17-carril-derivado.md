# Plataforma PAES — Bitácora: el carril deja de tener puntero

*Sesión: 17 de septiembre de 2026 — implementa la Opción A de
`bitacora-2026-09-17-carril-preferencia-nodo.md §2.3` (derivar desde
`responses`, sin columna nueva) y cierra su pregunta 1*

---

## 1. La decisión sobre `position`: se sacó de la migración

**Se eliminó `student_misconceptions.position`.** La migración 031
todavía no se había corrido, así que fue una edición directa del
archivo, no una migración nueva que la borre.

Por qué no tiene sentido conservarla: bajo el modelo nuevo, ningún
código la escribe nunca. "Avanzar" el carril ya no mueve ningún
puntero — el próximo ítem a servir se recalcula desde cero en cada
`GET /next`, a partir de `responses`. Una columna que nadie actualiza
pero que sigue ahí, con nombre `position`, es peor que no tenerla:
sugiere un orden fijo que ya no rige. Es el mismo argumento que ya usó
este repo para sacar `pool`/`role` de `node_items` en la `026`
("columna que existía para marcar filas que el sistema descarta").

Lo que sí sigue existiendo y haciendo ese trabajo es
`remediation_items.position` — el orden **curado por contenido**, que
ahora se usa solo como desempate, nunca como puntero de avance.

---

## 2. Qué se reescribió

**`_CARRIL_EN_TURNO`** (el fragmento compartido) ahora trae
`misconception_id, entered_at` en vez de `misconception_id, position`.
`entered_at` es la pieza que hace posible todo lo demás: es el corte
que separa "respondido en este pase" de "respondido en un pase
anterior", y se resetea en cada reingreso (`LANE_TRIGGER`) a propósito
— así los fallos de un carril viejo no cuentan para el nuevo, tal como
pediste.

**`ACTIVE_LANE_ITEM`** ya no exige que el ítem coincida con una
`position` puntual: alcanza con que pertenezca a la remediación del
carril en turno (cualquiera de sus `remediation_items`). Tiene sentido
porque ahora cualquiera de ellos puede haber sido el que se sirvió.

**`NEXT_LANE_ITEM`** implementa la regla completa: entre los
`remediation_items` de la remediación que (a) están `active` y (b) no
tienen una `response` de este alumno con `created_at >= entered_at`
(no respondidos en este pase) y (c) no tienen una `response` en esta
sesión (regla de siempre, sin cambios), ordena por
`(nodo coincide con el de la sesión) desc, position asc, item id asc`
y toma el primero. El último criterio (`item id`) es nuevo, para que
el resultado sea determinístico si dos ítems empatan en nodo y
`position` — algo que el esquema no impide (`remediation_items` no
tiene `unique(remediation_id, position)`).

**`LANE_NEXT_POSITION_EXISTS` se reemplazó por `LANE_HAS_UNANSWERED_ITEM`.**
Ya no pregunta "¿existe `position + 1`?" sino "¿queda algún
`remediation_item` sin responder en este pase?" — mismo criterio de
`created_at >= entered_at`, y el mismo filtro `i.status = 'active'`
que `NEXT_LANE_ITEM` (ver §3, es algo que agregué).

**`LANE_ADVANCE` se eliminó.** Ya no existe la operación "avanzar":
si falló pero queda algo sin responder, el carril sigue `active` sin
ningún `update` — no hay nada que cambiar en la fila, el estado real
vive en `responses`. `_advance_lane` en `main.py` quedó así: acertó →
`LANE_RESOLVE`; falló y no queda nada sin responder → `LANE_LOCK`;
falló y queda algo → no hace ninguna escritura.

**`LANE_LOCK`** no cambió su SQL, pero cambió cuándo se dispara —
ahora por `LANE_HAS_UNANSWERED_ITEM`, no por `LANE_NEXT_POSITION_EXISTS`.

**`MISCONCEPTION_REMEDIATION_READY`** ya no exige `position = 1`: con
cualquier `remediation_item` alcanza para que el carril tenga algo que
servir, sin importar su `position`.

**`LANE_TRIGGER`** dejó de insertar/actualizar `position`. El resto
—`times_triggered`, `entered_at = now()` en el reingreso— sin cambios.

---

## 3. Por qué esto sí cerró (a diferencia de la ronda anterior)

La ronda anterior se detuvo porque la regla de preferencia de nodo
rompía el supuesto de "un solo ítem en juego, igual a `sm.position`".
Tu decisión de hoy — derivar desde `responses` en vez de guardar un
puntero — es exactamente lo que permite que la regla se pueda expresar
sin ese supuesto: en vez de preguntar "¿cuál es el ítem actual?",
`NEXT_LANE_ITEM` pregunta "¿cuáles no se probaron todavía?" y elige
entre esos. Nada quedó a medio resolver ni obligó a inventar una regla
nueva — cerró con las cuatro queries que dijiste que había que revisar,
más `MISCONCEPTION_REMEDIATION_READY`, que no la nombraste pero
dependía del mismo supuesto (`ri.position = 1`).

**Una consecuencia que confirmé, no que decidí:** la condición "y
ninguno fue acertado" que pediste para `locked` no necesita chequeo
aparte. Si algún `remediation_item` de este pase hubiera sido
acertado, `LANE_RESOLVE` ya habría sacado la fila de `active` en ESE
momento — no puede llegar a evaluarse `LANE_HAS_UNANSWERED_ITEM` con
un acierto sin resolver en el medio. Y un reingreso resetea
`entered_at`, así que un acierto de un pase anterior tampoco puede
colarse. La garantía es por construcción del flujo, no por una
condición extra en la query.

**Lo que agregué por mi cuenta, no pedido explícitamente:**
`LANE_HAS_UNANSWERED_ITEM` filtra `i.status = 'active'`, igual que
`NEXT_LANE_ITEM`. Sin eso, un `remediation_item` en `draft` contaría
como "sin responder" para siempre — nunca se puede responder algo que
nunca se sirve — y el carril quedaría `active` sin poder trabarse
nunca. Mismo tipo de guard que ya llevaba `MISCONCEPTION_REMEDIATION_READY`
para el caso "sin remediación", aplicado acá para el caso "con
remediación, pero con ítems sin publicar".

---

## 4. Verificación (lectura, no contra una base — sigue sin haber
## suite de tests)

- `ORDER BY (n.code = %(node_code)s) desc, ri.position asc, i.id asc
  LIMIT 1`: el booleano de coincidencia de nodo ordena primero
  (`true > false` en Postgres), así que si existe al menos un ítem del
  nodo de la sesión, gana sobre cualquiera de otro nodo sin importar su
  `position` — "solo si ninguno pertenece al nodo actual, servir el de
  afuera", confirmado por cómo ordena, no por un `if` aparte.
- `NEXT_LANE_ITEM` y `LANE_HAS_UNANSWERED_ITEM` usan la misma
  definición de "respondido en este pase" (`item_id` + `student_id` +
  `created_at >= entered_at`) — no hay forma de que una diga "queda
  algo" y la otra "no queda nada" para el mismo estado.
- El choque con "no repetir en esta sesión" (decidido hace dos
  rondas) sigue funcionando igual: si el único ítem que falta responder
  en este pase ya tiene una respuesta en la sesión actual (por ejemplo,
  se respondió por el pool antes de que el carril se disparara),
  `NEXT_LANE_ITEM` no lo sirve y cae al pool, pero `LANE_HAS_UNANSWERED_ITEM`
  lo sigue contando como "sin responder EN EL PASE" — la fila se queda
  `active`, no se traba, y se reintenta en la próxima sesión. Es
  a propósito: "trabada" es una propiedad del contenido (se agotó lo
  que hay para probar), no de qué sesión pregunta.

---

## 5. Preguntas abiertas

Sin cambios respecto de rondas anteriores — sigue abierta la salida de
`locked` por revisar la clase del nodo (sin disparador construido).

Una nota nueva, no una pregunta bloqueante: `NEXT_LANE_ITEM` y
`LANE_HAS_UNANSWERED_ITEM` corren un `not exists` contra `responses`
filtrado por `item_id` + `student_id` + `created_at`, y eso pasa a ser
parte de un camino caliente — cada `GET /next` (cuando hay carril) y
cada `POST /responses` a un ítem del carril. Los índices que hoy tiene
`responses` (`item_id`, `session_id`, `(student_id, created_at desc)`,
el `unique` de `(session_id, item_id)`) no cubren exactamente ese
patrón. No agregué ninguno — no hay señal todavía de que haga falta,
el volumen de datos sigue siendo de prueba — pero es lo primero que
miraría si `/next` empieza a sentirse lento con más alumnos reales.

---

## 6. Lo que no toqué

- `LANE_RESOLVE`: sin cambios de SQL ni de cuándo se dispara.
- `_trigger_misconception`, `_update_misconception_lane`,
  `MISCONCEPTION_REMEDIATION_READY` (salvo sacar `position = 1`): sin
  cambios de lógica.
- El resto de `/next` (validación de sesión, `source`/`item_node_code`
  en la respuesta): implementado en la ronda anterior, sin tocar hoy.
- Nada de frontend.
