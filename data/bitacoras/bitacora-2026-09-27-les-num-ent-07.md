# Plataforma PAES — Bitácora: LES-NUM-ENT-07, valor absoluto

*Sesiones: 26 y 27 de septiembre de 2026*

---

## 1. Qué se hizo

Clase completa de **NUM-ENT-ABS** (M2), sola, con la skill `crear-clase`:
9 misconceptions nuevas en el catálogo de NUM-ENT, 33 ítems
(M2-ENT-001 a 033, la primera serie M2 de la unidad), 9 remediaciones,
el cuerpo de la clase y 5 figuras. Además, una arista nueva en el grafo:
**NUM-ENT-ADI → NUM-ENT-ABS**.

Migraciones 048 (catálogo), 049 (arista), 050 (clase, como `draft`) y
051 (publicación), aplicadas y verificadas el 27 sep.

---

## 2. Control 1: alcance, grafo y misconceptions

**Posición 7.** La clase va al final de la unidad para dejar 3 a 6
libres a las clases M1 que faltan (MUL, PRIOR, DIVIS, MCM). El código
coincide con la posición, como en POT.

**El grafo, en dos vueltas.** ABS dependía solo de REC. En el control 1
Ben eligió no tocar el grafo (camino B), y se escribieron 24 ítems sin
operar enteros: definición, comparación, qué números cumplen |x| = a,
conteo de enteros con |x| <= a y distancia en la recta. En el control 2
Ben trajo dos ítems de preparación PAES (distancia = |a − b|; si a > b,
|b − a| = a − b). Los dos operan dentro de las barras, que es como la
PAES pregunta el tema. Se discutió qué es más básico:

- la **idea** de distancia al 0 es anterior a la suma (ADI la usa como
  "tamaño" en la regla de signos);
- el valor absoluto **como herramienta** (|a − b|, deducir el signo de lo
  de adentro) necesita sumar y restar.

El nodo es M2, así que es la segunda capa. Se agregó la arista ADI → ABS
(camino A). Se descartó partir el nodo en ABS-CONC (M1) y ABS-OPER (M2):
ADI ya está cargada y usa el "tamaño" sin ese prerrequisito.

**MUL no es prerrequisito.** Ben preguntó si ADI y MUL deberían ir en una
misma clase y ser ambos prerrequisitos. Las clases no definen
prerrequisitos (lo hace el grafo), ADI ya está publicada sola, y MUL no
tiene contenido: la arista MUL → ABS dejaría ABS bloqueado para todos.
Se evalúa al hacer la clase de MUL, junto con ítems de |a · b|.

**Sin vocabulario de ecuaciones.** Ben notó que el M2-ENT-005 hablaba de
"ecuación" y "solución" antes de que el estudiante haya visto
ecuaciones (ALG-ECU no es ancestro). Todo se reescribió como "¿qué
números cumplen |x| = a?", incluido el nombre de ENT-ABS-NEGSOL en el
catálogo.

**Misconceptions.** Siete primeras, todas vistas por Ben en aula
(`docente`): CAMBIA (|5| = −5), PARENT (|−5| = −5), SIGNOFUERA
(−|−6| = 6), UNASOL (|x| = 5 solo x = 5), NEGSOL (|x| = −4 tiene
solución), DISTTAM (distancia entre −3 y 5 = 2), SALTOS (enteros con
|x| <= 3: 6). Con la arista entraron dos más como `hipotesis`:
DISTRIB (|3 − 8| = |3| − |8|) y QUITASIGNO (|3 − 8| = 3 + 8).

DISTRIB estuvo fuera con el camino B: sin operar dentro de las barras,
ningún ítem la podía mostrar. Ben propuso ponerla en ADI; no calzaba,
porque el alcance de ADI excluye la notación |x|.

