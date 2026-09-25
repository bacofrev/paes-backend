#!/usr/bin/env python3
"""
Figuras de los ítems de NUM-ENT-REC (clase LES-NUM-ENT-01).

  python3 data/contenido/figuras/generar_ent_rec.py

Regenera FIG-ENT-REC-01..05 en este directorio. Las rectas salen del
generador del repo (data/loaders/recta.py); el termómetro es vertical y
el generador no lo soporta, así que se construye acá con el mismo
patrón: posiciones calculadas con aritmética exacta, SVG releído y
verificado con asserts antes de escribirlo.

Reglas de estas figuras (son de ítem, no de clase):
  - muestran la escala con dos rótulos y nada más: deducir la escala es
    justo lo que la misconception ENT-REC-ESCALA pone a prueba;
  - ningún rótulo cae en el valor de la respuesta ni de un distractor
    (se verifica leyendo las alternativas del YAML, no copiándolas acá);
  - el punto que es la respuesta nunca se dibuja.
"""

import re
import sys
import xml.etree.ElementTree as ET
from fractions import Fraction
from pathlib import Path

import yaml

AQUI = Path(__file__).resolve().parent
sys.path.insert(0, str(AQUI.parent.parent / "loaders"))

import figuras  # noqa: E402
from recta import FUENTE, TRAZO, recta  # noqa: E402

CLASE = AQUI.parent / "LES-NUM-ENT-01.yaml"
NS = {"s": figuras.SVG_NS}


# ---------------------------------------------------------------------
# Lo que dice el YAML
# ---------------------------------------------------------------------

def alternativas(codigo: str) -> tuple[Fraction, set[Fraction]]:
    """-> (valor de la correcta, valores de los distractores)."""
    doc = yaml.safe_load(CLASE.read_text(encoding="utf-8"))
    it = next(i for i in doc["items"] if i["code"] == codigo)

    def valor(body: str) -> Fraction:
        m = re.findall(r"-?\d+", body)
        assert len(m) == 1, f"{codigo}: alternativa '{body}' no es un solo número"
        return Fraction(m[0])

    correcta = [valor(o["body"]) for o in it["options"] if o.get("correct")]
    assert len(correcta) == 1
    return correcta[0], {valor(o["body"]) for o in it["options"] if not o.get("correct")}


def leidos(svg: str, clase: str) -> list[Fraction]:
    raiz = ET.fromstring(svg)
    return [Fraction(e.get("data-valor"))
            for e in raiz.iter() if e.get("class") == clase]


def verificar_item(codigo, svg, rotulos, puntos=()):
    """Condiciones comunes a toda figura de ítem."""
    correcta, distractores = alternativas(codigo)
    rot = leidos(svg, "rotulo")
    pts = leidos(svg, "punto")
    assert sorted(rot) == sorted(Fraction(r) for r in rotulos), \
        f"{codigo}: rótulos {rot}, se pidieron {rotulos}"
    assert len(rot) == 2, f"{codigo}: la escala se deduce de dos rótulos"
    prohibidos = {correcta} | distractores
    assert not set(rot) & prohibidos, \
        f"{codigo}: rótulo sobre la respuesta o un distractor: {set(rot) & prohibidos}"
    assert sorted(pts) == sorted(Fraction(p) for p in puntos), \
        f"{codigo}: puntos {pts}, se pidieron {puntos}"
    assert correcta not in pts, f"{codigo}: la figura dibuja la respuesta"
    assert figuras.validar_svg(svg, codigo) == []
    return correcta


# ---------------------------------------------------------------------
# Termómetro vertical
# ---------------------------------------------------------------------

PX_POR_MARCA = 14
Y_MAX = 30          # y de la marca del máximo
CX = 40             # eje del tubo
MEDIO_TUBO = 7      # radio del tubo
R_BULBO = 13
R_LIQUIDO = 9
MEDIO_COLUMNA = 3
X_MARCA = (CX + MEDIO_TUBO, CX + MEDIO_TUBO + 10)
X_ROTULO = 63


