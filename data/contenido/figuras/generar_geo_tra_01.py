#!/usr/bin/env python3
"""
Figuras de GEO-PLA-COORD (clase LES-GEO-TRA-01).

  .venv/bin/python data/contenido/figuras/generar_geo_tra_01.py

Ítems (el aria-label nunca dice las coordenadas que el ítem pregunta):
  FIG-PLA-COORD-01  M1-TRA-001  punto P, escala 2 (solo 2 y 4 rotulados)
  FIG-PLA-COORD-02  M1-TRA-005  A y B en una horizontal, escala 2
  FIG-PLA-COORD-03  M1-TRA-006  punto Q, escala 1
  FIG-PLA-COORD-04  M1-TRA-008  punto R sobre el eje y
  FIG-PLA-COORD-05  (nivel 2)   A, B y C de un rectángulo, escala 2
  FIG-PLA-COORD-06  (nivel 2)   A y B en una vertical, escala 2
  FIG-PLA-COORD-07  (nivel 2)   cuadrilátero ABCD
  FIG-PLA-COORD-08  (nivel 2)   cuatro puntos para elegir (−2, 5)
  FIG-PLA-COORD-09  (nivel 3)   punto P, escala 5
  FIG-PLA-COORD-10  (nivel 3)   A, B y C, escala 2
  FIG-PLA-COORD-11  (nivel 3)   punto T
Clase:
  FIG-PLA-COORD-12  cuadrantes y signos
  FIG-PLA-COORD-13  leer las coordenadas de un punto (guías)
  FIG-PLA-COORD-14  deducir la escala de dos rótulos

Los códigos de ítem de la tabla de arriba son orientativos: el YAML de la
clase manda. Cada figura verifica además lo que su ítem necesita (que la
lectura por cuadrados dé el distractor ESCALA, que los puntos que deben
ser distintos lo sean, etc.).
"""

from fractions import Fraction as Fr

from plano_svg import Plano, guardar

HECHAS = {}


def fig(codigo, svg):
    HECHAS[codigo] = svg
    guardar(codigo, svg)


def cuadrados(p, e):
    """Lectura de quien cuenta cuadrados en vez de unidades."""
    return (Fr(p[0]) / e, Fr(p[1]) / e)


