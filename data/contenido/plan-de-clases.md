# Plan de clases — Matemática M1 y M2

Mapa de todas las clases que cubren el grafo (`data/loaders/grafo.py`): qué nodos van juntos, en qué
orden producirlas y qué falta. Es un plan, no la fuente de verdad: el alcance fino de cada clase se
cierra en el control 1 de `crear-clase`, y si ahí cambia una agrupación, se actualiza este archivo.

Armado el 27 sep 2026 con el grafo en 244 nodos (11 `pre`, 162 M1, 71 M2).

## Resumen

| | Clases | Nodos | Hechas |
|---|---:|---:|---:|
| M1 (incluye `pre`) | 92 | 173 | 8 |
| M2 | 41 | 71 | 1 |
| **Total** | **133** | **244** | **9** |

Tamaño: 42 clases de 1 nodo, 71 de 2, 20 de 3. Ninguna de más de 3: a 24 ítems por nodo, una clase
de 3 ya son 72 ítems más remediaciones.

## Reglas con las que se agrupó

Las de `.claude/skills/crear-clase/referencias/alcance-y-agrupacion.md`, verificadas con script contra el grafo:

1. **Nunca M1 con M2.** Lo impone además el trigger `check_lesson_single_level` (migración 052). Los nodos `pre` combinan con cualquiera.
2. **Nodos agrupados conectados por arista directa** dentro de la clase (cadena A → B → C, o un nodo del que cuelgan los otros, como POT-02).
3. **Nodos pesados, solos** (ENT-ADI, FRA-ADI, ECU-LIT, CUA-FAC...).
4. **El orden no contradice el grafo**: dentro de cada unidad, ninguna arista va de una clase posterior a una anterior.
5. **Código por unidad del grafo**: `LES-<unidad>-NN`, con la unidad de la tabla `units` (por eso `ALG-CUA-*` va en `LES-ALG-FCU-NN` y `GEO-PIT-*` en `LES-GEO-FIG-NN`).

Las 244 quedan cubiertas exactamente una vez.

## Revisión de potencias

**La agrupación se mantiene tal cual.** Las cinco clases cumplen las reglas: CONC→SIG, PROD→{POT, CERO},
DIST→FRA, NEG→CIENT (CIENT es `pre`) y RAC sola. Es el modelo que se replica en raíces (RAI-01 espejo de POT-01).

Hay dos problemas, y ninguno es de agrupación:

**1. Hoy es inalcanzable.** `NUM-POT-CONC` pide `NUM-ENT-MUL`, que no tiene clase. Un estudiante que parte de cero
no desbloquea nada de potencias hasta que exista LES-NUM-ENT-03. Además `NUM-POT-FRA` (POT-03) pide `NUM-FRA-MUL`
(LES-NUM-RAC-03). Por eso ENT-03 es la prioridad número uno: activa cinco clases ya escritas y 126 más dependen de ella.

**2. Volumen por debajo del estándar actual.** Se escribió antes de la regla de 24 ítems por nodo y ~6 por misconception:

| Clase | Ítems por nodo | Nivel 1 | Ítems de remediación |
|---|---|---:|---:|
| POT-01 | CONC 11 · SIG 10 | 8 | 20 en 9 remediaciones |
| POT-02 | PROD 14 · POT 10 · CERO 10 | 8 | 36 en 17 |
| POT-03 | DIST 9 · FRA 10 | **2** | 13 en 6 |
| POT-04 | NEG 10 · CIENT 10 | 4 | 21 en 7 |
| POT-05 | RAC 10 | **2** | 9 en 3 |
| *Estándar hoy* | *24 (piso)* | *8 por nodo* | *6 por remediación* |

Lo más urgente es el nivel 1 de POT-03 y POT-05: con 2 ítems de entrada, el estudiante que no está listo
choca de inmediato con ítems de nivel 2–3. Propuesta: una pasada de relleno por clase (ítems y práctica de
remediación, sin tocar el cuerpo ni las misconceptions), después de la ola 1, no una reescritura.

## Orden de ataque

Calculado sobre el grafo de clases: cada clase va después de todas las clases que contienen sus prerrequisitos.
M1 primero (lo rinden todos y M2 se construye encima). Dentro de cada ola, el orden de la lista respeta el grafo
(ninguna pide algo que aparezca después) y, a igual profundidad, va primero la que más desbloquea.

### M1

**Ola 1 — tronco de números** (10)  
EST-DAT-01 (23), GEO-FIG-01 (23), GEO-TRA-01 (22), NUM-ENT-03 (120), GEO-TRA-03 (3), GEO-TRA-02 (3), NUM-ENT-05 (102), NUM-ENT-04 (82), ALG-EXP-03 (49), GEO-TRA-04 (2)

**Ola 2 — fracciones, raíces y álgebra básica** (10)  
NUM-RAC-01 (100), ALG-ECU-01 (40), NUM-RAI-01 (33), GEO-FIG-03 (9), GEO-TRA-06 (0), GEO-TRA-05 (0), NUM-RAC-02 (82), NUM-RAC-04 (70), ALG-EXP-04 (36), NUM-RAI-02 (16)

**Ola 3** (13)  
NUM-RAC-03 (79), ALG-FAC-01 (30), ALG-FAC-02 (30), NUM-RAC-05 (15), EST-DAT-05 (4), NUM-POR-01 (58), ALG-FAC-04 (27), ALG-FAC-03 (27), ALG-FCU-01 (12), ALG-ECU-04 (6), EST-POS-01 (6), ALG-ECU-02 (0), ALG-FAC-06 (0)

