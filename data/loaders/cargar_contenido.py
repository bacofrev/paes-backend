#!/usr/bin/env python3
"""
cargar_contenido.py — YAML de autoría  ->  migración SQL idempotente.

  python3 cargar_contenido.py contenido/clases/LES-NUM-POT-02.yaml > 019_....sql

No toca la base. Emite SQL a stdout para revisar antes de correr, igual
que grafo.py -> 005_load_graph.sql.

El archivo de autoría es por CLASE, no por nodo: una clase cubre varios
nodos y las misconcepciones se comparten entre ellos.

Las misconceptions NO se declaran acá: viven en el catálogo de la unidad,
contenido/misconceptions/<unit>.yaml, y se cargan con
cargar_misconceptions.py. Este script solo referencia códigos y falla si
alguno no existe en el catálogo. Antes cada clase declaraba las suyas y
dos clases podían definir el mismo error distinto: ganaba la última.

La cobertura de remediaciones se evalúa POR UNIDAD, no por archivo: un
error puede detectarse en la clase 03 y remediarse en la 01.
"""

import re
import sys
import unicodedata
from pathlib import Path

import yaml

import figuras

# code_text: ^[A-Z0-9]{2,6}(-[A-Z0-9]+){0,3}$  — máximo 4 segmentos
CODE_RE = re.compile(r"^[A-Z0-9]{2,6}(-[A-Z0-9]+){0,3}$")

LABELS_OK = ["A", "B", "C", "D"]
POOLS_OK = ("curated", "generated")
MIN_CURATED = 4

# ---------------------------------------------------------------------
# Registro: el contenido que lee el estudiante va en español de Chile.
# Tuteo estándar, no voseo. 'Cuenta los factores', no 'contá'.
# Solo se revisa lo que ve el estudiante. Los campos de autor quedan
# fuera: ahí el registro da lo mismo.
# ---------------------------------------------------------------------

VOSEO = re.compile(
    r"\b(vos|tenés|tenes|podés|podes|querés|queres|sabés|hacés|"
    r"sos|vení|venís|decís|ponés)\b",
    re.IGNORECASE,
)

IMPERATIVO_VOSEO = re.compile(
    r"\b((cont|mir|fij|prob|calcul|reemplaz|agrup|aplic|multiplic|divid|"
    r"sum|rest|desarm|comprob|revis|anot|us|tom|dej|busc|piens|observ|"
    r"compar|simplific|factoriz|despej|grafic|marc|escrib|record)(á|é|í)"
    r"|(desarmalo|reescribilo|comprobalo|escribile|acordate|fijate|mirala))\b",
    re.IGNORECASE,
)


def revisar_registro(texto, donde: str) -> list[str]:
    if not texto:
        return []
    hallazgos = {m.group(0) for m in VOSEO.finditer(texto)}
    hallazgos |= {m.group(0) for m in IMPERATIVO_VOSEO.finditer(texto)}
    if not hallazgos:
        return []
    return [f"{donde}: registro rioplatense — {sorted(hallazgos)}. "
            f"El contenido del estudiante va en español de Chile (tuteo)"]


def slug(titulo: str) -> str:
    """Convierte un título markdown en el id de ancla que produce el front."""
    t = unicodedata.normalize("NFKD", titulo)
    t = "".join(c for c in t if not unicodedata.combining(c))
    t = t.lower().strip()
    t = re.sub(r"[^a-z0-9\s-]", "", t)
    return re.sub(r"\s+", "-", t)


def secciones(body: str) -> list[str]:
    """Anclas disponibles: un slug por cada encabezado de nivel 2."""
    return [slug(m.group(1).strip())
            for m in re.finditer(r"^##\s+(.+)$", body or "", re.MULTILINE)]


# ---------------------------------------------------------------------
# Catálogo de la unidad y clases hermanas
# ---------------------------------------------------------------------

def raiz_contenido(ruta: Path) -> Path:
    """Sube desde el archivo de clase hasta el directorio 'contenido'."""
    for p in [ruta.parent, *ruta.parents]:
        if p.name == "contenido":
            return p
        if (p / "contenido").is_dir():
            return p / "contenido"
    return ruta.parent


