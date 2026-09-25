#!/usr/bin/env python3
"""
Figuras de NUM-ENT-ADI (clase LES-NUM-ENT-02).

  .venv/bin/python data/contenido/figuras/generar_ent_adi.py

Regenera en este directorio:
  FIG-ENT-ADI-01       ítem M1-ENT-038
  FIG-ENT-ADI-02..07   cuerpo de la clase, una por concepto

Todas parten de la recta del repo (data/loaders/recta.py). La del ítem
usa las verificaciones de generar_ent_rec.py: dos rótulos, ninguno sobre
la respuesta ni un distractor, y la respuesta nunca se dibuja.

Las de la clase agregan saltos: un arco con punta de flecha desde un
valor hasta otro, rotulado con el cambio (+5, −20). El rótulo se calcula
de los extremos, nunca se escribe a mano, y se verifica releyendo el SVG
que cada arco nace y termina exactamente sobre la marca de su valor.
"""

import math
import sys
import xml.etree.ElementTree as ET
from fractions import Fraction
from pathlib import Path

import yaml

AQUI = Path(__file__).resolve().parent
sys.path.insert(0, str(AQUI.parent.parent / "loaders"))
sys.path.insert(0, str(AQUI))

import figuras  # noqa: E402
import recta as R  # noqa: E402
from recta import recta  # noqa: E402
import generar_ent_rec as rec  # noqa: E402

rec.CLASE = AQUI.parent / "LES-NUM-ENT-02.yaml"


def puntos_con_nombre(svg: str) -> dict[str, Fraction]:
    """nombre -> valor, releyendo el SVG: el nombre va sobre su punto."""
    raiz = ET.fromstring(svg)
    x_de = {e.get("cx"): Fraction(e.get("data-valor"))
            for e in raiz.iter() if e.get("class") == "punto"}
    return {e.text: x_de[e.get("x")]
            for e in raiz.iter() if e.get("class") == "nombre"}


# ---------------------------------------------------------------------
# Recta con saltos
# ---------------------------------------------------------------------

ALTO_NIVEL = 30     # altura de cada nivel de arco
PUNTA = 7           # largo de la punta de flecha


def _num(v: Fraction) -> str:
    return ("−" if v < 0 else "") + str(abs(v))


