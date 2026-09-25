#!/usr/bin/env python3
"""
recta.py — genera rectas numéricas en SVG para contenido/figuras/.

  python3 recta.py FIG-ENT-REC-01 --min -5 --max 5 --paso 1 \\
      --rotulos=-5,0,5 --puntos=P=-3,Q=2

Escribe contenido/figuras/FIG-ENT-REC-01.svg (o a stdout con --stdout).
Los valores negativos van con '=' (--min=-5) o separados como arriba.

No toca la base. El SVG sale ya validado con las mismas reglas que
aplica cargar_contenido.py (figuras.validar_svg), y además el generador
verifica sus propias condiciones releyendo el SVG que produjo:
  - las marcas están equiespaciadas;
  - cada punto cae exactamente sobre la coordenada de su valor;
  - cada rótulo está sobre una marca.
Una recta con la escala mal dibujada enseña justo el error que la
figura existe para diagnosticar (ME-ENT-REC-ESCALA).

El aria-label describe lo mismo que ve un estudiante que mira la
figura: rótulos visibles y nombres de puntos, nunca el valor de un
punto con nombre. Si el ítem pregunta "¿qué número es P?", decir
"P en -3" en el texto alternativo es darle la respuesta.
"""

import argparse
import sys
import xml.etree.ElementTree as ET
from fractions import Fraction
from pathlib import Path

import figuras

PASO_PX = 40      # distancia entre marcas: entera, para que caigan en px exactos
MARGEN = 30       # desde el borde hasta la primera/última marca
ALTO = 76
Y_EJE = 36
MARCA = 7         # media altura de una marca
Y_ROTULO = 64
Y_NOMBRE = 18
RADIO = 5


def _num(v: Fraction) -> str:
    """Texto visible: signo menos tipográfico, coma decimal."""
    signo = "−" if v < 0 else ""
    v = abs(v)
    if v.denominator == 1:
        return f"{signo}{v.numerator}"
    d = v.denominator
    while d % 2 == 0:
        d //= 2
    while d % 5 == 0:
        d //= 5
    if d == 1:  # decimal finito
        return signo + f"{float(v):g}".replace(".", ",")
    return f"{signo}{v.numerator}/{v.denominator}"


def _px(x: Fraction) -> str:
    """Coordenada en el SVG. Falla si no se puede escribir exacta con 3
    decimales: un punto 'casi' sobre su valor no sirve."""
    s = f"{float(x):.3f}".rstrip("0").rstrip(".")
    assert Fraction(s) == x, f"coordenada {x} no es exacta en 3 decimales"
    return s


def recta(minimo, maximo, paso, rotulos=None, puntos=None,
          descripcion: str | None = None) -> str:
    """
    minimo, maximo, paso: números (o strings como '-2.5'); se usan exactos.
    rotulos: None = todas las marcas; lista de valores = solo esas.
    puntos: lista de valores (punto sin nombre) o dict valor -> nombre.
    descripcion: aria-label; por defecto se arma con lo visible.
    """
    mn, mx, p = Fraction(str(minimo)), Fraction(str(maximo)), Fraction(str(paso))
    assert mn < mx, f"min ({mn}) debe ser menor que max ({mx})"
    assert p > 0, f"paso ({p}) debe ser positivo"
    n = (mx - mn) / p
    assert n.denominator == 1, f"el paso {p} no divide el tramo {mn}..{mx}"
    n = int(n)
    assert 1 <= n <= 30, f"{n} tramos: no cabe legible en un celular"

    px_por_unidad = Fraction(PASO_PX) / p

    def x(v: Fraction) -> Fraction:
        return MARGEN + (v - mn) * px_por_unidad

    marcas = [mn + k * p for k in range(n + 1)]
    ancho = 2 * MARGEN + n * PASO_PX

    rot = marcas if rotulos is None else [Fraction(str(r)) for r in rotulos]
    for r in rot:
        assert r in marcas, f"el rótulo {r} no está sobre ninguna marca"

    if puntos is None:
        pts: dict[Fraction, str | None] = {}
    elif isinstance(puntos, dict):
        pts = {Fraction(str(v)): nom for v, nom in puntos.items()}
    else:
        pts = {Fraction(str(v)): None for v in puntos}
    for v in pts:
        assert mn <= v <= mx, f"el punto {v} está fuera de {mn}..{mx}"

    if descripcion is None:
        partes = [f"Recta numérica con {n + 1} marcas equiespaciadas"]
        if rot:
            partes.append("rótulos: " + "; ".join(
                _num(r).replace("−", "-") for r in rot))
        con_nombre = [nom for nom in pts.values() if nom]
        sin_nombre = [v for v, nom in pts.items() if not nom]
        if con_nombre:
            partes.append("puntos marcados: " + "; ".join(con_nombre))
        if sin_nombre:
            partes.append("punto sin nombre en " + "; ".join(
                _num(v).replace("−", "-") for v in sin_nombre))
        descripcion = ". ".join(partes)

    L = [f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {ancho} {ALTO}" '
         f'role="img" aria-label="{_attr(descripcion)}" fill="currentColor" '
         f'font-family="inherit" font-size="15">']
    # Eje con flecha en ambos extremos: la recta sigue.
    x0, x1 = 6, ancho - 6
    L.append(f'  <line class="eje" x1="{x0 + 8}" y1="{Y_EJE}" x2="{x1 - 8}" '
             f'y2="{Y_EJE}" stroke="currentColor" stroke-width="2"/>')
    L.append(f'  <polygon points="{x0},{Y_EJE} {x0 + 10},{Y_EJE - 5} '
             f'{x0 + 10},{Y_EJE + 5}"/>')
    L.append(f'  <polygon points="{x1},{Y_EJE} {x1 - 10},{Y_EJE - 5} '
             f'{x1 - 10},{Y_EJE + 5}"/>')
    for m in marcas:
        L.append(f'  <line class="marca" data-valor="{m}" x1="{_px(x(m))}" '
                 f'y1="{Y_EJE - MARCA}" x2="{_px(x(m))}" y2="{Y_EJE + MARCA}" '
                 f'stroke="currentColor" stroke-width="2"/>')
    for r in rot:
        L.append(f'  <text class="rotulo" data-valor="{r}" x="{_px(x(r))}" '
                 f'y="{Y_ROTULO}" text-anchor="middle">{_num(r)}</text>')
    for v, nom in pts.items():
        L.append(f'  <circle class="punto" data-valor="{v}" cx="{_px(x(v))}" '
                 f'cy="{Y_EJE}" r="{RADIO}"/>')
        if nom:
            L.append(f'  <text class="nombre" x="{_px(x(v))}" y="{Y_NOMBRE}" '
                     f'text-anchor="middle" font-weight="600">{_attr(nom)}</text>')
    L.append("</svg>")
    svg = "\n".join(L) + "\n"

    _verificar(svg, mn, px_por_unidad, marcas, rot, pts)
    fallas = figuras.validar_svg(svg, "recta generada")
    assert not fallas, fallas
    return svg