**Colisiones documentadas en el catálogo:** SIGNOFUERA siempre coincide
con PARENT (−|negativo|) o con CAMBIA (−|positivo|) en una expresión
suelta, así que sus ítems combinan las dos. PARENT y UNASOL coinciden en
|x| = a con a > 0. DISTRIB coincide con PARENT en |a − b| con 0 < a < b
y con QUITASIGNO en sumas.

---

## 3. Control 2: producción

- **33 ítems, 11 por nivel.** PARENT está en 17 (52%) y CAMBIA en 16:
  son los dos errores centrales del nodo (las barras "no hacen nada" o
  "dan vuelta el signo"). Los demás del nodo, entre 6 y 12. Distractores
  de otros nodos: REC-CONTEO 6, MAGN 2, SINSIGNO 2, CTXSIGNO 1,
  ESCALA 1, ADI-MAGNOP 1, ADI-DOBLENEG 1.
- **Ítems de Ben**, adaptados a 4 alternativas: la distancia como
  |a − b| (027), |b − a| con a > b (029) y el I/II/III con |x| < |y|
  (030; en su versión original I y II no apuntaban a ningún error y
  tenía 5 alternativas).
- **Cambios de Ben:** el 013 pasó de "la temperatura cumple |t| <= 4"
  (poco lógico) a la variación respecto de −18 °C. Se cuenta la
  variación: pedir el rango (−22 a −14) sería una resta.
- **Cambios propios:** el 011 perdió un distractor de PARENT ("la
  gaviota está más lejos"): nadie pasa por las barras para comparar
  12 m con 7 m. El ejemplo de conteo de la clase pasó de |x| <= 2 a
  |x| <= 7 porque le entregaba el conjunto al 024, y dos ejemplos que
  mostraban |−9| = 9 se cambiaron porque regalaban el 001.
- **Distractores débiles, a revisar con datos:**
  - "Infinitos: todos los mayores que −a" como CAMBIA (008, 020) y
    CAMBIA en contexto (024): la regla los produce, pero cuesta creer
    que alguien razone así.
  - MAGN en una afirmación compuesta (002).
  - SINSIGNO (006, 016): mide orden, no valor absoluto.
  - SALTOS aplicado a "desde −8 hasta 3" (023), que estira la
    definición del catálogo.
  - "Ninguna de ellas" como UNASOL (017) y DISTRIB (033).
  - CAMBIA sobre la hipótesis con letras (030).
  - CONTEO con la fórmula dada en el enunciado (032).
- **Figuras** (`generar_ent_abs.py`): dos de ítem con la escala por
  deducir (una con un punto justo en el borde de |x| <= 3) y tres de
  clase. Las de clase reutilizan los saltos de `generar_ent_adi.py`
  pero rotulados con la distancia sin signo: un "−14" sobre el arco
  enseñaría lo contrario del concepto.

---

## 4. Carga

Antes de aplicar: 047 aplicada, ningún código nuevo existía, posición 7
libre, nodo activo, arista REC → ABS ya presente. Se aplicaron 048 a 051
con `psql -1`. Verificación:

- 9 misconceptions ENT-ABS (7 `docente`, 2 `hipotesis`).
- 33 ítems `active` en NUM-ENT-ABS, todos con 4 alternativas y 1
  correcta; 2 con figura.
- 9 remediaciones `active` con 6 ítems cada una.
- La clase activa en la posición 7, con su anchor `valor-absoluto`.
- Aristas REC → ABS y ADI → ABS, las dos en `hypothesis`.
- 5 figuras.

---

## 5. Qué quedó abierto

- **DISTRIB y QUITASIGNO** siguen como `hipotesis`: falta que Ben diga si
  las ha visto en aula.
- **MUL → ABS**: evaluar al hacer la clase de MUL, con ítems de |a · b|.
- **Huecos del grafo**: inecuaciones con valor absoluto (|x − a| < b) y
  la función f(x) = |x| no tienen nodo.
- Revisar los distractores débiles de la sección 3 con respuestas reales.