**Ola 4** (22)  
ALG-PRO-01 (42), ALG-EXP-02 (29), ALG-FAC-05 (26), NUM-POR-02 (7), EST-POS-02 (5), ALG-ECU-05 (4), EST-DAT-02 (2), GEO-TRA-07 (0), ALG-EXP-05 (23), ALG-FLI-01 (18), ALG-PRO-03 (15), GEO-SEM-01 (12), NUM-RAI-03 (12), PRO-EVE-01 (9), ALG-FCU-02 (7), GEO-FIG-02 (7), ALG-FCU-03 (5), EST-POS-03 (3), ALG-PRO-02 (1), EST-DAT-03 (1), NUM-POR-03 (0), EST-DAT-06 (0)

**Ola 5** (19)  
ALG-ECU-03 (22), ALG-FLI-02 (14), GEO-SEM-04 (9), ALG-FCU-05 (8), PRO-EVE-02 (7), NUM-RAI-04 (6), GEO-CUE-01 (5), GEO-FIG-04 (5), ALG-FCU-04 (1), EST-POS-04 (1), PRO-EVE-03 (0), GEO-SEM-02 (0), ALG-PRO-04 (0), ALG-FLI-03 (13), GEO-FIG-05 (8), ALG-FCU-06 (6), GEO-CUE-02 (4), PRO-EVE-04 (4), ALG-SIS-01 (3)

**Ola 6** (10)  
ALG-FLI-04 (11), GEO-CUE-03 (1), GEO-SEM-03 (0), ALG-SIS-02 (0), GEO-FIG-06 (0), ALG-FCU-08 (0), GEO-CUE-04 (0), ALG-FCU-07 (4), EST-DAT-04 (0), ALG-FLI-05 (0)

El número entre paréntesis es cuántas clases dependen de ella, directa o indirectamente.

### M2

Todas piden M1 debajo; se atacan cuando su rama de M1 esté hecha. En orden de profundidad:

NUM-REA-01, EST-DIS-01, NUM-REA-02, NUM-REA-03, NUM-FIN-01, GEO-FIG-07, GEO-REC-02, PRO-MOD-02, NUM-LOG-01, NUM-FIN-02, GEO-CIRC-01, EST-POS-05, GEO-TRI-01, NUM-LOG-02, PRO-CON-04, GEO-HOM-01, NUM-FIN-03, NUM-FIN-04, GEO-CIRC-02, EST-DIS-02, ALG-FTR-01, PRO-CON-01, NUM-LOG-03, GEO-REC-03, PRO-CON-05, GEO-HOM-02, GEO-TRI-02, GEO-TRI-03, GEO-REC-01, ALG-SIS-03, ALG-FTR-02, PRO-CON-02, PRO-CON-03, PRO-MOD-01, ALG-FEX-01, ALG-FTR-03, GEO-REC-04, ALG-FEX-02, ALG-FEX-03, ALG-FEX-04

## Plan M1

Todas las clases que ve el curso M1: nodos de nivel 1 y `pre`.

### NUM-ENT · Enteros

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-ENT-01 | Los enteros en la recta y su orden | `NUM-ENT-REC` Enteros en la recta y orden | ✅ publicada |  |
| LES-NUM-ENT-02 | Adición y sustracción de enteros | `NUM-ENT-ADI` Adición y sustracción de enteros | ✅ publicada |  |
| LES-NUM-ENT-03 | Multiplicación y división de enteros | `NUM-ENT-MUL` Multiplicación y división de enteros |  | Sola: incluye la división y concentra las reglas de signos. **Desbloquea potencias.** |
| LES-NUM-ENT-04 | Prioridad de operaciones | `NUM-ENT-PRIOR` Prioridad de operaciones |  | Sola: PAPOMUDAS, errores propios (sumar antes de multiplicar, signo delante del paréntesis). |
| LES-NUM-ENT-05 | Divisibilidad, mcm y MCD | `NUM-ENT-DIVIS` (pre) Divisibilidad, múltiplos y divisores<br>`NUM-ENT-MCM` (pre) mcm y MCD |  | Ambas `pre`, arista directa DIVIS → MCM. LES-NUM-ENT-06 queda sin usar (decisión 1, cerrada). |

### NUM-RAC · Racionales

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-RAC-01 | Qué es una fracción: equivalencia y simplificación | `NUM-FRA-CONC` Concepto de fracción y equivalencia<br>`NUM-FRA-SIMP` Simplificación de fracciones |  | SIMP es equivalencia aplicada; comparten el error de «simplificar restando». |
| LES-NUM-RAC-02 | Adición y sustracción de fracciones | `NUM-FRA-ADI` Adición y sustracción de fracciones |  | Sola: el nodo más pesado de la unidad (a/b + c/d = (a+c)/(b+d)). |
| LES-NUM-RAC-03 | Multiplicación, división y signo en fracciones | `NUM-FRA-MUL` Multiplicación y división de fracciones<br>`NUM-FRA-SIG` Fracciones con signo |  | SIG también pide FRA-ADI, que queda en la clase anterior. |
| LES-NUM-RAC-04 | Decimales: operatoria y conversión a fracción | `NUM-DEC-OPER` Operatoria con decimales<br>`NUM-DEC-FRA` Conversión decimal ↔ fracción |  |  |
| LES-NUM-RAC-05 | Orden de racionales y la recta | `NUM-RAC-ORDEN` Orden y comparación de racionales<br>`NUM-RAC-RECTA` Racionales en la recta y densidad |  | RECTA es ORDEN visto en la recta, incluida la densidad. |

