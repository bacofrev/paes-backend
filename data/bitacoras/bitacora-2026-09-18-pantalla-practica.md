# Plataforma PAES — Bitácora: primera pantalla del frontend (loop de práctica)

*Sesión: 18 de septiembre de 2026*

---

## 1. Qué se pidió

`frontend/` era hasta ahora un walking skeleton (`page.tsx` con un botón
"Probar backend" contra `/health`, nada más). La tarea: una sola pantalla,
el bucle completo de un nodo en modo `practice` — ítem, responder,
feedback, continuar — para un alumno y un `node_code` hardcodeados. Sin
login, sin router, sin historial, sin pantalla de reporte, sin librerías de
estado ni de componentes (`useState` + `fetch`). Look mobile-first a 390px,
paleta y tipografías (Manrope / IBM Plex Mono / Fraunces) dadas de antemano,
CSS plano, sin Tailwind pese a que el proyecto ya lo tenía instalado.

Instrucción explícita antes de escribir nada: leer el contrato exacto de
`POST /sessions`, `GET /next`, `POST /responses` en `main.py`/`queries.py` y
no inventar nombres ni campos que no estuvieran.

---

## 2. Tres huecos de contrato, encontrados antes de tocar el frontend

Leyendo el contrato tal cual estaba, tres partes del spec de UI no tenían
de dónde sacar el dato. Los tres se resolvieron agrandando una query
existente o agregando una chica — nunca inventando el nombre de un campo
que no viniera del backend.

1. **Nombre del nodo para la pantalla de Inicio.** Se muestra *antes* de
   `POST /sessions`, así que no alcanza con lo que devuelve `/next`. No
   existía ningún endpoint `node_code → name`. Se agregó `GET
   /nodes/{node_code}` (`main.py`), con `queries.NODE_BY_CODE` nueva.
   `404 node_not_found` si el código no existe o no está `active`.

2. **Alternativa correcta, para "La alternativa correcta era la X."** Ni
   `/next` ni `/responses` la devolvían. Decisión tomada con el usuario:
   agregarla a `POST /responses` (no a `/next`), para no filtrar por red
   la respuesta correcta antes de que el alumno conteste — se ve en
   Network/devtools igual, pero solo después de responder, no antes.
   `VERDICT` (`queries.py`) suma un segundo join a `item_options` (alias
   `co`, `co.is_correct = true`, mismo `item_id`) y expone
   `correct_option_id`/`correct_option_label`; el `join` es obligatorio,
   no `left join` — un ítem `active` sin alternativa correcta es un bug de
   contenido que tiene que verse, no esconderse en un `null` silencioso.

3. **Nombre del nodo de origen de un ítem de carril** (segunda línea del
   banner: "Este viene de `<nombre>`"). `NEXT_LANE_ITEM` ya devolvía
   `item_node_code` pero no el nombre. Se sumó `n.name as item_node_name`
   al `select` y al `group by`. Se decidió extender la query en vez de
   hacer un segundo fetch en el cliente para resolver el nombre — evita un
   round-trip extra justo antes de medir `response_time_ms`.

**Una decisión de producto que no es un hueco de contrato pero tampoco
estaba en los 8 estados originales:** `POST /sessions` puede devolver `409
session_already_open` (el alumno hardcodeado ya tenía una sesión abierta de
una prueba anterior). El usuario decidió tratarlo exactamente igual que el
Estado 7 ("Tu sesión se cerró." + "Empezar de nuevo"), aunque sea lo
opuesto semánticamente — hay una sesión abierta, no cerrada. Implementado
literal, sin cerrar la sesión vieja automáticamente: si sigue abierta,
"Empezar de nuevo" vuelve a pegar el mismo 409. Es el comportamiento
pedido, no un bug pendiente.

---

## 3. Qué se construyó

- **`frontend/app/layout.tsx`** — fuentes Manrope/IBM Plex Mono/Fraunces
  vía `next/font/google`, `lang="es"`.
- **`frontend/app/globals.css`** — reescrito entero, sin
  `@import "tailwindcss"`. Tokens de color exactos del spec, tarjeta,
  bloque de carril, opciones (`<label>`+`<input type=radio>`, 56-58px),
  botones reales, label de misconception en Fraunces 26px (único uso de
  esa tipografía).
- **`frontend/app/page.tsx`** — un solo client component. Máquina de
  estados con 4 valores de `screen` (`start`/`item`/`empty`/`closed`); los
  8 estados del spec salen de cruzar `screen` con `answer` (null / correcto
  / incorrecto) y `currentItem.source` (`pool`/`lane`). `STUDENT_ID` y
  `NODE_CODE` como constantes hardcodeadas arriba del archivo — valores
  reales pasados por el usuario, no placeholders.
- **Medición:** `response_time_ms` (dibujado del ítem → click en
  Responder) se manda al backend, que ya lo acepta. El segundo timer
  (cuánto estuvo abierto el bloque de resultado hasta Continuar) el
  backend no lo recibe hoy — queda en
  `console.log("result_block_open_ms", ...)`, marcado así a propósito.

