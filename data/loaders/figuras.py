"""
figuras.py — validación de figuras SVG y de las referencias a ellas.

No es un script: lo importan cargar_contenido.py (valida y emite) y
recta.py (el generador se autovalida con las mismas reglas).

Una figura es contenido/figuras/<CODIGO>.svg, con CODIGO en la forma
FIG-<unidad>-<nodo>-<NN>, ej. FIG-ENT-REC-01. La referencian:
  - un ítem, con `figure: CODIGO` en el YAML de la clase;
  - el markdown de una clase o remediación, con ![](fig:CODIGO).
Nunca ambos: si la figura de un ítem aparece en una clase o
remediación, el estudiante ve la figura del ítem antes de responderlo.

El SVG se dibuja en línea en el front, así que acá se rechaza todo lo
que pueda ejecutar código o traer algo de afuera, y todo color fijo:
la figura hereda el color del texto (currentColor) o desaparece en
modo oscuro.
"""

import re
import xml.etree.ElementTree as ET
from pathlib import Path

import yaml

FIG_RE = re.compile(r"^FIG-[A-Z0-9]+-[A-Z0-9]+-[0-9]{2}$")
MAX_BYTES = 50 * 1024

SVG_NS = "http://www.w3.org/2000/svg"

# Elementos que ejecutan, incrustan o traen algo de afuera. La animación
# SMIL (animate, set) puede reescribir un href después de validar.
PROHIBIDOS = {
    "script", "foreignObject", "image", "feImage", "style", "iframe",
    "embed", "object", "animate", "animateMotion", "animateTransform",
    "set", "handler", "listener",
}

# Propiedades de color: solo currentColor o none.
COLORES = {"fill", "stroke", "color", "stop-color", "flood-color",
           "lighting-color"}
COLORES_OK = {"currentcolor", "none"}


def _local(nombre: str) -> str:
    """'{ns}tag' -> 'tag'."""
    return nombre.rsplit("}", 1)[-1]


def validar_svg(texto: str, donde: str) -> list[str]:
    fallas: list[str] = []

    if len(texto.encode("utf-8")) > MAX_BYTES:
        fallas.append(f"{donde}: pesa {len(texto.encode('utf-8'))} bytes, "
                      f"el máximo es {MAX_BYTES}")
    # Sin DTD: una entidad puede expandirse a cualquier cosa después de
    # validar el texto que se ve.
    # Lo mismo con una hoja de estilos externa.
    if re.search(r"<!(DOCTYPE|ENTITY)|<\?xml-stylesheet", texto, re.IGNORECASE):
        fallas.append(f"{donde}: trae DOCTYPE/ENTITY/xml-stylesheet, "
                      f"no se aceptan")
        return fallas

    try:
        raiz = ET.fromstring(texto)
    except ET.ParseError as e:
        fallas.append(f"{donde}: no es XML válido ({e})")
        return fallas

    if raiz.tag != f"{{{SVG_NS}}}svg":
        fallas.append(f"{donde}: la raíz debe ser <svg> con "
                      f"xmlns=\"{SVG_NS}\", es <{raiz.tag}>")
        return fallas

    vb = (raiz.get("viewBox") or "").replace(",", " ").split()
    if len(vb) != 4:
        fallas.append(f"{donde}: falta viewBox (4 números). Sin él la "
                      f"figura no escala a max-width 100%")
    if not (raiz.get("aria-label") or "").strip():
        fallas.append(f"{donde}: falta aria-label en <svg> (texto "
                      f"alternativo)")
    # El fill por defecto de SVG es negro. Sin fill en la raíz, todo lo
    # que no declare el suyo sale negro y desaparece en modo oscuro.
    if (raiz.get("fill") or "").strip().lower() not in COLORES_OK:
        fallas.append(f"{donde}: <svg> debe declarar fill=\"currentColor\" "
                      f"(o none). El default de SVG es negro")

    for el in raiz.iter():
        tag = _local(el.tag) if isinstance(el.tag, str) else str(el.tag)
        if not (isinstance(el.tag, str) and el.tag.startswith(f"{{{SVG_NS}}}")):
            fallas.append(f"{donde}: elemento <{el.tag}> fuera del "
                          f"namespace SVG")
            continue
        if tag in PROHIBIDOS:
            fallas.append(f"{donde}: <{tag}> no se permite")

        for attr, valor in el.attrib.items():
            nombre = _local(attr)
            v = valor.strip()
            if nombre.lower().startswith("on"):
                fallas.append(f"{donde}: <{tag}> tiene {nombre}=, los "
                              f"atributos on* no se permiten")
            if nombre == "href" and not v.startswith("#"):
                fallas.append(f"{donde}: <{tag}> href='{v}'. Solo se "
                              f"permiten referencias internas (#id)")
            if "url(" in v.lower() or "javascript:" in v.lower():
                fallas.append(f"{donde}: <{tag}> {nombre}='{v}' referencia "
                              f"algo con url()/javascript:")
            if nombre in COLORES and v.lower() not in COLORES_OK:
                fallas.append(f"{donde}: <{tag}> {nombre}='{v}'. Solo "
                              f"currentColor o none: un color fijo "
                              f"desaparece en modo oscuro")
            if nombre == "style":
                for decl in v.split(";"):
                    if ":" not in decl:
                        continue
                    prop, val = (s.strip() for s in decl.split(":", 1))
                    if prop.lower() in COLORES and val.lower() not in COLORES_OK:
                        fallas.append(f"{donde}: <{tag}> style {prop}:{val}. "
                                      f"Solo currentColor o none")
    return fallas


