#!/usr/bin/env python3
"""
Figuras de GEO-TRA-REF-EJE y GEO-TRA-REF-REC (clase LES-GEO-TRA-03).

  .venv/bin/python data/contenido/figuras/generar_geo_tra_03.py

Ítems:
  FIG-REF-EJE-01  triángulo F y cuatro candidatas (reflejo en el eje y)
  FIG-REF-EJE-02  punto A(−3, 4)
  FIG-REF-EJE-03  triángulo T y su reflejo T' respecto del eje y
  FIG-REF-REC-01  punto A(2, 3) y la recta x = −1
  FIG-REF-REC-02  triángulo ABC y la recta y = −1
  FIG-REF-REC-03  triángulo y su reflejo respecto de x = 1 (sin dibujar la recta)
Clase:
  FIG-REF-EJE-04  P y su reflejo respecto del eje x: misma distancia al eje
  FIG-REF-EJE-05  una bandera y su reflejo: la orientación se invierte
  FIG-REF-REC-04  reflejo respecto de x = 2: misma distancia a cada lado
  FIG-REF-REC-05  reflejo respecto de y = x: las coordenadas se intercambian
"""

from fractions import Fraction as Fr

from plano_svg import Plano, guardar

HECHAS = {}


def fig(codigo, svg):
    HECHAS[codigo] = svg
    guardar(codigo, svg)


def centro(pts):
    return (Fr(sum(x for x, _ in pts), len(pts)), Fr(sum(y for _, y in pts), len(pts)))


def sin_choques(figs):
    vs = [set(v) for v in figs.values()]
    for i in range(len(vs)):
        for j in range(i + 1, len(vs)):
            assert not (vs[i] & vs[j]), "dos figuras comparten un vértice"