### NUM-POR · Porcentaje

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-POR-01 | Porcentaje: qué es, de una cantidad y qué porcentaje es | `NUM-POR-CONC` Porcentaje como fracción y decimal<br>`NUM-POR-PARTE` Porcentaje de una cantidad<br>`NUM-POR-TASA` Qué porcentaje representa |  | Tres nodos colgando de CONC: los dos problemas «hacia adelante». |
| LES-NUM-POR-02 | Aumentos, descuentos y porcentajes sucesivos | `NUM-POR-VAR` Aumento y descuento<br>`NUM-POR-SUCE` Porcentajes sucesivos |  | La trampa central: 20% + 30% ≠ 50%. |
| LES-NUM-POR-03 | Volver al total: total desde la parte y porcentaje inverso | `NUM-POR-TOTAL` Total a partir de la parte<br>`NUM-POR-INV` Porcentaje inverso |  | Los dos problemas «hacia atrás». INV también pide VAR (clase 02). |

### NUM-POT · Potencias

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-POT-01 | Qué es una potencia y qué pasa con el signo | `NUM-POT-CONC` Concepto de potencia<br>`NUM-POT-SIG` Base negativa y paridad del exponente | ✅ publicada |  |
| LES-NUM-POT-02 | Reglas de operación con potencias de igual base | `NUM-POT-PROD` Producto y cociente de igual base<br>`NUM-POT-POT` Potencia de una potencia<br>`NUM-POT-CERO` Exponente cero y uno | ✅ publicada |  |
| LES-NUM-POT-03 | Potencia de un producto, de un cociente y de una fracción | `NUM-POT-DIST` Potencia de producto y de cociente<br>`NUM-POT-FRA` Base fraccionaria | ✅ publicada |  |
| LES-NUM-POT-04 | Exponente negativo y notación científica | `NUM-POT-NEG` Exponente negativo<br>`NUM-POT-CIENT` (pre) Notación científica | ✅ publicada |  |
| LES-NUM-POT-05 | Exponente racional | `NUM-POT-RAC` Exponente racional | ✅ publicada |  |

### NUM-RAI · Raíces

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-RAI-01 | Qué es una raíz y el signo en índice par | `NUM-RAI-CONC` Concepto de raíz enésima<br>`NUM-RAI-SIG` Signo y raíces de índice par |  | Espejo de LES-NUM-POT-01. |
| LES-NUM-RAI-02 | Descomponer y sumar raíces | `NUM-RAI-DESC` Descomposición de raíces<br>`NUM-RAI-ADI` Adición y sustracción de raíces |  | Va antes que EQ porque GEO-PIT-CAT y ALG-CUA-FOR piden DESC. |
| LES-NUM-RAI-03 | Raíz como potencia: multiplicar y dividir raíces | `NUM-RAI-EQ` Equivalencia raíz ↔ potencia racional<br>`NUM-RAI-MUL` Multiplicación y división de raíces |  | Multiplicar raíces es aplicar las reglas de potencias vía la equivalencia. |
| LES-NUM-RAI-04 | Racionalización | `NUM-RAI-RAC` Racionalización |  |  |

### ALG-EXP · Expresiones algebraicas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-EXP-01 | Lenguaje algebraico | `ALG-EXP-LENG` Lenguaje algebraico | ✅ publicada |  |
| LES-ALG-EXP-02 | Valorización de expresiones | `ALG-EXP-VAL` Valorización de expresiones |  | Sola: pesada con negativos y potencias; pide POT-SIG y POT-FRA. |
| LES-ALG-EXP-03 | Términos semejantes y suma de polinomios | `ALG-EXP-TERM` Términos semejantes<br>`ALG-EXP-ADI` Adición y sustracción de polinomios |  | Reducir y suprimir paréntesis: los mismos errores de signo. |
| LES-ALG-EXP-04 | Multiplicación de expresiones y potencias | `ALG-EXP-MUL` Multiplicación y distributividad<br>`ALG-EXP-POT` Expresiones con potencias |  | POT = multiplicar monomios con reglas de potencias. |
| LES-ALG-EXP-05 | División y fracciones algebraicas | `ALG-EXP-DIV` División de expresiones<br>`ALG-FRA-ALG` Fracciones algebraicas |  | FRA-ALG pide `ALG-FAC-ELEC` (migración 054), así que la clase va después de LES-ALG-FAC-05 y arrastra a ECU-03 (despeje). Decisión 2. |

### ALG-FAC · Productos notables y factorización

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-FAC-01 | Factor común y agrupación | `ALG-FAC-COMUN` Factor común<br>`ALG-FAC-AGRUP` Factorización por agrupación |  | Primera técnica: solo pide ALG-EXP-MUL. |
| LES-ALG-FAC-02 | Cuadrado de binomio y trinomio cuadrado perfecto | `ALG-NOT-BIN2` Cuadrado de binomio<br>`ALG-FAC-TRIN` Trinomio cuadrado perfecto |  | Producto notable junto a su factorización inversa. Idem 03 y 04. |
| LES-ALG-FAC-03 | Suma por diferencia y diferencia de cuadrados | `ALG-NOT-SUMDIF` Suma por diferencia<br>`ALG-FAC-DIFCUAD` Diferencia de cuadrados |  |  |
| LES-ALG-FAC-04 | Binomios con término común y trinomio x²+bx+c | `ALG-NOT-TERCOM` Binomios con término común<br>`ALG-FAC-TRINX` Trinomio x²+bx+c |  |  |
| LES-ALG-FAC-05 | Elegir el método de factorización | `ALG-FAC-ELEC` Elegir el método de factorización |  | Sola: integra 01–04. |
| LES-ALG-FAC-06 | Cubo de binomio | `ALG-NOT-BIN3` (pre) Cubo de binomio |  | `pre`, no lo pide ningún nodo. Se mantiene: el temario DEMRE no es claro. |

