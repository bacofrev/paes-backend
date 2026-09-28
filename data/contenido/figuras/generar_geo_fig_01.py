#!/usr/bin/env python3
"""
Figuras de GEO-FIG-CLAS, GEO-FIG-ELEM y GEO-PER-POL (clase LES-GEO-FIG-01).

  .venv/bin/python data/contenido/figuras/generar_geo_fig_01.py

Cada figura verifica sus condiciones geométricas (perpendicularidad, lados
iguales, paralelismo, puntos medios, que un pie de altura caiga dentro o
fuera del lado según corresponda) antes de escribir el SVG, y que el
aria-label no diga lo que el ítem pregunta.
"""

import math

from figura_svg import (Figura, add, cross, dist, dot, fuera_de, guardar, medio, mul, norm,
                        paralelos, perpendicular, pie_perpendicular, regular, rotar, sub)

HECHAS = {}


def fig(codigo, svg):
    HECHAS[codigo] = svg
    guardar(codigo, svg)


def lados(pol):
    return [(pol[i], pol[(i + 1) % len(pol)]) for i in range(len(pol))]


def iguales(*ls):
    return all(abs(l - ls[0]) < 1e-7 for l in ls)


def vertices(f, pol, nombres, d=0.34):
    for p, n in zip(pol, nombres):
        if n:
            f.vertice(p, n, fuera_de(pol, p), d)