def _attr(s: str) -> str:
    return (s.replace("&", "&amp;").replace('"', "&quot;")
             .replace("<", "&lt;").replace(">", "&gt;"))


def _verificar(svg, mn, px_por_unidad, marcas, rot, pts):
    """Relee el SVG producido: lo que se verifica es la salida, no las
    variables intermedias."""
    ns = {"s": figuras.SVG_NS}
    raiz = ET.fromstring(svg)

    def x(v):
        return MARGEN + (v - mn) * px_por_unidad

    xs = [Fraction(el.get("x1")) for el in raiz.findall("s:line[@class='marca']", ns)]
    assert len(xs) == len(marcas), "faltan o sobran marcas"
    assert all(Fraction(el.get("x1")) == Fraction(el.get("x2"))
               for el in raiz.findall("s:line[@class='marca']", ns)), \
        "marca inclinada"
    difs = {b - a for a, b in zip(xs, xs[1:])}
    assert len(difs) == 1 and difs.pop() > 0, \
        f"marcas no equiespaciadas: {xs}"

    x_marca = {Fraction(el.get("data-valor")): Fraction(el.get("x1"))
               for el in raiz.findall("s:line[@class='marca']", ns)}
    for el in raiz.findall("s:circle[@class='punto']", ns):
        v = Fraction(el.get("data-valor"))
        cx = Fraction(el.get("cx"))
        assert cx == x(v), f"punto {v} dibujado en {cx}, va en {x(v)}"
        if v in x_marca:
            assert cx == x_marca[v], f"punto {v} no coincide con su marca"
    assert len(raiz.findall("s:circle[@class='punto']", ns)) == len(pts)

    for el in raiz.findall("s:text[@class='rotulo']", ns):
        v = Fraction(el.get("data-valor"))
        assert v in x_marca and Fraction(el.get("x")) == x_marca[v], \
            f"rótulo {v} no está sobre su marca"
    assert len(raiz.findall("s:text[@class='rotulo']", ns)) == len(rot)


# ---------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------

def _lista(s: str | None):
    if s is None or s == "todos":
        return None
    return [x.strip() for x in s.split(",") if x.strip()]


def _puntos(s: str | None):
    """'P=-3,Q=2' -> {'-3': 'P', '2': 'Q'};  '-3,2' -> ['-3', '2']."""
    if not s:
        return None
    partes = [x.strip() for x in s.split(",") if x.strip()]
    if all("=" in x for x in partes):
        return {v: nom for nom, v in (x.split("=", 1) for x in partes)}
    assert not any("=" in x for x in partes), "mezcla de puntos con y sin nombre"
    return partes


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("codigo")
    ap.add_argument("--min", required=True)
    ap.add_argument("--max", required=True)
    ap.add_argument("--paso", required=True)
    ap.add_argument("--rotulos", help="valores separados por coma, o 'todos' (default)")
    ap.add_argument("--puntos", help="'P=-3,Q=2' o '-3,2'")
    ap.add_argument("--descripcion", help="aria-label; por defecto, lo visible")
    ap.add_argument("--stdout", action="store_true")
    a = ap.parse_args()

    if not figuras.FIG_RE.match(a.codigo):
        print(f"'{a.codigo}' no tiene la forma FIG-<unidad>-<nodo>-<NN>",
              file=sys.stderr)
        return 1
    try:
        svg = recta(a.min, a.max, a.paso, _lista(a.rotulos),
                    _puntos(a.puntos), a.descripcion)
    except AssertionError as e:
        print(f"recta inválida: {e}", file=sys.stderr)
        return 1

    if a.stdout:
        sys.stdout.write(svg)
        return 0
    destino = Path(__file__).resolve().parent.parent / "contenido" / "figuras"
    destino.mkdir(exist_ok=True)
    ruta = destino / f"{a.codigo}.svg"
    ruta.write_text(svg, encoding="utf-8")
    print(f"escrito {ruta} ({len(svg.encode('utf-8'))} bytes)", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