### ALG-PRO · Proporcionalidad

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-PRO-01 | Razón, proporción directa y reparto | `ALG-PRO-RAZ` Razón y proporción<br>`ALG-PRO-DIR` Proporción directa<br>`ALG-PRO-REPART` (pre) Reparto proporcional |  | REPART es `pre`, cuelga de DIR. |
| LES-ALG-PRO-02 | Proporción inversa y cómo distinguirla | `ALG-PRO-INV` Proporción inversa<br>`ALG-PRO-DIST` Distinguir directa de inversa |  |  |
| LES-ALG-PRO-03 | Representaciones de la proporcionalidad | `ALG-PRO-REP` Representaciones de proporcionalidad |  |  |
| LES-ALG-PRO-04 | Proporcionalidad compuesta | `ALG-PRO-COMP` Proporcionalidad compuesta |  |  |

### ALG-ECU · Ecuaciones e inecuaciones

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-ECU-01 | Ecuaciones lineales | `ALG-ECU-CONC` Concepto de ecuación y solución<br>`ALG-ECU-LIN` Resolución de ecuaciones lineales |  |  |
| LES-ALG-ECU-02 | Ecuaciones con paréntesis y fracciones | `ALG-ECU-PAR` Ecuaciones con paréntesis<br>`ALG-ECU-FRA` Ecuaciones con coeficientes fraccionarios |  |  |
| LES-ALG-ECU-03 | Despeje de fórmulas | `ALG-ECU-LIT` Despeje de fórmulas literales |  | Sola: la piden GEO-PIT-CAT, GEO-TRI-DESP, ALG-FCU-VERT, ALG-SIS-RES y más. |
| LES-ALG-ECU-04 | Inecuaciones: resolver y representar | `ALG-INE-CONC` Concepto de inecuación<br>`ALG-INE-LIN` Resolución de inecuaciones<br>`ALG-INE-REP` Representación del conjunto solución |  | Cadena CONC → LIN → REP. |
| LES-ALG-ECU-05 | Planteo de ecuaciones e inecuaciones | `ALG-ECU-PLAN` Planteo de ecuaciones<br>`ALG-INE-PLAN` Planteo de inecuaciones |  | Planteo al final: INE-PLAN pide ECU-PLAN directo. |

### ALG-SIS · Sistemas 2×2

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-SIS-01 | Sistemas 2×2: qué son y cómo se resuelven | `ALG-SIS-CONC` Solución como par ordenado<br>`ALG-SIS-RES` Resolución de sistemas |  |  |
| LES-ALG-SIS-02 | Planteo de sistemas | `ALG-SIS-PLAN` Planteo de sistemas |  |  |

### ALG-FLI · Función lineal y afín

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-FLI-01 | Qué es una función y cómo se evalúa | `ALG-FUN-CONC` Concepto de función, dominio y recorrido<br>`ALG-FUN-EVAL` Evaluación de funciones |  |  |
| LES-ALG-FLI-02 | Función lineal y afín: el intercepto | `ALG-FLI-CONC` Función lineal vs afín<br>`ALG-FLI-INTER` Intercepto |  |  |
| LES-ALG-FLI-03 | La pendiente: calcularla e interpretarla | `ALG-FLI-PEND` Pendiente: cálculo<br>`ALG-FLI-PEND-INT` Pendiente: interpretación |  |  |
| LES-ALG-FLI-04 | Tabla, gráfico y fórmula de una recta | `ALG-FUN-REP` Transitar entre representaciones<br>`ALG-FLI-TAB` Tablas de valores ↔ función<br>`ALG-FLI-GRAF` Graficar y leer rectas |  | GRAF recibe las tres: transitar entre tabla, gráfico y fórmula. |
| LES-ALG-FLI-05 | Modelación con función afín | `ALG-FLI-MOD` Modelación con función afín |  |  |

### ALG-FCU · Función cuadrática

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-FCU-01 | Ecuación de segundo grado y ecuaciones incompletas | `ALG-CUA-CONC` Ecuación de segundo grado<br>`ALG-CUA-INC` Ecuaciones incompletas |  |  |
| LES-ALG-FCU-02 | Resolver por factorización | `ALG-CUA-FAC` Resolución por factorización |  | Sola: pide FAC-ELEC (toda la factorización). |
| LES-ALG-FCU-03 | Fórmula general y discriminante | `ALG-CUA-FOR` Resolución por fórmula general<br>`ALG-CUA-DIS` Discriminante |  |  |
| LES-ALG-FCU-04 | Planteo de problemas de segundo grado | `ALG-CUA-PLAN` Planteo de problemas de 2° grado |  |  |
| LES-ALG-FCU-05 | Función cuadrática: forma, concavidad y parámetros | `ALG-FCU-CONC` Función cuadrática: forma y concavidad<br>`ALG-FCU-PARAM` Variación de parámetros |  |  |
| LES-ALG-FCU-06 | El vértice: máximo y mínimo | `ALG-FCU-VERT` Vértice: cálculo<br>`ALG-FCU-MAXMIN` Vértice: máximo o mínimo |  |  |
| LES-ALG-FCU-07 | Ceros y gráfico de la parábola | `ALG-FCU-CEROS` Ceros e intersección con ejes<br>`ALG-FCU-GRAF` Gráfico de la parábola |  | GRAF también pide VERT (06) y PARAM (05). |
| LES-ALG-FCU-08 | Modelación con cuadrática | `ALG-FCU-MOD` Modelación con cuadrática |  |  |