def recta_con_saltos(minimo, maximo, paso, saltos, rotulos=None,
                     puntos=None, descripcion=None) -> str:
    """saltos: lista de (desde, hasta, nivel). nivel 1 es el arco más
    bajo; dos saltos que se cruzan van en niveles distintos."""
    base = recta(minimo, maximo, paso, rotulos=rotulos, puntos=puntos,
                 descripcion=descripcion)
    mn, p = Fraction(str(minimo)), Fraction(str(paso))
    ppu = Fraction(R.PASO_PX) / p

    def x(v) -> Fraction:
        return R.MARGEN + (Fraction(v) - mn) * ppu

    con_nombre = isinstance(puntos, dict) and any(puntos.values())
    niveles = max(n for _, _, n in saltos)
    extra = (18 if con_nombre else 12) + ALTO_NIVEL * niveles
    # los arcos nacen sobre el eje, o sobre los nombres si los hay
    y0 = extra + (R.Y_NOMBRE - 14 if con_nombre else R.Y_EJE - R.MARCA - 3)

    raiz = ET.fromstring(base)
    _, _, ancho, alto = (int(float(v)) for v in raiz.get("viewBox").split())
    alto += extra
    cuerpo = base.split(">", 1)[1].rsplit("</svg>", 1)[0]
    cab = base.split(">", 1)[0] + ">"
    cab = (cab.replace(f'viewBox="0 0 {ancho} {alto - extra}"',
                       f'viewBox="0 0 {ancho} {alto}"')
              .replace(f'height="{alto - extra}"', f'height="{alto}"'))

    L = [cab, f'  <g transform="translate(0,{extra})">{cuerpo}  </g>']
    etiquetas = []
    for desde, hasta, nivel in saltos:
        d, h = Fraction(desde), Fraction(hasta)
        assert d != h
        x1, x2 = x(d), x(h)
        cima = y0 - ALTO_NIVEL * nivel          # y del punto más alto
        # cuadrática: el control a 2x la altura deja la cima en 'cima'
        yc = 2 * cima - y0
        xm = (x1 + x2) / 2
        L.append(f'  <path class="salto" data-desde="{d}" data-hasta="{h}" '
                 f'fill="none" stroke="currentColor" stroke-width="{R.TRAZO}" '
                 f'd="M{float(x1):g},{float(y0):g} Q{float(xm):g},{float(yc):g} '
                 f'{float(x2):g},{float(y0):g}"/>')
        # punta: sigue la tangente al final del arco
        tx, ty = float(x2 - xm), float(y0 - yc)
        n = math.hypot(tx, ty)
        ux, uy = tx / n, ty / n
        bx, by = float(x2) - PUNTA * ux, float(y0) - PUNTA * uy
        px, py = -uy * PUNTA * 0.55, ux * PUNTA * 0.55
        L.append(f'  <polygon class="punta" points="{float(x2):g},{float(y0):g} '
                 f'{bx + px:.2f},{by + py:.2f} {bx - px:.2f},{by - py:.2f}"/>')
        cambio = h - d
        txt = ("+" if cambio > 0 else "−") + str(abs(cambio))
        # con varios niveles, el arco de arriba pasa por la cima de los de
        # abajo: su rótulo va por dentro de la curva
        yt = float(cima) - 5 if nivel == niveles else float(cima) + 15
        L.append(f'  <text class="cambio" data-valor="{cambio}" x="{float(xm):g}" '
                 f'y="{yt:g}" text-anchor="middle" font-weight="600">{txt}</text>')
        etiquetas.append((float(xm), yt, len(txt)))
    L.append("</svg>")
    svg = "\n".join(L) + "\n"

    # --- releer y verificar ------------------------------------------
    r = ET.fromstring(svg)
    marcas = {Fraction(e.get("data-valor")): Fraction(e.get("x1"))
              for e in r.iter() if e.get("class") == "marca"}
    for e in r.iter():
        if e.get("class") != "salto":
            continue
        d, h = Fraction(e.get("data-desde")), Fraction(e.get("data-hasta"))
        assert d in marcas and h in marcas, f"salto {d}->{h} fuera de marca"
        nums = [Fraction(t) for t in
                e.get("d").replace("M", " ").replace("Q", " ")
                 .replace(",", " ").split()]
        assert nums[0] == marcas[d] and nums[4] == marcas[h], \
            f"el arco {d}->{h} no nace o no termina en su marca"
    cambios = [Fraction(e.get("data-valor")) for e in r.iter()
               if e.get("class") == "cambio"]
    assert cambios == [Fraction(h) - Fraction(d) for d, h, _ in saltos]
    # rótulos de cambio: dentro del dibujo y sin montarse entre ellos
    for xm, yt, n in etiquetas:
        assert 0 < xm - 5 * n and xm + 5 * n < ancho and yt > 12
    for i, (xa, ya, na) in enumerate(etiquetas):
        for xb, yb, nb in etiquetas[i + 1:]:
            assert abs(ya - yb) > 16 or abs(xa - xb) > 5 * (na + nb) + 6, \
                "rótulos de cambio montados"
    # ningún arco pasa por encima de un rótulo de cambio
    arcos = []
    for e in r.iter():
        if e.get("class") == "salto":
            v = [float(t) for t in e.get("d").replace("M", " ").replace("Q", " ")
                 .replace(",", " ").split()]
            arcos.append(v)
    for xm, yt, n in etiquetas:
        caja = (xm - 5 * n, xm + 5 * n, yt - 13, yt + 3)
        for x1, y1, xc, yc, x2, y2 in arcos:
            for k in range(201):
                t = k / 200
                bx = (1 - t) ** 2 * x1 + 2 * (1 - t) * t * xc + t * t * x2
                by = (1 - t) ** 2 * y1 + 2 * (1 - t) * t * yc + t * t * y2
                assert not (caja[0] < bx < caja[1] and caja[2] < by < caja[3]), \
                    f"un arco pasa por el rótulo en x={xm}"
    assert figuras.validar_svg(svg, "recta con saltos") == []
    return svg