def clas():
    # 01 — cuadrado apoyado en un vértice
    Q = regular(4, 1.6, ang0=90)
    assert iguales(*[dist(a, b) for a, b in lados(Q)])
    assert perpendicular(sub(Q[1], Q[0]), sub(Q[3], Q[0]))
    f = Figura(-2.2, 2.2, -2.2, 2.2)
    f.poligono(Q)
    for a, b in lados(Q):
        f.marca_igual(a, b)
    f.angulo_recto(Q[0], Q[1], Q[3])
    fig("FIG-FIG-CLAS-01", f.svg("Un cuadrilátero apoyado sobre uno de sus vértices, con sus cuatro "
                                 "lados marcados como iguales y un ángulo recto marcado.",
                                 prohibido=("cuadrado", "rombo")))

    # 02 — rectángulo
    R = [(0, 0), (5, 0), (5, 3), (0, 3)]
    f = Figura(-0.6, 5.6, -0.6, 3.6)
    f.poligono(R)
    for i in range(4):
        f.angulo_recto(R[i], R[(i + 1) % 4], R[i - 1])
    f.marca_igual(R[0], R[1], 1); f.marca_igual(R[3], R[2], 1)
    f.marca_igual(R[1], R[2], 2); f.marca_igual(R[0], R[3], 2)
    fig("FIG-FIG-CLAS-02", f.svg("Un cuadrilátero con sus cuatro ángulos rectos marcados; sus lados "
                                 "opuestos están marcados como iguales.", prohibido=("rectángulo",)))

    # 03 — triángulo rectángulo isósceles con el ángulo recto arriba, girado
    T = [rotar(p, 15) for p in [(0, 2), (-2, 0), (2, 0)]]
    assert perpendicular(sub(T[1], T[0]), sub(T[2], T[0]))
    assert iguales(dist(T[0], T[1]), dist(T[0], T[2]))
    f = Figura(-2.6, 2.6, -0.6, 2.8)
    f.poligono(T)
    f.angulo_recto(T[0], T[1], T[2])
    f.marca_igual(T[0], T[1]); f.marca_igual(T[0], T[2])
    fig("FIG-FIG-CLAS-03", f.svg("Un triángulo con un ángulo recto marcado en su vértice superior y los "
                                 "dos lados que forman ese ángulo marcados como iguales.",
                                 prohibido=("isósceles", "rectángulo")))

    # 04 — cuatro cuadriláteros A–D; solo C es trapecio (un par de lados paralelos)
    A = [(0, 0), (2.6, 0), (3.4, 1.6), (0.8, 1.6)]                 # paralelogramo
    B = [(4.4, 0), (7, 0), (6.6, 1.9), (4.8, 1.2)]                 # cuadrilátero cualquiera, base horizontal
    C0 = [(0, 0), (2.8, 0), (2.1, 1.4), (0.7, 1.4)]
    C = [add(rotar(p, 35), (8.9, -0.3)) for p in C0]              # trapecio girado
    D = [(12.2, 0.2), (14.6, -0.1), (14.2, 1.9), (12.8, 1.3)]      # trapezoide
    par = lambda P: [paralelos(sub(P[1], P[0]), sub(P[2], P[3])), paralelos(sub(P[2], P[1]), sub(P[3], P[0]))]
    assert par(A) == [True, True] and par(C) == [True, False]
    assert par(B) == [False, False] and par(D) == [False, False]
    assert B[0][1] == B[1][1]
    assert not paralelos(sub(C[1], C[0]), (1, 0))
    f = Figura(-0.4, 15, -0.9, 2.9, escala=34)
    for P, n in ((A, "A"), (B, "B"), (C, "C"), (D, "D")):
        f.poligono(P)
        cx = sum(x for x, _ in P) / 4
        f.rotulo((cx, -0.65), n, size=14, que="nombre")
    fig("FIG-FIG-CLAS-04", f.svg("Cuatro cuadriláteros rotulados A, B, C y D.",
                                 prohibido=("trapecio", "paralel")))

    # 05 — isósceles obtusángulo (120°), girado
    V = (0, 0)
    B1 = (2 * math.cos(math.radians(210)), 2 * math.sin(math.radians(210)))
    B2 = (2 * math.cos(math.radians(330)), 2 * math.sin(math.radians(330)))
    T = [rotar(p, 35) for p in (V, B1, B2)]
    ang = math.degrees(math.acos(dot(norm(sub(T[1], T[0])), norm(sub(T[2], T[0])))))
    assert abs(ang - 120) < 1e-7 and iguales(dist(T[0], T[1]), dist(T[0], T[2]))
    xs, ys = [p[0] for p in T], [p[1] for p in T]
    f = Figura(min(xs) - 0.6, max(xs) + 0.6, min(ys) - 0.6, max(ys) + 0.6, escala=60)
    f.poligono(T)
    f.marca_igual(T[0], T[1]); f.marca_igual(T[0], T[2])
    f.arco(T[0], T[2], T[1], r=0.35) if cross(sub(T[2], T[0]), sub(T[1], T[0])) > 0 else f.arco(T[0], T[1], T[2], r=0.35)
    bis = norm(add(norm(sub(T[1], T[0])), norm(sub(T[2], T[0]))))
    f.rotulo(add(T[0], mul(bis, 0.72)), "120°", size=12, que="ángulo")
    fig("FIG-FIG-CLAS-05", f.svg("Un triángulo con dos lados marcados como iguales y el ángulo entre "
                                 "ellos marcado de 120°, dibujado inclinado.",
                                 prohibido=("isósceles", "obtus")))

    # 06 — A hexágono regular girado; B rombo que no es cuadrado; C isósceles de pie;
    #      D hexágono irregular "derecho"
    A = [add(p, (1.5, 1.4)) for p in regular(6, 1.2, ang0=15)]
    B0 = [(0, 0), (1.8, 0), (2.88, 1.44), (1.08, 1.44)]
    B = [add(p, (3.4, 0.5)) for p in B0]
    C = [(7.4, 0.3), (9.2, 0.3), (8.3, 2.6)]
    D = [(10.0, 1.4), (10.6, 0.3), (11.9, 0.4), (12.4, 1.5), (11.7, 2.6), (10.5, 2.5)]
    assert iguales(*[dist(a, b) for a, b in lados(A)])
    assert iguales(*[dist(a, b) for a, b in lados(B)]) and not perpendicular(sub(B[1], B[0]), sub(B[3], B[0]))
    assert iguales(dist(C[0], C[2]), dist(C[1], C[2])) and not iguales(dist(C[0], C[1]), dist(C[0], C[2]))
    assert not iguales(*[dist(a, b) for a, b in lados(D)])
    f = Figura(0, 12.8, -0.8, 2.9, escala=36)
    for P, n in ((A, "A"), (B, "B"), (C, "C"), (D, "D")):
        f.poligono(P)
        if P is B:
            for a, b in lados(P):
                f.marca_igual(a, b)
        if P is A:
            for a, b in lados(P):
                f.marca_igual(a, b, largo=0.12)
        if P is C:
            f.marca_igual(C[0], C[2]); f.marca_igual(C[1], C[2])
        cx = sum(x for x, _ in P) / len(P)
        f.rotulo((cx, -0.5), n, size=14, que="nombre")
    fig("FIG-FIG-CLAS-06", f.svg("Cuatro polígonos rotulados A, B, C y D; las marcas indican los lados "
                                 "iguales.", prohibido=("regular",)))

    # 07 (clase) — familia de los cuadriláteros
    f = Figura(0, 12, 0, 6.2, escala=40)
    nodos = {"Cuadriláteros": (6, 5.6), "Trapezoides": (1.6, 3.9), "Trapecios": (4.6, 3.9),
             "Paralelogramos": (8.9, 3.9), "Romboides": (6.2, 2.2), "Rectángulos": (8.9, 2.2),
             "Rombos": (11.2, 2.2), "Cuadrados": (10.0, 0.5)}
    aristas = [("Cuadriláteros", "Trapezoides"), ("Cuadriláteros", "Trapecios"),
               ("Cuadriláteros", "Paralelogramos"), ("Paralelogramos", "Romboides"),
               ("Paralelogramos", "Rectángulos"), ("Paralelogramos", "Rombos"),
               ("Rectángulos", "Cuadrados"), ("Rombos", "Cuadrados")]
    for a, b in aristas:
        pa, pb = nodos[a], nodos[b]
        f.segmento((pa[0], pa[1] - 0.25), (pb[0], pb[1] + 0.25), w=1.1)
    for n, p in nodos.items():
        f.rotulo(p, n, size=12, que="nodo")
    fig("FIG-FIG-CLAS-07", f.svg("Esquema: los cuadriláteros se dividen en trapezoides (ningún par de "
                                 "lados paralelos), trapecios (un par) y paralelogramos (dos pares). "
                                 "Los paralelogramos incluyen romboides, rectángulos y rombos. El "
                                 "cuadrado es a la vez rectángulo y rombo."))