# ---------------------------------------------------------------------
# Markdown de clases, remediaciones, enunciados y alternativas
# ---------------------------------------------------------------------

FIG_IMG = re.compile(r"!\[\]\(fig:([^)\s]+)\)")
IMAGEN = re.compile(r"!\[[^\]]*\](\([^)]*\)|\[[^\]]*\])")
LINK = re.compile(r"\]\(([^)]*)\)")
REF_DEF = re.compile(r"^\s{0,3}\[[^\]]+\]:\s*\S+", re.MULTILINE)
HTML = re.compile(r"<[A-Za-z/!?]")
URL = re.compile(r"(https?:|ftp:|mailto:|javascript:|data:|www\.)",
                 re.IGNORECASE)


def _sin_math(texto: str) -> str:
    """El LaTeX usa '<' y otros caracteres que parecen HTML: fuera."""
    texto = re.sub(r"\$\$.*?\$\$", " ", texto, flags=re.DOTALL)
    return re.sub(r"\$[^$\n]*\$", " ", texto)


def validar_markdown(texto, donde: str,
                     permitir_figuras: bool) -> tuple[list[str], list[str]]:
    """-> (fallas, códigos de figura referenciados, en orden)."""
    if not texto:
        return [], []
    fallas: list[str] = []
    t = _sin_math(str(texto))

    codigos: list[str] = []
    for m in FIG_IMG.finditer(t):
        cod = m.group(1)
        if not permitir_figuras:
            fallas.append(f"{donde}: ![](fig:{cod}) no va acá. La figura "
                          f"de un ítem va en 'figure:', y las alternativas "
                          f"no llevan figura")
        elif not FIG_RE.match(cod):
            fallas.append(f"{donde}: fig:{cod} no tiene la forma "
                          f"FIG-<unidad>-<nodo>-<NN>")
        elif cod not in codigos:
            codigos.append(cod)
    resto = FIG_IMG.sub(" ", t)

    for m in IMAGEN.finditer(resto):
        fallas.append(f"{donde}: imagen '{m.group(0)}'. La única imagen "
                      f"permitida es ![](fig:CODIGO), sin texto alternativo "
                      f"(ese va en el aria-label del SVG)")
    resto = IMAGEN.sub(" ", resto)

    for m in LINK.finditer(resto):
        destino = m.group(1).strip()
        if not destino.startswith("#"):
            fallas.append(f"{donde}: enlace a '{destino}'. Solo se permiten "
                          f"anclas internas (#seccion)")
    for m in REF_DEF.finditer(resto):
        fallas.append(f"{donde}: definición de enlace '{m.group(0).strip()}' "
                      f"no se permite")
    for m in HTML.finditer(resto):
        ini = max(0, m.start() - 10)
        fallas.append(f"{donde}: HTML crudo cerca de "
                      f"'{resto[ini:m.start() + 20].strip()}'")
    for m in URL.finditer(resto):
        fallas.append(f"{donde}: URL externa '{m.group(0)}…'")
    return fallas, codigos


