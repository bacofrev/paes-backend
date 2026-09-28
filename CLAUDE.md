# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Backend for a PAES (Chilean university-entry exam) math prep platform. A student answers
items (questions), the backend records the response, and a Postgres function recomputes
whether they've mastered each prerequisite node in a hand-built knowledge graph. The product
bet is psychometric: it eventually adds IRT (item response theory) and BKT (Bayesian
knowledge tracing), which is why the backend is Python and lives in its own service rather
than inside the Next.js app.

## Commands

```bash
source .venv/bin/activate      # required in every new terminal — not persistent
fastapi dev main.py            # dev server on localhost:8000
```

After installing any library:

```bash
pip install <package>
pip freeze > requirements.txt   # do this in the same commit — Railway builds from this file, not your local venv
```

Frontend (`frontend/`, separate Next.js app, deployed to Vercel):

```bash
cd frontend && npm run dev      # localhost:3000
npm run build
npm run lint
```

There is no test suite yet (`pytest` is planned, not present — don't assume tests exist).

## Deploy model

`main` is production for both services. Railway (backend) and Vercel (frontend) watch `main`
via webhook — `git push` *is* the deploy command, with no staging environment. The build runs
on the server, not locally: a package installed locally but missing from `requirements.txt`
works on your machine and breaks in production with `ModuleNotFoundError`. Env vars are set
once in each provider's dashboard and are not read from any file in this repo (`.env` /
`data/.env` / `frontend/.env.local` are local-only and gitignored).

CORS origins are hardcoded in `main.py` — update that list when the frontend URL changes, and
never widen it to `allow_origins=["*"]` once real student sessions exist.

## Architecture

**Two services, one repo.** `paes-backend` (FastAPI, this root) and `paes-frontend` (Next.js,
`frontend/`) are separate deploys glued together only by an HTTP API and CORS. `data/` holds
the content-authoring pipeline and SQL migrations for the shared Postgres (Supabase). All
three were merged into one repo for convenience; they still ship independently.

**Request flow through the backend is thin on purpose:**
- `main.py` — every endpoint. Validates, orchestrates, applies business rules that don't
  belong in SQL (session TTLs, mode-based feedback gating, ownership checks).
- `queries.py` — every SQL statement, as string constants. The comment at the top of the file
  states the intent: when item selection moves to IRT, the diff should be contained to this
  file, not scattered across endpoints.
- `db.py` — a single `psycopg_pool.AsyncConnectionPool`, opened/closed in the FastAPI
  lifespan. Endpoints borrow a connection via `db.pool.connection()` (a transaction: use it
  for anything that writes) or `db.read_connection()` (autocommit, for reads).
- **Round trips are the cost, not queries.** Supabase is in us-west-1; from Chile each round
  trip is ~200 ms. A read-only endpoint takes `Depends(read_as_student)` (`auth.py`) and reads
  only through `reads.fetch(...)`, which sends the soft-delete check and all its queries in one
  pipeline (one round trip) — so queries that go together must not depend on each other's
  results (key them by code, decide ownership in Python after). Write endpoints keep
  `Depends(get_current_student)`.

**Domain model, in the order data moves through it:**
1. `nodes` — one topic each (e.g. `NUM-POT-SIG`), grouped under `areas` (`NUM`, `ALG`, `GEO`,
   `EST`, `PRO`). Codes are constrained by the `code_text` domain and a trigger
   (`check_code_matches_area`) that enforces the prefix matches the area.
2. `node_edges` — prerequisite DAG between nodes. A trigger (`node_edges_no_cycles`) walks the
   graph on insert and rejects anything that would close a cycle.
3. `items` — questions. Each item belongs to exactly one node (`UNIQUE` on
   `node_items.item_id`, migration `026`); a node has many items. An item is never shared
   across nodes: its distractors encode errors of *its* node, so using it to evaluate another
   node would measure the wrong thing. Items have `status` `draft`/`active`. **Loading content
   never publishes it** — `active` is a separate, explicit step a human does, because promoting
   an unvalidated item can hand out wrong feedback silently.
4. `item_options` / `misconceptions` / `remediations` — each wrong option can point at a named
   misconception, which can point at a remediation. `responses` stores `option_id`, not just
   correct/incorrect — *which* distractor a student picked is the diagnostic signal; collapsing
   it to a boolean throws that away.
5. `sessions` — the unit of study. `mode` (`diagnostic` | `mock_exam` | `study` | `practice` |
   `review`) is a behavior switch, not metadata: it decides where items come from, whether
   feedback is immediate or deferred (`NO_FEEDBACK` modes in `main.py`), and the TTL after
   which an unfinished session is auto-abandoned (`SESSION_TTL`). Only one `in_progress`
   session per student is allowed (partial unique index) — `POST /sessions` pre-checks this
   and also relies on the index to turn a lost race into a 409, not a 500. A session's `mode`
   is read server-side (`SESSION_BY_ID`) when scoring a response, never trusted from the
   client, so a student can't open a `mock_exam` and answer as `practice` to dodge deferred
   feedback.
