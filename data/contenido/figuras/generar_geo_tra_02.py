#!/usr/bin/env python3
"""
Figuras de GEO-PLA-VEC, GEO-PLA-VEC-OP y GEO-TRA-TRAS (clase
LES-GEO-TRA-02).

  .venv/bin/python data/contenido/figuras/generar_geo_tra_02.py

Ítems:
  FIG-PLA-VEC-01   vector u de (−1, 3) a (4, 1): componentes (5, −2)
  FIG-PLA-VEC-02   cuatro flechas a–d; solo a es (−3, 2)
  FIG-PLA-VEC-03   vector con escala 2: (8, −4)
  FIG-PLA-VEC-04   a y c iguales; b opuesto de a; d termina donde a
  FIG-PLA-VEC-05   vector horizontal (5, 0)
  FIG-PLA-VEC-06   u y v iguales en posiciones distintas
  FIG-VEC-OP-01    u = (2, 3) y v = (4, −1) separados
  FIG-VEC-OP-02    u = (3, −1) y v = (−1, 3) desde un mismo punto
  FIG-VEC-OP-03    u = (1, 3) y v = (4, 1) separados
  FIG-VEC-OP-04    A → B → C, u = AB, v = BC
  FIG-VEC-OP-05    u = (2, −1) y v = (−1, 3) desde un mismo punto
  FIG-VEC-OP-06    u = (4, 1) y v = (1, 3) separados
  FIG-TRA-TRAS-01  triángulo ABC y su imagen A'B'C' según (5, −2)
  FIG-TRA-TRAS-02  figura F y cuatro candidatas numeradas
  FIG-TRA-TRAS-03  cuadrilátero F y su imagen F' según (−4, 2)
  FIG-TRA-TRAS-04  triángulo e imagen con escala 2, vector (6, −4)
  FIG-TRA-TRAS-05  solo el punto P' (el ítem da el vector)
Clase:
  FIG-PLA-VEC-07   componentes de un vector (catetos punteados)
  FIG-PLA-VEC-08   tres flechas iguales en lugares distintos
  FIG-VEC-OP-07    suma poniendo un vector a continuación del otro
  FIG-VEC-OP-08    suma con el paralelogramo
  FIG-TRA-TRAS-06  traslación de un triángulo: el mismo vector en cada vértice
  FIG-TRA-TRAS-07  ida y vuelta: v y −v
"""

from fractions import Fraction as Fr

from plano_svg import Plano, guardar

HECHAS = {}


def fig(codigo, svg):
    HECHAS[codigo] = svg
    guardar(codigo, svg)


def comp(a, b):
    return (b[0] - a[0], b[1] - a[1])


def mas(p, v):
    return (p[0] + v[0], p[1] + v[1])


