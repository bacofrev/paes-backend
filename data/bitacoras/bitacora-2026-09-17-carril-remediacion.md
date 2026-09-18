# Plataforma PAES — Bitácora: esquema para el carril de remediación

*Sesión: 17 de septiembre de 2026 — propuesta, sin implementar*

---

## 0. Antes de proponer nombres

Repasé `esquema_actual.sql`, `queries.py`, `main.py` y las bitácoras del
11 y 14 de septiembre. Dos hallazgos cambian la propuesta:

**Esto ya se decidió, no se construyó.** La bitácora del 11
(`bitacora-2026-09-11-sessions.md §3` y `§4.5`) ya cerró que la
remediación no es un modo de sesión, que es un tramo disparado por un
fallo, y que el calendario correcto es **por misconception, no por
nodo** — textual: *"Ben eligió el camino por misconception sobre el
camino por nodo... es el producto que diferencia"*. La tabla que pido
acá es la primera pieza de ese camino ya elegido.

**El esquema ya dejó un lugar para esto y quedó sin usar.**
`responses.context` acepta `'remediation'` desde que existe la columna,
con el comentario *"después de diagnosticar un error"* y *"el estimador
debe poder ponderar distinto por contexto"*
(`esquema_actual.sql:3901`). Pero `recompute_node_mastery` no lee
`context` en ningún lado — cuenta todas las respuestas igual. Ese hueco
importa para la pregunta 3, más abajo.

**Vocabulario que ya existe y reuso, no invento:**

| lo que necesito nombrar | término que ya existe | de dónde |
|---|---|---|
| tabla por (alumno, X) | `student_courses`, `node_mastery` | prefijo `student_` + plural, o `<dominio>_mastery` |
| progreso en una secuencia ordenada | `"position"` | ya es el nombre de la columna en `remediation_items` |
| estado que avanza con reintentos | `not_started` / `in_progress` / `mastered` | `node_mastery.status` |
| estilo de constraint | `text` + `check (... = any (array[...]))` | todas las tablas del dominio, no hay un segundo enum público salvo `misconception_origin` |
| cascada al borrar alumno | `on delete cascade` en `student_id` | `node_mastery`, `sessions`, `student_courses` |

No hay tabla `student_misconceptions` todavía — el nombre no colisiona
con nada existente.

---

## 1. Propuesta de esquema

```sql
-- PROPUESTA — no ejecutada, no hay migración numerada todavía

create table student_misconceptions (
  student_id       uuid     not null references students(id) on delete cascade,
  misconception_id bigint   not null references misconceptions(id),
  status            text     not null default 'in_progress',
  position          smallint not null default 1,
  times_triggered   smallint not null default 1,
  entered_at        timestamptz not null default now(),
  updated_at        timestamptz not null default now(),

  constraint student_misconceptions_pkey
    primary key (student_id, misconception_id),

  constraint student_misconceptions_status_check
    check (status = any (array['in_progress', 'resolved', 'locked'])),

  constraint student_misconceptions_position_check
    check (position >= 1)
);

comment on table student_misconceptions is
  'Estado del carril de remediación por (alumno, misconception). '
  'No cuelga de node_mastery porque una misconception cruza nodos: '
  'el mismo error aparece en varios nodos y el carril es uno solo.';

comment on column student_misconceptions.position is
  'Última position de remediation_items servida dentro del carril '
  'actual. No asume 3: el corte es "no hay más ítems", no un número.';

comment on column student_misconceptions.times_triggered is
  'Cuántas veces un ítem del flujo normal (no del carril) disparó '
  'esta misconception, incluyendo reingresos después de resolved '
  'o locked. No cuenta los reintentos dentro del carril mismo — '
  'eso ya lo mide position.';
```

**Por qué no lleva `node_id`:** es la razón de ser de la tabla — una
misconception que ya se vio en 8 nodos distintos (`POT-CONC-MULT`, ver
`bitacora-2026-09-14-criterio.md §4`) no tiene un nodo dueño. Ponerle
`node_id` sería la misma inconsistencia que `026` ya corrigió en
`node_items` con `un_nodo_por_item`.

**Por qué `status` son tres valores y no reusa los de `node_mastery`:**
`not_started` no aplica — la fila no existe hasta el primer fallo, así
que "no empezado" es la ausencia de fila, no un estado. Cambié
`mastered` por `resolved` porque acá no se mide dominio (eso lo sigue
diciendo `node_mastery`); se mide si el carril se cerró bien o mal.

**Por qué `remediation_id` no está en la tabla:** `remediations` tiene
`unique (misconception_id)` (`esquema_actual.sql:4887-4888`) — es 1:1
con la misconception. Guardar `misconception_id` alcanza; el join a
`remediations` y de ahí a `remediation_items` es directo y no duplica
la relación.

**Lo que dejé afuera a propósito:** un `check` que exija `position <=
3`. Nada en el esquema fija en 3 la cantidad de ítems por remediación
— `remediation_items` no tiene `unique(remediation_id, position)` ni
un tope. "Falla los 3" es la cantidad de hoy, no una regla de la base.
Si mañana una remediación tiene 4 ítems, la lógica de "trabada" debería
ser "no queda position siguiente", no "position = 3".

---

## 2. Las cuatro preguntas

### 2.1 Estados y transiciones

Propuesta:

```
(sin fila)
    │ falla un ítem del flujo normal, distractor mapea a esta misconception
    ▼
in_progress (position = 1)
    │ acierta el ítem de esa position         │ falla, hay siguiente position
    ▼                                          ▼
resolved                              in_progress (position += 1)
                                               │ falla, NO hay siguiente position
                                               ▼
                                            locked
```