def cargar_catalogo(unit: str, ruta: Path) -> dict[str, dict]:
    """Las misconceptions de la unidad. Única fuente."""
    base = raiz_contenido(ruta)
    for cand in (base / "misconceptions" / f"{unit}.yaml",
                 base / f"{unit}.yaml",
                 ruta.parent / f"{unit}.yaml"):
        if cand.is_file():
            doc = yaml.safe_load(cand.read_text(encoding="utf-8"))
            return {m["code"]: m for m in doc.get("misconceptions") or []}
    raise FileNotFoundError(
        f"no encuentro el catálogo de {unit}. Se busca en "
        f"{base}/misconceptions/{unit}.yaml")


def codigos_de_la_unidad(unit: str, ruta: Path) -> dict[str, str]:
    """item/remediation code -> archivo que lo define, en el resto de la
    unidad. Los códigos son unique global: dos clases que usan el mismo
    se pisan en silencio via upsert."""
    base = raiz_contenido(ruta)
    ajenos: dict[str, str] = {}
    for f in sorted(base.rglob("*.yaml")):
        if f.parent.name == "misconceptions" or f.resolve() == ruta.resolve():
            continue
        try:
            d = yaml.safe_load(f.read_text(encoding="utf-8")) or {}
        except Exception:
            continue
        if d.get("unit") != unit:
            continue
        for it in d.get("items") or []:
            ajenos.setdefault(it.get("code"), f.name)
        for rem in d.get("remediations") or []:
            ajenos.setdefault(rem.get("code"), f.name)
    return ajenos


def remediaciones_de_la_unidad(unit: str, ruta: Path) -> dict[str, str]:
    """misconception -> clase que la remedia, mirando todas las clases
    de la unidad. Un error puede detectarse en una clase y remediarse en
    otra: validar por archivo daba falsos negativos."""
    base = raiz_contenido(ruta)
    vistas: dict[str, str] = {}
    for f in sorted(base.rglob("*.yaml")):
        if f.parent.name == "misconceptions":
            continue
        try:
            d = yaml.safe_load(f.read_text(encoding="utf-8")) or {}
        except Exception:
            continue
        if d.get("unit") != unit:
            continue
        for rem in d.get("remediations") or []:
            mc = rem.get("misconception")
            if mc:
                vistas.setdefault(mc, f.name)
    return vistas


# ---------------------------------------------------------------------
# Validación
# ---------------------------------------------------------------------

