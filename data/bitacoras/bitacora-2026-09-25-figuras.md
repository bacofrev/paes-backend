# Plataforma PAES — Bitácora: figuras SVG para ítems, clases y remediaciones

*Sesión: 25 de septiembre de 2026*

---

## 1. Qué se pidió

Soporte de figuras (rectas numéricas primero) para ítems, clases y
remediaciones. Decisión cerrada de antemano: **una tabla compartida, SVG en
línea, sin Storage**. El ítem apunta a su figura con una FK; la clase y la
remediación no llevan columna: referencian dentro del markdown con
`![](fig:CODIGO)`.

Reglas que venían con el encargo:

- La figura de un ítem no puede aparecer en ninguna clase ni remediación:
  filtraría la respuesta.
- No existe endpoint que liste figuras sueltas: expondría el banco de ítems.
- El SVG no puede traer nada ejecutable ni externo, y no puede tener colores
  fijos (desaparece en modo oscuro).
- El código de una figura es inmutable. Si cambia el SVG, se actualiza. Si
  una figura desaparece del contenido pero sigue referenciada en la base,
  falla.

Fuera de alcance: tocar contenido existente (incluidos los ítems de
ENT-REC, que van en un paso aparte) y figuras en las alternativas.

---

## 2. Cuatro desajustes con el repo, encontrados antes de escribir

1. **El código de ejemplo no cabía en `code_text`.** El dominio permite
   máximo 4 segmentos (`^[A-Z0-9]{2,6}(-[A-Z0-9]+){0,3}$`) y
   `FIG-ENT-REC-ESC-01` tiene 5. Decisión: **`FIG-<unidad>-<nodo>-<NN>`**,
   ej. `FIG-ENT-REC-01`. Mismo dominio que todo lo demás, más un check
   propio de la forma en `figures`.
2. **No hay endpoint ni pantalla de clase.** `lessons.body` no lo entrega
   nadie hoy; solo existe el evento `lesson_viewed`. Decisión: para la
   clase, **solo validación en el cargador**; el endpoint queda para cuando
   exista la pantalla. La remediación sí quedó completa, porque ya llega en
   `POST /responses`.
3. **El front no tiene modo oscuro.** `globals.css` tiene solo la paleta
   clara. Decisión: la figura hereda `currentColor` y se probó forzando
   fondo oscuro con texto claro en una página temporal, sin agregar un tema
   a la app.
4. **La "decisión de protección de contenido" no estaba escrita en ninguna
   parte.** Queda registrada acá: *el banco de ítems no se expone. Una
   figura solo viaja junto a lo que la usa (el ítem servido, o la
   remediación que la referencia). No hay listado ni búsqueda de figuras por
   código, y `figures` tiene RLS encendido sin policies, igual que `items`,
   `lessons` y `remediations`, para que PostgREST de Supabase tampoco la
   exponga.*

---

## 3. Qué quedó

### Esquema — `040_figures.sql`

- `figures (id, code code_text unique, svg text, created_at, updated_at)`.
  Checks: forma `FIG-X-Y-NN` y `octet_length(svg) <= 51200`.
- `items.figure_id` nullable, FK `on delete restrict` + índice parcial.
- RLS encendido, sin policies.

### Autoría

- SVGs en `data/contenido/figuras/<CODIGO>.svg`.
- En el YAML de clase, cada ítem puede llevar `figure: FIG-ENT-REC-01`. La
  figura tiene que ser del nodo del ítem (`NUM-ENT-REC` → `FIG-ENT-REC-NN`).
- `data/loaders/recta.py`: `recta(min, max, paso, rotulos, puntos)` → SVG.
  Aritmética exacta con `Fraction`. Antes de devolver, **relee el SVG que
  produjo** y verifica con asserts: marcas equiespaciadas y verticales,
  cada punto con `cx` exactamente igual a la coordenada de su valor (y a la
  de su marca, si cae en una), cada rótulo sobre su marca. Falla si una
  coordenada no es exacta en 3 decimales: un punto "casi" sobre su valor no
  sirve. Al final pasa por el mismo `validar_svg` del cargador.
  CLI: `python3 recta.py FIG-ENT-REC-01 --min=-5 --max 5 --paso 1 --rotulos=-5,0,5 --puntos=P=-3,Q=2`.
