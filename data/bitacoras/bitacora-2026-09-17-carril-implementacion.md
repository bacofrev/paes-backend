# Plataforma PAES — Bitácora: carril de remediación, implementado

*Sesión: 17 de septiembre de 2026 — sigue a
`bitacora-2026-09-17-carril-remediacion.md` (la propuesta)*

---

## 1. Qué se implementó

**Migración `031_student_misconceptions.sql`.** Tabla nueva, sin tocar
ninguna existente. `status` con tres valores (`active`, `resolved`,
`locked`), `position` sin tope fijo, `times_triggered`, `entered_at`,
`updated_at`. PK `(student_id, misconception_id)` — sin `node_id`, a
propósito, porque la misconception cruza nodos.

**`queries.py` — seis queries nuevas** (sección "Carril de
remediación"): `ACTIVE_LANE_ITEM`, `LANE_NEXT_POSITION_EXISTS`,
`LANE_RESOLVE`, `LANE_ADVANCE`, `LANE_LOCK`, `LANE_TRIGGER`. Además,
`VERDICT` ahora trae `m.id as misconception_id` — antes solo traía
`code`/`name`, y hacía falta el id para poder escribir en la tabla
nueva.

**`main.py` — `_update_misconception_lane`**, llamada desde
`create_response` justo después de calcular `VERDICT`, dentro de la
misma conexión/transacción que inserta la respuesta y recalcula
`node_mastery`. Dos casos:

1. **La respuesta es el ítem que corresponde a la `position` actual de
   un carril `active`** (`ACTIVE_LANE_ITEM` lo confirma cruzando
   `student_misconceptions` con `remediation_items` por `position`):
   acierta → `resolved`. Falla y hay `position + 1` → avanza. Falla y
   no hay siguiente → `locked`.
2. **No es un ítem del carril, pero la respuesta falló y el distractor
   mapea a una misconception:** `LANE_TRIGGER` decide sola, en un solo
   `insert ... on conflict`: sin fila → primer disparo
   (`times_triggered = 1`). Fila `resolved` → reingresa
   (`times_triggered += 1`, `position` vuelve a 1). Fila `active` o
   `locked` → no toca nada.

No se tocó `recompute_node_mastery`, ni `RECOMPUTE_FOR_ITEM`, ni
`responses`. Los ítems de `remediation_items` cuentan para `p_correct`
exactamente igual que cualquier otro porque nadie los filtra — es la
decisión que tomaste, y la forma de cumplirla es no escribir el filtro,
no escribir uno que los incluya explícitamente.

---

## 2. Cómo quedaron las cuatro decisiones en código

**(1) Cuentan para dominio, sin excepción.** Cierto por omisión: no
agregué ningún `where context <> 'remediation'` ni ponderación en
`recompute_node_mastery`. `responses.context` se sigue insertando
como siempre — ver el hallazgo en §3.1, porque ahí encontré algo que no
cuadra con cómo está escrita la instrucción.

**(2) Trabada = no queda `position` siguiente.** `LANE_NEXT_POSITION_EXISTS`
consulta `remediation_items` en vivo por `misconception_id` y
`position + 1`; no hay ningún `3` ni `min_hard_correct`-style config
en el medio. Si una remediación tiene 5 ítems, se traba en la 5°; si
tiene 1, se traba en la 1° si falla.

**(3) Transiciones:**
- `resolved → active` vía `LANE_TRIGGER`: implementado, es el camino
  normal de reingreso.
- `locked` no reactiva por caer de nuevo: `LANE_TRIGGER` solo escribe
  cuando la fila existente es `resolved` (`where
  student_misconceptions.status = 'resolved'`); si es `locked`, la
  cláusula no aplica y el `on conflict` no hace nada. Verificado
  leyendo la query, no contra una base — no hay entorno de pruebas
  todavía (`CLAUDE.md`: no hay suite de tests).
- `locked → ?` por revisar la clase del nodo: **no implementado, tal
  como se pidió.** Quedó solo como comentario en la migración
  (`comment on column student_misconceptions.status`), documentando
  que la salida existe conceptualmente pero no hay disparador. No
  inventé una tabla de "vio la clase" ni un endpoint para esto.

**(4) `times_triggered` no se mueve dentro de un mismo carril.**
Mientras `status = 'active'`, tanto `LANE_ADVANCE` como `LANE_LOCK`
tocan `position`/`status`, nunca `times_triggered`. Y si el alumno
cae en la misma misconception por OTRO ítem del flujo normal mientras
ya está `active` en su carril, `LANE_TRIGGER` tampoco hace nada
(la fila no es `resolved`) — no hay forma de que se incremente dos
veces por el mismo carril.

---

## 3. Lo que encontré al implementar, no al proponer

### 3.1 `responses.context = 'remediation'` no se escribe en ningún lado

Volví a mirar esto para la decisión 1 y confirmo lo que ya había
anotado en la bitácora de la propuesta: **hoy nada en el código pone
`context = 'remediation'`.** `create_response` siempre hace
`data["context"] = session["mode"]` — el valor sale de la sesión, no
del hecho de que el ítem sea o no del carril. El valor `'remediation'`
existe en el `check` de la columna desde que la columna existe, pero
ninguna escritura lo produce.

Tu instrucción dice "se sigue guardando para análisis" — lo leo como
que asumías que esto ya pasaba. **No lo toqué ni lo arreglé**, porque
hacerlo bien implica una decisión que no estaba en el pedido: ¿el
`context` de la respuesta a un ítem del carril debería ser
`'remediation'` sin importar el modo de la sesión (pisando `study`
`practice` o `review`), incluso para modos que hoy nunca lo producen?
¿Y qué pasa si el ítem del carril coincide, por azar, con uno servido
en una sesión `diagnostic`/`mock_exam` — ahí ni siquiera se calcula
`VERDICT` hoy, así que `_update_misconception_lane` no corre y nunca
se sabría que era un ítem del carril? No lo resolví — queda listado
como pregunta 1 en §4. No hice ningún cambio en cómo se escribe
`context`.

### 3.2 `LANE_TRIGGER` no crea un carril si la misconception no tiene
remediación servible

No estaba en tu lista de decisiones, así que lo marco como algo que
agregué por mi cuenta, con la razón: `bitacora-2026-09-08-infra.md`
deja registrado que en producción hay misconceptions **sin
remediación activa** (`POT-CONC-FACTOR`, `POT-CONC-MULT`,
`POT-SIG-NEG` en NUM-POT, al menos al 08 de septiembre). Sin este
guard, fallar uno de esos ítems crearía una fila `active` en
`position = 1` que **nunca podría resolverse ni trabarse**, porque
`ACTIVE_LANE_ITEM` nunca la encontraría (no hay `remediation_items`
que la satisfagan) — un carril fantasma, invisible, que se queda
`active` para siempre.

`LANE_TRIGGER` ahora solo inserta/reingresa si existe una
`remediation` `active` con un ítem en `position = 1` para esa
misconception. Si no existe, no pasa nada — ni error, ni fila. Lo
marco explícitamente porque es una regla que inventé para tapar un
agujero que la tarea no mencionaba; si preferís que sí se cree la fila
igual (para tener el conteo de `times_triggered` aunque no haya carril
que mostrar), es un `where` menos.

### 3.3 Progresar el carril no vuelve a chequear que la remediación
siga activa

`ACTIVE_LANE_ITEM` y `LANE_NEXT_POSITION_EXISTS` no filtran por
`remediations.status`, a propósito: si lo hicieran, que alguien
desactive una remediación a mitad de un carril en curso haría que la
próxima respuesta del alumno a ese mismo ítem dejara de reconocerse
como parte del carril y cayera en la rama de "disparo nuevo" — un
`resolved`/`locked` mal derivado. Con el filtro solo en `LANE_TRIGGER`
(la entrada), un carril ya abierto se resuelve con las reglas que
tenía al entrar. El costo: si además se **editan** los
`remediation_items` de una remediación activa mientras alguien está a
mitad de camino (se borra o se agrega un ítem), eso sí lo afecta,
porque las queries leen la tabla en vivo, no una foto del momento en
que entró. Lo dejo como riesgo aceptado y anotado, no como pregunta
abierta — es poco probable y no lo puedo resolver sin versionar
`remediation_items`, que es mucho más que esta tarea.

---

## 4. Preguntas abiertas

1. **`responses.context = 'remediation'`** (§3.1): ¿debería
   `create_response` marcarlo así cuando la respuesta es del carril,
   pisando el modo de la sesión? Y si la respuesta a un ítem del
   carril llega en un modo `NO_FEEDBACK` (`diagnostic`/`mock_exam`) —
   hoy `_update_misconception_lane` ni corre ahí porque el `return`
   temprano pasa antes de calcular `VERDICT` — ¿eso está bien (el
   carril simplemente no existe fuera de sesiones de feedback
   inmediato, como dice el comentario de `sessions.mode`), o hay que
   sacar el carril de ese `if` también?
2. **El guard de `LANE_TRIGGER` contra misconceptions sin remediación**
   (§3.2): lo agregué yo. ¿Se mantiene, o preferís que la fila se cree
   igual para no perder el conteo de `times_triggered` aunque no haya
   carril que mostrar?
3. **Un distractor del propio carril que mapea a otra misconception.**
   Si el alumno falla el ítem de `position` 2 de un carril para la
   misconception A, pero el distractor que eligió mapea a la
   misconception B, hoy solo se procesa A (avanza o traba); B no se
   dispara. Quedó así por simplicidad — no estaba en el pedido y
   sumarlo implica decidir si dos carriles pueden estar `active` al
   mismo tiempo para el mismo alumno (la tabla lo permite, el
   `PRIMARY KEY` es por misconception).
4. **`locked → ?`** (§2, decisión 3): la salida por "revisar la clase"
   quedó modelada en el comentario de la columna, sin tabla de
   seguimiento de lectura de clases y sin disparador. El día que se
   construya, falta decidir a qué estado vuelve — ¿`resolved`, como si
   se hubiera cerrado bien, o algo que la tabla todavía no tiene?

---

## 5. Lo que no toqué

- `recompute_node_mastery`, `RECOMPUTE_FOR_ITEM`: sin cambios, tal
  como se pidió.
- `responses` (tabla y query de insert): sin cambios de columnas ni de
  lógica de `context`.
- `GET /next`: no sirve ítems del carril. El carril existe como
  estado; enrutar `next_item` para que lo consulte y sirva
  `remediation_items` cuando corresponda es trabajo aparte, no pedido
  acá ("nada de frontend" además implica que ninguna pantalla puede
  mostrar el carril todavía aunque el backend ya lo calcule).
- Sin migración de backfill: la tabla arranca vacía, no hay
  `student_misconceptions` históricas que reconstruir porque el carril
  nunca se registró antes de hoy.