Transición no dibujada arriba porque es la pregunta abierta más grande
del documento: **¿qué pasa si el flujo normal vuelve a disparar esta
misconception cuando la fila ya está en `resolved` o `locked`?** Ver
pregunta 1 en §3.

### 2.2 Si cierra la sesión a mitad del carril

**Retoma en la `position` guardada.** No es una lectura neutral de la
pregunta — es casi forzada por el hecho de que se pide una tabla nueva.
`node_mastery` demuestra que este dominio ya sabe hacer estado que no
depende de la sesión: sobrevive a sesiones que se cierran, se abandonan
o expiran por TTL. Si el carril *no* tuviera que sobrevivir a una
sesión cerrada, no haría falta esta tabla — alcanzaría con leer
`responses` filtradas por `session_id`, que es exactamente lo que
`node_mastery` **no** hace y por lo que existe como tabla aparte.

Dicho eso, esto sí cambia lo que dice la bitácora del 11: *"la
remediación es un tramo dentro de una sesión"* estaba pensado para una
remediación que vive y muere con la sesión que la disparó. Esta tabla
la convierte en estado durable entre sesiones. Vale la pena que quede
explícito que es un cambio de arquitectura, no solo una tabla nueva.

### 2.3 Si cuenta para `p_correct` del nodo

**No debería contarse.** Dos razones, una de cada lado del sistema:

- **Ya está declarado en el esquema y no implementado.** El comentario
  de `responses.context` dice que el estimador debe ponderar distinto
  por `remediation`, y la bitácora del 11 lo dice más fuerte: *"valen
  distinto para dominio, porque vienen inmediatamente después de que le
  explicaron el error"*. Ponderar distinto, llevado a la práctica más
  simple, es peso cero: un ítem que el alumno responde con la
  explicación todavía fresca no mide lo mismo que uno a secas.
- **Un ítem de `remediation_items` puede pertenecer a otro nodo.**
  `RECOMPUTE_FOR_ITEM` recalcula el nodo al que el ítem respondido
  pertenece vía `node_items` (`queries.py:52-56`), no el nodo que el
  alumno está estudiando. Si el carril sirve un ítem de un nodo
  distinto al de la sesión activa — plausible, porque la misconception
  cruza nodos — contarlo movería el `p_correct` de un nodo que el
  alumno ni siquiera estaba trabajando esa sesión.

**Esto no es gratis:** `recompute_node_mastery` hoy no filtra por
`context` en ningún lado (`data/migraciones/026...sql:62-73`). Excluir
`remediation` del criterio de dominio implica tocar esa función —
agregar `and r.context <> 'remediation'` a la CTE `ultimas`, o
equivalente — antes de que el carril pueda servir su primer ítem real.
No es parte de esta tarea, pero es un prerequisito, no un detalle
posterior.

### 2.4 Si sobrevive al cambio de nodo

**Sí, y no por decisión sino por diseño:** la tabla no tiene `node_id`.
No hay nada que "sobreviva" porque nunca estuvo atado a un nodo — el
alumno puede terminar una sesión de `practice` en `NUM-POT-CONC`, abrir
`review` al otro día y cruzarse con un ítem de `ALG-ECU-LIN` que
dispara la misma `POT-CONC-MULT`, y la fila sigue siendo la misma fila.

Lo que la elección de esquema **no** resuelve, porque es de producto y
no de tabla, es la pregunta operativa real: si el alumno tiene un
carril `in_progress` sin cerrar y entra a estudiar un nodo distinto,
¿el backend lo interrumpe para forzarlo a cerrar el carril primero, o
lo deja seguir y el carril queda ahí esperando a que la misconception
se dispare de nuevo? Las dos son implementables sin cambiar esta tabla
— por eso no la resuelvo acá, queda listada como pregunta 3 en §3.

---

## 3. Preguntas abiertas — necesitan tu criterio, no las resolví

1. **Reingreso después de `resolved` o `locked`.** Si el flujo normal
   vuelve a disparar una misconception que ya está `resolved`, ¿se
   pisa `status` a `in_progress` de nuevo con `position = 1` y
   `times_triggered += 1`? Si está `locked`, ¿reingresa igual, o
   `locked` es un cierre definitivo y el sistema deja de mostrar el
   carril para siempre (aunque el ítem se siga fallando)? La tarea dice
   *"deja de servirse"* pero no dice si eso es permanente o hasta
   cuándo.
2. **`locked` y el calendario por misconception.** La bitácora del 11
   ya dejó *"decidido, no construido"* un calendario FSRS por
   misconception (§4.5). Cuando exista, ¿una misconception `locked`
   entra a esa cola igual que cualquier otra, o queda afuera porque ya
   "gastó" sus 3 intentos? No lo resuelvo acá porque el calendario
   mismo todavía no existe — pero el día que se construya, esta tabla
   es uno de sus insumos, así que vale decidirlo antes de esa migración,
   no después.
3. **Interrupción por cambio de nodo** (§2.4): ¿bloquear o dejar
   correr en paralelo? Esto además decide si `GET /next` necesita
   consultar `student_misconceptions` antes de devolver un ítem del
   flujo normal, o si el carril y el flujo normal son dos colas
   independientes que nunca se pisan.
4. **`times_triggered` como señal.** Propuse que cuente reingresos
   desde el flujo normal, no reintentos dentro del carril. ¿Para qué se
   va a leer esta columna — reporte al alumno, alerta a un docente,
   input del futuro calendario? La respuesta cambia si el contador
   debería resetear alguna vez o ser estrictamente acumulativo de por
   vida.
