# Plataforma PAES — Bitácora: preferencia de nodo, metadata de origen,
# validación de sesión en GET /next

*Sesión: 17 de septiembre de 2026*

---

## 1. Qué se implementó (2 y 3)

### 1.1 `/next` dice de dónde salió el ítem

Respuesta de `GET /next` ahora incluye `"source": "lane" | "pool"`, y
cuando `source == "lane"` y el ítem pertenece a un nodo distinto del
`node_code` de la URL, se agrega `"item_node_code"` con el código del
nodo real del ítem. Sin ese desajuste, el campo no aparece — no hay
nada que explicar. Sin texto armado, tal como se pidió: son datos
crudos, el frontend decide qué mostrar.

`NEXT_LANE_ITEM` ahora trae `n.code as node_code` (join a
`node_items`/`nodes`, seguro porque `node_items.item_id` es `unique`
desde la `026`, no duplica filas). `main.py` arma la respuesta a mano
en vez de devolver la fila cruda de la base, para poder decidir cuándo
incluir `item_node_code`.

### 1.2 `GET /next` valida la sesión, mismo criterio que `POST /responses`

Existe → si no, `404 session_not_found`. Está `in_progress` → si no,
`409 session_not_in_progress`. Es del alumno del path → si no,
`403 session_not_yours`. Mismo orden, mismos strings de `detail` que
`create_response`, a propósito — dos endpoints que fallan distinto
para el mismo problema son peor que uno solo que se copia.

Esto cierra la decisión abierta 4 de `bitacora-2026-09-15-next-item.md`
y el hallazgo de `bitacora-2026-09-17-carril-next.md §2.3` (un
`session_id` ajeno silenciando el carril de otro alumno) — ya no es
posible: si el `session_id` no es tuyo, el endpoint corta antes de
llegar a mirar ningún carril.

---

## 2. Lo que NO se implementó: preferencia de nodo (1)

**Me detuve acá, como se pidió.** No toqué `NEXT_LANE_ITEM` para
preferir el nodo de la sesión, ni cambié `position`. Explico por qué.

### 2.1 Por qué no es un cambio chico

Hoy `position` cumple dos roles a la vez, fundidos en una sola
columna: es **el puntero a qué ítem toca servir** (`NEXT_LANE_ITEM`
sirve exactamente `remediation_items` en `position = sm.position`) y
es **el contador de avance** (`LANE_ADVANCE` hace `position + 1`,
`LANE_NEXT_POSITION_EXISTS` decide `locked` mirando si existe
`position + 1`, `ACTIVE_LANE_ITEM` reconoce una respuesta como "del
carril" solo si el ítem coincide con `sm.position` exacto).

La regla nueva - preferir nodo, position como desempate, y solo servir
de afuera si no hay ningún ítem del nodo actual - implica elegir el
próximo ítem de entre **todos** los `remediation_items` de la
misconception, no solo el de `position = sm.position`. Eso rompe el
supuesto que las tres funciones de arriba dan por sentado: que en
cualquier momento hay exactamente un ítem "en juego" y que ese ítem es,
por definición, el de `sm.position`. Si el próximo ítem a servir puede
NO ser `sm.position + 1` (porque se prefirió uno de otra position por
matchear nodo), `position` deja de alcanzar para saber **qué ítems ya
se probaron** en este pase del carril — que es justo lo que hace falta
para no repetir un ítem ya fallado dentro del mismo carril, y para
saber cuándo no queda ninguno más (`locked`).

### 2.2 Un problema adicional, no solo de representación

El nodo preferido depende de **con qué sesión se llama a `/next`**, no
solo del carril. El mismo carril, todavía `active`, puede consultarse
hoy desde una sesión en el nodo X y mañana desde una sesión en el nodo
Y — la remediación persiste entre sesiones a propósito (fue la
decisión de `bitacora-2026-09-17-carril-remediacion.md §2.2`). Eso
quiere decir que "el orden preferido" no es un dato fijo del carril:
puede cambiar de una llamada a la siguiente según el nodo desde el que
se pregunta. Cualquier solución que precalcule un orden fijo en el
momento del disparo (`LANE_TRIGGER`) queda desactualizada si el alumno
cambia de nodo a mitad de camino.

### 2.3 Opciones, sin elegir ninguna

**Opción A — derivar el conjunto de "ya probados" desde `responses`,
sin columna nueva.** `position` deja de ser el puntero; pasa a ser
solo informativo ("la última position que se sirvió", para lectura
humana). El ítem a servir se calcula en cada llamada: entre los
`remediation_items` de la misconception SIN una fila en `responses`
con `created_at >= entered_at` (o sea, no respondidos desde que
arrancó este pase del carril), ordenar por nodo-coincide-con-sesión
primero y `position` como desempate, y tomar el primero. `locked` pasa
a ser "no queda ningún remediation_item sin probar". Es coherente con
algo que este código ya prefiere en otras partes — "se deriva, no se
acumula" (`bitacora-2026-09-11-sessions.md`, sobre por qué `answered`
no es un contador guardado) — pero obliga a reescribir
`ACTIVE_LANE_ITEM`, `NEXT_LANE_ITEM`, `_advance_lane` y las tres
queries de avance/traba.

**Opción B — una columna o tabla nueva que registre qué se probó.**
Por ejemplo `tried_positions smallint[]` en `student_misconceptions`,
o una tabla hija `student_misconception_attempts`. Más explícito y más
fácil de leer en una consulta suelta que la Opción A, a costa de
guardar un dato que ya está, en el fondo, en `responses` — duplicación
que hay que mantener sincronizada a mano en cada punto donde se
escribe.

**Ninguna de las dos resuelve sola el problema de 2.2** (el nodo
preferido cambia según desde dónde se pregunta) — las dos necesitan,
además, decidir si la preferencia de nodo se recalcula en cada llamada
a `/next` (se adapta si el alumno cambió de nodo) o se fija una sola
vez, en el momento en que el carril se dispara (`LANE_TRIGGER`), y
listo. Es una pregunta de producto aparte, no solo de implementación:
"el nodo preferido es donde estás ahora" y "el nodo preferido es donde
estabas cuando se disparó" son dos respuestas razonables y distintas.

---

## 3. Preguntas abiertas

1. **La de arriba, la que bloqueó 1:** ¿cómo se representa "qué
   `remediation_items` ya se probaron en este pase" cuando dejan de
   servirse en orden estricto? Opción A, B, u otra que no vi.
2. **¿La preferencia de nodo es dinámica o fija al disparo?** Ver §2.3,
   último párrafo.
3. De rondas anteriores, siguen abiertas sin cambios: la salida de
   `locked` por revisar la clase (sin disparador construido), y el
   distractor de un ítem del carril que mapea a una misconception
   distinta de la que se estaba avanzando ya se resolvió — esa está
   cerrada desde `bitacora-2026-09-17-carril-multiples.md`.

---

## 4. Lo que no toqué

- `ACTIVE_LANE_ITEM`, `LANE_RESOLVE`, `LANE_ADVANCE`, `LANE_LOCK`,
  `LANE_NEXT_POSITION_EXISTS`, `LANE_TRIGGER`,
  `MISCONCEPTION_REMEDIATION_READY`, `_advance_lane`,
  `_trigger_misconception`, `_update_misconception_lane`: sin cambios.
  El carril sigue sirviendo estrictamente `position = sm.position`,
  igual que antes de esta ronda.
- La migración 031: sin cambios — no agregué ninguna columna nueva
  mientras la Opción A/B de §2.3 sigue sin decidirse.
- Nada de frontend.
