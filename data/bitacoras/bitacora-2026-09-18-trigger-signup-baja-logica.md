# Plataforma PAES — Bitácora: trigger de alta, FK a restrict, baja lógica

*Sesión: 18 de septiembre de 2026*

---

## 1. Qué se pidió

Cinco cosas, todas alrededor del ciclo de vida de un alumno como cuenta de
Supabase Auth (seguimiento directo de los hallazgos abiertos en
`bitacora-2026-09-18-autenticacion-supabase.md` §4):

1. Trigger de alta automática en `auth.users` → `public.students` — hoy la
   fila se crea a mano (migraciones `033`, `034`); cualquier alumno real
   que se registre queda sin fila y revienta en el primer endpoint.
2. `students_id_fkey` de `on delete cascade` a `restrict` — borrar una
   cuenta desde el panel de Supabase borra en silencio al alumno y todo su
   historial; ya pasó una vez.
3. Baja lógica: columna `deleted_at` + rechazo real en
   `get_current_student()` (403), no solo la columna.
4. Barrido completo del router con el criterio corregido: *todos* los
   endpoints llevan `Depends(get_current_student)`, no solo los que
   reciben `student_id`. El barrido anterior se había quedado corto —
   `GET /nodes/{node_code}` respondía sin token.
5. Frontend: campo "Nombre" único en el signup, mandado como
   `options.data.display_name` en el `signUp` de Supabase.

---

## 2. Qué cambié

**`data/migraciones/035_trigger_signup_soft_delete.sql`**, corrida contra
la base real (`psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f`):
- `public.handle_new_user()` — `security definer set search_path = public`,
  trigger `on_auth_user_created` (`after insert on auth.users`). Inserta
  en `students (id, display_name)` con `new.raw_user_meta_data ->>
  'display_name'` (null si no viene), `on conflict (id) do nothing` para
  que sea idempotente (reintentos, o una fila ya creada a mano). Sin
  `security definer`, el rol que dispara el trigger no tiene permisos
  sobre `public.students` y el alta entera en `auth.users` falla.
- `students_id_fkey`: drop + recreate con `on delete restrict` en vez de
  `on delete cascade`.
- `students.deleted_at timestamptz`, nullable, sin default (nula = activo).

**`auth.py`** — `get_current_student()` ahora hace un round-trip extra a
la base después de validar el JWT: `queries.STUDENT_DELETED_AT` por
`sub`. Si la fila existe y `deleted_at is not null` → `403
student_deleted`. Si no hay fila (no debería pasar con el trigger
puesto), no bloquea — mismo comportamiento que antes de este cambio.
Importa `db` y `queries`, mismo patrón que `main.py` (el pool se abre en
el lifespan de FastAPI; `auth.py` solo lo usa en tiempo de request).

**`queries.py`** — `STUDENT_DELETED_AT`, nueva.

**`main.py`** — `GET /nodes/{node_code}` gana
`student_id: str = Depends(get_current_student)`. Era el único endpoint
del router (sin contar `/health`) sin la dependencia; en producción
respondía `404 node_not_found` sin token en vez de `401`, lo que además
deja adivinar códigos de nodo válidos sin estar logueado.

**`GET /health` queda deliberadamente sin `Depends(get_current_student)`**
— decisión explícita tomada con el usuario en esta sesión: no toca
`students` ni ningún dato de alumno (`select 1` + estado de la pool), y
gatearlo detrás de un JWT le rompería a cualquier healthcheck o monitor
externo que hoy le pegue sin token. Es la única excepción al criterio
"todos los endpoints" del punto 4; el resto del router (7 endpoints)
confirmado con `Depends(get_current_student)` inspeccionando
`app.routes` en runtime, no solo leyendo el código.

**Frontend — `app/LoginScreen.tsx`:** no existía pantalla de signup
separada (el hallazgo abierto de la sesión anterior — solo había
`signInWithPassword`). Se agregó un toggle `mode: "login" | "signup"` en
el mismo componente en vez de una pantalla nueva: menos superficie, y el
alta es simple hoy. En modo `signup` aparece un solo campo "Nombre"
(sin apellido — el modelo de datos del alumno no está definido todavía,
según lo pedido) y el submit llama `supabase.auth.signUp({ email,
password, options: { data: { display_name: name } } })`. Reutiliza las
clases CSS existentes (`.field`, `.primary`, `.link-button` para el
toggle) — no se tocó `globals.css`.

---

## 3. Cómo se verificó

Todo contra la base real (no hay staging — `CLAUDE.md`), backend local
(`fastapi dev main.py`) contra esa misma base:

- **Alta automática:** signup real vía `POST {SUPABASE_URL}/auth/v1/signup`
  con `apikey` = anon key y `data.display_name`, exactamente lo que hace
  `supabase-js` desde `LoginScreen.tsx` — no se pudo abrir un navegador
  desde este entorno, así que se reprodujo la misma llamada HTTP que hace
  el frontend. Confirmado en `students`: fila creada sola, con el
  `display_name` correcto.
- **`GET /nodes/{code}` sin token:** `401 missing_token`. Con token
  basura: `401 invalid_token`. `POST /sessions` sin token: `401` también.
- **Bucle completo con el token real** del alumno de prueba: `POST
  /sessions` → `201`, `GET /nodes/{code}/next` → `200`, `POST /responses`
  → `200` (`is_correct: true`), `POST /sessions/{id}/end` → `200
  completed`.
- **Baja lógica:** `update students set deleted_at = now()` a mano sobre
  el alumno de prueba (con su sesión ya cerrada). Mismo token, mismo
  request antes válido (`GET /nodes/{code}`, `GET /sessions/current`) →
  `403 student_deleted` en ambos.
- **FK a restrict:** con la fila de `students` todavía viva, `delete from
  auth.users where id = ...` → rechazado por Postgres
  (`violates foreign key constraint "students_id_fkey"`), confirmando que
  ya no hay cascade silencioso.
- **Limpieza:** el alumno de prueba se borró al final, en el orden que
  `restrict` ahora exige (`responses` → `sessions` → `students` →
  `auth.users`), dejando la base como estaba antes de la sesión.
- **Frontend:** `npm run lint` y `npm run build` (incluye `tsc` interno),
  limpios.

---

## 4. Lo que no se tocó / hallazgos abiertos

- **`esquema_actual.sql`** no se regeneró — sigue sin ser un log
  reproducible según `CLAUDE.md`, y esta sesión no lo cambia.
- **No se abrió un navegador real** para probar el signup: se verificó
  con la misma llamada HTTP que hace `supabase-js` desde el browser
  (mismo endpoint, mismo `apikey`, mismo body), pero vale la pena que
  alguien confirme una vez a mano desde `npm run dev` que el campo
  "Nombre" se ve bien y el toggle entre "Ingresar"/"Crear cuenta" es
  claro.
- **`GET /health` sigue público** — ver decisión explícita arriba. Si en
  algún momento empieza a filtrar algo más que `{"status", "db"}`,
  reconsiderar.
- **RLS de Supabase sigue sin usarse a propósito** — sin cambios respecto
  a la sesión anterior; toda la autorización sigue viviendo en
  `auth.py` + los chequeos `session["student_id"] != student_id` en
  `main.py`.
- **`get_current_student()` ahora pega a la base en cada request**
  (antes solo validaba el JWT en memoria vía JWKS cacheado). Es un
  round-trip más por request, sobre el mismo pool que ya usa cada
  endpoint — no debería notarse con el volumen actual, pero es el primer
  lugar a mirar si `get_current_student` aparece como punto lento más
  adelante.
