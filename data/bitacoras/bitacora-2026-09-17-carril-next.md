# Plataforma PAES — Bitácora: GET /next sirve el carril

*Sesión: 17 de septiembre de 2026 — cierra la mitad de lectura del
carril de remediación (la de escritura viene de las bitácoras
anteriores del mismo día)*

---

## 1. Qué se implementó

**`queries.py` — `_CARRIL_EN_TURNO`**, un fragmento (no una query
ejecutable sola) que resuelve "cuál es el carril `active` más antiguo
por `entered_at` de este alumno" — exactamente la misma CTE que ya
tenía `ACTIVE_LANE_ITEM`, ahora factoreada. `ACTIVE_LANE_ITEM` se
reescribió como `_CARRIL_EN_TURNO + "select ..."`, sin cambiar su
resultado ni su firma. Nueva query, `NEXT_LANE_ITEM`, hecha con el
mismo fragmento: en vez de comparar el carril en turno contra un
`item_id` dado, trae el ítem completo (mismas columnas que `NEXT_ITEM`:
`id`, `code`, `stem`, `author_difficulty`, `options`) para servirlo.
Es la reutilización pedida — una sola definición de "a quién le toca",
usada por las dos queries.

**`main.py` — `next_item`** ahora busca primero el ítem del carril en
turno (`NEXT_LANE_ITEM`) y, si no hay uno servible, cae al pool del
nodo (`NEXT_ITEM`), igual que antes de este cambio. `NO_FEEDBACK` se
movió arriba en el archivo porque ahora lo usan dos endpoints, no uno.

---

## 2. Los tres casos

### 2.1 ¿Respeta "no repetir en esta sesión"? — resuelto, no listado

`NEXT_LANE_ITEM` lleva el mismo `where not exists (select 1 from
responses r where r.item_id = i.id and r.session_id = ...)` que
`NEXT_ITEM`, más `i.status = 'active'` (que el ítem del carril esté
publicado, igual que cualquier otro). Si el ítem del carril choca con
cualquiera de las dos reglas, `NEXT_LANE_ITEM` no devuelve nada y
`next_item` cae al pool del nodo — **sin tocar el estado del carril**:
ni `position` ni `status` cambian, así que se vuelve a intentar servir
ese mismo ítem la próxima vez que el alumno pida uno.

Por qué esto es una resolución y no una regla inventada: la pregunta
era si el carril debía "respetar el filtro", y la respuesta es que no
hizo falta escribir un filtro nuevo — el mecanismo que ya iba a existir
de todos modos ("si el carril no tiene nada que servir, cae al pool")
es el mismo mecanismo que resuelve el choque. No inventé un estado
nuevo ("carril bloqueado"), ni un 404 especial, ni una regla sobre
cuántas veces puede fallar antes de saltearse. Es la misma pregunta que
hizo el guard de `LANE_TRIGGER` con las misconceptions sin remediación:
"si no se puede servir, no se sirve, y no pasa nada más".

**Por qué esto no puede trabar un carril para siempre:** el choque solo
puede pasar dentro de la MISMA sesión donde el ítem ya se respondió por
otro lado. Una sesión nueva empieza sin respuestas propias, así que en
la próxima sesión el mismo ítem vuelve a estar disponible para el
carril. En el peor caso, el carril espera hasta la sesión siguiente —
no espera para siempre.

### 2.2 ¿Se sirve aunque el ítem sea de otro nodo? — resuelto, ya estaba decidido

**Sí, sin excepción.** `NEXT_LANE_ITEM` no toca `nodes`, `node_items`
ni recibe `node_code` como parámetro — el `node_code` de la URL se
ignora por completo cuando hay carril en turno. Esto no es una decisión
nueva de hoy: ya estaba en
`bitacora-2026-09-17-carril-remediacion.md §2.4` ("Sí, y no por
decisión sino por diseño: la tabla no tiene node_id"). Hoy solo se hizo
cumplir en el único lugar donde todavía no se aplicaba — la selección
de ítems.

**Lo que sí falta, y no lo agregué porque no se pidió:** la respuesta
de `/next` no dice de dónde salió el ítem (pool del nodo vs. carril de
una misconception). Un frontend que muestre "estás en NUM-POT-CONC"
podría confundir al alumno si el ítem servido es en realidad de
ALG-ECU-LIN por venir del carril. Es una señal que el backend ya tiene
(sabe si vino de `NEXT_LANE_ITEM` o de `NEXT_ITEM`) y hoy no expone.
Lo dejo anotado como algo a agregar cuando haya frontend, no como una
pregunta abierta — no requiere ninguna decisión de producto, es
literalmente un campo que falta en la respuesta.

### 2.3 Modos sin carril — confirmado

`next_item` solo llama a `NEXT_LANE_ITEM` cuando `mode not in
NO_FEEDBACK`. Para `diagnostic`/`mock_exam`, `item` arranca en `None`
y va directo al pool — la misma rama que ya recorría el código antes de
este cambio. Confirmado leyendo el código, no contra una base (sigue
sin haber suite de tests).

**Encontré, al escribir esto, que amplifica un gap ya anotado.**
`next_item` no valida que `session_id` exista, esté `in_progress` ni
sea del alumno del path
(`bitacora-2026-09-15-next-item.md`, decisión abierta 4). Antes ese gap
solo afectaba el filtro de "no repetir" (alguien podría, en teoría,
mandar un `session_id` ajeno y cambiar qué se excluye). Ahora también
afecta si el carril se consulta: mandar el `session_id` de una sesión
`diagnostic` ajena silenciaría el carril de este alumno para esa
llamada, aunque su sesión real sea `practice`. Sigue siendo el mismo
gap de siempre, no uno nuevo — lo marco porque ahora tiene una segunda
consecuencia, no porque haga falta arreglarlo en esta tarea.

---

## 3. Lo que no toqué

- `ACTIVE_LANE_ITEM`, `LANE_RESOLVE`, `LANE_ADVANCE`, `LANE_LOCK`,
  `LANE_NEXT_POSITION_EXISTS`, `LANE_TRIGGER`,
  `MISCONCEPTION_REMEDIATION_READY`: sin cambios de comportamiento —
  `ACTIVE_LANE_ITEM` se reescribió para compartir `_CARRIL_EN_TURNO`,
  pero da exactamente el mismo resultado que antes.
- La validación de `session_id` en `/next` (existencia, `in_progress`,
  pertenencia): sigue sin implementarse, es la misma decisión abierta
  de la bitácora del 15, no la de hoy.
- El campo "de dónde vino el ítem" en la respuesta de `/next`: no lo
  agregué, ver §2.2.
- Nada de frontend, tal como en las tareas anteriores de este carril.