def main():
    # 01 — F y candidatas. Reflejo en el eje y: (x, y) -> (−x, y).
    F = [(-5, 1), (-2, 1), (-5, 3)]
    c1 = [(-x, y) for x, y in F]                        # correcta
    c2 = [(x + 7, y + 3) for x, y in F]                 # TRASLADA: al otro lado, sin dar vuelta
    c3 = [(x, -y) for x, y in F]                        # CAMBIAEJE: reflejo en el eje x
    c4 = [(-x, -y) for x, y in F]                       # AMBOS: cambia los dos signos
    todas = {"F": F, "1": c1, "2": c2, "3": c3, "4": c4}
    sin_choques(todas)
    rel = lambda t: [(x - t[0][0], y - t[0][1]) for x, y in t]
    assert rel(c2) == rel(F)                            # 2 conserva la orientación
    assert rel(c1) != rel(F)                            # 1 está dada vuelta
    p = Plano(-6, 6, -4, 7, rotulos_x=[], rotulos_y=[])
    for nombre, pts in todas.items():
        p.poligono([("", x, y) for x, y in pts], marcas=False)
        cx, cy = centro(pts)
        p.texto(cx - Fr(1, 3), cy - Fr(1, 3), nombre, size=13, italic=(nombre == "F"))
    fig("FIG-REF-EJE-01", p.svg("Plano con cuadrícula, el triángulo F y cuatro triángulos numerados del "
                                "1 al 4.", prohibido=("reflejo", "correct")))

    # 02 — A(−3, 4)
    p = Plano(-5, 5, -5, 5)
    p.punto("A", -3, 4, pos="ne")
    fig("FIG-REF-EJE-02", p.svg("Plano cartesiano con cuadrícula de una unidad y el punto A.",
                                prohibido=("−3", "(")))

    # 03 — triángulo T y su reflejo en el eje y
    T = [(-5, -2), (-2, -2), (-2, 3)]
    T2 = [(-x, y) for x, y in T]
    p = Plano(-6, 6, -3, 4)
    p.poligono([("", x, y) for x, y in T], marcas=False)
    p.poligono([("", x, y) for x, y in T2], marcas=False)
    p.texto(Fr(-3), Fr(-3, 2), "T", italic=True)
    p.texto(Fr(3), Fr(-3, 2), "T'", italic=True)
    fig("FIG-REF-EJE-03", p.svg("Plano cartesiano con el triángulo T y su imagen T' por una reflexión.",
                                prohibido=("eje y",)))

    # 04 (clase) — P(1, 4) y P'(1, −4) respecto del eje x
    p = Plano(-3, 4, -5, 5)
    p.segmento((1, 4), (1, -4))
    p.punto("P", 1, 4, pos="e")
    p.punto("P'", 1, -4, pos="e")
    p.texto(Fr(3, 2), Fr(2), "4", size=12)
    p.texto(Fr(3, 2), Fr(-2), "4", size=12)
    fig("FIG-REF-EJE-04", p.svg("El punto P(1, 4) y su reflejo P'(1, −4) respecto del eje x: los dos "
                                "están a 4 unidades del eje, uno arriba y otro abajo, en la misma "
                                "vertical."))

    # 05 (clase) — bandera y su reflejo en el eje y
    B = [(-4, 0), (-4, 4), (-1, 3), (-4, 2)]
    B2 = [(-x, y) for x, y in B]
    p = Plano(-5, 5, -1, 5, rotulos_x=[], rotulos_y=[])
    p.poligono([("", x, y) for x, y in B], marcas=False)
    p.poligono([("", x, y) for x, y in B2], marcas=False)
    fig("FIG-REF-EJE-05", p.svg("Una bandera que apunta a la derecha y su reflejo respecto del eje y, "
                                "que apunta a la izquierda: la reflexión invierte la orientación."))

    # --- REF-REC ---------------------------------------------------------------
    # 01 — A(2, 3), recta x = −1; imagen (−4, 3)
    p = Plano(-5, 4, -1, 5)
    p.recta_vertical(-1, "x = −1", lado=-1)
    p.punto("A", 2, 3, pos="ne")
    fig("FIG-REF-REC-01", p.svg("Plano cartesiano con la recta vertical x = −1 punteada y el punto A.",
                                prohibido=("(2", "−4")))

    # 02 — triángulo A(1, 1), B(3, 1), C(1, 3) y la recta y = −1
    p = Plano(-3, 5, -6, 4)
    p.recta_horizontal(-1, "y = −1", arriba=False)
    p.poligono([("A", 1, 1), ("B", 3, 1), ("C", 1, 3)], pos={"A": "sw", "B": "e", "C": "ne"})
    fig("FIG-REF-REC-02", p.svg("Plano cartesiano con la recta horizontal y = −1 punteada y el "
                                "triángulo ABC.", prohibido=("−5",)))

    # 03 — triángulo y su reflejo respecto de x = 1 (la recta no se dibuja)
    T = [("A", -3, 2), ("B", -1, 2), ("C", -3, 4)]
    T2 = [(n + "'", 2 * 1 - x, y) for n, x, y in T]
    assert T2[0][1:] == (5, 2)
    p = Plano(-4, 6, -1, 5)
    p.poligono(T, pos={"A": "sw", "B": "s", "C": "nw"})
    p.poligono(T2, pos={"A'": "se", "B'": "s", "C'": "ne"})
    fig("FIG-REF-REC-03", p.svg("Plano cartesiano con el triángulo ABC y su imagen A'B'C' por una "
                                "reflexión.", prohibido=("x = 1",)))

    # 04 (clase) — P(0, 4) sobre x = −2: P'(−4, 4)
    p = Plano(-5, 2, -1, 5)
    p.recta_vertical(-2, "x = −2", lado=-1)
    p.segmento((0, 4), (-4, 4))
    p.punto("P", 0, 4, pos="ne")
    p.punto("P'", -4, 4, pos="n")
    p.texto(Fr(-1), Fr(9, 2), "2", size=12)
    p.texto(Fr(-3), Fr(9, 2), "2", size=12)
    fig("FIG-REF-REC-04", p.svg("La recta x = −2 y el punto P(0, 4), que está 2 unidades a su "
                                "derecha. Su reflejo P'(−4, 4) está 2 unidades a la izquierda de la "
                                "recta."))

    # 05 (clase) — Q(4, 1) sobre y = x: Q'(1, 4)
    p = Plano(-1, 5, -1, 5)
    p.recta_diagonal(1, "y = x")
    p.segmento((4, 1), (1, 4))
    p.punto("Q", 4, 1, pos="e")
    p.punto("Q'", 1, 4, pos="n")
    fig("FIG-REF-REC-05", p.svg("La recta y = x y el punto Q(4, 1). Su reflejo es Q'(1, 4): las "
                                "coordenadas se intercambian."))

    print(f"{len(HECHAS)} figuras: " + ", ".join(sorted(HECHAS)))


if __name__ == "__main__":
    main()
