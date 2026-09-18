# Plataforma PAES — Bitácora: autenticación con Supabase Auth

*Sesión: 18 de septiembre de 2026*

---

## 1. Qué se pidió

El alumno estaba hardcodeado en el frontend (`STUDENT_ID` fijo en
`page.tsx`) y el backend confiaba en un `student_id` que mandaba el
cliente — en el body de `POST /sessions`/`POST /responses` y en el path
de `GET /next` y `GET /sessions/current`. Cualquiera podía escribir
respuestas o leer progreso a nombre de otro alumno con solo cambiar ese
valor. Se cerró eso: el alumno pasa a salir exclusivamente de un JWT de
Supabase Auth, validado en el backend.

Decisión de modelo, tomada por el usuario antes de tocar código:
`students.id` pasa a ser el mismo uuid que `auth.users.id`. Un solo
identificador en todo el sistema, sin columna `auth_user_id` ni
traducción entre ids.

---

## 2. Qué cambié

**`data/migraciones/033_auth_identidad_unica.sql`:**
- Los 4 alumnos de prueba existentes (`Prueba`, `Ben — vacío`, `Ben — falla
  POT-PROD-RESTA`, `Ben — domina`) tenían `auth_user_id` vacío — ninguno
  podía representarse bajo el modelo nuevo. Se descartaron junto con sus
  sesiones y respuestas (`delete from responses`, `delete from sessions`,
  `delete from students`, en ese orden; `node_mastery`,
  `student_misconceptions` y `student_courses` no se tocaron a mano —
  tienen `fk ... on delete cascade` a `students` desde que se crearon).
- `alter table students drop column auth_user_id`.
- `alter table students alter column id drop default` — ya no lo genera
  la aplicación.
- **Agregado no pedido explícitamente, pero es la forma directa de
  aplicar la decisión de modelo:** `alter table students add constraint
  students_id_fkey foreign key (id) references auth.users(id) on delete
  cascade`. Sin esto, nada impedía crear un `students` con un id que no
  corresponde a ninguna cuenta real.
- Insertada la fila del primer alumno real.

**`data/migraciones/034_alumno_real_uuid_correcto.sql`:**
Entre escribir la migración `033` y hacer la prueba end-to-end, la cuenta
de Supabase Auth se recreó con otro uuid (mismo mail,
`bacofrev@gmail.com`). El `on delete cascade` de `students_id_fkey`
efectivamente vació `students` solo al borrarse la cuenta vieja — quedó
como validación en vivo de que la FK hace lo que tiene que hacer. Esta
migración solo inserta la fila con el id correcto
(`4055b69a-c9db-42fc-b69f-fcd6db906161`).

**`auth.py`, nuevo:**
`get_current_student()` — dependency de FastAPI. Lee `Authorization:
Bearer <token>`, valida con PyJWT + `PyJWKClient` contra
`SUPABASE_JWKS_URL` (env var, `.well-known/jwks.json`, sin secreto que
guardar), algoritmo `ES256` únicamente, `audience="authenticated"`
explícito (PyJWT rechaza el claim `aud` si no se pasa `audience`, así que
hacía falta declararlo). Devuelve el `sub` del payload. Sin header,
header sin `Bearer`, firma inválida o token expirado → `401`.
`PyJWKClient` cachea el JWKS en el proceso (no hay round-trip a Supabase
por request); un solo cliente a nivel de módulo, mismo patrón que
`db.pool`.

`requirements.txt`: `PyJWT[crypto]` (el extra `crypto` trae
`cryptography`, necesario para verificar firmas `ES256`).

**`main.py` — barrido completo del router:**
- `GET /students/{student_id}/nodes/{node_code}/next` → `GET
  /nodes/{node_code}/next`. `student_id` sale del path.
- `GET /students/{student_id}/sessions/current` → `GET
  /sessions/current`.
- `ResponseIn` y `SessionIn` pierden el campo `student_id`.
- Los cinco endpoints que necesitan identidad de alumno
  (`next_item`, `create_response`, `create_session`, `current_session`,
  y ahora también `end_session`/`session_report`, ver abajo) toman
  `student_id: str = Depends(get_current_student)`.
- **`end_session` y `session_report` no tenían student_id como
  parámetro — tampoco tenían ningún chequeo de dueño.** Cualquiera que
  supiera o adivinara un `session_id` (uuid, en la práctica no
  adivinable, pero igual) podía terminar o leer el reporte de la sesión
  de otro alumno. No estaba pedido explícitamente en la consigna, pero
  es exactamente el tipo de agujero que esta sesión existe para cerrar
  ("toda la autorización vive en FastAPI"), así que se agregó
  `Depends(get_current_student)` + el mismo chequeo `session["student_id"]
  != student_id → 403 session_not_yours` que ya tenían `next_item` y
  `create_response`.

**Frontend (`frontend/`):**
- `npm install @supabase/ssr @supabase/supabase-js`.
- `lib/supabase/client.ts` — `createBrowserClient`, un cliente para toda
  la app.