6. `plans` / `courses` — what a student *buys* vs. what they *see*. A plan (`CIE-BIO`, "Ciencias
   mención Biología") grants several courses (`FIS`, `QUI`, `BIO-E`) via `plan_courses`;
   `student_plans` records the purchase. A course is `(subject, area or null, exam_level)`, and
   level 2 includes level 1. The student's scope is the union of the courses from their active
   plans (`v_student_courses`, a view — there is no stored per-student course list). Tiles come
   from `v_student_visible_courses` (`QUI` is hidden behind `QUI-E`; `M1`/`M2` are never merged).
   Which lessons a course shows comes from `v_course_lessons`: a lesson enters only if *every*
   node is in scope, and a trigger (`check_lesson_single_level`) forbids a lesson mixing level-1
   and level-2 nodes. That's what keeps `M1` from ever listing an `M2` lesson. Migration `052`;
   test with `data/sim_cursos_alcance.sql`. How a course *looks* (subtitle, short name, icon key)
   lives in `courses` too (migration `075`), never mapped by code in the frontend.
   A lesson's state (`review`/`completed`/`in_progress`/`available`/`locked`) is computed in
   `main.py` (`lesson_state`). A locked lesson can still be read; only practice is blocked, and
   the backend enforces it: `POST /sessions` and `GET /nodes/{code}/next` check `NODE_ACCESS`
   (`v_available_nodes`) → 404 `node_not_found` out of scope, 409 `node_locked` with pending
   prereqs. See `bitacora-2026-09-28-plataforma-cursos.md`.
7. `node_mastery` — one row per (student, node), recomputed by the Postgres function
   `recompute_node_mastery` after every response (`queries.RECOMPUTE_FOR_ITEM`). It Beta-smooths
   the proportion correct against `mastery_config` (so 3-for-3 reads as 0.80, not 1.00) and
   requires a minimum count of *hard* items correct, not just volume. This computation lives in
   SQL, not Python — there is currently no application-level mirror of this logic to keep in
   sync if you touch it.

**Frontend routes** (`frontend/app/`): `AuthProvider` (root layout) gates everything behind the
Supabase login; `(app)/` is the shell (sidebar on web, tab bar on phones) with `/` Inicio,
`/cursos`, `/cursos/[curso]`, `/cursos/[curso]/clases/[clase]`, `/perfil`; `/practica/[nodo]`
(`?curso=&clase=`) is the full-screen practice, outside the shell. Nothing content-related is
hardcoded in the frontend: codes, names, order and icons all come from the API. Lesson bodies
are split by `## ` in `lib/sections.ts`, whose `slug()` must stay identical to
`data/loaders/cargar_contenido.py` — the loader validates `lesson_nodes.anchor` against it.

**Content pipeline** (`data/contenido/`, `data/loaders/`, `data/migraciones/`):
- Lessons are authored as YAML **per class** (`data/contenido/LES-<UNIT>-<NN>.yaml`), not per
  node — one class covers several nodes and its misconceptions are shared across them.
- Misconceptions are authored once per unit in `data/contenido/misconceptions/<unit>.yaml`.
  Lessons only *reference* misconception codes; `cargar_contenido.py` fails loudly if a
  referenced code isn't in the catalog yet, specifically to prevent two lessons from silently
  defining the same error differently.
- `cargar_contenido.py`, `cargar_misconceptions.py`, and `grafo.py` (the Python source of truth
  for the node/edge graph, defined as plain dicts/tuples) never touch the database — they emit
  SQL to stdout for review, which then becomes the next numbered file in `data/migraciones/`.
- Figures are SVG files in `data/contenido/figuras/FIG-<unit>-<node>-<NN>.svg`, referenced by an
  item (`figure:` in the lesson YAML → `items.figure_id`) or from a lesson/remediation body
  (`![](fig:CODE)`), never both — an item's figure shown in a lesson leaks the answer.
  `data/loaders/figuras.py` holds the SVG/markdown rules (no scripts or external refs, only
  `currentColor`/`none`); `recta.py` generates number lines. There is deliberately no endpoint
  that lists figures. See `bitacora-2026-09-25-figuras.md`.
- Migrations are applied with `psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f <file>`, not
  through the Supabase SQL editor — the editor doesn't respect `begin`/`commit`, so a failure
  partway through leaves a half-applied migration with no transaction to roll back.
- `DATABASE_URL` is Supabase's **transaction-mode pooler** (port 6543): a bare session-level
  `set ...` sticks to the server connection and leaks to the next client, production included.
  For ad-hoc read-only checks use `begin read only; …; rollback;` or `set local`, never `set`.
- History starts at `026`; migrations `001`–`025` were never committed, so `esquema_actual.sql`
  is a `pg_dump` reconstruction of current state, not a replayable log. Don't treat it as one.
- When editing a loader, verify by counting output lines, not exit code — an empty file piped
  through the loader still exits 0 and prints nothing, which has been mistaken for success
  before.

**Reference material, not source of truth:** the CSVs in the repo root (`Vistas e indices.csv`,
`columnas de todas las tablas.csv`, `funciones completas.csv`, `Constriants...csv`) are one-off
exports for human review, not generated or consumed by any script.

`data/bitacoras/` is a running dev journal in Spanish — worth checking for the reasoning behind
a schema or endpoint decision before changing it, especially `bitacora-tecnica-paes.md` (stack
overview) and the dated files for specific decisions.