### GEO-FIG · Figuras geométricas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-FIG-01 | Figuras: clasificación, elementos y perímetro | `GEO-FIG-CLAS` (pre) Clasificación de figuras<br>`GEO-FIG-ELEM` Altura, base, apotema, diagonal<br>`GEO-PER-POL` Perímetro de polígonos |  | CLAS es `pre`. Raíz: no pide nada. |
| LES-GEO-FIG-02 | Área de triángulos, paralelogramos y trapecios | `GEO-ARE-TRI` Área de triángulos<br>`GEO-ARE-PAR` Área de paralelogramos y rombos<br>`GEO-ARE-TRAP` Área de trapecios |  |  |
| LES-GEO-FIG-03 | El círculo: elementos, perímetro y área | `GEO-CIR-ELEM` Elementos del círculo<br>`GEO-CIR-PER` Perímetro de la circunferencia<br>`GEO-CIR-ARE` Área del círculo |  |  |
| LES-GEO-FIG-04 | Unidades de superficie y áreas compuestas | `GEO-UNI-SUP` (pre) Unidades de longitud y superficie<br>`GEO-ARE-COMP` Áreas compuestas |  | COMP también pide TRAP (02) y CIR-ARE (03). |
| LES-GEO-FIG-05 | Pitágoras: hipotenusa y cateto | `GEO-PIT-HIP` Pitágoras: hipotenusa<br>`GEO-PIT-CAT` Pitágoras: cateto |  |  |
| LES-GEO-FIG-06 | Recíproco de Pitágoras y aplicaciones | `GEO-PIT-INV` Recíproco de Pitágoras<br>`GEO-PIT-APL` Pitágoras en contextos |  |  |

### GEO-CUE · Cuerpos geométricos

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-CUE-01 | Redes y área de prismas | `GEO-CUE-RED` Redes y desarrollos planos<br>`GEO-CUE-ARE-PRI` Área: paralelepípedos y cubos |  |  |
| LES-GEO-CUE-02 | Volumen de prismas, capacidad y área vs volumen | `GEO-CUE-VOL-PRI` Volumen: paralelepípedos y cubos<br>`GEO-CUE-ARE-VOL` Distinguir área de volumen<br>`GEO-CUE-UNID` (pre) Unidades de volumen y capacidad |  | ARE-VOL y UNID (`pre`) cuelgan de VOL-PRI. |
| LES-GEO-CUE-03 | El cilindro: área y volumen | `GEO-CUE-ARE-CIL` Área: cilindros<br>`GEO-CUE-VOL-CIL` Volumen: cilindros |  |  |
| LES-GEO-CUE-04 | Qué pasa al variar una dimensión | `GEO-CUE-DESP` Efecto de variar una dimensión |  |  |

### GEO-TRA · Transformaciones isométricas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-TRA-01 | El plano cartesiano: puntos y cuadrantes | `GEO-PLA-COORD` Puntos y coordenadas |  | Sola y temprano: es tronco (la piden SIS, FUN-REP, VEC, ROT, REF, HOM, REC-DIST). Incluye los cuadrantes (leer signos de las coordenadas), que no piden inecuaciones. |
| LES-GEO-TRA-02 | Vectores y traslación | `GEO-PLA-VEC` Vectores: componentes<br>`GEO-PLA-VEC-OP` Suma de vectores<br>`GEO-TRA-TRAS` Traslación |  |  |
| LES-GEO-TRA-03 | Reflexiones | `GEO-TRA-REF-EJE` Reflexión respecto a los ejes<br>`GEO-TRA-REF-REC` Reflexión respecto a una recta |  |  |
| LES-GEO-TRA-04 | Rotaciones y simetría central | `GEO-TRA-ROT-90` Rotación en múltiplos de 90°<br>`GEO-TRA-ROT-CEN` Rotación respecto a un punto<br>`GEO-TRA-SIM-CEN` Simetría central |  | Simetría central = rotación de 180°. También pide REF-EJE (03). |
| LES-GEO-TRA-05 | Propiedades de las isometrías | `GEO-TRA-PROP` Propiedades de las isometrías |  |  |
| LES-GEO-TRA-06 | Composición y transformación inversa | `GEO-TRA-COMP` Composición de transformaciones<br>`GEO-TRA-INV` Determinar la transformación o el estado inicial |  |  |
| LES-GEO-TRA-07 | Regiones del plano y pertenencia | `GEO-PLA-REG` Regiones y pertenencia |  | Sola, después de LES-ALG-ECU-04: una región es el conjunto solución de una inecuación llevado de la recta al plano. |

### GEO-SEM · Semejanza

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-SEM-01 | Semejanza y cálculo de lados | `GEO-SEM-CONC` Semejanza y razón de semejanza<br>`GEO-SEM-LADO` Cálculo de lados en figuras semejantes |  |  |
| LES-GEO-SEM-02 | Escalas, planos y mapas | `GEO-SEM-ESC` Escalas, planos y mapas |  |  |
| LES-GEO-SEM-03 | Razón entre áreas y volúmenes | `GEO-SEM-AREA` Razón entre áreas<br>`GEO-SEM-VOL` Razón entre volúmenes |  |  |
| LES-GEO-SEM-04 | Criterios de semejanza y Tales | `GEO-SEM-CRIT` (pre) Criterios de semejanza<br>`GEO-SEM-TALES` (pre) Teorema de Tales |  | Los dos `pre`. |