def validar(doc: dict, catalogo: dict[str, dict],
            rem_unidad: dict[str, str],
            ajenos: dict[str, str] | None = None,
            dir_fig: Path | None = None,
            usos_ajenos: tuple[dict, dict] | None = None) -> list[str]:
    fallas: list[str] = []
    ajenos = ajenos or {}

    def chk_md(texto, donde, permitir_figuras=False):
        f, _ = figuras.validar_markdown(texto, donde, permitir_figuras)
        fallas.extend(f)

    def chk_code(valor, donde):
        if not CODE_RE.match(valor or ""):
            fallas.append(f"{donde}: '{valor}' no cumple code_text "
                          f"(mayúsculas, máx 4 segmentos)")

    if "misconceptions" in doc:
        fallas.append(
            "este archivo declara 'misconceptions'. Las misconceptions viven "
            "en contenido/misconceptions/<unit>.yaml. Saca el bloque: si "
            "queda acá, dos clases pueden definir el mismo error distinto")

    for campo in ("unit", "lesson", "items", "lesson_body"):
        if campo not in doc:
            fallas.append(f"falta la clave raíz '{campo}'")
    if fallas:
        return fallas

    chk_code(doc["unit"], "unit")

    # --- lesson y anclas ------------------------------------------------
    les = doc["lesson"]
    chk_code(les.get("code"), "lesson")
    for campo in ("title", "position", "nodes"):
        if not les.get(campo):
            fallas.append(f"lesson: falta '{campo}'")

    body = doc["lesson_body"]
    disponibles = secciones(body)
    nodos_clase: set[str] = set()

    for ln in les.get("nodes") or []:
        nodo = ln.get("node")
        chk_code(nodo, "lesson node")
        nodos_clase.add(nodo)
        anchor = ln.get("anchor")
        if not anchor:
            fallas.append(f"lesson node {nodo}: falta anchor. Cada nodo "
                          f"necesita su sección para poder entregar la clase "
                          f"por pedazos")
        elif anchor not in disponibles:
            fallas.append(f"lesson node {nodo}: anchor '{anchor}' no "
                          f"corresponde a ningún '## ' del cuerpo. "
                          f"Disponibles: {disponibles}")

    fallas += revisar_registro(les.get("title"), "lesson title")
    fallas += revisar_registro(body, "lesson body")
    chk_md(les.get("title"), "lesson title")
    chk_md(body, "lesson body", permitir_figuras=True)

    # --- misconceptions: solo referencia, la fuente es el catálogo ------
    mcs = catalogo

    # --- items ----------------------------------------------------------
    items: dict[str, dict] = {}
    usadas: set[str] = set()
    por_nodo: dict[str, int] = {}

    for it in doc["items"]:
        code = it.get("code")
        chk_code(code, "item")
        if code in items:
            fallas.append(f"item duplicado: {code}")
        if code in ajenos:
            fallas.append(f"item {code}: ese código ya lo usa "
                          f"{ajenos[code]}. items.code es unique global y "
                          f"el upsert lo pisaria en silencio")
        items[code] = it

        nodo = it.get("node")
        chk_code(nodo, f"item {code} node")
        if nodo not in nodos_clase:
            fallas.append(f"item {code}: mide sobre '{nodo}', que no es un "
                          f"nodo de esta clase")

        pool = it.get("pool")
        if pool not in POOLS_OK:
            fallas.append(f"item {code}: pool '{pool}', se espera "
                          f"curated o generated")
        if pool == "curated":
            por_nodo[nodo] = por_nodo.get(nodo, 0) + 1

        if not it.get("stem"):
            fallas.append(f"item {code}: falta stem")
        fallas += revisar_registro(it.get("stem"), f"item {code} stem")
        chk_md(it.get("stem"), f"item {code} stem")

        fig = it.get("figure")
        if fig is not None:
            # FIG-<unidad>-<nodo>-<NN>: la figura de un ítem es de su nodo.
            # NUM-ENT-REC -> FIG-ENT-REC-NN
            if (figuras.FIG_RE.match(str(fig))
                    and str(fig).split("-")[1:3] != str(nodo).split("-")[-2:]):
                fallas.append(f"item {code}: figura {fig} no corresponde al "
                              f"nodo {nodo} (se espera "
                              f"FIG-{'-'.join(str(nodo).split('-')[-2:])}-NN)")

        dif = it.get("difficulty")
        if dif is None or not (1 <= dif <= 5):
            fallas.append(f"item {code}: difficulty debe ir de 1 a 5")

        opts = it.get("options") or []
        if len(opts) != 4:
            fallas.append(f"item {code}: tiene {len(opts)} alternativas, "
                          f"se esperan 4")
        if sorted(o.get("label") or "" for o in opts) != LABELS_OK:
            fallas.append(f"item {code}: labels deben ser A, B, C, D")

        correctas = [o for o in opts if o.get("correct")]
        if len(correctas) != 1:
            fallas.append(f"item {code}: {len(correctas)} alternativas "
                          f"correctas, debe haber exactamente 1")

        for o in opts:
            etq = o.get("label")
            fallas += revisar_registro(o.get("body"), f"item {code} alt {etq}")
            chk_md(o.get("body"), f"item {code} alt {etq}")
            if not o.get("body"):
                fallas.append(f"item {code} alt {etq}: falta body")
            if o.get("correct"):
                if o.get("misconception"):
                    fallas.append(f"item {code} alt {etq}: la correcta no "
                                  f"lleva misconception")
                continue
            mc = o.get("misconception")
            if not mc:
                fallas.append(f"item {code} alt {etq}: distractor sin "
                              f"misconception. Un distractor sin error "
                              f"nombrado no aporta señal")
            elif mc not in mcs:
                fallas.append(f"item {code} alt {etq}: misconception '{mc}' "
                              f"no está en el catálogo de {doc['unit']}")
            else:
                usadas.add(mc)

        errores = [o.get("misconception") for o in opts if not o.get("correct")]
        repes = {m for m in errores if errores.count(m) > 1}
        if repes:
            fallas.append(f"item {code}: dos distractores comparten {repes}. "
                          f"El ítem no puede distinguirlos")

        if "secondary" in it:
            fallas.append(f"item {code}: tiene 'secondary'. Un ítem pertenece "
                          f"a un solo nodo (unique en node_items.item_id). "
                          f"Lo que detecta de otros nodos ya lo dicen sus "
                          f"distractores via misconceptions.node_id. Borra "
                          f"la línea")

    for nodo in sorted(nodos_clase):
        n = por_nodo.get(nodo, 0)
        if n < MIN_CURATED:
            fallas.append(f"nodo {nodo}: solo {n} ítems curated. Con menos "
                          f"de {MIN_CURATED} no se puede decidir dominio")

    # --- remediations ---------------------------------------------------
    vistas: set[str] = set()
    for rem in doc.get("remediations") or []:
        code = rem.get("code")
        chk_code(code, "remediation")
        if code in ajenos:
            fallas.append(f"remediation {code}: ese código ya lo usa "
                          f"{ajenos[code]}")
        mc = rem.get("misconception")
        if mc not in mcs:
            fallas.append(f"remediation {code}: misconception '{mc}' "
                          f"no está en el catálogo de {doc['unit']}")
        if mc in vistas:
            fallas.append(f"remediation {code}: '{mc}' ya tiene remediación "
                          f"(la tabla acepta una sola por error)")
        vistas.add(mc)
        for campo in ("title", "body"):
            if not rem.get(campo):
                fallas.append(f"remediation {code}: falta '{campo}'")
            fallas += revisar_registro(rem.get(campo),
                                       f"remediation {code} {campo}")
            chk_md(rem.get(campo), f"remediation {code} {campo}",
                   permitir_figuras=(campo == "body"))
        for ref in rem.get("items") or []:
            if ref not in items:
                fallas.append(f"remediation {code}: ítem '{ref}' no existe "
                              f"en este archivo")

    # --- cobertura de remediación, por unidad ---------------------------
    # Falla dura, no aviso: un error detectable sin remediación escrita
    # deja al estudiante viendo el nombre de su error y nada más. Eso es
    # justo lo que el producto promete no hacer.
    cubiertas = set(rem_unidad) | vistas
    sin_rem = sorted(c for c in usadas if c not in cubiertas)
    if sin_rem:
        fallas.append(
            f"errores detectables sin remediación en toda la unidad "
            f"{doc['unit']}: {sin_rem}")

    # --- figuras ----------------------------------------------------------
    de_items, de_cuerpos = figuras.refs_de_doc(doc)
    if dir_fig is not None:
        for cod in sorted(set(de_items) | set(de_cuerpos)):
            _, f = figuras.leer_figura(cod, dir_fig)
            fallas += f

    # Una figura de ítem en una clase o remediación le muestra al
    # estudiante la figura del ítem antes de que lo responda. Se mira todo
    # el contenido, no solo este archivo ni esta unidad.
    ajenos_items, ajenos_cuerpos = usos_ajenos or ({}, {})
    todos_items = {c: list(v) for c, v in ajenos_items.items()}
    todos_cuerpos = {c: list(v) for c, v in ajenos_cuerpos.items()}
    for c, v in de_items.items():
        todos_items.setdefault(c, []).extend(v)
    for c, v in de_cuerpos.items():
        todos_cuerpos.setdefault(c, []).extend(v)
    for cod in sorted(set(todos_items) & set(todos_cuerpos)):
        if cod in de_items or cod in de_cuerpos:
            fallas.append(
                f"figura {cod}: la usa {', '.join(todos_items[cod])} y "
                f"también aparece en {', '.join(todos_cuerpos[cod])}. La "
                f"figura de un ítem no puede aparecer en una clase ni "
                f"remediación: filtra la respuesta")

    return fallas


