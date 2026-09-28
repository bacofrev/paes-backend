#!/usr/bin/env python3
"""
Figuras de GEO-TRA-ROT-90, GEO-TRA-ROT-CEN y GEO-TRA-SIM-CEN (clase
LES-GEO-TRA-04).

  .venv/bin/python data/contenido/figuras/generar_geo_tra_04.py

Ítems:
  FIG-ROT-90-01   triángulo F y cuatro candidatas (90° antihorario, origen)
  FIG-ROT-90-02   punto A(4, 2)
  FIG-ROT-90-03   triángulo F y su imagen F' (90° antihorario)
  FIG-ROT-90-04   triángulo con el vértice P(−3, 2) marcado
  FIG-ROT-CEN-01  punto A(3, 2) y centro C(1, −1)
  FIG-ROT-CEN-02  triángulo T, centro C(3, 2) y cuatro candidatas
  FIG-ROT-CEN-03  triángulo con A(−3, 4) y centro C(1, 1)
  FIG-SIM-CEN-01  triángulo F y cuatro candidatas (simetría central, origen)
  FIG-SIM-CEN-02  punto A(−2, 3) y centro C(1, 1)
Clase:
  FIG-ROT-90-05   P(5, 2) girado 90° antihorario: P'(−2, 5)
  FIG-ROT-CEN-04  P(2, 1) girado 90° antihorario respecto de C(−1, 0)
  FIG-SIM-CEN-03  P, C y P' alineados, con C al medio
"""

from fractions import Fraction as Fr

from plano_svg import Plano, guardar

HECHAS = {}


def fig(codigo, svg):
    HECHAS[codigo] = svg
    guardar(codigo, svg)


def centro(pts):
    return (Fr(sum(x for x, _ in pts), len(pts)), Fr(sum(y for _, y in pts), len(pts)))


def sin_vertices_comunes(figs):
    vs = [set(v) for v in figs.values()]
    for i in range(len(vs)):
        for j in range(i + 1, len(vs)):
            assert not (vs[i] & vs[j]), "dos figuras comparten un vértice"


def ccw(p, c=(0, 0)):
    x, y = p[0] - c[0], p[1] - c[1]
    return (c[0] - y, c[1] + x)


def cw(p, c=(0, 0)):
    x, y = p[0] - c[0], p[1] - c[1]
    return (c[0] + y, c[1] - x)


def media(p, c=(0, 0)):
    return (2 * c[0] - p[0], 2 * c[1] - p[1])


def dibujar_candidatas(p, todas):
    for nombre, pts in todas.items():
        p.poligono([("", x, y) for x, y in pts], marcas=False)
        cx, cy = centro(pts)
        p.texto(cx, cy, nombre, size=13, italic=(nombre in ("F", "T")))