def main() -> int:
    hechas: dict[str, str] = {}

    # M1-ENT-038: qué hay que sumarle a P para obtener Q.
    svg = recta(-8, 6, 1, rotulos=[0, 1], puntos={"-6": "P", "4": "Q"})
    c = rec.verificar_item("M1-ENT-038", svg, [0, 1], [-6, 4])
    p = puntos_con_nombre(svg)
    assert c == p["Q"] - p["P"] == 10
    assert "-6" not in svg.split('aria-label="')[1].split('"')[0]
    hechas["FIG-ENT-ADI-01"] = svg

    # --- clase: una figura por concepto ------------------------------

    # "Sumar es moverse en la recta": 2 + 5 = 7 y 2 + (-5) = -3
    hechas["FIG-ENT-ADI-02"] = recta_con_saltos(
        -4, 8, 1, [(2, 7, 1), (2, -3, 1)], puntos=[2],
        descripcion="Recta numérica de −4 a 8. Desde el 2 sale un salto de "
                    "+5 hacia la derecha que llega al 7, y un salto de −5 "
                    "hacia la izquierda que llega al −3")
    assert 2 + 5 == 7 and 2 + (-5) == -3

    # "Números con el mismo signo": -12 + (-20) = -32
    hechas["FIG-ENT-ADI-03"] = recta_con_saltos(
        -36, 4, 4, [(-12, -32, 1)], puntos=[-12, -32],
        descripcion="Recta numérica de −36 a 4 con marcas cada 4. Desde el "
                    "−12 sale un salto de −20 hacia la izquierda que llega "
                    "al −32")
    assert -12 + (-20) == -32

    # "Números con distinto signo": -18 + 12 = -6
    hechas["FIG-ENT-ADI-04"] = recta_con_saltos(
        -24, 18, 6, [(-18, -6, 1)], puntos=[-18, -6],
        descripcion="Recta numérica de −24 a 18 con marcas cada 6. Desde el "
                    "−18 sale un salto de +12 hacia la derecha que llega al "
                    "−6, que queda entre −18 y 12")
    assert -18 + 12 == -6 and -18 < -6 < 12

    # "Restar es sumar el opuesto": 7 - 5 = 2 y 7 - (-5) = 12
    hechas["FIG-ENT-ADI-05"] = recta_con_saltos(
        0, 13, 1, [(7, 2, 1), (7, 12, 1)], puntos=[7],
        descripcion="Recta numérica de 0 a 13. Desde el 7 sale un salto de "
                    "−5 hacia la izquierda que llega al 2, y un salto de +5 "
                    "hacia la derecha que llega al 12")
    assert 7 - 5 == 2 and 7 - (-5) == 12

    # "Cadenas": -10 + 20 - 15 = -5, en dos saltos
    hechas["FIG-ENT-ADI-06"] = recta_con_saltos(
        -15, 15, 5, [(-10, 10, 1), (10, -5, 2)], puntos=[-10, 10, -5],
        descripcion="Recta numérica de −15 a 15 con marcas cada 5. Primer "
                    "salto de +20 desde el −10 hasta el 10; segundo salto de "
                    "−15 desde el 10 hasta el −5")
    assert -10 + 20 - 15 == -5

    # "Variación y diferencia": de A a B. Mismo formato que el ítem 038
    # (solo 0 y 1 rotulados), con otros valores.
    svg = recta_con_saltos(-6, 7, 1, [(-4, 5, 1)], rotulos=[0, 1],
                           puntos={"-4": "A", "5": "B"})
    p = puntos_con_nombre(svg.replace(
        svg[svg.index("<g "):svg.index(">", svg.index("<g ")) + 1], "<g>"))
    assert p == {"A": -4, "B": 5} and (p["A"], p["B"]) != (-6, 4)
    assert p["B"] - p["A"] == 9
    hechas["FIG-ENT-ADI-07"] = svg

    for codigo, svg in hechas.items():
        (AQUI / f"{codigo}.svg").write_text(svg, encoding="utf-8")
        print(f"{codigo}.svg  {len(svg)} bytes")
    return 0


if __name__ == "__main__":
    sys.exit(main())