# ---------------------------------------------------------------------
# Emisión
# ---------------------------------------------------------------------

def q(texto) -> str:
    """Literal SQL con dollar-quoting: el contenido está lleno de
    backslashes de LaTeX y de comillas."""
    if texto is None:
        return "null"
    tag, n = "$c$", 0
    while tag in str(texto):
        n += 1
        tag = f"$c{n}$"
    return f"{tag}{texto}{tag}"


def lista(codes) -> str:
    return ", ".join(q(c) for c in codes)


# fig:CODIGO dentro de un body, del lado de Postgres. Mismo patrón que
# figuras.FIG_IMG.
FIG_RE_SQL = r"!\[\]\(fig:([A-Z0-9-]+)\)"


def emitir(doc: dict, origen: str, svgs: dict[str, str] | None = None,
           presentes: list[str] | None = None) -> str:
    """svgs: las figuras que usa esta clase, código -> SVG ya validado.
    presentes: todos los códigos en contenido/figuras/ al generar."""
    o: list[str] = []
    w = o.append
    svgs = svgs or {}
    presentes = presentes or []

    les = doc["lesson"]
    body = doc["lesson_body"]
    items = doc["items"]
    rems = doc.get("remediations") or []
    codes_items = [it["code"] for it in items]
    mcs_ref = {o["misconception"] for it in items for o in it["options"]
               if o.get("misconception")}

    w("-- =====================================================================")
    w(f"-- {les['code']} — {les['title']}")
    w(f"-- Generado por cargar_contenido.py desde {origen}")
    w("-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.")
    w("-- =====================================================================")
    w("")
    w("-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f")
    w("")

    # Las misconceptions no se emiten acá: las carga
    # cargar_misconceptions.py desde el catálogo de la unidad.

    # 0. figures
    if svgs:
        w("-- 0. figures ---------------------------------------------------------")
        w("-- El código no cambia nunca; si cambió el SVG, se actualiza.")
        w("insert into figures (code, svg)")
        w("values")
        w(",\n".join(f"  ({q(c)}, {q(svgs[c])})" for c in sorted(svgs)))
        w("on conflict (code) do update")
        w("  set svg = excluded.svg, updated_at = now()")
        w("  where figures.svg is distinct from excluded.svg;")
        w("")

    # 1. items
    w("-- 1. items -----------------------------------------------------------")
    w("insert into items (code, stem, author_difficulty, source, status, figure_id)")
    w("select v.code, v.stem, v.difficulty, v.source, 'draft', f.id")
    w("from (values")
    w(",\n".join(
        f"  ({q(it['code'])}, {q(it['stem'])}, {it['difficulty']}, "
        f"{q(it.get('source'))}::text, {q(it.get('figure'))}::text)"
        for it in items))
    w(") as v(code, stem, difficulty, source, fig_code)")
    w("left join figures f on f.code = v.fig_code")
    w("on conflict (code) do update")
    w("  set stem = excluded.stem,")
    w("      author_difficulty = excluded.author_difficulty,")
    w("      source = excluded.source,")
    w("      figure_id = excluded.figure_id;")
    w("")

    # 3. item_options — upsert, no delete
    w("-- 2. item_options — la señal diagnóstica -----------------------------")
    w("-- Upsert sobre (item_id, label), que ya tiene índice único.")
    w("-- No se borra: responses.option_id apunta acá con on delete restrict,")
    w("-- y el delete rompería la publicación apenas exista una respuesta.")
    w("insert into item_options (item_id, label, body, is_correct, misconception_id)")
    w("select i.id, v.label, v.body, v.is_correct, m.id")
    w("from (values")
    filas = []
    for it in items:
        for opt in it["options"]:
            filas.append(
                f"  ({q(it['code'])}, {q(opt['label'])}, {q(opt['body'])}, "
                f"{'true' if opt.get('correct') else 'false'}, "
                f"{q(opt.get('misconception'))})")
    w(",\n".join(filas))
    w(") as v(item_code, label, body, is_correct, mc_code)")
    w("join items i on i.code = v.item_code")
    w("left join misconceptions m on m.code = v.mc_code")
    w("on conflict (item_id, label) do update")
    w("  set body = excluded.body,")
    w("      is_correct = excluded.is_correct,")
    w("      misconception_id = excluded.misconception_id;")
    w("")

    # 4. node_items
    w("-- 3. node_items — un ítem, un nodo ----------------------------------")
    w("-- do nothing a propósito: si el ítem ya vive en otro nodo, NO se mueve.")
    w("-- Moverlo reescribe a qué nodo cuentan sus respuestas históricas.")
    w("-- La verificación del final revienta si el nodo no coincide.")
    w("insert into node_items (node_id, item_id)")
    w("select n.id, i.id")
    w("from (values")
    w(",\n".join(f"  ({q(it['node'])}, {q(it['code'])})" for it in items))
    w(") as v(node_code, item_code)")
    w("join nodes n on n.code = v.node_code")
    w("join items i on i.code = v.item_code")
    w("on conflict do nothing;")
    w("")

    # 5. remediations
    if rems:
        w("-- 4. remediations ----------------------------------------------------")
        w("insert into remediations (code, misconception_id, title, body, status)")
        w("select v.code, m.id, v.title, v.body, 'draft'")
        w("from (values")
        w(",\n".join(
            f"  ({q(r['code'])}, {q(r['misconception'])}, {q(r['title'])}, "
            f"{q(r['body'].strip())})" for r in rems))
        w(") as v(code, mc_code, title, body)")
        w("join misconceptions m on m.code = v.mc_code")
        w("on conflict (code) do update")
        w("  set title = excluded.title,")
        w("      body  = excluded.body,")
        w("      -- solo sube versión si el texto cambió de verdad")
        w("      version = remediations.version")
        w("                + (excluded.body is distinct from remediations.body)::int;")
        w("")

        pares = [(r["code"], ref, i + 1)
                 for r in rems for i, ref in enumerate(r.get("items") or [])]
        if pares:
            w("delete from remediation_items where remediation_id in (")
            w(f"  select id from remediations "
              f"where code in ({lista(r['code'] for r in rems)})")
            w(");")
            w("insert into remediation_items (remediation_id, item_id, position)")
            w("select r.id, i.id, v.position")
            w("from (values")
            w(",\n".join(f"  ({q(rc)}, {q(ic)}, {p}::smallint)"
                         for rc, ic, p in pares))
            w(") as v(rem_code, item_code, position)")
            w("join remediations r on r.code = v.rem_code")
            w("join items i on i.code = v.item_code;")
            w("")

    # 6. lesson
    w("-- 5. lesson ----------------------------------------------------------")
    w("insert into lessons (code, unit_id, title, body, position, status)")
    w("select v.code, u.id, v.title, v.body, v.position, 'draft'")
    w("from (values")
    w(f"  ({q(les['code'])}, {q(doc['unit'])}, {q(les['title'])}, "
      f"{q(body.strip())}, {les['position']}::smallint)")
    w(") as v(code, unit_code, title, body, position)")
    w("join units u on u.code = v.unit_code")
    w("on conflict (code) do update")
    w("  set title = excluded.title,")
    w("      body  = excluded.body,")
    w("      version = lessons.version")
    w("                + (excluded.body is distinct from lessons.body)::int;")
    w("")
    w("insert into lesson_nodes (lesson_id, node_id, position, anchor)")
    w("select l.id, n.id, v.position, v.anchor")
    w("from (values")
    w(",\n".join(
        f"  ({q(les['code'])}, {q(ln['node'])}, {i + 1}::smallint, "
        f"{q(ln.get('anchor'))})"
        for i, ln in enumerate(les["nodes"])))
    w(") as v(lesson_code, node_code, position, anchor)")
    w("join lessons l on l.code = v.lesson_code")
    w("join nodes n on n.code = v.node_code")
    w("on conflict (lesson_id, node_id) do update")
    w("  set position = excluded.position, anchor = excluded.anchor;")
    w("")

    # 7. verificación
    n_items = len(items)
    n_opts = sum(len(it["options"]) for it in items)
    pares_nodo = [(it["code"], it["node"]) for it in items]

    w("-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------")
    w("do $verif$")
    w("declare c integer; t text;")
    w("begin")
    w(f"  select count(*) into c from items where code in ({lista(codes_items)});")
    w(f"  if c <> {n_items} then")
    w(f"    raise exception 'items: se esperaban {n_items}, hay %', c; end if;")
    w("")
    w("  select count(*) into c from item_options io")
    w("    join items i on i.id = io.item_id")
    w(f"   where i.code in ({lista(codes_items)});")
    w(f"  if c <> {n_opts} then")
    w(f"    raise exception 'item_options: se esperaban {n_opts}, hay %', c; end if;")
    w("")
    w("  select count(*) into c")
    w("    from (values")
    w(",\n".join(f"      ({q(ic)}, {q(nc)})" for ic, nc in pares_nodo))
    w("    ) as v(item_code, node_code)")
    w("    join items i        on i.code = v.item_code")
    w("    join node_items ni  on ni.item_id = i.id")
    w("    join nodes n        on n.id = ni.node_id and n.code = v.node_code;")
    w(f"  if c <> {len(pares_nodo)} then")
    w(f"    raise exception 'node_items: {len(pares_nodo)} ítems, solo % en el "
      f"nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en "
      f"otro nodo (moverlo es una migración a mano)', c; end if;")
    w("")
    w("  select count(*) into c from item_options io")
    w("    join items i on i.id = io.item_id")
    w(f"   where i.code in ({lista(codes_items)})")
    w("     and not io.is_correct and io.misconception_id is null;")
    w("  if c <> 0 then")
    w("    raise exception '% distractores sin misconception', c; end if;")
    w("")
    # Las misconceptions referenciadas tienen que existir ya en la base
    # (las carga cargar_misconceptions.py) y tener nodo de origen.
    w("  select count(*) into c from misconceptions")
    w(f"   where code in ({lista(sorted(mcs_ref))})")
    w("     and node_id is null;")
    w("  if c <> 0 then")
    w("    raise exception '% errores sin nodo donde se ensenan', c; end if;")
    w("")

    con_fig = [(it["code"], it["figure"]) for it in items if it.get("figure")]
    if con_fig:
        w("  select count(*) into c")
        w("    from (values")
        w(",\n".join(f"      ({q(ic)}, {q(fc)})" for ic, fc in con_fig))
        w("    ) as v(item_code, fig_code)")
        w("    join items i   on i.code = v.item_code")
        w("    join figures f on f.id = i.figure_id and f.code = v.fig_code;")
        w(f"  if c <> {len(con_fig)} then")
        w(f"    raise exception 'figure_id: {len(con_fig)} ítems con figura, "
          f"solo % apuntan a la que declara el YAML', c; end if;")
        w("")

    # Figuras referenciadas en TODA la base, no solo en esta clase.
    w("  -- Toda figura referenciada en la base (ítems, clases, remediaciones)")
    w("  -- tiene que existir en figures y seguir en contenido/figuras/.")
    w("  -- Si alguien borró el .svg, el contenido deja de poder regenerarse.")
    w("  with refs as (")
    w("    select f.code::text as code from items i join figures f on f.id = i.figure_id")
    w("    union")
    w(f"    select m[1] from lessons l, regexp_matches(l.body, {q(FIG_RE_SQL)}, 'g') m")
    w("    union")
    w(f"    select m[1] from remediations r, regexp_matches(r.body, {q(FIG_RE_SQL)}, 'g') m")
    w("  )")
    w("  select string_agg(code, ', ' order by code) into t from refs")
    w("   where code not in (select code from figures)")
    w(f"      or not (code = any (array[{lista(presentes)}]::text[]));")
    w("  if t is not null then")
    w("    raise exception 'figuras referenciadas en la base que ya no están "
      "en contenido/figuras/ (o no están en figures): %', t; end if;")
    w("")
    w("  -- La figura de un ítem no puede aparecer en ninguna clase ni")
    w("  -- remediación: filtraría la respuesta.")
    w("  select string_agg(distinct f.code, ', ') into t")
    w("    from items i join figures f on f.id = i.figure_id")
    w("   where f.code in (")
    w(f"     select m[1] from lessons l, regexp_matches(l.body, {q(FIG_RE_SQL)}, 'g') m")
    w("     union")
    w(f"     select m[1] from remediations r, regexp_matches(r.body, {q(FIG_RE_SQL)}, 'g') m);")
    w("  if t is not null then")
    w("    raise exception 'figuras de ítem que aparecen en una clase o "
      "remediación: %', t; end if;")
    w("end")
    w("$verif$;")
    w("")

    curados = [it["code"] for it in items if it["pool"] == "curated"]
    generados = [it["code"] for it in items if it["pool"] != "curated"]

    w(f"-- {n_items} ítems ({len(curados)} curated), {n_opts} alternativas, "
      f"{len(mcs_ref)} misconceptions referenciadas,")
    w(f"-- {len(rems)} remediaciones, {len(svgs)} figuras, "
      f"1 clase sobre {len(les['nodes'])} nodos.")
    w("")

    # --- publicación: paso aparte, a propósito -------------------------
    w("-- =====================================================================")
    w("-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.")
    w("-- =====================================================================")
    w("-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',")
    w("-- así que hasta que corras esto el estudiante no ve nada de esta clase.")
    w("-- Cargar no es publicar: publicar es una decisión y queda registrada")
    w("-- en el archivo que corriste.")
    w("")
    w(f"-- {len(curados)} ítems curated -> active:")
    w("-- update items set status = 'active'")
    w(f"--  where code in ({lista(curados)});")
    w("")
    if generados:
        w(f"-- {len(generados)} generated quedan en draft: "
          f"{', '.join(generados)}")
        w("-- No se publican sin validar que cada distractor corresponda")
        w("-- exactamente a su misconception (§4.5).")
        w("")
    w("-- update remediations set status = 'active'")
    w(f"--  where code in ({lista(r['code'] for r in rems)});"
      if rems else "-- (esta clase no trae remediaciones)")
    w("")
    w("-- update lessons set status = 'active'")
    w(f"--  where code = {q(les['code'])};")
    w("")
    w("-- Verificar después de publicar:")
    w("--   select status, count(*) from items")
    w(f"--    where code in ({lista(codes_items)}) group by 1;")

    return "\n".join(o)


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2

    ruta = Path(sys.argv[1])
    doc = yaml.safe_load(ruta.read_text(encoding="utf-8"))

    unit = doc.get("unit")
    if not unit:
        print("falta la clave raíz 'unit'", file=sys.stderr)
        return 1
    try:
        catalogo = cargar_catalogo(unit, ruta)
        rem_unidad = remediaciones_de_la_unidad(unit, ruta)
        ajenos = codigos_de_la_unidad(unit, ruta)
    except FileNotFoundError as e:
        print(e, file=sys.stderr)
        return 1

    raiz = raiz_contenido(ruta)
    dir_fig = figuras.dir_figuras(raiz)
    presentes, fallas_nombres = figuras.codigos_presentes(dir_fig)
    usos_ajenos = figuras.usos_en_contenido(raiz, ruta)

    fallas = validar(doc, catalogo, rem_unidad, ajenos, dir_fig, usos_ajenos)
    fallas += fallas_nombres
    duros = [f for f in fallas if not f.startswith("AVISO")]
    for a in (f for f in fallas if f.startswith("AVISO")):
        print(a, file=sys.stderr)

    if duros:
        print(f"\n{len(duros)} problema(s). No se generó SQL:\n", file=sys.stderr)
        for f in duros:
            print(f"  - {f}", file=sys.stderr)
        return 1

    de_items, de_cuerpos = figuras.refs_de_doc(doc)
    svgs = {c: figuras.leer_figura(c, dir_fig)[0]
            for c in set(de_items) | set(de_cuerpos)}
    print(emitir(doc, ruta.name, svgs, presentes))
    return 0


if __name__ == "__main__":
    sys.exit(main())