- El `aria-label` por defecto describe **solo lo que se ve**: rótulos
  visibles y nombres de puntos, nunca el valor de un punto con nombre. Si el
  ítem pregunta "¿qué número es P?", el texto alternativo no le da la
  respuesta al lector de pantalla.

### Validación — `data/loaders/figuras.py` (falla dura, sin SQL)

- SVG: ≤ 50 KB; sin DOCTYPE/ENTITY/xml-stylesheet; XML válido; raíz `<svg>`
  en el namespace SVG; `viewBox`; `aria-label` no vacío; `fill` en la raíz
  (el default de SVG es negro, así que sin esto cualquier elemento sin fill
  propio desaparece en oscuro). Rechaza `script`, `foreignObject`, `image`,
  `feImage`, `style`, animación SMIL (puede reescribir un href después de
  validar), atributos `on*`, `href` que no sea `#id`, cualquier `url(` o
  `javascript:`, y elementos fuera del namespace SVG. Colores (`fill`,
  `stroke`, `color`, `stop-color`, `flood-color`, `lighting-color`, también
  dentro de `style=`): solo `currentColor` o `none`.
- Markdown (clase, remediación, enunciado, alternativas, títulos): se quita
  el LaTeX antes de mirar (usa `<`). La única imagen permitida es
  `![](fig:CODIGO)`, sin texto alternativo, y solo en el cuerpo de la clase
  y de las remediaciones. Rechaza HTML crudo, URLs externas, enlaces que no
  sean `#ancla` y definiciones de enlace.
- Todo código referenciado (en `figure:` o en `fig:`) tiene que existir como
  archivo y pasar la validación. Un `.svg` con nombre inválido en
  `figuras/` también falla.
- **Filtración:** se recorre todo el contenido, todas las unidades. Si una
  figura la usa un ítem y aparece en una clase o remediación, falla diciendo
  en qué archivos.

### SQL generado por `cargar_contenido.py`

- Bloque `0. figures`: upsert de las figuras que usa la clase;
  `updated_at` sube solo si el SVG cambió de verdad.
- El insert de ítems pasa a `select … left join figures` y el upsert
  también actualiza `figure_id`. Para un YAML sin `figure:`, el estado
  resultante es idéntico al de antes.
- En `$verif$`, dos chequeos nuevos **contra toda la base**, no solo contra
  la clase:
  - **Figura desaparecida.** El cargador no lee la base, así que el SQL
    lleva la lista de códigos presentes en `contenido/figuras/` al
    generarse. Si la base tiene una figura referenciada (por
    `items.figure_id` o por `fig:` en cualquier `lessons.body` o
    `remediations.body`) que no está en `figures` o ya no está en esa
    lista, la migración revienta. Con `-1` no queda nada a medias.
  - **Filtración ya cargada.** La figura de un ítem que aparezca en
    cualquier clase o remediación de la base hace fallar la migración.

### API

- `GET /nodes/{code}/next`: `"figure": {"code", "svg"} | null`, tanto desde
  el pool como desde el carril.
- `POST /responses`: `remediation.figures: {code: svg}` con solo las figuras
  que referencia ese cuerpo (`{}` si no hay). Se arma en `VERDICT` con
  `regexp_matches` sobre `r.body`, sin query que busque figuras por código.
- Ningún endpoint nuevo.

### Front

- `app/Figure.tsx`: el único lugar que dibuja una figura. Sanitiza con
  DOMPurify (`USE_PROFILES: { svg: true }`, más `role`), la dibuja en línea
  dentro de un `span` block (puede caer dentro del `<p>` que arma
  react-markdown), `max-width: 100%` y hereda el color del texto. En SSR no
  dibuja nada, porque DOMPurify necesita el DOM; aparece al hidratar.
- `MathText`: nuevo prop `figures`. `urlTransform` deja pasar `fig:`
  (react-markdown lo borra por defecto) y `img` lo convierte en `<Figure>`.
  Cualquier otra imagen, o un `fig:` sin `figures`, no dibuja nada.
- `page.tsx`: la figura del ítem va bajo el enunciado, y las figuras de la
  remediación dentro de su cuerpo.