### EST-DAT · Representación de datos

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-EST-DAT-01 | Variables y tablas de frecuencia | `EST-DAT-VAR` (pre) Tipos de variables<br>`EST-TAB-ABS` Frecuencia absoluta<br>`EST-TAB-ACUM` Frecuencia acumulada |  |  |
| LES-EST-DAT-02 | Frecuencia relativa y gráfico circular | `EST-TAB-REL` Frecuencia relativa y porcentual<br>`EST-GRA-CIRC` Gráfico circular |  |  |
| LES-EST-DAT-03 | Gráfico de barras y pictogramas | `EST-GRA-BAR` Gráfico de barras<br>`EST-GRA-PICT` Pictogramas |  |  |
| LES-EST-DAT-04 | Gráfico de línea: elegir e interpretar | `EST-GRA-LIN` Gráfico de línea<br>`EST-GRA-ELEC` Elegir el gráfico adecuado<br>`EST-GRA-INT` Interpretación e inferencia |  | Pide ALG-FLI-GRAF: llega tarde en el orden de producción. |
| LES-EST-DAT-05 | El promedio y sus propiedades | `EST-PRO-CAL` Promedio: cálculo<br>`EST-PRO-PROP` Propiedades del promedio |  |  |
| LES-EST-DAT-06 | Promedio desde una tabla | `EST-PRO-TAB` Promedio desde tabla |  | Sola: promedio ponderado, error típico «dividir por el número de filas». |

### EST-POS · Medidas de posición

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-EST-POS-01 | Mediana y cuartiles | `EST-POS-MEDIANA` Mediana<br>`EST-POS-CUAR-CAL` Cuartiles: cálculo |  |  |
| LES-EST-POS-02 | Interpretar cuartiles y percentiles | `EST-POS-CUAR-INT` Cuartiles: interpretación<br>`EST-POS-PERC` Percentiles |  |  |
| LES-EST-POS-03 | El diagrama de cajón | `EST-POS-CAJ-CONS` Construcción del cajón<br>`EST-POS-CAJ-LEC` Lectura del cajón |  |  |
| LES-EST-POS-04 | Comparar distribuciones con cajones | `EST-POS-CAJ-COMP` Comparación de distribuciones |  |  |

### PRO-EVE · Probabilidad

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-PRO-EVE-01 | Espacio muestral y regla de Laplace | `PRO-EXP-MUES` Experimento aleatorio y espacio muestral<br>`PRO-EVE-LAP` Regla de Laplace<br>`PRO-EVE-ESC` Probabilidad como fracción, decimal y % |  | ESC es liviano: la misma probabilidad como fracción, decimal y %. |
| LES-PRO-EVE-02 | Conteo: principio multiplicativo y árbol | `PRO-CON-MULT` Principio multiplicativo de conteo<br>`PRO-CON-ARB` Diagrama de árbol |  | Ojo: el prefijo PRO-CON-MULT/ARB es de esta unidad, no de PRO-CON. |
| LES-PRO-EVE-03 | Complemento y regla aditiva | `PRO-EVE-COMP` Evento complementario<br>`PRO-ADI-EXC` Regla aditiva: excluyentes<br>`PRO-ADI-NOEXC` Regla aditiva: no excluyentes |  | NOEXC recibe las otras dos. |
| LES-PRO-EVE-04 | Regla multiplicativa | `PRO-MUL-IND` Regla multiplicativa: independientes<br>`PRO-MUL-DEP` Regla multiplicativa: sin reposición |  |  |

## Plan M2

Clases con nodos de nivel 2. El curso M2 ve además todo M1. Algunas viven en unidades mayormente M1
(ENT-07, FIG-07, SIS-03, POS-05): por eso su número no es 01.

### NUM-ENT · Enteros

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-ENT-07 | Valor absoluto | `NUM-ENT-ABS` Valor absoluto | ✅ publicada |  |

### NUM-REA · Reales

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-REA-01 | Racionales, irracionales y conjuntos numéricos | `NUM-REA-CLAS` Racionales e irracionales<br>`NUM-REA-CONJ` Operaciones de conjuntos numéricos |  |  |
| LES-NUM-REA-02 | Orden y aproximación en ℝ | `NUM-REA-ORD` Orden y aproximación en ℝ |  |  |
| LES-NUM-REA-03 | Operatoria con irracionales | `NUM-REA-IRR` Operatoria con irracionales |  |  |

### NUM-FIN · Matemática financiera

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-FIN-01 | Interés simple | `NUM-FIN-SIM` Interés simple |  |  |
| LES-NUM-FIN-02 | Interés compuesto y cómo distinguirlo del simple | `NUM-FIN-COM` Interés compuesto<br>`NUM-FIN-DIST` Distinguir simple de compuesto |  | El contraste simple/compuesto se enseña apenas aparece el compuesto. |
| LES-NUM-FIN-03 | Capitalización y ahorro previsional | `NUM-FIN-CAP` Capitalización y ahorro previsional |  |  |
| LES-NUM-FIN-04 | UF, UTM y créditos | `NUM-FIN-REAJ` Unidades reajustables (UF, UTM)<br>`NUM-FIN-CRED` Créditos: cuotas, tasa y costo total |  | CRED también pide DIST (clase 02). |