def main():
    # ---------------- VEC ------------------------------------------------
    A, B = (-1, 3), (4, 1)
    assert comp(A, B) == (5, -2)
    p = Plano(-3, 6, -2, 5)
    p.vector(A, B, "u", pos_nombre="n")
    fig("FIG-PLA-VEC-01", p.svg("Plano cartesiano con cuadrícula y un vector u dibujado como flecha.",
                                prohibido=("(5", "−2")))

    flechas = {"a": ((5, -3), (2, -1)), "b": ((-5, 3), (-2, 1)),
               "c": ((2, 4), (4, 1)), "d": ((-5, -4), (-2, -2))}
    comps = {k: comp(*v) for k, v in flechas.items()}
    assert comps == {"a": (-3, 2), "b": (3, -2), "c": (2, -3), "d": (3, 2)}
    p = Plano(-6, 6, -5, 5)
    p.vector(*flechas["a"], "a", pos_nombre="s")
    p.vector(*flechas["b"], "b", pos_nombre="n")
    p.vector(*flechas["c"], "c", pos_nombre="e")
    p.vector(*flechas["d"], "d", pos_nombre="n")
    fig("FIG-PLA-VEC-02", p.svg("Plano cartesiano con cuadrícula y cuatro vectores: a, b, c y d.",
                                prohibido=("(",)))

    A, B = (-4, 2), (4, -2)
    assert comp(A, B) == (8, -4) and (comp(A, B)[0] // 2, comp(A, B)[1] // 2) == (4, -2)
    p = Plano(-6, 6, -4, 4, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.vector(A, B, "w", pos_nombre="ne")
    fig("FIG-PLA-VEC-03", p.svg("Plano cartesiano con cuadrícula. En cada eje están rotulados solo el "
                                "2 y el 4. Hay un vector w dibujado como flecha.", prohibido=("8",)))

    flechas = {"a": ((-5, 2), (-2, 4)), "b": ((4, 4), (1, 2)),
               "c": ((1, -3), (4, -1)), "d": ((-6, 5), (-2, 4))}
    comps = {k: comp(*v) for k, v in flechas.items()}
    assert comps["a"] == comps["c"] == (3, 2)
    assert comps["b"] == (-3, -2)                       # opuesto de a: SINSIGNO los iguala
    assert flechas["d"][1] == flechas["a"][1]           # d termina donde a: PUNTO los iguala
    assert comps["d"] != comps["a"]
    p = Plano(-7, 5, -4, 6)
    p.vector(*flechas["a"], "a", pos_nombre="n")
    p.vector(*flechas["b"], "b", pos_nombre="n")
    p.vector(*flechas["c"], "c", pos_nombre="n")
    p.vector(*flechas["d"], "d", pos_nombre="n")
    fig("FIG-PLA-VEC-04", p.svg("Plano cartesiano con cuadrícula y cuatro vectores: a, b, c y d.",
                                prohibido=("iguales",)))

    A, B = (-4, 2), (1, 2)
    assert comp(A, B) == (5, 0)
    p = Plano(-5, 3, -1, 4)
    p.vector(A, B, "v", pos_nombre="n")
    fig("FIG-PLA-VEC-05", p.svg("Plano cartesiano con cuadrícula y un vector v horizontal.",
                                prohibido=("5",)))

    u, v = ((-3, -1), (0, 1)), ((1, 2), (4, 4))
    assert comp(*u) == comp(*v) == (3, 2)
    p = Plano(-4, 5, -2, 5)
    p.vector(*u, "u", pos_nombre="nw")
    p.vector(*v, "v", pos_nombre="nw")
    fig("FIG-PLA-VEC-06", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados en "
                                "lugares distintos.", prohibido=("igual", "(3")))

    # ---------------- VEC-OP ---------------------------------------------
    u, v = ((-5, -2), (-3, 1)), ((0, 2), (4, 1))
    assert comp(*u) == (2, 3) and comp(*v) == (4, -1)
    p = Plano(-6, 5, -3, 4)
    p.vector(*u, "u", pos_nombre="w")
    p.vector(*v, "v", pos_nombre="n")
    fig("FIG-VEC-OP-01", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por "
                               "separado.", prohibido=("(6",)))

    P = (2, -1)
    u, v = (P, mas(P, (3, -1))), (P, mas(P, (-1, 3)))
    p = Plano(-1, 6, -3, 3)
    p.vector(*u, "u", pos_nombre="s")
    p.vector(*v, "v", pos_nombre="w")
    fig("FIG-VEC-OP-02", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, que parten del "
                               "mismo punto.", prohibido=("(2",)))

    u, v = ((-4, 1), (-3, 4)), ((0, -2), (4, -1))
    assert comp(*u) == (1, 3) and comp(*v) == (4, 1)
    p = Plano(-5, 5, -3, 5)
    p.vector(*u, "u", pos_nombre="w")
    p.vector(*v, "v", pos_nombre="s")
    fig("FIG-VEC-OP-03", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por "
                               "separado.", prohibido=("(−3",)))

    A, B, C = (-4, -1), (-1, 2), (3, 0)
    assert comp(A, B) == (3, 3) and comp(B, C) == (4, -2) and comp(A, C) == (7, 1)
    p = Plano(-5, 4, -2, 3)
    p.vector(A, B, "u", pos_nombre="nw")
    p.vector(B, C, "v", pos_nombre="n")
    p.punto("A", *A, pos="sw", marca=False)
    p.punto("B", *B, pos="n", marca=False)
    p.punto("C", *C, pos="se", marca=False)
    fig("FIG-VEC-OP-04", p.svg("Plano cartesiano con cuadrícula. El vector u va del punto A al punto B, "
                               "y el vector v va de B al punto C.", prohibido=("(7",)))

    Q = (1, -1)
    u, v = (Q, mas(Q, (2, -1))), (Q, mas(Q, (-1, 3)))
    p = Plano(-2, 4, -3, 3)
    p.vector(*u, "u", pos_nombre="s")
    p.vector(*v, "v", pos_nombre="w")
    fig("FIG-VEC-OP-05", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, que parten del "
                               "mismo punto.", prohibido=("(−3",)))

    u, v = ((-5, 2), (-1, 3)), ((1, -3), (2, 0))
    assert comp(*u) == (4, 1) and comp(*v) == (1, 3)
    p = Plano(-6, 4, -4, 4)
    p.vector(*u, "u", pos_nombre="n")
    p.vector(*v, "v", pos_nombre="e")
    fig("FIG-VEC-OP-06", p.svg("Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por "
                               "separado.", prohibido=("(−3",)))

    # ---------------- TRAS -----------------------------------------------
    T = [("A", -4, 1), ("B", -2, 1), ("C", -4, 3)]
    vt = (5, -2)
    T2 = [(n + "'", x + vt[0], y + vt[1]) for n, x, y in T]
    p = Plano(-5, 5, -3, 4)
    p.poligono(T, pos={"A": "sw", "B": "se", "C": "nw"})
    p.poligono(T2, pos={"A'": "sw", "B'": "se", "C'": "nw"})
    fig("FIG-TRA-TRAS-01", p.svg("Plano cartesiano con el triángulo ABC y su imagen A'B'C' por una "
                                 "traslación.", prohibido=("(5",)))

    F = [(-3, 3), (-1, 3), (-3, 5)]
    tr = lambda fig_, w: [mas(q, w) for q in fig_]
    c1 = tr(F, (4, -2))                                   # correcta
    c3 = tr(F, (-4, 2))                                   # SENTIDO
    c4 = tr(F, (4, 2))                                    # SINSIGNO del vector
    # FORMA: la misma figura girada en 180°, en una zona libre del plano
    c2 = [(6 - (x - F[0][0]), 3 - (y - F[0][1])) for x, y in F]
    assert sorted(abs(a - b) for a, b in zip(c2[0], c2[1])) == [0, 2]
    todas = {"F": F, "1": c1, "2": c2, "3": c3, "4": c4}
    celdas = [set(v) for v in todas.values()]
    for i in range(len(celdas)):
        for j in range(i + 1, len(celdas)):
            assert not (celdas[i] & celdas[j]), "dos figuras comparten un vértice"
    p = Plano(-8, 7, -1, 8, rotulos_x=[], rotulos_y=[])
    for nombre, pts in todas.items():
        p.poligono([("", x, y) for x, y in pts], marcas=False)
        cx = Fr(sum(x for x, _ in pts), 3)
        cy = Fr(sum(y for _, y in pts), 3)
        p.texto(cx - Fr(1, 3), cy - Fr(1, 3), nombre, size=13, italic=(nombre == "F"))
    fig("FIG-TRA-TRAS-02", p.svg("Plano cartesiano con la figura F y cuatro figuras numeradas del 1 "
                                 "al 4.", prohibido=("girada", "correcta")))

    F = [(2, -4), (4, -4), (5, -2), (3, -2)]
    vt = (-6, 5)
    F2 = [mas(q, vt) for q in F]
    assert F2 == [(-4, 1), (-2, 1), (-1, 3), (-3, 3)]
    p = Plano(-5, 6, -5, 4)
    p.poligono([("", x, y) for x, y in F], marcas=False)
    p.poligono([("", x, y) for x, y in F2], marcas=False)
    p.texto(Fr(7, 2), Fr(-3), "F", italic=True)
    p.texto(Fr(-5, 2), Fr(2), "F'", italic=True)
    fig("FIG-TRA-TRAS-03", p.svg("Plano cartesiano con el cuadrilátero F y el cuadrilátero F', que es "
                                 "su imagen por una traslación.", prohibido=("(−6",)))

    T = [("A", -8, 2), ("B", -4, 2), ("C", -8, 6)]
    vt = (10, -4)
    T2 = [(n + "'", x + vt[0], y + vt[1]) for n, x, y in T]
    assert (vt[0] // 2, vt[1] // 2) == (5, -2)
    p = Plano(-10, 8, -4, 8, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.poligono(T, pos={"A": "sw", "B": "se", "C": "nw"})
    p.poligono(T2, pos={"A'": "sw", "B'": "se", "C'": "nw"})
    fig("FIG-TRA-TRAS-04", p.svg("Plano cartesiano con cuadrícula. En cada eje están rotulados solo el "
                                 "2 y el 4. Están el triángulo ABC y su imagen A'B'C' por una traslación.",
                                 prohibido=("(10",)))

    p = Plano(-4, 3, -1, 5)
    p.punto("P'", -1, 4, pos="nw")
    fig("FIG-TRA-TRAS-05", p.svg("Plano cartesiano con cuadrícula y el punto P' marcado.",
                                 prohibido=("(−1",)))

    # ---------------- clase --------------------------------------------------
    A, B = (-2, -1), (3, 2)
    p = Plano(-3, 4, -2, 3)
    p.vector(A, B, "v", pos_nombre="nw")
    p.segmento(A, (B[0], A[1]))
    p.segmento((B[0], A[1]), B)
    p.punto("A", *A, pos="sw")
    p.punto("B", *B, pos="ne")
    p.texto(Fr(1, 2), Fr(-3, 2), "5 a la derecha", size=11)
    p.texto(Fr(4), Fr(1, 2), "3", size=12)
    fig("FIG-PLA-VEC-07", p.svg("El vector v va del punto A al punto B. Punteado, el camino "
                                "horizontal de 5 unidades a la derecha y el vertical de 3 hacia "
                                "arriba: v = (5, 3)."))

    p = Plano(-5, 5, -3, 4)
    for (x, y), n in [((-4, -2), "p"), ((0, 1), "q"), ((1, -2), "r")]:
        p.vector((x, y), (x + 3, y - 1), n, pos_nombre="n")
    fig("FIG-PLA-VEC-08", p.svg("Tres flechas p, q y r que parten de puntos distintos, todas 3 "
                                "unidades a la derecha y 1 hacia abajo: representan el mismo "
                                "vector (3, −1)."))

    A = (-4, 1)
    u, v = (1, 3), (4, -1)
    B = mas(A, u)
    C = mas(B, v)
    p = Plano(-5, 3, -1, 5)
    p.vector(A, B, "u", pos_nombre="w")
    p.vector(B, C, "v", pos_nombre="n")
    p.vector(A, C, "u + v", pos_nombre="s", clase="suma")
    fig("FIG-VEC-OP-07", p.svg("El vector v se dibuja a continuación de u. El vector u + v va desde el "
                               "inicio de u hasta el final de v: u = (1, 3), v = (4, −1), "
                               "u + v = (5, 2)."))

    O = (2, 1)
    u, v = (5, 1), (1, 3)
    p = Plano(-1, 9, -1, 6)
    p.vector(O, mas(O, u), "u", pos_nombre="s")
    p.vector(O, mas(O, v), "v", pos_nombre="w")
    p.segmento(mas(O, u), mas(O, (6, 4)))
    p.segmento(mas(O, v), mas(O, (6, 4)))
    p.vector(O, mas(O, (6, 4)), "u + v", pos_nombre="se", clase="suma")
    fig("FIG-VEC-OP-08", p.svg("Los vectores u y v parten del mismo punto. Con copias punteadas se "
                               "completa un paralelogramo; su diagonal desde el punto común es "
                               "u + v."))

    T = [("A", -4, -1), ("B", -2, -1), ("C", -2, 1)]
    vt = (5, 2)
    T2 = [(n + "'", x + vt[0], y + vt[1]) for n, x, y in T]
    p = Plano(-5, 4, -2, 4)
    p.poligono(T, pos={"A": "sw", "B": "s", "C": "nw"})
    p.poligono(T2, pos={"A'": "s", "B'": "se", "C'": "n"})
    for (_, x, y), (_, x2, y2) in zip(T, T2):
        p.segmento((x, y), (x2, y2))
    fig("FIG-TRA-TRAS-06", p.svg("El triángulo ABC se traslada según el vector (5, 2). Cada vértice se "
                                 "mueve 5 a la derecha y 2 hacia arriba: los segmentos punteados que "
                                 "unen cada vértice con su imagen son iguales y paralelos."))

    P, v = (-3, 1), (4, 2)
    P2 = mas(P, v)
    p = Plano(-4, 3, -1, 4)
    p.vector(P, P2, "v", pos_nombre="nw")
    p.punto("P", *P, pos="sw")
    p.punto("P'", *P2, pos="ne")
    fig("FIG-TRA-TRAS-07", p.svg("El punto P se traslada según v = (4, 2) y llega a P'. Para volver de "
                                 "P' a P se usa el vector opuesto, (−4, −2)."))

    print(f"{len(HECHAS)} figuras: " + ", ".join(sorted(HECHAS)))


if __name__ == "__main__":
    main()