- `app/LoginScreen.tsx`, nuevo — mail + contraseña,
  `signInWithPassword`.
- `app/page.tsx`: sale `STUDENT_ID` hardcodeado. Estado `session` (
  `undefined` = cargando, `null` = sin sesión → `LoginScreen`, si no →
  la app de siempre) poblado con `getSession()` +
  `onAuthStateChange`. `authHeaders()` agrega
  `Authorization: Bearer <access_token>` a las tres llamadas al backend
  (`POST /sessions`, `GET /next`, `POST /responses`) y a
  `POST /sessions/{id}/end`, que antes no mandaba headers. `student_id`
  sale de los tres bodies y de la URL de `/next`. Botón "Cerrar sesión"
  en la pantalla de inicio.
- `.env.local`: `NEXT_PUBLIC_SUPABASE_URL` y
  `NEXT_PUBLIC_SUPABASE_ANON_KEY` (nunca `service_role`) — ya estaba
  gitignoreado (`frontend/.gitignore` tiene `.env*`).

---

## 3. Cómo se verificó

- `import main` limpio, rutas registradas sin `{student_id}` en ningún
  path (confirmado con un dump de `app.routes`).
- `fastapi dev main.py` local. Sin header `Authorization`: `401
  missing_token` en `POST /sessions`, `GET /nodes/.../next`, `POST
  /responses`, `GET /sessions/current`. Token basura
  (`Bearer garbage.not.a.jwt`): `401 invalid_token`.
- **Bucle completo con un token real**, alumno logueado desde
  `frontend/` (`npm run dev`, `.env.local` apuntado a
  `localhost:8000` durante la prueba, revertido a la URL de Railway
  después): `POST /sessions` → `201`, `GET /next` → `200`, 15×
  `POST /responses` → `200`, `GET /next` final → `404 sin_items`,
  `POST /sessions/{id}/end` → `200`. Cero `401` durante el flujo real.
  Confirmado contra la base: las 15 respuestas y la sesión quedaron con
  `student_id = 4055b69a-c9db-42fc-b69f-fcd6db906161` (el del JWT, nunca
  mandado por el cliente); `node_mastery` recomputado, un nodo llegó a
  `mastered`.
- Repetido el chequeo de "sin header → 401" después del flujo real, para
  confirmar que no quedó ningún estado que lo saltara.
- `npm run lint` y `npm run build` en `frontend/`, limpios.
- `npx tsc --noEmit`, limpio.

---

## 4. Lo que no se tocó / hallazgos abiertos

- **No hay trigger de alta automática** en `auth.users` → `students`.
  Hoy la fila se crea a mano (esta sesión lo hizo dos veces, migraciones
  `033` y `034`). Con un solo alumno real esto no bloquea, pero el
  primer signup de un alumno nuevo va a fallar en el primer request al
  backend (`get_current_student` valida el JWT igual, pero cualquier
  endpoint que joinee o inserte contra `students` va a chocar con la FK
  si la fila no existe). Hace falta decidir: ¿trigger en Postgres sobre
  `auth.users`, o un endpoint/paso explícito de "completar registro"
  después del signup? No se armó en esta sesión — no estaba pedido y
  cambia superficie pública otra vez.
- **`SUPABASE_JWKS_URL` no está seteada en Railway.** Local
  (`.env`) sí. Sin esto, el deploy de este cambio tira `KeyError` al
  arrancar — hay que agregarla en el dashboard de Railway antes de
  pushear (ver `CLAUDE.md`: las env vars no se leen de ningún archivo
  del repo en producción).
- **`NEXT_PUBLIC_SUPABASE_URL` / `NEXT_PUBLIC_SUPABASE_ANON_KEY` no
  están en Vercel.** Mismo caso, del lado del frontend.
- **`frontend/.env.local`** quedó como estaba antes de esta sesión
  (`NEXT_PUBLIC_API_URL` apuntando al backend de Railway) — se cambió a
  `localhost:8000` solo durante la prueba en vivo y se revirtió después.
  Importante: mientras Railway no tenga el backend nuevo desplegado
  (con `SUPABASE_JWKS_URL` seteada), correr el frontend local contra esa
  URL va a fallar — el backend viejo en prod todavía espera
  `student_id` en el body y no sabe nada de JWT.
- **`esquema_actual.sql` no se regeneró.** Ya estaba desactualizado
  desde antes de esta sesión (no incluye ni `031` ni `032`); sigue sin
  ser un log reproducible según `CLAUDE.md`.
- **`data/loaders/` y `data/contenido/` no se tocaron** — no dependen de
  `students` ni de auth.
- **RLS de Supabase sigue sin usarse a propósito** — el pool de
  psycopg3 se conecta con un rol privilegiado y pasa por encima; toda la
  autorización vive en `auth.py` + los chequeos `session["student_id"] !=
  student_id` en `main.py`, como ya establecía la arquitectura del
  proyecto.