def main():
    # ---------------- ROT-90 ---------------------------------------------
    F = [(1, 4), (3, 4), (1, 6)]
    todas = {"F": F,
             "1": [ccw(q) for q in F],                  # correcta
             "2": [cw(q) for q in F],                   # SENTIDO
             "3": [media(q) for q in F],                # ANGULO (180°)
             "4": [(y, x) for x, y in F]}               # SOLOCAMBIA
    sin_vertices_comunes(todas)
    p = Plano(-7, 7, -7, 7, px=22, rotulos_x=[], rotulos_y=[])
    dibujar_candidatas(p, todas)
    fig("FIG-ROT-90-01", p.svg("Plano con cuadrícula, el triángulo F y cuatro triángulos numerados del "
                               "1 al 4.", prohibido=("gir", "rot")))

    p = Plano(-5, 5, -5, 5)
    p.punto("A", 4, 2, pos="ne")
    fig("FIG-ROT-90-02", p.svg("Plano cartesiano con cuadrícula de una unidad y el punto A.",
                               prohibido=("(4",)))

    F = [(1, 1), (4, 1), (1, 3)]
    F2 = [ccw(q) for q in F]
    assert F2 == [(-1, 1), (-1, 4), (-3, 1)]
    p = Plano(-5, 5, -2, 5)
    p.poligono([("", x, y) for x, y in F], marcas=False)
    p.poligono([("", x, y) for x, y in F2], marcas=False)
    p.texto(Fr(2), Fr(3, 2), "F", italic=True)
    p.texto(Fr(-3, 2), Fr(2), "F'", italic=True)
    fig("FIG-ROT-90-03", p.svg("Plano cartesiano con el triángulo F y su imagen F' por una rotación "
                               "con centro en el origen.", prohibido=("90", "antihorario")))

    p = Plano(-5, 3, -1, 6)
    p.poligono([("P", -3, 2), ("", -1, 2), ("", -3, 5)], pos={"P": "sw"})
    fig("FIG-ROT-90-04", p.svg("Plano cartesiano con un triángulo; uno de sus vértices está marcado "
                               "como P.", prohibido=("(−3",)))

    P = (5, 2)
    P2 = ccw(P)
    assert P2 == (-2, 5)
    p = Plano(-4, 6, -1, 6)
    p.segmento((0, 0), P)
    p.segmento((0, 0), P2)
    p.punto("P", *P, pos="e")
    p.punto("P'", *P2, pos="w")
    p.texto(Fr(1, 2), Fr(3, 2), "90°", size=12)
    fig("FIG-ROT-90-05", p.svg("El punto P(5, 2) girado 90° en sentido antihorario alrededor del "
                               "origen llega a P'(−2, 5). Los segmentos punteados desde el origen "
                               "miden lo mismo y forman un ángulo recto."))

    # ---------------- ROT-CEN --------------------------------------------
    p = Plano(-4, 5, -3, 4)
    p.punto("A", 3, 2, pos="ne")
    p.punto("C", 1, -1, pos="se")
    fig("FIG-ROT-CEN-01", p.svg("Plano cartesiano con el punto A y el punto C marcados.",
                                prohibido=("(−2",)))

    C = (3, 2)
    T = [(4, 3), (6, 3), (4, 5)]
    todas = {"T": T,
             "1": [ccw(q, C) for q in T],               # correcta
             "2": [ccw(q) for q in T],                  # ORIGEN
             "3": [cw(q, C) for q in T],                # SENTIDO
             "4": [ccw((x - C[0], y - C[1])) for x, y in T]}   # NOVUELVE
    assert todas["1"] == [(2, 3), (2, 5), (0, 3)]
    sin_vertices_comunes(todas)
    assert C not in {v for vs in todas.values() for v in vs}
    p = Plano(-6, 7, -2, 7, px=22, rotulos_x=[], rotulos_y=[])
    dibujar_candidatas(p, todas)
    p.punto("C", *C, pos="se")
    fig("FIG-ROT-CEN-02", p.svg("Plano con cuadrícula, el punto C, el triángulo T y cuatro triángulos "
                                "numerados del 1 al 4.", prohibido=("gir", "rot")))

    A, C = (-3, 4), (1, 1)
    assert media(A, C) == (5, -2)
    p = Plano(-6, 6, -4, 7)
    p.poligono([("A", *A), ("", -5, 4), ("", -3, 6)], pos={"A": "e"})
    p.punto("C", *C, pos="se")
    fig("FIG-ROT-CEN-03", p.svg("Plano cartesiano con un triángulo, uno de cuyos vértices está marcado "
                                "como A, y el punto C.", prohibido=("(5",)))

    C, P = (-1, 0), (2, 1)
    P2 = ccw(P, C)
    assert P2 == (-2, 3)
    p = Plano(-4, 4, -2, 4)
    p.segmento(C, P)
    p.segmento(C, P2)
    p.punto("C", *C, pos="nw")
    p.punto("P", *P, pos="e")
    p.punto("P'", *P2, pos="w")
    fig("FIG-ROT-CEN-04", p.svg("El punto P(2, 1) girado 90° en sentido antihorario alrededor de "
                                "C(−1, 0) llega a P'(−2, 3). Los segmentos punteados desde C miden lo "
                                "mismo y forman un ángulo recto."))

    # ---------------- SIM-CEN --------------------------------------------
    F = [(1, 2), (4, 2), (1, 4)]
    correcta = [media(q) for q in F]
    todas = {"F": F,
             "1": correcta,                             # correcta
             "2": [(x, -y) for x, y in F],              # EJE (reflejo en el eje x)
             "3": [ccw(q) for q in F],                  # ANGULO (90°)
             "4": [(x - 7, y - 8) for x, y in F]}       # SINGIRAR: al lado opuesto sin girar
    sin_vertices_comunes(todas)
    rel = lambda t: [(x - t[0][0], y - t[0][1]) for x, y in t]
    assert rel(todas["4"]) == rel(F) and rel(correcta) != rel(F)
    p = Plano(-7, 5, -7, 5, px=22, rotulos_x=[], rotulos_y=[])
    dibujar_candidatas(p, todas)
    fig("FIG-SIM-CEN-01", p.svg("Plano con cuadrícula, el triángulo F y cuatro triángulos numerados "
                                "del 1 al 4.", prohibido=("simétric", "correct")))

    p = Plano(-4, 5, -3, 5)
    p.punto("A", -2, 3, pos="nw")
    p.punto("C", 1, 1, pos="se")
    fig("FIG-SIM-CEN-02", p.svg("Plano cartesiano con el punto A y el punto C marcados.",
                                prohibido=("(4",)))

    C, P = (0, 1), (3, 3)
    P2 = media(P, C)
    assert P2 == (-3, -1)
    p = Plano(-4, 4, -2, 4)
    p.segmento(P, P2)
    p.punto("P", *P, pos="ne")
    p.punto("C", *C, pos="e")
    p.punto("P'", *P2, pos="sw")
    fig("FIG-SIM-CEN-03", p.svg("El punto P(3, 3), el centro C(0, 1) y el simétrico P'(−3, −1) están "
                                "en una misma recta, con C justo al medio entre P y P'."))

    print(f"{len(HECHAS)} figuras: " + ", ".join(sorted(HECHAS)))


if __name__ == "__main__":
    main()
