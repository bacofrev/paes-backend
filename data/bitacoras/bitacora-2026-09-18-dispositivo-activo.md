# Plataforma PAES — Bitácora: bloqueo por dispositivo activo

*Sesión: 18 de septiembre de 2026 — continúa el trabajo de
`bitacora-2026-09-18-pantalla-practica.md`*

---

## 1. Qué se pidió

Probando la pantalla de práctica desde dos dispositivos (compu + celu, mismo
alumno hardcodeado) se detectó que la sesión no tiene dueño: los dos
comparten `session_id` y el backend nunca distingue de dónde viene cada
request. Dos parches de esta misma sesión de trabajo ya habían resuelto
síntomas — que el segundo dispositivo pudiera *entrar* a la sesión sin
chocar con un 409 confuso, y que un ítem ya respondido en otro lado no
rompiera la pantalla vieja — pero dejaban a los dos dispositivos
respondiendo ítems distintos en paralelo, indefinidamente, sin que ninguno
se enterara del otro.

Decisión de producto, tomada con el usuario antes de tocar código: bloqueo
duro. En cuanto el dispositivo B toma la sesión, la siguiente acción del
dispositivo A (pedir ítem o responder) se rechaza con un mensaje claro —
"Seguís esta sesión desde otro dispositivo." — con dos botones: **Retomar
acá** (A vuelve a ser el activo) y **Empezar de nuevo** (termina la sesión
entera para los dos).

---

## 2. Qué cambié

**Esquema — `data/migraciones/032_session_active_device.sql`:**
```sql
alter table sessions add column active_device_id text;
```
Nullable, sin backfill. Aplicada contra la base compartida (no hay una
local separada) con el proceso de siempre (`psql ... -1 -f ...`), con
confirmación explícita del usuario antes de correrla — es una `ALTER TABLE`
de bajo riesgo (metadata-only, sin default que recalcular) pero toca el
esquema real.

**`queries.py`:**
- `CREATE_SESSION` ahora inserta `active_device_id`.
- `CLAIM_SESSION`, nueva: `update sessions set active_device_id = ... where
  id = ... and status = 'in_progress'`.
- `SESSION_BY_ID` suma `active_device_id` al `select` — lo necesitan
  `/next` y `/responses` para comparar.

**`main.py`:**
- `POST /sessions` reclama la sesión para quien la llama. Esto pasa en el
  mismo lugar para los tres casos (sesión nueva, segundo dispositivo,
  "Retomar acá"): no hay endpoint de claim aparte, `POST /sessions` *es*
  el claim. En la rama que hoy solo lanzaba el 409
  `session_already_open`, ahora corre `CLAIM_SESSION` con el `device_id`
  entrante antes de lanzar la excepción.
- `GET /next` y `POST /responses` suman `device_id` como parámetro
  obligatorio, y una cuarta validación (después de existe/`in_progress`/es
  tuya): si `active_device_id` no es `NULL` y no coincide con el
  `device_id` que llega, `403 session_taken_over`.
- `POST /sessions/{id}/end` **sin cambios, sin chequeo de dispositivo a
  propósito** — tiene que poder terminarla el dispositivo que quedó
  bloqueado, porque es el botón "Empezar de nuevo" de la pantalla nueva.

`active_device_id IS NULL` nunca bloquea. Sin este detalle, cualquier
sesión `in_progress` que ya existiera en el momento del deploy —
`active_device_id = NULL` porque nadie la reclamó todavía bajo la
migración nueva — le habría dado `session_taken_over` a su único
dispositivo real en la primera llamada después del deploy.

**`frontend/app/page.tsx`:**
- `device_id`: `crypto.randomUUID()` generado una vez, persistido en
  `localStorage` (mismo navegador = mismo dispositivo entre recargas y
  pestañas; si `localStorage` tira, cae a un id en memoria para esa carga
  de página). Va en las tres llamadas: `POST /sessions`, `GET /next`,
  `POST /responses`.
- Estado `screen` nuevo: `"taken_over"`.
- `fetchNext` y `handleResponder` enrutan `detail === "session_taken_over"`
  a esa pantalla — aparte del `"item_already_answered_in_session"` que ya
  existía (ese sigue resolviéndose solo, pidiendo un ítem nuevo; este sí
  bloquea).
