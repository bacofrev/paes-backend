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
  lifespan. Endpoints borrow a connection via `db.pool.connection()`.

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
6. `node_mastery` — one row per (student, node), recomputed by the Postgres function
   `recompute_node_mastery` after every response (`queries.RECOMPUTE_FOR_ITEM`). It Beta-smooths
   the proportion correct against `mastery_config` (so 3-for-3 reads as 0.80, not 1.00) and
   requires a minimum count of *hard* items correct, not just volume. This computation lives in
   SQL, not Python — there is currently no application-level mirror of this logic to keep in
   sync if you touch it.

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
- Migrations are applied with `psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f <file>`, not
  through the Supabase SQL editor — the editor doesn't respect `begin`/`commit`, so a failure
  partway through leaves a half-applied migration with no transaction to roll back.
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