def termometro(minimo, maximo, paso, rotulos, nivel, descripcion) -> str:
    mn, mx, p = Fraction(minimo), Fraction(maximo), Fraction(paso)
    nv = Fraction(nivel)
    assert mn < mx and p > 0
    n = (mx - mn) / p
    assert n.denominator == 1, "el paso no divide el tramo"
    n = int(n)
    marcas = [mn + k * p for k in range(n + 1)]
    rot = [Fraction(r) for r in rotulos]
    assert all(r in marcas for r in rot), "rótulo fuera de marca"
    assert nv in marcas, "el líquido tiene que llegar exacto a una marca"

    def y(v: Fraction) -> Fraction:
        return Y_MAX + (mx - v) / p * PX_POR_MARCA

    y_min = y(mn)
    cy_bulbo = y_min + 22
    # donde las paredes del tubo tocan el bulbo
    dy = Fraction(R_BULBO**2 - MEDIO_TUBO**2) ** Fraction(1, 2)
    y_union = float(cy_bulbo) - float(dy)
    y_tapa = Y_MAX - 16
    alto = int(cy_bulbo) + R_BULBO + 6
    ancho = 92

    def f(v) -> str:
        return f"{float(v):.2f}".rstrip("0").rstrip(".")

    xi, xd = CX - MEDIO_TUBO, CX + MEDIO_TUBO
    L = [f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {ancho} {alto}" '
         f'width="{ancho}" height="{alto}" role="img" aria-label="{descripcion}" '
         f'fill="currentColor" font-family="{FUENTE}" font-size="15" '
         f'stroke-linecap="round" stroke-linejoin="round">']
    # tubo + bulbo: un solo contorno
    L.append(f'  <path class="tubo" fill="none" stroke="currentColor" stroke-width="{TRAZO}" '
             f'd="M{xi},{f(y_union)} L{xi},{y_tapa} A{MEDIO_TUBO},{MEDIO_TUBO} 0 0 1 {xd},{y_tapa} '
             f'L{xd},{f(y_union)} A{R_BULBO},{R_BULBO} 0 1 1 {xi},{f(y_union)}"/>')
    # líquido: bulbo lleno + columna hasta el nivel
    L.append(f'  <circle class="bulbo" cx="{CX}" cy="{f(cy_bulbo)}" r="{R_LIQUIDO}"/>')
    L.append(f'  <rect class="liquido" data-valor="{nv}" x="{CX - MEDIO_COLUMNA}" '
             f'y="{f(y(nv))}" width="{2 * MEDIO_COLUMNA}" '
             f'height="{f(cy_bulbo - y(nv))}"/>')
    for m in marcas:
        L.append(f'  <line class="marca" data-valor="{m}" x1="{X_MARCA[0]}" y1="{f(y(m))}" '
                 f'x2="{X_MARCA[1]}" y2="{f(y(m))}" stroke="currentColor" stroke-width="{TRAZO}"/>')
    for r in rot:
        txt = ("−" if r < 0 else "") + str(abs(r))
        L.append(f'  <text class="rotulo" data-valor="{r}" x="{X_ROTULO}" y="{f(y(r))}" '
                 f'dominant-baseline="central">{txt}</text>')
    L.append(f'  <text class="unidad" x="{X_ROTULO}" y="{y_tapa}" '
             f'dominant-baseline="central" font-size="13">°C</text>')
    L.append("</svg>")
    svg = "\n".join(L) + "\n"

    # --- releer y verificar la salida --------------------------------
    raiz = ET.fromstring(svg)
    lineas = [e for e in raiz.iter() if e.get("class") == "marca"]
    assert len(lineas) == len(marcas)
    ys = [Fraction(e.get("y1")) for e in lineas]
    assert all(e.get("y1") == e.get("y2") for e in lineas), "marca inclinada"
    assert len({b - a for a, b in zip(ys, ys[1:])}) == 1, f"marcas no equiespaciadas: {ys}"
    y_de = {Fraction(e.get("data-valor")): Fraction(e.get("y1")) for e in lineas}
    liq = next(e for e in raiz.iter() if e.get("class") == "liquido")
    assert Fraction(liq.get("y")) == y_de[nv], "el líquido no llega exacto a su marca"
    assert Fraction(liq.get("y")) + Fraction(liq.get("height")) == cy_bulbo, \
        "la columna no nace en el bulbo"
    for e in raiz.iter():
        if e.get("class") == "rotulo":
            v = Fraction(e.get("data-valor"))
            assert Fraction(e.get("y")) == y_de[v], f"rótulo {v} fuera de su marca"
    # la marca más baja queda sobre el bulbo, no adentro
    assert y_de[mn] < y_union - R_LIQUIDO / 2
    assert int(cy_bulbo) + R_BULBO < alto
    return svg


# ---------------------------------------------------------------------
# Las cinco figuras
# ---------------------------------------------------------------------

def main() -> int:
    hechas: dict[str, str] = {}

    # M1-ENT-006: tercera marca a la izquierda del 0.
    svg = recta(-8, 4, 2, rotulos=[0, 2])
    c = verificar_item("M1-ENT-006", svg, [0, 2])
    assert c == 0 - 3 * 2
    hechas["FIG-ENT-REC-01"] = svg

    # M1-ENT-011: unidades entre P y Q.
    svg = recta(-25, 15, 5, rotulos=[0, 10], puntos={"-20": "P", "5": "Q"})
    c = verificar_item("M1-ENT-011", svg, [0, 10], [-20, 5])
    assert c == 5 - (-20)
    hechas["FIG-ENT-REC-02"] = svg

    # M1-ENT-016: segunda marca a la izquierda del 0.
    svg = recta(-40, 20, 10, rotulos=[0, 10])
    c = verificar_item("M1-ENT-016", svg, [0, 10])
    assert c == 0 - 2 * 10
    hechas["FIG-ENT-REC-03"] = svg

    # M1-ENT-018: 2 marcas a la derecha de A. -6 es distractor: sin rótulo.
    svg = recta(-15, 3, 3, rotulos=[-12, -9], puntos={"-9": "A"})
    c = verificar_item("M1-ENT-018", svg, [-12, -9], [-9])
    assert c == -9 + 2 * 3
    hechas["FIG-ENT-REC-04"] = svg

    # M1-ENT-022: temperatura que marca el termómetro. Acá la lectura ES la
    # pregunta: el líquido tiene que llegar a -14, pero esa marca no lleva
    # rótulo y el aria-label no dice el valor.
    svg = termometro(-20, 8, 2, rotulos=[0, 4], nivel=-14,
                     descripcion="Termómetro en grados Celsius con marcas "
                                 "equiespaciadas; rótulos: 0 y 4; el líquido "
                                 "llega hasta una marca bajo el 0")
    c, distractores = alternativas("M1-ENT-022")
    assert c == -14
    rot = leidos(svg, "rotulo")
    assert sorted(rot) == [0, 4] and not set(rot) & ({c} | distractores)
    assert "14" not in svg.split('aria-label="')[1].split('"')[0]
    assert figuras.validar_svg(svg, "FIG-ENT-REC-05") == []
    hechas["FIG-ENT-REC-05"] = svg

    for codigo, svg in hechas.items():
        (AQUI / f"{codigo}.svg").write_text(svg, encoding="utf-8")
        print(f"{codigo}.svg  {len(svg.encode('utf-8'))} bytes")
    return 0


if __name__ == "__main__":
    sys.exit(main())