---

## 4. Pruebas corridas

No hay pytest. Todo corrió con scripts desechables fuera del repo.

- **Generador y validador:** 53 asserts. Rectas válidas (escala 1, escala 2
  cruzando el 0, escala 10, decimales). Inválidas que lanzan
  `AssertionError`: min > max, paso 0, paso que no divide, rótulo fuera de
  marca, punto fuera de rango, demasiados tramos, punto no exacto. Un SVG
  malo por regla, las 24 rechazadas. Markdown: 12 variantes malas
  rechazadas; `$a<b$`, `-3 < 2` y `[x](#ancla)` no dan falsos positivos.
- **Regresión del cargador:** los 6 `LES-*.yaml` existentes cargan con
  exit 0. Se contaron líneas (592 → 623, etc.). El diff contra la salida
  previa, que era idéntica a `038_les_num_ent_01.sql`, muestra solo la
  nueva forma del insert de ítems y los chequeos nuevos.
- **De punta a punta, en una copia del contenido:** ítem con `figure:` y
  remediación con `fig:` → SQL con bloque de figuras y `figure_id`. Fallan
  sin emitir SQL (0 líneas): figura de ítem en la remediación de la misma
  clase, figura de ítem en otra clase de otra unidad, código inexistente,
  figura de otro nodo, SVG con `stroke="#333"`, imagen externa en el
  enunciado, archivo `figuras/recta.svg`.
- **Contra Postgres 16 real** (embebido con `pgserver`, esquema mínimo que
  replica las tablas, uniques y FKs que toca el SQL; **no se tocó
  Supabase**):
  - `040` aplica; la salida real de LES-NUM-ENT-01 carga; la versión con
    figuras carga y es idempotente.
  - Cambiar el SVG actualiza `updated_at` solo de esa figura.
  - Figura desaparecida: `ERROR: figuras referenciadas en la base que ya
    no están en contenido/figuras/ …: FIG-ENT-REC-02`, y todo revertido.
  - Filtración ya cargada: `ERROR: figuras de ítem que aparecen en una
    clase o remediación: FIG-ENT-REC-01`.
  - Los checks de la tabla rechazan `FIG-ENT-REC-ESC-01` y un SVG de
    60 KB; la FK impide borrar una figura en uso.
  - `NEXT_ITEM`, `NEXT_LANE_ITEM` y `VERDICT` corridas con psycopg: el
    ítem trae su figura, el carril también, y la remediación trae solo
    `{FIG-ENT-REC-02}` (o `{}` si no referencia ninguna).
- **Front:** `npm run lint` y `tsc --noEmit` limpios; `npm run build` ok.
  Página temporal (ya borrada) en Chrome headless con columna de 390px, un
  panel oscuro forzado y uno claro: las rectas toman el color del texto en
  ambos y el SVG más ancho mide 326px en la columna de 358. Con un SVG
  hostil (`<script>`, `onload`, `javascript:`, `foreignObject`), el DOM
  final dio `script=0 foreignObject=0 onload=0 javascript=false`, y el
  script nunca corrió. Una imagen externa en el markdown no se dibuja. El
  `fill="red"` de ese SVG sí se ve: DOMPurify no filtra colores; eso lo
  rechaza el cargador.

---

## 5. Orden de despliegue — importante

`main` es producción y Railway despliega al hacer push. `queries.py` ahora
hace `left join figures` y lee `items.figure_id`: **si el backend se
despliega antes de aplicar `040_figures.sql`, `/next` y `/responses`
revientan.** El orden es:

1. `psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f data/migraciones/040_figures.sql`
2. Recién entonces, push del backend y del front.

Lo mismo para los cargadores: el SQL que generan desde ahora referencia
`figures`, así que no corre en una base sin la 040.

---

## 6. Pendiente

- Figuras para los ítems de ENT-REC (`M1-ENT-006`, `-011`, `-016`, `-018`,
  `-022` hablan de rectas con escala): paso aparte, como se acordó.
- Endpoint y pantalla de clase. Cuando existan, la clase debe traer
  sus figuras con el mismo patrón de `VERDICT`: solo las que referencia su
  body.
- Modo oscuro real en el front. Las figuras ya están listas para él.