### NUM-LOG · Logaritmos

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-NUM-LOG-01 | El logaritmo como exponente | `NUM-LOG-CONC` Logaritmo como exponente<br>`NUM-LOG-REL` Relación potencia–raíz–logaritmo |  |  |
| LES-NUM-LOG-02 | Propiedades de los logaritmos y cambio de base | `NUM-LOG-PROD` Logaritmo de producto y cociente<br>`NUM-LOG-POT` Logaritmo de potencias y raíces<br>`NUM-LOG-BASE` Cambio de base |  | Cadena PROD → POT → BASE: las propiedades. |
| LES-NUM-LOG-03 | Ecuaciones exponenciales y logarítmicas | `NUM-LOG-ECU` Ecuaciones exponenciales y logarítmicas |  | Sola: cierre de la unidad, la usa ALG-FEX-MOD. |

### ALG-SIS · Sistemas 2×2

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-SIS-03 | Tipos de solución de un sistema | `ALG-SIS-TIPO` Tipos de solución |  |  |

### ALG-FEX · Potencia, exponencial y logarítmica

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-FEX-01 | Función potencia | `ALG-FPO-CONC` Función potencia<br>`ALG-FPO-GRAF` Gráfico según paridad del exponente |  |  |
| LES-ALG-FEX-02 | Función exponencial | `ALG-FEX-CONC` Función exponencial<br>`ALG-FEX-GRAF` Gráfico exponencial: asíntota |  |  |
| LES-ALG-FEX-03 | Función logarítmica | `ALG-FLO-CONC` Función logarítmica como inversa<br>`ALG-FLO-GRAF` Gráfico logarítmico: dominio y asíntota |  |  |
| LES-ALG-FEX-04 | Crecimiento y decaimiento | `ALG-FEX-MOD` Crecimiento y decaimiento |  | Sola: cierre, pide NUM-LOG-ECU y NUM-FIN-COM. |

### ALG-FTR · Trigonométricas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-ALG-FTR-01 | Radianes | `ALG-FTR-RAD` Radianes y conversión |  |  |
| LES-ALG-FTR-02 | Gráficos de seno y coseno | `ALG-FTR-SEN` Gráfico de seno<br>`ALG-FTR-COS` Gráfico de coseno |  |  |
| LES-ALG-FTR-03 | Amplitud, período, desfase y fenómenos periódicos | `ALG-FTR-PARAM` Amplitud, período y desfase<br>`ALG-FTR-MOD` Fenómenos periódicos |  |  |

### GEO-FIG · Figuras geométricas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-FIG-07 | Sector y segmento circular | `GEO-CIR-SECT` Sector y segmento circular |  | Único nodo M2 de la unidad. |

### GEO-HOM · Homotecia

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-HOM-01 | Homotecia: centro, razón y razón negativa | `GEO-HOM-CONC` Homotecia: centro y razón<br>`GEO-HOM-NEG` Homotecia de razón negativa |  |  |
| LES-GEO-HOM-02 | Homotecia en el plano cartesiano | `GEO-HOM-COORD` Homotecia en el plano |  |  |

### GEO-TRI · Trigonometría

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-TRI-01 | Razones trigonométricas y valores notables | `GEO-TRI-RAZ` Seno, coseno y tangente<br>`GEO-TRI-NOT` Valores notables |  |  |
| LES-GEO-TRI-02 | Despejar lados y ángulos: elevación y depresión | `GEO-TRI-DESP` Despeje de lados y ángulos<br>`GEO-TRI-APL` Elevación y depresión |  |  |
| LES-GEO-TRI-03 | Identidad fundamental | `GEO-TRI-IDEN` Identidad fundamental |  |  |

### GEO-CIRC · Circunferencia

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-CIRC-01 | Ángulos del centro, inscritos y arcos | `GEO-CIRC-CEN` Ángulo del centro<br>`GEO-CIRC-INS` Ángulo inscrito<br>`GEO-CIRC-ARC` Medida de arcos |  |  |
| LES-GEO-CIRC-02 | Cuerdas, secantes y tangentes | `GEO-CIRC-CUE` Cuerdas<br>`GEO-CIRC-SEC` Secantes y tangentes |  |  |

### GEO-REC · Esfera y rectas

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-GEO-REC-01 | La esfera: área y volumen | `GEO-ESF-ARE` Área de la esfera<br>`GEO-ESF-VOL` Volumen de la esfera |  |  |
| LES-GEO-REC-02 | Distancia y punto medio | `GEO-REC-DIST` Distancia y punto medio |  |  |
| LES-GEO-REC-03 | Ecuación de la recta | `GEO-REC-ECU` Ecuación de la recta |  |  |
| LES-GEO-REC-04 | Rectas paralelas, perpendiculares e intersección | `GEO-REC-PAR` Rectas paralelas<br>`GEO-REC-PERP` Rectas perpendiculares<br>`GEO-REC-INT` Intersección y posiciones relativas |  | Posiciones relativas: todas cuelgan de PAR. |

### EST-POS · Medidas de posición

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-EST-POS-05 | Rango y rango intercuartílico | `EST-POS-RIC` Rango y rango intercuartílico |  |  |

### EST-DIS · Dispersión

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-EST-DIS-01 | Varianza y desviación estándar | `EST-DIS-VAR` Varianza<br>`EST-DIS-DESV` Desviación estándar |  |  |
| LES-EST-DIS-02 | Interpretar y comparar dispersión | `EST-DIS-INT` Interpretación de la dispersión<br>`EST-DIS-COMP` Comparación de grupos por dispersión |  |  |

