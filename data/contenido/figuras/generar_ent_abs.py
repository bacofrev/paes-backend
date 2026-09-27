#!/usr/bin/env python3
"""
Figuras de NUM-ENT-ABS (clase LES-NUM-ENT-07).

  .venv/bin/python data/contenido/figuras/generar_ent_abs.py

Regenera en este directorio:
  FIG-ENT-ABS-01       ítem M2-ENT-012  (qué puntos cumplen |x| <= 3)
  FIG-ENT-ABS-02       ítem M2-ENT-021  (distancia con escala 2)
  FIG-ENT-ABS-03..05   cuerpo de la clase

Las de ítem usan la recta del repo con dos rótulos: la escala se deduce,
no se regala. Las de la clase reutilizan los saltos de generar_ent_adi.py,
pero rotulados con la distancia sin signo: un valor absoluto no tiene
dirección, y un rótulo "−5" sobre el arco enseñaría justo lo contrario.
"""

import re
import sys
import xml.etree.ElementTree as ET
from fractions import Fraction
from pathlib import Path

AQUI = Path(__file__).resolve().parent
sys.path.insert(0, str(AQUI.parent.parent / "loaders"))
sys.path.insert(0, str(AQUI))

import figuras  # noqa: E402
from recta import recta  # noqa: E402
import generar_ent_rec as rec  # noqa: E402
from generar_ent_adi import recta_con_saltos, puntos_con_nombre  # noqa: E402

rec.CLASE = AQUI.parent / "LES-NUM-ENT-07.yaml"


def aria(svg: str) -> str:
    return svg.split('aria-label="')[1].split('"')[0]


def nums_aria(svg: str) -> set[Fraction]:
    """Números que menciona el texto alternativo (con signo)."""
    return {Fraction(m) for m in re.findall(r"-?\d+", aria(svg))}


def distancias(svg: str) -> str:
    """Cambia los rótulos de los saltos (+5, −5) por la distancia (5).
    Se verifica releyendo: cada rótulo es |hasta − desde| del arco."""
    raiz = ET.fromstring(svg)
    for e in raiz.iter():
        if e.get("class") == "cambio":
            e.text = e.text.lstrip("+−")
    ET.register_namespace("", figuras.SVG_NS)
    out = ET.tostring(raiz, encoding="unicode") + "\n"
    r = ET.fromstring(out)
    arcos = [abs(Fraction(e.get("data-hasta")) - Fraction(e.get("data-desde")))
             for e in r.iter() if e.get("class") == "salto"]
    rot = [Fraction(e.text) for e in r.iter() if e.get("class") == "cambio"]
    assert rot == arcos, f"rótulos {rot} no son las distancias {arcos}"
    assert figuras.validar_svg(out, "distancias") == []
    return out


def main() -> int:
    hechas: dict[str, str] = {}

    # --- M2-ENT-012: qué puntos cumplen |x| <= 3 ----------------------
    pts = {"-4": "P", "-3": "Q", "-1": "R", "2": "S", "5": "T"}
    svg = recta(-5, 6, 1, rotulos=[0, 1], puntos=pts)
    p = puntos_con_nombre(svg)
    assert p == {k: Fraction(v) for v, k in pts.items()}
    dentro = sorted(k for k, v in p.items() if abs(v) <= 3)
    assert dentro == ["Q", "R", "S"]
    # cada distractor sale de su regla, y ninguna coincide con la correcta
    parent = sorted(k for k, v in p.items() if v <= 3)          # |x| = x
    cambia = sorted(k for k, v in p.items() if -v <= 3)         # |x| = -x
    unasol = sorted(k for k, v in p.items() if 0 <= v <= 3)
    assert parent == ["P", "Q", "R", "S"] and cambia == ["Q", "R", "S", "T"]
    assert unasol == ["S"]
    # Q en -3 queda justo en el borde: sin él, el ítem no mide el <=
    assert any(abs(v) == 3 for v in p.values())
    # el texto alternativo no dice dónde está cada punto
    assert not nums_aria(svg) & {Fraction(v) for v in pts}
    assert figuras.validar_svg(svg, "FIG-ENT-ABS-01") == []
    hechas["FIG-ENT-ABS-01"] = svg

    # --- M2-ENT-021: distancia entre M y N, marcas de 2 en 2 ----------
    svg = recta(-8, 10, 2, rotulos=[0, 4], puntos={"-6": "M", "8": "N"})
    c = rec.verificar_item("M2-ENT-021", svg, [0, 4], [-6, 8])
    p = puntos_con_nombre(svg)
    assert c == p["N"] - p["M"] == 14
    assert abs(abs(p["N"]) - abs(p["M"])) == 2          # DISTTAM
    assert (8 - 0) // 2 + (0 - -6) // 2 == 7            # ESCALA: marcas
    assert not nums_aria(svg) & {Fraction(14), Fraction(-6), Fraction(8)}
    hechas["FIG-ENT-ABS-02"] = svg

    # --- clase ----------------------------------------------------------

    # "El valor absoluto es una distancia": -14 y 14, a 14 del 0
    hechas["FIG-ENT-ABS-03"] = distancias(recta_con_saltos(
        -14, 14, 7, [(0, -14, 1), (0, 14, 1)], puntos=[-14, 14],
        descripcion="Recta numérica de −14 a 14 con marcas cada 7. Desde "
                    "el 0 salen dos arcos, uno hasta el −14 y otro hasta el "
                    "14, los dos rotulados con la distancia 14"))
    assert abs(-14) == abs(14) == 14

    # "Contar los enteros con |x| <= 7": los quince marcados. No usa el 2
    # ni el 3 ni el 4: son los de los ítems 012, 013 y 024, y la figura
    # les entregaría el conjunto.
    svg = recta(-9, 9, 1, rotulos=[-9, -7, 0, 7, 9], puntos=list(range(-7, 8)),
                descripcion="Recta numérica de −9 a 9. Están marcados los "
                            "quince enteros que cumplen que su valor "
                            "absoluto es menor o igual que 7, del −7 al 7")
    marcados = [Fraction(e.get("data-valor")) for e in ET.fromstring(svg).iter()
                if e.get("class") == "punto"]
    assert marcados == [v for v in range(-9, 10) if abs(v) <= 7]
    assert len(marcados) == 15
    hechas["FIG-ENT-ABS-04"] = svg

    # "Distancia entre dos enteros": de -7 a 2 pasando por el 0
    hechas["FIG-ENT-ABS-05"] = distancias(recta_con_saltos(
        -8, 3, 1, [(-7, 0, 1), (0, 2, 1)], rotulos=[-7, 0, 2],
        puntos=[-7, 2],
        descripcion="Recta numérica de −8 a 3. Un arco va del −7 al 0, "
                    "rotulado 7, y otro del 0 al 2, rotulado 2"))
    assert abs(-7) + abs(2) == 2 - (-7) == 9

    # Ninguna figura de la clase es la de un ítem (lo revisa el cargador),
    # y sus números no son los de los ítems 006, 018, 021 ni 023.
    for codigo, svg in hechas.items():
        (AQUI / f"{codigo}.svg").write_text(svg, encoding="utf-8")
        print(f"{codigo}.svg  {len(svg)} bytes")
    return 0


if __name__ == "__main__":
    sys.exit(main())