- La pantalla nueva **no agregó funciones**: "Retomar acá" dispara
  `handleEmpezar` (que ya sabe manejar el 409-con-`session_id` desde el
  fix anterior) y "Empezar de nuevo" dispara `handleTerminarSesion` (ya
  hacía `POST /sessions/{id}/end` + reset). El diseño de "`POST /sessions`
  siempre reclama" es justamente lo que permite que el botón de retomar no
  necesite nada nuevo del lado del cliente.

---

## 3. Un bug propio, encontrado por la primera prueba con curl

La primera corrida end-to-end (A crea sesión, B la reclama, A vuelve a
pedir ítem) dio el resultado **invertido**: A seguía activo, B quedaba
bloqueado. El `UPDATE` de `CLAIM_SESSION` se estaba revirtiendo.

Causa: en la rama del pre-check de `create_session`, el `CLAIM_SESSION` y
el `raise HTTPException(...)` del 409 quedan dentro del mismo `async with
db.pool.connection() as con:`. `db.py` no usa `autocommit` — la conexión
vive en una transacción implícita — y el patrón de `pool.connection()` es
el mismo que el de una conexión de psycopg sola: si el bloque se sale por
una excepción, hace `ROLLBACK`, no `COMMIT`. El `raise` que ya estaba ahí
(para devolver el 409) se comía el `UPDATE` que acababa de correr.

No había precedente de este patrón en el código existente — todo lo demás
que escribe y después puede lanzar una excepción lo hace en momentos
distintos (una viola una constraint antes de escribir nada, o el flujo
entero termina bien y el commit pasa solo al salir del bloque sin
excepción). Se corrigió con un `await con.commit()` explícito
inmediatamente después del `CLAIM_SESSION`, antes del `raise`. Repetida la
prueba con curl después del fix: A y B se turnan el control exactamente
como se esperaba.

---

## 4. Cómo se verificó

- **curl con dos `device_id` simulados**, contra la base compartida real
  (mismo `student_id` de siempre): A crea sesión y pide ítem (200); B
  abre, 409, reclama; A vuelve a pedir ítem → `403 session_taken_over`; B
  pide ítem → 200; A manda "Retomar acá" (`POST /sessions` de nuevo) →
  409, reclama otra vez; A pide ítem → 200; B pide ítem →
  `403 session_taken_over`. Los siete pasos dieron el resultado esperado
  después del fix del §3.
- **Playwright con dos `BrowserContext` separados** (no dos pestañas del
  mismo contexto — el `device_id` vive en `localStorage`, que dos pestañas
  del mismo navegador comparten, así que hacían falta storages aislados
  para simular dos dispositivos de verdad). Confirmado por captura: A
  cae en la pantalla nueva apenas B abre, "Retomar acá" se la devuelve,
  "Empezar de nuevo" termina la sesión para los dos.
- `npm run lint` y `npm run build` en `frontend/`, y `import main` en
  Python para confirmar que las rutas se registran, antes de cada prueba
  end-to-end.

---

## 5. Lo que no se tocó

- **`esquema_actual.sql`** no se regeneró. Ya estaba desactualizado
  respecto de la migración `031` desde antes de esta sesión — no es un
  log reproducible según `CLAUDE.md`, y no parece regenerarse en cada
  migración (el último commit que la tocó es anterior a `030`).
- **Sin endpoint de claim aparte.** Se decidió a propósito que `POST
  /sessions` hiciera de claim implícito — una alternativa más "limpia"
  (un endpoint `POST /sessions/{id}/claim`) hubiera sido más explícita
  pero agregaba un round-trip al flujo de "Retomar acá" que ya resolvía
  el fix anterior.
- **La rama de `UniqueViolation`** en `create_session` (la carrera entre
  dos creaciones simultáneas) no reclama el dispositivo — ese 409 nunca
  trae `session_id` en el body, así que el frontend ya caía en la
  pantalla `"closed"` genérica de antes; no se tocó porque es un caso
  aparte del flujo normal de dos dispositivos.