def elem():
    # 01 — base AB inclinada; desde C: altura CD, vertical CV, mediana CM
    A, B, C = (0, 0), (6, 2), (4.5, 5)
    D, tD = pie_perpendicular(C, A, B)
    V = (C[0], C[0] / 3)
    M = medio(A, B)
    assert perpendicular(sub(C, D), sub(B, A)) and 0 < tD < 1
    assert abs(cross(sub(V, A), sub(B, A))) < 1e-9 and V[0] == C[0]
    assert min(dist(D, V), dist(D, M), dist(V, M)) > 0.5
    f = Figura(-0.6, 6.6, -0.6, 5.6)
    f.poligono([A, B, C])
    for P in (D, V, M):
        f.segmento(C, P, w=1.2)
    f.angulo_recto(D, C, B, t=0.22)
    vertices(f, [A, B, C], ["A", "B", "C"])
    f.rotulo(add(D, (0.12, -0.35)), "D", size=13)
    f.rotulo(add(V, (0.0, -0.4)), "V", size=13)
    f.rotulo(add(M, (0.15, -0.38)), "M", size=13)
    fig("FIG-FIG-ELEM-01", f.svg("Triángulo ABC con el lado AB inclinado. Desde C salen tres segmentos "
                                 "hasta el lado AB: CD, CV y CM. En D hay un ángulo recto marcado.",
                                 prohibido=("altura", "vertical", "medio")))

    # 02 — pentágono regular de centro O: radio OA y apotema OM
    P = regular(5, 2, ang0=90)
    O = (0, 0)
    A, B = P[0], P[1]
    M = medio(A, B)
    assert perpendicular(sub(M, O), sub(B, A))
    f = Figura(-2.6, 2.6, -2.3, 2.6, escala=55)
    f.poligono(P)
    f.segmento(O, A, w=1.2); f.segmento(O, M, w=1.2)
    f.angulo_recto(M, O, B, t=0.18)
    f.punto(O)
    f.vertice(A, "A", sub(A, O)); f.vertice(B, "B", sub(B, O))
    f.rotulo(add(M, mul(norm(sub(M, O)), 0.3)), "M", size=13)
    f.rotulo(add(O, (0.25, -0.2)), "O", size=13)
    fig("FIG-FIG-ELEM-02", f.svg("Pentágono regular de centro O. Están dibujados el segmento OA, hasta "
                                 "un vértice, y el segmento OM, hasta el punto M del lado AB, con un "
                                 "ángulo recto en M.", prohibido=("apotema", "radio")))

    # 03 — triángulo rectángulo en C, girado; desde A: vertical AV y mediana AM a BC
    C0, A0, B0 = (0, 0), (0, 3), (4, 0)
    C, A, B = (rotar(p, -25) for p in (C0, A0, B0))
    assert perpendicular(sub(A, C), sub(B, C))
    # V: punto de BC en la vertical de A
    t = (A[0] - B[0]) / (C[0] - B[0])
    V = add(B, mul(sub(C, B), t))
    assert 0 < t < 1 and abs(V[0] - A[0]) < 1e-9
    M = medio(B, C)
    assert dist(V, M) > 0.4 and dist(V, C) > 0.4
    xs, ys = [p[0] for p in (A, B, C)], [p[1] for p in (A, B, C)]
    f = Figura(min(xs) - 0.6, max(xs) + 0.6, min(ys) - 0.6, max(ys) + 0.6, escala=50)
    f.poligono([A, B, C])
    f.segmento(A, V, w=1.2); f.segmento(A, M, w=1.2)
    f.angulo_recto(C, A, B, t=0.25)
    vertices(f, [A, B, C], ["A", "B", "C"])
    f.rotulo(add(V, mul(norm(sub(V, A)), 0.32)), "V", size=13)
    f.rotulo(add(M, mul(norm(sub(M, A)), 0.32)), "M", size=13)
    fig("FIG-FIG-ELEM-03", f.svg("Triángulo ABC con un ángulo recto marcado en C, dibujado inclinado. "
                                 "Desde A salen los segmentos AV y AM hasta el lado BC.",
                                 prohibido=("vertical", "medio", "altura")))

    # 04 — trapecio girado; desde D: altura DH, vertical DV, mediana DM a AB
    T0 = [(0, 0), (5, 0), (4, 2.4), (1.4, 2.4)]
    A, B, Cc, D = (rotar(p, 20) for p in T0)
    assert paralelos(sub(B, A), sub(Cc, D)) and not paralelos(sub(D, A), sub(Cc, B))
    H, tH = pie_perpendicular(D, A, B)
    t = (D[0] - A[0]) / (B[0] - A[0])
    V = add(A, mul(sub(B, A), t))
    M = medio(A, B)
    assert perpendicular(sub(D, H), sub(B, A)) and 0 < tH < 1 and 0 < t < 1
    assert min(dist(H, V), dist(H, M), dist(V, M), dist(H, A)) > 0.4
    pts = [A, B, Cc, D]
    xs, ys = [p[0] for p in pts], [p[1] for p in pts]
    f = Figura(min(xs) - 0.6, max(xs) + 0.6, min(ys) - 0.7, max(ys) + 0.6, escala=50)
    f.poligono(pts)
    for P in (H, V, M):
        f.segmento(D, P, w=1.2)
    f.angulo_recto(H, D, B, t=0.2)
    vertices(f, pts, ["A", "B", "C", "D"])
    for P, n in ((H, "H"), (V, "V"), (M, "M")):
        f.rotulo(add(P, mul(norm(sub(P, D)), 0.34)), n, size=13)
    fig("FIG-FIG-ELEM-04", f.svg("Trapecio ABCD, dibujado inclinado, con los lados AB y DC paralelos. "
                                 "Desde D salen los segmentos DH, DV y DM hasta el lado AB; en H hay un "
                                 "ángulo recto marcado.", prohibido=("altura", "vertical", "medio")))

    # 05 — obtusángulo en B, BC horizontal; altura desde A cae fuera (en la prolongación)
    B, C, A = (2, 0), (7, 0), (0, 3)
    H = (0, 0)
    assert dot(sub(A, B), sub(C, B)) < 0                      # obtuso en B
    assert perpendicular(sub(A, H), sub(C, B)) and H[0] < B[0]  # pie fuera del lado BC
    M = medio(B, C)
    K = (3.4, 0)
    assert B[0] < K[0] < C[0] and abs(K[0] - M[0]) > 0.5
    f = Figura(-0.7, 7.6, -0.8, 3.6)
    f.poligono([A, B, C])
    f.segmento(H, B, punteado=True, w=1.1)
    f.segmento(A, H, w=1.2); f.segmento(A, M, w=1.2); f.segmento(A, K, w=1.2)
    f.angulo_recto(H, A, C, t=0.22)
    vertices(f, [A, B, C], ["A", "B", "C"])
    f.rotulo((H[0] - 0.3, H[1] - 0.3), "H", size=13)
    f.rotulo((K[0], -0.4), "K", size=13)
    f.rotulo((M[0], -0.4), "M", size=13)
    fig("FIG-FIG-ELEM-05", f.svg("Triángulo ABC con el ángulo en B mayor que un ángulo recto. El lado BC "
                                 "se prolonga con una línea punteada hasta H. Desde A salen los segmentos "
                                 "AH, AK y AM; en H hay un ángulo recto marcado.",
                                 prohibido=("altura", "medio")))

    # 06 — BC vertical; altura AH horizontal; mediana AM
    B, C, A = (4, 0), (4, 5), (0, 2)
    H = (4, 2)
    M = medio(B, C)
    assert perpendicular(sub(A, H), sub(C, B)) and dist(H, M) > 0.4
    f = Figura(-0.6, 4.8, -0.6, 5.6)
    f.poligono([A, B, C])
    f.segmento(A, H, w=1.2); f.segmento(A, M, w=1.2)
    f.angulo_recto(H, A, C, t=0.22)
    vertices(f, [A, B, C], ["A", "B", "C"])
    f.rotulo((4.35, 2), "H", size=13)
    f.rotulo((4.35, 2.55), "M", size=13)
    fig("FIG-FIG-ELEM-06", f.svg("Triángulo ABC con el lado BC vertical. Desde A salen el segmento AH, "
                                 "horizontal, con un ángulo recto marcado en H, y el segmento AM.",
                                 prohibido=("altura", "medio")))

    # 07 — hexágono regular de centro O, vértice A
    P = regular(6, 2, ang0=90)
    O = (0, 0)
    f = Figura(-2.5, 2.5, -2.5, 2.6, escala=50)
    f.poligono(P)
    f.segmento(O, P[0], w=1.2)
    f.punto(O)
    f.vertice(P[0], "A", sub(P[0], O))
    f.rotulo((0.3, -0.25), "O", size=13)
    fig("FIG-FIG-ELEM-07", f.svg("Hexágono regular de centro O, con el segmento OA dibujado hasta el "
                                 "vértice A.", prohibido=("radio", "apotema")))

    # 08 — cuadrado girado 30°, centro O, M punto medio de AB
    Q = [rotar(p, 30) for p in [(-1.5, -1.5), (1.5, -1.5), (1.5, 1.5), (-1.5, 1.5)]]
    O = (0, 0)
    A, B = Q[0], Q[1]
    M = medio(A, B)
    assert perpendicular(sub(M, O), sub(B, A))
    f = Figura(-2.4, 2.4, -2.4, 2.4, escala=50)
    f.poligono(Q)
    f.segmento(O, M, w=1.2); f.segmento(O, A, w=1.2)
    f.angulo_recto(M, O, B, t=0.18)
    f.punto(O)
    vertices(f, Q, ["A", "B", "", ""])
    f.rotulo(add(M, mul(norm(sub(M, O)), 0.3)), "M", size=13)
    f.rotulo((0.1, 0.32), "O", size=13)
    fig("FIG-FIG-ELEM-08", f.svg("Cuadrado dibujado inclinado, de centro O. Están dibujados OA, hasta el "
                                 "vértice A, y OM, hasta el punto M del lado AB, con un ángulo recto en M.",
                                 prohibido=("apotema", "diagonal")))

    # 09 — obtusángulo (para contar alturas fuera)
    T = [(0, 0), (6, 0), (1.3, 1.8)]
    assert dot(sub(T[0], T[2]), sub(T[1], T[2])) < 0
    f = Figura(-0.6, 6.6, -0.6, 2.5, escala=45)
    f.poligono(T)
    f.arco(T[2], T[0], T[1], r=0.35) if cross(sub(T[0], T[2]), sub(T[1], T[2])) > 0 else f.arco(T[2], T[1], T[0], r=0.35)
    fig("FIG-FIG-ELEM-09", f.svg("Un triángulo con uno de sus ángulos, marcado, mayor que un ángulo recto."))

    # 10 — paralelogramo con AB inclinado; desde D: altura DH (pie fuera de AB), vertical DV, DM
    A, B = (0, 0), (4, 1.6)
    D = (-3, 2.2)
    Cc = add(B, sub(D, A))
    H, tH = pie_perpendicular(D, A, B)
    assert tH < -0.3                                           # la altura cae en la prolongación, lejos de A
    t = (D[0] - A[0]) / (B[0] - A[0])
    M = medio(A, B)
    # la vertical desde D no toca el lado AB (x de D fuera): se usa DV hasta la recta AB
    V = add(A, mul(sub(B, A), t))
    assert perpendicular(sub(D, H), sub(B, A))
    pts = [A, B, Cc, D]
    xs = [p[0] for p in pts + [H, V]]
    ys = [p[1] for p in pts + [H, V]]
    f = Figura(min(xs) - 0.6, max(xs) + 0.6, min(ys) - 0.7, max(ys) + 0.6, escala=50)
    f.poligono(pts)
    f.segmento(A, H, punteado=True, w=1.1)
    f.segmento(D, H, w=1.2); f.segmento(D, M, w=1.2)
    f.angulo_recto(H, D, B, t=0.2)
    vertices(f, pts, ["A", "B", "C", "D"])
    f.rotulo(add(H, mul(norm(sub(H, D)), 0.34)), "H", size=13)
    f.rotulo(add(M, mul(norm(sub(M, D)), 0.34)), "M", size=13)
    fig("FIG-FIG-ELEM-10", f.svg("Paralelogramo ABCD con el lado AB inclinado. El lado AB se prolonga "
                                 "con una línea punteada hasta H. Desde D salen los segmentos DH, con "
                                 "un ángulo recto en H, y DM.", prohibido=("altura", "medio")))

    # 11 (clase) — altura dentro y altura fuera
    T1 = [(0, 0), (4, 0), (1.4, 2.6)]
    T2 = [add(p, (5.2, 0)) for p in [(1.8, 0), (5, 0), (0, 2.4)]]
    H1 = (1.4, 0)
    H2 = (T2[2][0], 0)
    assert dot(sub(T2[2], T2[0]), sub(T2[1], T2[0])) < 0 and H2[0] < T2[0][0]
    f = Figura(-0.5, 10.6, -0.7, 3.1, escala=42)
    f.poligono(T1); f.poligono(T2)
    f.segmento(T1[2], H1, w=1.2); f.angulo_recto(H1, T1[2], T1[1], t=0.2)
    f.segmento(H2, T2[0], punteado=True, w=1.1)
    f.segmento(T2[2], H2, w=1.2); f.angulo_recto(H2, T2[2], T2[1], t=0.2)
    f.rotulo((1.4 + 0.55, 1.0), "h", size=14, italic=True)
    f.rotulo((H2[0] - 0.35, 1.0), "h", size=14, italic=True)
    fig("FIG-FIG-ELEM-11", f.svg("Dos triángulos con su altura h trazada sobre el lado de abajo. En el "
                                 "primero, h cae dentro del lado. En el segundo, que tiene un ángulo "
                                 "obtuso, h cae fuera y el lado se prolonga con una línea punteada."))

    # 12 (clase) — hexágono: radio y apotema
    P = regular(6, 2.2, ang0=0)
    O = (0, 0)
    A, B = P[0], P[1]
    M = medio(A, B)
    f = Figura(-2.8, 2.8, -2.4, 2.4, escala=50)
    f.poligono(P)
    f.segmento(O, A, w=1.3); f.segmento(O, M, w=1.3)
    f.angulo_recto(M, O, B, t=0.18)
    f.punto(O)
    f.rotulo((1.1, -0.28), "radio", size=12, italic=True)
    f.rotulo(add(mul(M, 0.5), (-0.62, 0.12)), "apotema", size=12, italic=True)
    fig("FIG-FIG-ELEM-12", f.svg("Hexágono regular. El radio va del centro a un vértice. La apotema va "
                                 "del centro al punto medio de un lado y es perpendicular a él; es más "
                                 "corta que el radio."))

    # 13 (clase) — diagonales desde un vértice del hexágono
    P = regular(6, 2, ang0=90)
    f = Figura(-2.4, 2.4, -2.4, 2.6, escala=50)
    f.poligono(P)
    for q in P[2:5]:
        f.segmento(P[0], q, punteado=True, w=1.2)
    f.punto(P[0])
    fig("FIG-FIG-ELEM-13", f.svg("Hexágono con las tres diagonales que salen de uno de sus vértices: van "
                                 "a todos los vértices salvo a él mismo y a sus dos vecinos."))


