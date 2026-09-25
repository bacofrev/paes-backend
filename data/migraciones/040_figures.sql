-- =====================================================================
-- 040_figures.sql
--
-- Figuras SVG para ítems, clases y remediaciones. Una sola tabla
-- compartida, SVG en línea (text), sin Storage: una figura pesa pocos
-- KB y viaja en la misma respuesta que el enunciado.
--
-- Quién referencia qué:
--   - items.figure_id: el ítem tiene como mucho una figura, con FK.
--   - lessons.body / remediations.body: NO llevan columna. Referencian
--     con ![](fig:CODIGO) dentro del markdown; el cargador valida que el
--     código exista (y el SQL que genera lo vuelve a verificar contra la
--     base).
--
-- Una figura usada en un ítem no puede aparecer en ninguna clase ni
-- remediación: si aparece, la clase le muestra al estudiante la figura
-- del ítem que va a responder. Lo impone cargar_contenido.py.
--
-- El código es inmutable: si cambia el SVG, se actualiza la fila por
-- upsert; nunca se renombra ni se borra desde el cargador.
--
-- RLS encendido sin policies, igual que items/lessons/remediations: el
-- backend entra con su propio rol, y así PostgREST no expone la tabla.
-- Un listado de figuras sueltas expondría el banco de ítems.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- =====================================================================

create table public.figures (
    id         bigint generated always as identity primary key,
    code       public.code_text not null unique,
    svg        text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    -- FIG-<unidad>-<nodo>-<NN>, ej. FIG-ENT-REC-01
    constraint figures_code_formato
        check (code ~ '^FIG-[A-Z0-9]+-[A-Z0-9]+-[0-9]{2}$'),
    constraint figures_svg_tamano
        check (octet_length(svg) <= 51200)
);

comment on table public.figures is
  'Figuras SVG en línea. Las referencia un ítem (items.figure_id) o el markdown de una clase/remediación (![](fig:CODIGO)), nunca ambos. Sin endpoint que las liste: solo viajan junto a lo que las usa.';
comment on column public.figures.svg is
  'SVG validado por el cargador: sin script/foreignObject/image/on*/href externos, colores solo currentColor o none, con viewBox y aria-label.';

alter table public.figures enable row level security;

alter table public.items
    add column figure_id bigint references public.figures(id) on delete restrict;

create index items_figure_id_idx on public.items (figure_id)
    where figure_id is not null;

comment on column public.items.figure_id is
  'Figura del enunciado, opcional. La figura no puede aparecer en ninguna clase ni remediación (filtraría la respuesta).';