### PRO-CON · Condicional y combinatoria

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-PRO-CON-01 | Probabilidad condicional | `PRO-CON-CONC` Probabilidad condicional: concepto<br>`PRO-CON-CAL` Cálculo de P(A|B) |  |  |
| LES-PRO-CON-02 | Tablas de contingencia y probabilidad total | `PRO-CON-TAB` Tablas de contingencia<br>`PRO-CON-TOT` Probabilidad total |  |  |
| LES-PRO-CON-03 | Independencia | `PRO-CON-IND` Independencia vía condicional |  |  |
| LES-PRO-CON-04 | Factorial y permutaciones | `PRO-COM-FACT` Factorial<br>`PRO-COM-PERM` Permutaciones<br>`PRO-COM-REP` Permutaciones con repetición |  | Cadena FACT → PERM → REP. |
| LES-PRO-CON-05 | Combinaciones: ¿importa el orden? | `PRO-COM-COMB` Combinaciones<br>`PRO-COM-DIST` Decidir si el orden importa |  |  |

### PRO-MOD · Modelos probabilísticos

| Clase | Título | Nodos | Estado | Por qué así |
|---|---|---|---|---|
| LES-PRO-MOD-01 | Modelo binomial | `PRO-BIN-CONC` Modelo binomial: condiciones<br>`PRO-BIN-CAL` Cálculo binomial |  |  |
| LES-PRO-MOD-02 | Distribución normal, puntaje z y regla empírica | `PRO-NOR-CONC` Distribución normal<br>`PRO-NOR-EST` Puntaje z<br>`PRO-NOR-REG` Regla empírica |  | Cadena CONC → EST → REG. |

## Decisiones abiertas

1. ~~**DIVIS y MCM, ¿juntas o separadas?**~~ **Cerrada el 27 sep 2026: juntas en LES-NUM-ENT-05.** Arista directa,
   ambas `pre`, mismo tema. LES-NUM-ENT-06 queda como hueco en la numeración (ENT-07 ya está publicada y no se renumera).
2. ~~**`ALG-FRA-ALG` no depende de factorización en el grafo.**~~ **Cerrada el 27 sep 2026:** se agregó la arista
   `ALG-FAC-ELEC → ALG-FRA-ALG` (migración 054) y LES-ALG-EXP-05 se mantiene junta. Costo aceptado: EXP-05 se produce
   después de FAC-05 y con ella se atrasa ECU-03 (despeje), porque `ALG-ECU-LIT` pide `ALG-EXP-DIV`.
3. ~~**`ALG-NOT-BIN3` es `pre` y no lo pide ningún nodo.**~~ **Cerrada el 27 sep 2026:** se mantiene como clase propia;
   el temario DEMRE no deja claro si entra. Ver «Revisión de hojas» abajo.
4. ~~**GEO-TRA-01 junta COORD con REG.**~~ **Cerrada el 27 sep 2026:** separadas. COORD va sola en GEO-TRA-01 con los
   cuadrantes; REG pasa a GEO-TRA-07, después de ALG-ECU-04 (recta primero, plano después).

## Revisión de hojas (27 sep 2026)

De los 244 nodos, 59 no los pedía ningún otro. Se revisó cada uno: ¿es una meta del examen o le falta una arista?

**12 aristas nuevas** (migración 054, bloque final de `grafo.py`):

| Arista | Por qué |
|---|---|
| `NUM-FRA-SIG → ALG-ECU-FRA` | Las ecuaciones con fracciones traen coeficientes negativos |
| `NUM-FRA-SIG → ALG-FLI-PEND` | (y₂ − y₁)/(x₂ − x₁) da fracciones negativas |
| `NUM-RAI-RAC → GEO-TRI-NOT` | sen 45° = 1/√2 = √2/2 es racionalizar |
| `NUM-RAI-SIG → ALG-CUA-INC` | x² = 9 da ±3; x² = −4 no tiene solución real |
| `NUM-RAI-SIG → ALG-CUA-DIS` | Discriminante negativo es raíz de un negativo |
| `ALG-CUA-INC → ALG-FCU-CEROS` | Ceros de y = x² − k y de y = x² + bx |
| `ALG-CUA-DIS → ALG-FCU-CEROS` | El discriminante dice cuántas veces corta al eje x |
| `ALG-PRO-REP → ALG-FLI-CONC` | Graficar y = kx es el puente de proporción a función lineal |
| `NUM-LOG-REL → ALG-FLO-CONC` | El logaritmo como inversa de la exponencial |
| `GEO-CUE-UNID → GEO-CUE-VOL-CIL` | Volumen de cilindros en contexto se pide en litros |
| `EST-TAB-ACUM → EST-POS-MEDIANA` | La mediana desde una tabla se ubica con la frecuencia acumulada |
| `ALG-FAC-ELEC → ALG-FRA-ALG` | Decisión 2 |

**Hojas `pre` que siguen sueltas:** `ALG-NOT-BIN3` (se mantiene, decisión 3) y `ALG-PRO-REPART` (reparto
proporcional: es contenido M1, candidato a pasar de `pre` a `m1`; pendiente).

**El resto (47) son hojas legítimas:** modelación, planteo, aplicaciones, nodos de «distinguir/decidir» y casi todas
las M2. Son metas del examen, no escalones. `NUM-ENT-ABS` es M2 y ningún nodo M1 puede pedirla.

Una hoja no se posterga por serlo: las olas van por profundidad, y dentro de cada ola una hoja solo queda al final
de esa ola.

## Cómo se verificó

Script contra `grafo.py`: cobertura (cada nodo en exactamente una clase), nivel (sin M1+M2), conexión (los nodos
de cada clase forman un grupo conexo por aristas directas) y orden (ninguna arista contradice la numeración dentro
de la unidad). Si el grafo cambia, hay que volver a pasarlo.