def main():
    # 01 — P(−6, 4) con escala 2. ESCALA lee (−3, 2).
    P = (-6, 4)
    assert cuadrados(P, 2) == (-3, 2)
    p = Plano(-8, 8, -6, 6, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.punto("P", *P, pos="ne")
    fig("FIG-PLA-COORD-01", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. "
        "Hay un punto marcado, P.", prohibido=("−6", "-6", "(")))

    # 02 — A(−4, 2), B(6, 2): distancia 10; ESCALA 5; CONTEO 6; SINSIGNO 2.
    A, B = (-4, 2), (6, 2)
    assert A[1] == B[1] and B[0] - A[0] == 10
    assert (B[0] - A[0]) // 2 == 5 and (B[0] - A[0]) // 2 + 1 == 6 and abs(B[0]) - abs(A[0]) == 2
    p = Plano(-6, 8, -4, 6, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.punto("A", *A, pos="n")
    p.punto("B", *B, pos="n")
    fig("FIG-PLA-COORD-02", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. "
        "Los puntos A y B están a la misma altura.", prohibido=("10",)))

    # 03 — Q(4, −3). CONTEO (contar líneas incluyendo el eje) lee (5, −4).
    Q = (4, -3)
    p = Plano(-5, 6, -5, 4)
    p.punto("Q", *Q, pos="e")
    fig("FIG-PLA-COORD-03", p.svg(
        "Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, Q.",
        prohibido=("(4", "−3")))

    # 04 — R(0, −4), sobre el eje y.
    p = Plano(-5, 5, -5, 3)
    p.punto("R", 0, -4, pos="e")
    fig("FIG-PLA-COORD-04", p.svg(
        "Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, R.",
        prohibido=("eje y", "−4")))

    # 05 — rectángulo: A(−4, −2), B(6, −2), C(6, 4); D(−4, 4) no se dibuja.
    A, B, C = (-4, -2), (6, -2), (6, 4)
    D = (A[0], C[1])
    assert (B[0] - A[0]) * (C[1] - B[1]) != 0 and B[1] == A[1] and C[0] == B[0]
    assert cuadrados(D, 2) == (-2, 2)
    p = Plano(-6, 8, -4, 6, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.punto("A", *A, pos="sw")
    p.punto("B", *B, pos="se")
    p.punto("C", *C, pos="ne")
    fig("FIG-PLA-COORD-05", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. "
        "Están marcados tres vértices de un rectángulo: A, B y C.", prohibido=("D",)))

    # 06 — A(2, −6), B(2, 4): distancia 10; ESCALA 5; CONTEO 6; SINSIGNO 2.
    A, B = (2, -6), (2, 4)
    assert A[0] == B[0] and B[1] - A[1] == 10 and abs(A[1]) - abs(B[1]) == 2
    p = Plano(-4, 6, -8, 6, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.punto("A", *A, pos="e")
    p.punto("B", *B, pos="e")
    fig("FIG-PLA-COORD-06", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. "
        "Los puntos A y B están en una misma vertical.", prohibido=("10",)))

    # 07 — cuadrilátero; el ítem pregunta por C(3, −2).
    V = [("A", -3, 2), ("B", 1, 4), ("C", 3, -2), ("D", -2, -3)]
    p = Plano(-5, 5, -5, 5)
    p.poligono(V, pos={"A": "nw", "B": "ne", "C": "se", "D": "sw"})
    fig("FIG-PLA-COORD-07", p.svg(
        "Plano cartesiano con cuadrícula de una unidad y el cuadrilátero ABCD.",
        prohibido=("(3", "cuarto")))

    # 08 — elegir el punto (−2, 5): A correcto, B lo invierte (ORDEN),
    #      C sin signo, D contando la línea del eje como la primera (CONTEO).
    pts = {"A": (-2, 5), "B": (5, -2), "C": (2, 5), "D": (-1, 4)}
    assert len(set(pts.values())) == 4
    p = Plano(-4, 6, -4, 6)
    p.punto("A", *pts["A"], pos="nw")
    p.punto("B", *pts["B"], pos="se")
    p.punto("C", *pts["C"], pos="ne")
    p.punto("D", *pts["D"], pos="nw")
    fig("FIG-PLA-COORD-08", p.svg(
        "Plano cartesiano con cuadrícula de una unidad y cuatro puntos marcados: A, B, C y D.",
        prohibido=("(",)))

    # 09 — P(15, −10) con escala 5; ESCALA lee (3, −2).
    P = (15, -10)
    assert cuadrados(P, 5) == (3, -2)
    p = Plano(-20, 20, -15, 15, escala=5, px=22, rotulos_x=[5, 10], rotulos_y=[5, 10])
    p.punto("P", *P, pos="e")
    fig("FIG-PLA-COORD-09", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 5 y el 10. "
        "Hay un punto marcado, P.", prohibido=("15", "−10")))

    # 10 — A(−4, 2), B(4, −2), C(6, 0) con escala 2.
    #      I: A = (−4, 2) (verdadera; ESCALA lee (−2, 1)).
    #      II: B en el cuarto cuadrante (verdadera).
    #      III: C = (0, 6) (falsa; ORDEN la acepta).
    A, B, C = (-4, 2), (4, -2), (6, 0)
    assert cuadrados(A, 2) == (-2, 1) and B[0] > 0 > B[1] and C[1] == 0
    p = Plano(-6, 8, -4, 4, escala=2, rotulos_x=[2, 4], rotulos_y=[2, 4])
    p.punto("A", *A, pos="nw")
    p.punto("B", *B, pos="se")
    p.punto("C", *C, pos="n")
    fig("FIG-PLA-COORD-10", p.svg(
        "Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. "
        "Hay tres puntos marcados: A, B y C.", prohibido=("(",)))

    # 11 — T(−3, −5): la ordenada es −5.
    p = Plano(-5, 4, -6, 3)
    p.punto("T", -3, -5, pos="w")
    fig("FIG-PLA-COORD-11", p.svg(
        "Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, T.",
        prohibido=("−5", "−3")))

    # --- clase ----------------------------------------------------------------

    # 12 — cuadrantes y signos. Sin puntos.
    p = Plano(-5, 5, -4, 4, rotulos_x=[], rotulos_y=[])
    p.texto(Fr(5, 2), Fr(5, 2), "I", size=16)
    p.texto(Fr(5, 2), Fr(3, 2), "(+, +)", size=13)
    p.texto(Fr(-5, 2), Fr(5, 2), "II", size=16)
    p.texto(Fr(-5, 2), Fr(3, 2), "(−, +)", size=13)
    p.texto(Fr(-5, 2), Fr(-3, 2), "III", size=16)
    p.texto(Fr(-5, 2), Fr(-5, 2), "(−, −)", size=13)
    p.texto(Fr(5, 2), Fr(-3, 2), "IV", size=16)
    p.texto(Fr(5, 2), Fr(-5, 2), "(+, −)", size=13)
    fig("FIG-PLA-COORD-12", p.svg(
        "Los ejes dividen el plano en cuatro cuadrantes. El primero, arriba a la derecha, tiene "
        "x positiva e y positiva; el segundo, arriba a la izquierda, x negativa e y positiva; "
        "el tercero, abajo a la izquierda, las dos negativas; el cuarto, abajo a la derecha, "
        "x positiva e y negativa."))

    # 13 — leer M(−4, 3)... no: (−4, 2) y (−3, 2) están tomados por ítems.
    #      Se usa M(−1, 3), que no aparece en ningún ítem.
    M = (-1, 3)
    p = Plano(-4, 4, -3, 4)
    p.guias(*M)
    p.punto("M", *M, pos="nw")
    fig("FIG-PLA-COORD-13", p.svg(
        "El punto M está una unidad a la izquierda del eje y y tres unidades arriba del eje x. "
        "Líneas punteadas bajan de M a cada eje: M = (−1, 3)."))

    # 14 — escala 3: solo 3 y 6 rotulados; K(−6, −3).
    K = (-6, -3)
    assert cuadrados(K, 3) == (-2, -1)
    p = Plano(-9, 9, -6, 6, escala=3, rotulos_x=[3, 6], rotulos_y=[3, 6])
    p.guias(*K)
    p.punto("K", *K, pos="sw")
    fig("FIG-PLA-COORD-14", p.svg(
        "Plano con cuadrícula donde solo están rotulados el 3 y el 6 en cada eje: cada cuadrado "
        "vale 3 unidades. El punto K está dos cuadrados a la izquierda y uno abajo: "
        "K = (−6, −3)."))

    print(f"{len(HECHAS)} figuras: " + ", ".join(sorted(HECHAS)))


if __name__ == "__main__":
    main()