# ---------------------------------------------------------------------
# Archivos y referencias
# ---------------------------------------------------------------------

def dir_figuras(raiz_contenido: Path) -> Path:
    return raiz_contenido / "figuras"


def codigos_presentes(directorio: Path) -> tuple[list[str], list[str]]:
    """-> (códigos de todos los .svg del directorio, fallas de nombre)."""
    if not directorio.is_dir():
        return [], []
    codigos, fallas = [], []
    for f in sorted(directorio.iterdir()):
        if f.name.startswith("."):
            continue
        if f.suffix != ".svg" or not FIG_RE.match(f.stem):
            fallas.append(f"figuras/{f.name}: nombre inválido, se espera "
                          f"FIG-<unidad>-<nodo>-<NN>.svg")
            continue
        codigos.append(f.stem)
    return codigos, fallas


def leer_figura(codigo: str, directorio: Path) -> tuple[str | None, list[str]]:
    donde = f"figura {codigo}"
    if not FIG_RE.match(codigo or ""):
        return None, [f"{donde}: no tiene la forma FIG-<unidad>-<nodo>-<NN>"]
    ruta = directorio / f"{codigo}.svg"
    if not ruta.is_file():
        return None, [f"{donde}: no existe {ruta}"]
    svg = ruta.read_text(encoding="utf-8")
    return svg, validar_svg(svg, donde)


def refs_de_doc(doc: dict) -> tuple[dict[str, list[str]], dict[str, list[str]]]:
    """-> (figura -> ítems que la usan, figura -> cuerpos que la usan).
    Solo recolecta; la validación de cada cuerpo la hace validar()."""
    de_items: dict[str, list[str]] = {}
    de_cuerpos: dict[str, list[str]] = {}
    for it in doc.get("items") or []:
        if it.get("figure"):
            de_items.setdefault(it["figure"], []).append(f"ítem {it.get('code')}")
    cuerpos = [("clase " + str((doc.get("lesson") or {}).get("code")),
                doc.get("lesson_body"))]
    cuerpos += [(f"remediación {r.get('code')}", r.get("body"))
                for r in doc.get("remediations") or []]
    for donde, body in cuerpos:
        for cod in FIG_IMG.findall(_sin_math(str(body or ""))):
            de_cuerpos.setdefault(cod, []).append(donde)
    return de_items, de_cuerpos


def usos_en_contenido(raiz_contenido: Path, excluir: Path):
    """Referencias de TODO el contenido (todas las unidades), salvo el
    archivo que se está cargando. La regla 'figura de ítem nunca en una
    clase o remediación' cruza unidades: un ítem de ENT y una clase de
    RAC pueden compartir figura sin compartir unidad."""
    de_items: dict[str, list[str]] = {}
    de_cuerpos: dict[str, list[str]] = {}
    for f in sorted(raiz_contenido.rglob("*.yaml")):
        if f.parent.name == "misconceptions" or f.resolve() == excluir.resolve():
            continue
        try:
            d = yaml.safe_load(f.read_text(encoding="utf-8")) or {}
        except Exception:
            continue
        if not isinstance(d, dict):
            continue
        di, dc = refs_de_doc(d)
        for cod, dondes in di.items():
            de_items.setdefault(cod, []).extend(f"{x} ({f.name})" for x in dondes)
        for cod, dondes in dc.items():
            de_cuerpos.setdefault(cod, []).extend(f"{x} ({f.name})" for x in dondes)
    return de_items, de_cuerpos