def per():
    # 01 — hexágono regular, un lado rotulado 7 cm
    P = regular(6, 2, ang0=90)
    f = Figura(-2.6, 2.6, -2.4, 2.6, escala=50)
    f.poligono(P)
    for a, b in lados(P):
        f.marca_igual(a, b)
    f.medida(P[3], P[4], "7 cm", lado=-1, d=0.38)
    fig("FIG-PER-POL-01", f.svg("Hexágono con sus seis lados marcados como iguales; uno de ellos mide 7 cm.",
                                prohibido=("42",)))

    # 02 — rectángulo 8 × 6 con diagonal 10
    R = [(0, 0), (8, 0), (8, 6), (0, 6)]
    assert abs(dist(R[0], R[2]) - 10) < 1e-9
    f = Figura(-1, 9.4, -1, 6.7, escala=32)
    f.poligono(R)
    f.segmento(R[0], R[2], w=1.2)
    for i in range(4):
        f.angulo_recto(R[i], R[(i + 1) % 4], R[i - 1], t=0.35)
    f.medida(R[0], R[1], "8 cm", lado=-1, d=0.5)
    f.medida(R[1], R[2], "6 cm", lado=-1, d=0.75)
    f.medida(R[0], R[2], "10 cm", lado=1, d=0.45)
    fig("FIG-PER-POL-02", f.svg("Rectángulo de lados 8 cm y 6 cm, con una diagonal de 10 cm dibujada.",
                                prohibido=("28",)))

    # 03 — figura en L: 10 × 7 con una muesca de 4 × 3 arriba a la derecha
    L = [(0, 0), (10, 0), (10, 4), (6, 4), (6, 7), (0, 7)]
    per_ = sum(dist(a, b) for a, b in lados(L))
    assert per_ == 34
    f = Figura(-1.2, 11, -1, 7.8, escala=30)
    f.poligono(L)
    for i in range(6):
        f.angulo_recto(L[i], L[(i + 1) % 6], L[i - 1], t=0.35) if i != 3 else None
    f.medida(L[0], L[1], "10 cm", lado=-1, d=0.55)
    f.medida(L[5], L[0], "7 cm", lado=-1, d=0.8)
    f.medida(L[4], L[5], "6 cm", lado=-1, d=0.55)
    f.medida(L[1], L[2], "4 cm", lado=-1, d=0.8)
    fig("FIG-PER-POL-03", f.svg("Figura en forma de L, con todos sus ángulos rectos. Medidas rotuladas: "
                                "abajo 10 cm, a la izquierda 7 cm, arriba 6 cm y el lado derecho de abajo "
                                "4 cm. Dos lados no tienen medida.", prohibido=("34",)))

    # 04 — rectángulos 6 × 4 y 3 × 4 unidos (segmento interior dibujado)
    R = [(0, 0), (9, 0), (9, 4), (0, 4)]
    f = Figura(-1.2, 9.6, -1.1, 4.7, escala=34)
    f.poligono(R)
    f.segmento((6, 0), (6, 4), w=1.5)
    f.medida((0, 0), (6, 0), "6 cm", lado=-1, d=0.5)
    f.medida((6, 0), (9, 0), "3 cm", lado=-1, d=0.5)
    f.medida((0, 4), (0, 0), "4 cm", lado=-1, d=0.75)
    fig("FIG-PER-POL-04", f.svg("Dos rectángulos unidos por un lado, formando un rectángulo más grande. "
                                "El de la izquierda mide 6 cm de ancho y el de la derecha 3 cm; los dos "
                                "miden 4 cm de alto.", prohibido=("26",)))

    # 05 — isósceles de base 6 y lados iguales 9
    h = math.sqrt(81 - 9)
    T = [(0, 0), (6, 0), (3, h)]
    assert iguales(dist(T[0], T[2]), dist(T[1], T[2]), 9)
    f = Figura(-1.3, 7.3, -1, h + 0.7, escala=30)
    f.poligono(T)
    f.marca_igual(T[0], T[2]); f.marca_igual(T[1], T[2])
    f.medida(T[0], T[1], "6 cm", lado=-1, d=0.55)
    f.medida(T[2], T[0], "9 cm", lado=1, d=0.75)
    fig("FIG-PER-POL-05", f.svg("Triángulo con base de 6 cm y dos lados marcados como iguales; uno de "
                                "ellos mide 9 cm.", prohibido=("24",)))

    # 06 — escalera de 3 escalones: 9 de ancho y 6 de alto
    E = [(0, 0), (9, 0), (9, 2), (6, 2), (6, 4), (3, 4), (3, 6), (0, 6)]
    assert sum(dist(a, b) for a, b in lados(E)) == 30
    f = Figura(-1.2, 9.6, -1, 6.6, escala=32)
    f.poligono(E)
    f.medida(E[0], E[1], "9 cm", lado=-1, d=0.55)
    f.medida(E[7], E[0], "6 cm", lado=-1, d=0.8)
    fig("FIG-PER-POL-06", f.svg("Figura en forma de escalera, con todos sus ángulos rectos: mide 9 cm de "
                                "ancho abajo y 6 cm de alto a la izquierda. Los escalones no tienen "
                                "medidas.", prohibido=("30",)))

    # 07 — rombo de lado 5 con diagonales 8 y 6
    Rb = [(-4, 0), (0, -3), (4, 0), (0, 3)]
    assert iguales(*[dist(a, b) for a, b in lados(Rb)], 5)
    f = Figura(-5, 5.2, -3.8, 3.8, escala=34)
    f.poligono(Rb)
    f.segmento(Rb[0], Rb[2], punteado=True, w=1.1)
    f.segmento(Rb[1], Rb[3], punteado=True, w=1.1)
    for a, b in lados(Rb):
        f.marca_igual(a, b)
    f.medida(Rb[2], Rb[3], "5 cm", lado=1, d=0.55)
    f.rotulo((-2, 0.35), "8 cm", size=13)
    f.rotulo((0.75, -1.5), "6 cm", size=13)
    fig("FIG-PER-POL-07", f.svg("Rombo con sus cuatro lados marcados como iguales; un lado mide 5 cm. "
                                "Sus diagonales, punteadas, miden 8 cm y 6 cm.", prohibido=("20",)))

    # 08 — triángulo 13, 14, 15 con altura 12
    B, C, A = (0, 0), (14, 0), (5, 12)
    assert abs(dist(A, B) - 13) < 1e-9 and abs(dist(A, C) - 15) < 1e-9
    H = (5, 0)
    f = Figura(-1.5, 15.5, -1.3, 13, escala=17)
    f.poligono([A, B, C])
    f.segmento(A, H, punteado=True, w=1.2)
    f.angulo_recto(H, A, C, t=0.8)
    f.medida(B, C, "14 cm", lado=-1, d=0.9)
    f.medida(A, B, "13 cm", lado=1, d=1.2)
    f.medida(C, A, "15 cm", lado=1, d=1.2)
    f.rotulo((3.7, 3.2), "12 cm", size=13)
    fig("FIG-PER-POL-08", f.svg("Triángulo de lados 13 cm, 14 cm y 15 cm, con la altura sobre el lado de "
                                "14 cm dibujada punteada; la altura mide 12 cm.", prohibido=("42",)))

    # 09 — cuadrados de lado 5 y 3 unidos
    F = [(0, 0), (8, 0), (8, 3), (5, 3), (5, 5), (0, 5)]
    assert sum(dist(a, b) for a, b in lados(F)) == 26
    f = Figura(-1.2, 8.8, -1, 5.7, escala=34)
    f.poligono(F)
    f.segmento((5, 0), (5, 3), w=1.5)
    f.marca_igual((0, 0), (5, 0)); f.marca_igual((0, 5), (5, 5)); f.marca_igual((0, 0), (0, 5))
    f.marca_igual((5, 3), (5, 5), 1) if False else None
    f.marca_igual((5, 0), (8, 0), 2); f.marca_igual((8, 0), (8, 3), 2); f.marca_igual((5, 3), (8, 3), 2)
    f.medida((0, 5), (0, 0), "5 cm", lado=-1, d=0.75)
    f.medida((8, 0), (8, 3), "3 cm", lado=-1, d=0.75)
    fig("FIG-PER-POL-09", f.svg("Dos cuadrados unidos por un lado: uno de lado 5 cm y otro de lado 3 cm, "
                                "apoyados en la misma línea.", prohibido=("26",)))

    # 10 — trapecio isósceles: bases 12 y 6, lados 5, altura 4
    T = [(0, 0), (12, 0), (9, 4), (3, 4)]
    assert iguales(dist(T[1], T[2]), dist(T[3], T[0]), 5)
    f = Figura(-1.3, 13, -1.2, 5.2, escala=30)
    f.poligono(T)
    f.segmento((3, 4), (3, 0), punteado=True, w=1.2)
    f.angulo_recto((3, 0), (3, 4), (12, 0), t=0.4)
    f.marca_igual(T[1], T[2]); f.marca_igual(T[3], T[0])
    f.medida(T[0], T[1], "12 cm", lado=-1, d=0.6)
    f.medida(T[2], T[3], "6 cm", lado=-1, d=0.55)
    f.medida(T[3], T[0], "5 cm", lado=-1, d=0.7)
    f.rotulo((3.8, 1.9), "4 cm", size=13)
    fig("FIG-PER-POL-10", f.svg("Trapecio con bases de 12 cm y 6 cm y sus dos lados no paralelos "
                                "marcados como iguales; uno mide 5 cm. Su altura, punteada, mide 4 cm.",
                                prohibido=("28",)))

    # 11 — cuadrado de lado 9
    Q = [(0, 0), (4, 0), (4, 4), (0, 4)]
    f = Figura(-1.3, 4.8, -1.1, 4.6, escala=38)
    f.poligono(Q)
    for a, b in lados(Q):
        f.marca_igual(a, b)
    f.angulo_recto(Q[0], Q[1], Q[3], t=0.3)
    f.medida(Q[0], Q[1], "9 cm", lado=-1, d=0.5)
    fig("FIG-PER-POL-11", f.svg("Cuadrilátero con sus cuatro lados marcados como iguales y un ángulo recto; "
                                "un lado mide 9 cm.", prohibido=("36",)))

    # 12 — figura en U: 12 × 8 con una muesca de 4 × 5 arriba al centro
    U = [(0, 0), (12, 0), (12, 8), (8, 8), (8, 3), (4, 3), (4, 8), (0, 8)]
    assert sum(dist(a, b) for a, b in lados(U)) == 50
    f = Figura(-1.4, 13, -1.1, 8.9, escala=26)
    f.poligono(U)
    f.medida(U[0], U[1], "12 cm", lado=-1, d=0.7)
    f.medida(U[7], U[0], "8 cm", lado=-1, d=0.95)
    f.medida(U[6], U[7], "4 cm", lado=-1, d=0.6)
    f.medida(U[2], U[3], "4 cm", lado=-1, d=0.6)
    f.medida(U[6], U[5], "5 cm", lado=-1, d=0.8)
    fig("FIG-PER-POL-12", f.svg("Figura en forma de U, con todos sus ángulos rectos. Medidas rotuladas: "
                                "abajo 12 cm, a la izquierda 8 cm, los dos tramos de arriba 4 cm cada "
                                "uno y la profundidad de la muesca 5 cm.", prohibido=("50",)))

    # 13 — casa: cuadrado 6 × 6 y techo triangular de lados 5 y altura 4
    Cs = [(0, 0), (6, 0), (6, 6), (3, 10), (0, 6)]
    assert iguales(dist(Cs[2], Cs[3]), dist(Cs[3], Cs[4]), 5)
    f = Figura(-1.4, 7.2, -1.1, 10.7, escala=26)
    f.poligono(Cs)
    f.segmento((0, 6), (6, 6), w=1.5)
    f.segmento((3, 10), (3, 6), punteado=True, w=1.2)
    f.marca_igual(Cs[0], Cs[1]); f.marca_igual(Cs[1], Cs[2]); f.marca_igual(Cs[4], Cs[0])
    f.marca_igual(Cs[2], Cs[3], 2); f.marca_igual(Cs[3], Cs[4], 2)
    f.medida(Cs[0], Cs[1], "6 cm", lado=-1, d=0.6)
    f.medida(Cs[3], Cs[4], "5 cm", lado=-1, d=0.7)
    f.rotulo((3.9, 7.8), "4 cm", size=13)
    fig("FIG-PER-POL-13", f.svg("Figura con forma de casa: un cuadrado de lado 6 cm con un techo "
                                "triangular encima, de lados iguales de 5 cm. El borde entre el cuadrado "
                                "y el techo está dibujado, y la altura del techo, punteada, mide 4 cm.",
                                prohibido=("28",)))

    # 14 (clase) — figura en L con los lados que faltan deducidos
    L = [(0, 0), (8, 0), (8, 3), (5, 3), (5, 6), (0, 6)]
    assert sum(dist(a, b) for a, b in lados(L)) == 28
    f = Figura(-1.3, 11.5, -1, 6.8, escala=30)
    f.poligono(L)
    f.medida(L[0], L[1], "8 cm", lado=-1, d=0.5)
    f.medida(L[5], L[0], "6 cm", lado=-1, d=0.75)
    f.medida(L[4], L[5], "5 cm", lado=-1, d=0.5)
    f.medida(L[1], L[2], "3 cm", lado=-1, d=0.75)
    f.rotulo((7.1, 3.55), "8 − 5 = 3", size=12, italic=True)
    f.rotulo((7.1, 4.6), "6 − 3 = 3", size=12, italic=True)
    fig("FIG-PER-POL-14", f.svg("Figura en L de 8 cm de ancho y 6 cm de alto, con una muesca. Los dos "
                                "lados sin medida se deducen: el tramo horizontal de arriba a la derecha "
                                "mide 8 − 5 = 3 cm y el vertical, 6 − 3 = 3 cm. Perímetro: 28 cm."))


def main():
    clas()
    elem()
    per()
    print(f"{len(HECHAS)} figuras: " + ", ".join(sorted(HECHAS)))


if __name__ == "__main__":
    main()