### Agregado después, a pedido: Markdown + LaTeX

El `body` de `remediation` mezcla Markdown (`**negrita**`) y LaTeX
(`$...$`, `$$...$$`); igual que `stem` y `options[].body`. Primera versión
lo mostraba tal cual venía (texto crudo, `$$...$$` visible). A pedido se
agregó `frontend/app/MathText.tsx`: `react-markdown` + `remark-math` +
`rehype-katex`, con dos modos (`as="p"` para bloques — enunciado,
misconception, remediación — y `as="span"` para que la alternativa no
rompa el `<label>` metiendo un `<p>` adentro de un inline). CSS de KaTeX
importado en `layout.tsx`; `.katex-display` con `overflow-x: auto` para
que una fórmula ancha no desborde la tarjeta en 390px en vez de agrandar
el layout. Dependencias nuevas: `react-markdown`, `remark-math`,
`rehype-katex`, `katex`.

---

## 4. Cómo se verificó

Nada de esto se dio por bueno solo por compilar. Contra la base compartida
real (`fastapi dev main.py` local, mismo `DATABASE_URL` que producción):

- **curl de punta a punta** con el `student_id`/`node_code` reales:
  `GET /nodes/...`, `POST /sessions` (incluyendo el 409 real, porque ya
  había una sesión abierta de una prueba anterior), `GET /next`,
  `POST /responses` con una alternativa incorrecta (misconception +
  remediación + `correct_option` en la respuesta) y una correcta, y un
  segundo `GET /next` que confirmó la activación real del carril
  (`source: "lane"`, con `item_node_code`/`item_node_name` correctamente
  omitidos por venir del mismo nodo).
- **Navegador real, headless, 390px.** No había `chromium-cli` en este
  entorno; se instaló Playwright ad-hoc (`npx playwright install
  chromium`) y se escribió un driver chico en el scratchpad — no quedó
  nada de esto en el repo. Confirmado por captura: ambos casos (acierto y
  error) con el orden exacto del spec, "TU RESPUESTA" en la elegida,
  fórmulas y negrita renderizadas (exponentes, fracciones), sin overflow
  horizontal.
- **Falsa alarma que vale dejar anotada:** las primeras corridas del
  driver mostraban `POST /sessions` en 201 pero la pantalla se quedaba
  pegada en "Inicio", sin pasar a mostrar el ítem. No era un bug de
  `page.tsx` — el primer `fetch` a `/next` contra el backend local recién
  levantado (`uvicorn --reload` en frío) tardaba más que el timeout corto
  del script de prueba. Con más margen de espera, el flujo corría entero
  sin tocar nada del código. Se anota para no reabrir la investigación si
  alguna vez el primer request de una corrida local parece "colgado".

---

## 5. Aparte, un bug post-commit (no de esta tarea, pero relacionado)

Después de commitear (`eae7864`, `b8947fb`), un reorder manual del usuario
en `main.py` (`07fb47b`, "change in the domain") borró sin querer la línea
`app = FastAPI(lifespan=lifespan)`. `app.add_middleware(...)` quedó
corriendo antes de que `app` existiera → `NameError` al importar el
módulo, ningún endpoint se registraba. Arreglado en un commit aparte
(`f5014b3`) restaurando esa línea antes del middleware. Se preguntó por el
otro cambio de ese mismo commit — el origin de CORS pasó de
`paes-frontend.vercel.app` a `paes-backend.vercel.app` — y se confirmó con
el usuario que es a propósito; no se tocó.

---

## 6. Lo que no se tocó / decisiones abiertas

- **`STUDENT_ID`/`NODE_CODE` hardcodeados en el código fuente**, no en
  variable de entorno — así se pidió para esta v1 de una sola pantalla.
- **El loop del 409 `session_already_open`** (§2) no tiene salida
  automática — "Empezar de nuevo" puede volver a pegar contra la misma
  sesión abierta. Aceptado explícitamente, no es un olvido.
- **`npm install` para Markdown/LaTeX destapó una vulnerabilidad crítica
  ya existente**, no introducida acá: `next@16.3.0` tiene un RCE no
  autenticado ([GHSA-p293-qw3h-jr36](https://github.com/advisories/GHSA-p293-qw3h-jr36)).
  No se actualizó Next como parte de esta tarea — es una decisión aparte,
  con riesgo de breaking changes dado que este proyecto ya corre una
  versión de Next fuera de lo usual (ver `frontend/AGENTS.md`). Queda
  pendiente decidir si se sube.
- **No hay endpoint para el segundo timer** (`result_block_open_ms`) — ver
  §3. Si se termina necesitando, es un campo más en `ResponseIn` y en
  `INSERT_RESPONSE`, no un endpoint nuevo.
- **`allow_origin_regex=r"https://.*\.vercel\.app"`** agregado en el mismo
  commit del CORS (§5) permite cualquier subdominio `*.vercel.app`, no
  solo el del proyecto — típico para previews de Vercel por PR/branch,
  pero más ancho que un origin exacto. Marcado como aparte, no revertido.
