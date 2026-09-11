# -*- coding: utf-8 -*-
"""Grafo de conocimiento M1+M2. Nodos, aristas, validación."""

# nivel: pre | m1 | m2
N = {}
def n(code, nombre, nivel, unidad):
    N[code] = dict(nombre=nombre, nivel=nivel, unidad=unidad)

# ---------------- NÚMEROS ----------------
U = "NUM · Enteros"
n("NUM-ENT-DIVIS","Divisibilidad, múltiplos y divisores","pre",U)
n("NUM-ENT-MCM","mcm y MCD","pre",U)
n("NUM-ENT-REC","Enteros en la recta y orden","m1",U)
n("NUM-ENT-ADI","Adición y sustracción de enteros","m1",U)
n("NUM-ENT-MUL","Multiplicación y división de enteros","m1",U)
n("NUM-ENT-PRIOR","Prioridad de operaciones","m1",U)
n("NUM-ENT-ABS","Valor absoluto","m2",U)

U = "NUM · Racionales"
n("NUM-FRA-CONC","Concepto de fracción y equivalencia","m1",U)
n("NUM-FRA-SIMP","Simplificación de fracciones","m1",U)
n("NUM-FRA-ADI","Adición y sustracción de fracciones","m1",U)
n("NUM-FRA-MUL","Multiplicación y división de fracciones","m1",U)
n("NUM-FRA-SIG","Fracciones con signo","m1",U)
n("NUM-DEC-OPER","Operatoria con decimales","m1",U)
n("NUM-DEC-FRA","Conversión decimal ↔ fracción","m1",U)
n("NUM-RAC-ORDEN","Orden y comparación de racionales","m1",U)
n("NUM-RAC-RECTA","Racionales en la recta y densidad","m1",U)

U = "NUM · Porcentaje"
n("NUM-POR-CONC","Porcentaje como fracción y decimal","m1",U)
n("NUM-POR-PARTE","Porcentaje de una cantidad","m1",U)
n("NUM-POR-TASA","Qué porcentaje representa","m1",U)
n("NUM-POR-TOTAL","Total a partir de la parte","m1",U)
n("NUM-POR-VAR","Aumento y descuento","m1",U)
n("NUM-POR-INV","Porcentaje inverso","m1",U)
n("NUM-POR-SUCE","Porcentajes sucesivos","m1",U)

U = "NUM · Potencias"
n("NUM-POT-CONC","Concepto de potencia","m1",U)
n("NUM-POT-SIG","Base negativa y paridad del exponente","m1",U)
n("NUM-POT-PROD","Producto y cociente de igual base","m1",U)
n("NUM-POT-POT","Potencia de una potencia","m1",U)
n("NUM-POT-DIST","Potencia de producto y de cociente","m1",U)
n("NUM-POT-CERO","Exponente cero y uno","m1",U)
n("NUM-POT-NEG","Exponente negativo","m1",U)
n("NUM-POT-FRA","Base fraccionaria","m1",U)
n("NUM-POT-RAC","Exponente racional","m1",U)
n("NUM-POT-CIENT","Notación científica","pre",U)

U = "NUM · Raíces"
n("NUM-RAI-CONC","Concepto de raíz enésima","m1",U)
n("NUM-RAI-EQ","Equivalencia raíz ↔ potencia racional","m1",U)
n("NUM-RAI-DESC","Descomposición de raíces","m1",U)
n("NUM-RAI-MUL","Multiplicación y división de raíces","m1",U)
n("NUM-RAI-ADI","Adición y sustracción de raíces","m1",U)
n("NUM-RAI-RAC","Racionalización","m1",U)
n("NUM-RAI-SIG","Signo y raíces de índice par","m1",U)

U = "NUM · Reales (M2)"
n("NUM-REA-CLAS","Racionales e irracionales","m2",U)
n("NUM-REA-IRR","Operatoria con irracionales","m2",U)
n("NUM-REA-ORD","Orden y aproximación en ℝ","m2",U)
n("NUM-REA-CONJ","Operaciones de conjuntos numéricos","m2",U)

U = "NUM · Matemática financiera (M2)"
n("NUM-FIN-SIM","Interés simple","m2",U)
n("NUM-FIN-COM","Interés compuesto","m2",U)
n("NUM-FIN-DIST","Distinguir simple de compuesto","m2",U)
n("NUM-FIN-CRED","Créditos: cuotas, tasa y costo total","m2",U)
n("NUM-FIN-CAP","Capitalización y ahorro previsional","m2",U)
n("NUM-FIN-REAJ","Unidades reajustables (UF, UTM)","m2",U)

U = "NUM · Logaritmos (M2)"
n("NUM-LOG-CONC","Logaritmo como exponente","m2",U)
n("NUM-LOG-REL","Relación potencia–raíz–logaritmo","m2",U)
n("NUM-LOG-PROD","Logaritmo de producto y cociente","m2",U)
n("NUM-LOG-POT","Logaritmo de potencias y raíces","m2",U)
n("NUM-LOG-BASE","Cambio de base","m2",U)
n("NUM-LOG-ECU","Ecuaciones exponenciales y logarítmicas","m2",U)

# ---------------- ÁLGEBRA ----------------
U = "ALG · Expresiones algebraicas"
n("ALG-EXP-LENG","Lenguaje algebraico","m1",U)
n("ALG-EXP-VAL","Valorización de expresiones","m1",U)
n("ALG-EXP-TERM","Términos semejantes","m1",U)
n("ALG-EXP-ADI","Adición y sustracción de polinomios","m1",U)
n("ALG-EXP-MUL","Multiplicación y distributividad","m1",U)
n("ALG-EXP-DIV","División de expresiones","m1",U)
n("ALG-EXP-POT","Expresiones con potencias","m1",U)
n("ALG-FRA-ALG","Fracciones algebraicas","m1",U)

U = "ALG · Productos notables y factorización"
n("ALG-NOT-BIN2","Cuadrado de binomio","m1",U)
n("ALG-NOT-SUMDIF","Suma por diferencia","m1",U)
n("ALG-NOT-TERCOM","Binomios con término común","m1",U)
n("ALG-NOT-BIN3","Cubo de binomio","pre",U)
n("ALG-FAC-COMUN","Factor común","m1",U)
n("ALG-FAC-DIFCUAD","Diferencia de cuadrados","m1",U)
n("ALG-FAC-TRIN","Trinomio cuadrado perfecto","m1",U)
n("ALG-FAC-TRINX","Trinomio x²+bx+c","m1",U)
n("ALG-FAC-AGRUP","Factorización por agrupación","m1",U)
n("ALG-FAC-ELEC","Elegir el método de factorización","m1",U)

U = "ALG · Proporcionalidad"
n("ALG-PRO-RAZ","Razón y proporción","m1",U)
n("ALG-PRO-DIR","Proporción directa","m1",U)
n("ALG-PRO-INV","Proporción inversa","m1",U)
n("ALG-PRO-DIST","Distinguir directa de inversa","m1",U)
n("ALG-PRO-REP","Representaciones de proporcionalidad","m1",U)
n("ALG-PRO-COMP","Proporcionalidad compuesta","m1",U)
n("ALG-PRO-REPART","Reparto proporcional","pre",U)

U = "ALG · Ecuaciones e inecuaciones"
n("ALG-ECU-CONC","Concepto de ecuación y solución","m1",U)
n("ALG-ECU-LIN","Resolución de ecuaciones lineales","m1",U)
n("ALG-ECU-PAR","Ecuaciones con paréntesis","m1",U)
n("ALG-ECU-FRA","Ecuaciones con coeficientes fraccionarios","m1",U)
n("ALG-ECU-LIT","Despeje de fórmulas literales","m1",U)
n("ALG-ECU-PLAN","Planteo de ecuaciones","m1",U)
n("ALG-INE-CONC","Concepto de inecuación","m1",U)
n("ALG-INE-LIN","Resolución de inecuaciones","m1",U)
n("ALG-INE-REP","Representación del conjunto solución","m1",U)
n("ALG-INE-PLAN","Planteo de inecuaciones","m1",U)

U = "ALG · Sistemas 2×2"
n("ALG-SIS-CONC","Solución como par ordenado","m1",U)
n("ALG-SIS-RES","Resolución de sistemas","m1",U)
n("ALG-SIS-PLAN","Planteo de sistemas","m1",U)
n("ALG-SIS-TIPO","Tipos de solución","m2",U)

U = "ALG · Función lineal y afín"
n("ALG-FUN-CONC","Concepto de función, dominio y recorrido","m1",U)
n("ALG-FUN-EVAL","Evaluación de funciones","m1",U)
n("ALG-FUN-REP","Transitar entre representaciones","m1",U)
n("ALG-FLI-CONC","Función lineal vs afín","m1",U)
n("ALG-FLI-PEND","Pendiente: cálculo","m1",U)
n("ALG-FLI-PEND-INT","Pendiente: interpretación","m1",U)
n("ALG-FLI-INTER","Intercepto","m1",U)
n("ALG-FLI-TAB","Tablas de valores ↔ función","m1",U)
n("ALG-FLI-GRAF","Graficar y leer rectas","m1",U)
n("ALG-FLI-MOD","Modelación con función afín","m1",U)

U = "ALG · Función cuadrática"
n("ALG-CUA-CONC","Ecuación de segundo grado","m1",U)
n("ALG-CUA-INC","Ecuaciones incompletas","m1",U)
n("ALG-CUA-FAC","Resolución por factorización","m1",U)
n("ALG-CUA-FOR","Resolución por fórmula general","m1",U)
n("ALG-CUA-DIS","Discriminante","m1",U)
n("ALG-CUA-PLAN","Planteo de problemas de 2° grado","m1",U)
n("ALG-FCU-CONC","Función cuadrática: forma y concavidad","m1",U)
n("ALG-FCU-PARAM","Variación de parámetros","m1",U)
n("ALG-FCU-VERT","Vértice: cálculo","m1",U)
n("ALG-FCU-MAXMIN","Vértice: máximo o mínimo","m1",U)
n("ALG-FCU-CEROS","Ceros e intersección con ejes","m1",U)
n("ALG-FCU-GRAF","Gráfico de la parábola","m1",U)
n("ALG-FCU-MOD","Modelación con cuadrática","m1",U)

U = "ALG · Potencia, exponencial y logarítmica (M2)"
n("ALG-FPO-CONC","Función potencia","m2",U)
n("ALG-FPO-GRAF","Gráfico según paridad del exponente","m2",U)
n("ALG-FEX-CONC","Función exponencial","m2",U)
n("ALG-FEX-GRAF","Gráfico exponencial: asíntota","m2",U)
n("ALG-FEX-MOD","Crecimiento y decaimiento","m2",U)
n("ALG-FLO-CONC","Función logarítmica como inversa","m2",U)
n("ALG-FLO-GRAF","Gráfico logarítmico: dominio y asíntota","m2",U)

U = "ALG · Trigonométricas (M2)"
n("ALG-FTR-RAD","Radianes y conversión","m2",U)
n("ALG-FTR-SEN","Gráfico de seno","m2",U)
n("ALG-FTR-COS","Gráfico de coseno","m2",U)
n("ALG-FTR-PARAM","Amplitud, período y desfase","m2",U)
n("ALG-FTR-MOD","Fenómenos periódicos","m2",U)

# ---------------- GEOMETRÍA ----------------
U = "GEO · Figuras geométricas"
n("GEO-FIG-CLAS","Clasificación de figuras","pre",U)
n("GEO-FIG-ELEM","Altura, base, apotema, diagonal","m1",U)
n("GEO-PIT-HIP","Pitágoras: hipotenusa","m1",U)
n("GEO-PIT-CAT","Pitágoras: cateto","m1",U)
n("GEO-PIT-INV","Recíproco de Pitágoras","m1",U)
n("GEO-PIT-APL","Pitágoras en contextos","m1",U)
n("GEO-PER-POL","Perímetro de polígonos","m1",U)
n("GEO-ARE-TRI","Área de triángulos","m1",U)
n("GEO-ARE-PAR","Área de paralelogramos y rombos","m1",U)
n("GEO-ARE-TRAP","Área de trapecios","m1",U)
n("GEO-CIR-ELEM","Elementos del círculo","m1",U)
n("GEO-CIR-PER","Perímetro de la circunferencia","m1",U)
n("GEO-CIR-ARE","Área del círculo","m1",U)
n("GEO-CIR-SECT","Sector y segmento circular","m2",U)
n("GEO-ARE-COMP","Áreas compuestas","m1",U)
n("GEO-UNI-SUP","Unidades de longitud y superficie","pre",U)

U = "GEO · Cuerpos geométricos"
n("GEO-CUE-RED","Redes y desarrollos planos","m1",U)
n("GEO-CUE-ARE-PRI","Área: paralelepípedos y cubos","m1",U)
n("GEO-CUE-ARE-CIL","Área: cilindros","m1",U)
n("GEO-CUE-VOL-PRI","Volumen: paralelepípedos y cubos","m1",U)
n("GEO-CUE-VOL-CIL","Volumen: cilindros","m1",U)
n("GEO-CUE-ARE-VOL","Distinguir área de volumen","m1",U)
n("GEO-CUE-DESP","Efecto de variar una dimensión","m1",U)
n("GEO-CUE-UNID","Unidades de volumen y capacidad","pre",U)

U = "GEO · Transformaciones isométricas"
n("GEO-PLA-COORD","Puntos y coordenadas","m1",U)
n("GEO-PLA-REG","Regiones y pertenencia","m1",U)
n("GEO-PLA-VEC","Vectores: componentes","m1",U)
n("GEO-PLA-VEC-OP","Suma de vectores","m1",U)
n("GEO-TRA-TRAS","Traslación","m1",U)
n("GEO-TRA-ROT-90","Rotación en múltiplos de 90°","m1",U)
n("GEO-TRA-ROT-CEN","Rotación respecto a un punto","m1",U)
n("GEO-TRA-REF-EJE","Reflexión respecto a los ejes","m1",U)
n("GEO-TRA-REF-REC","Reflexión respecto a una recta","m1",U)
n("GEO-TRA-SIM-CEN","Simetría central","m1",U)
n("GEO-TRA-COMP","Composición de transformaciones","m1",U)
n("GEO-TRA-INV","Determinar la transformación o el estado inicial","m1",U)
n("GEO-TRA-PROP","Propiedades de las isometrías","m1",U)

U = "GEO · Semejanza"
n("GEO-SEM-CONC","Semejanza y razón de semejanza","m1",U)
n("GEO-SEM-CRIT","Criterios de semejanza","pre",U)
n("GEO-SEM-LADO","Cálculo de lados en figuras semejantes","m1",U)
n("GEO-SEM-ESC","Escalas, planos y mapas","m1",U)
n("GEO-SEM-AREA","Razón entre áreas","m1",U)
n("GEO-SEM-VOL","Razón entre volúmenes","m1",U)
n("GEO-SEM-TALES","Teorema de Tales","pre",U)

U = "GEO · Homotecia (M2)"
n("GEO-HOM-CONC","Homotecia: centro y razón","m2",U)
n("GEO-HOM-NEG","Homotecia de razón negativa","m2",U)
n("GEO-HOM-COORD","Homotecia en el plano","m2",U)

U = "GEO · Trigonometría (M2)"
n("GEO-TRI-RAZ","Seno, coseno y tangente","m2",U)
n("GEO-TRI-NOT","Valores notables","m2",U)
n("GEO-TRI-DESP","Despeje de lados y ángulos","m2",U)
n("GEO-TRI-APL","Elevación y depresión","m2",U)
n("GEO-TRI-IDEN","Identidad fundamental","m2",U)

U = "GEO · Circunferencia (M2)"
n("GEO-CIRC-CEN","Ángulo del centro","m2",U)
n("GEO-CIRC-INS","Ángulo inscrito","m2",U)
n("GEO-CIRC-ARC","Medida de arcos","m2",U)
n("GEO-CIRC-CUE","Cuerdas","m2",U)
n("GEO-CIRC-SEC","Secantes y tangentes","m2",U)

U = "GEO · Esfera y rectas (M2)"
n("GEO-ESF-ARE","Área de la esfera","m2",U)
n("GEO-ESF-VOL","Volumen de la esfera","m2",U)
n("GEO-REC-DIST","Distancia y punto medio","m2",U)
n("GEO-REC-ECU","Ecuación de la recta","m2",U)
n("GEO-REC-PAR","Rectas paralelas","m2",U)
n("GEO-REC-PERP","Rectas perpendiculares","m2",U)
n("GEO-REC-INT","Intersección y posiciones relativas","m2",U)

# ---------------- PROBABILIDAD Y ESTADÍSTICA ----------------
U = "EST · Representación de datos"
n("EST-DAT-VAR","Tipos de variables","pre",U)
n("EST-TAB-ABS","Frecuencia absoluta","m1",U)
n("EST-TAB-REL","Frecuencia relativa y porcentual","m1",U)
n("EST-TAB-ACUM","Frecuencia acumulada","m1",U)
n("EST-GRA-BAR","Gráfico de barras","m1",U)
n("EST-GRA-CIRC","Gráfico circular","m1",U)
n("EST-GRA-LIN","Gráfico de línea","m1",U)
n("EST-GRA-PICT","Pictogramas","m1",U)
n("EST-GRA-ELEC","Elegir el gráfico adecuado","m1",U)
n("EST-GRA-INT","Interpretación e inferencia","m1",U)
n("EST-PRO-CAL","Promedio: cálculo","m1",U)
n("EST-PRO-TAB","Promedio desde tabla","m1",U)
n("EST-PRO-PROP","Propiedades del promedio","m1",U)

U = "EST · Medidas de posición"
n("EST-POS-MEDIANA","Mediana","m1",U)
n("EST-POS-CUAR-CAL","Cuartiles: cálculo","m1",U)
n("EST-POS-CUAR-INT","Cuartiles: interpretación","m1",U)
n("EST-POS-PERC","Percentiles","m1",U)
n("EST-POS-CAJ-CONS","Construcción del cajón","m1",U)
n("EST-POS-CAJ-LEC","Lectura del cajón","m1",U)
n("EST-POS-CAJ-COMP","Comparación de distribuciones","m1",U)
n("EST-POS-RIC","Rango y rango intercuartílico","m2",U)

U = "EST · Dispersión (M2)"
n("EST-DIS-VAR","Varianza","m2",U)
n("EST-DIS-DESV","Desviación estándar","m2",U)
n("EST-DIS-INT","Interpretación de la dispersión","m2",U)
n("EST-DIS-COMP","Comparación de grupos por dispersión","m2",U)

U = "PRO · Probabilidad"
n("PRO-EXP-MUES","Experimento aleatorio y espacio muestral","m1",U)
n("PRO-EVE-LAP","Regla de Laplace","m1",U)
n("PRO-EVE-COMP","Evento complementario","m1",U)
n("PRO-EVE-ESC","Probabilidad como fracción, decimal y %","m1",U)
n("PRO-CON-MULT","Principio multiplicativo de conteo","m1",U)
n("PRO-CON-ARB","Diagrama de árbol","m1",U)
n("PRO-ADI-EXC","Regla aditiva: excluyentes","m1",U)
n("PRO-ADI-NOEXC","Regla aditiva: no excluyentes","m1",U)
n("PRO-MUL-IND","Regla multiplicativa: independientes","m1",U)
n("PRO-MUL-DEP","Regla multiplicativa: sin reposición","m1",U)

U = "PRO · Condicional y combinatoria (M2)"
n("PRO-CON-CONC","Probabilidad condicional: concepto","m2",U)
n("PRO-CON-CAL","Cálculo de P(A|B)","m2",U)
n("PRO-CON-TAB","Tablas de contingencia","m2",U)
n("PRO-CON-IND","Independencia vía condicional","m2",U)
n("PRO-CON-TOT","Probabilidad total","m2",U)
n("PRO-COM-FACT","Factorial","m2",U)
n("PRO-COM-PERM","Permutaciones","m2",U)
n("PRO-COM-REP","Permutaciones con repetición","m2",U)
n("PRO-COM-COMB","Combinaciones","m2",U)
n("PRO-COM-DIST","Decidir si el orden importa","m2",U)

U = "PRO · Modelos probabilísticos (M2)"
n("PRO-BIN-CONC","Modelo binomial: condiciones","m2",U)
n("PRO-BIN-CAL","Cálculo binomial","m2",U)
n("PRO-NOR-CONC","Distribución normal","m2",U)
n("PRO-NOR-EST","Puntaje z","m2",U)
n("PRO-NOR-REG","Regla empírica","m2",U)

# ---------------- ARISTAS ----------------
E = []
def e(*pares):
    for a, b in pares:
        E.append((a, b))

# --- Números: enteros ---
e(("NUM-ENT-REC","NUM-ENT-ADI"),("NUM-ENT-ADI","NUM-ENT-MUL"),
  ("NUM-ENT-MUL","NUM-ENT-PRIOR"),("NUM-ENT-REC","NUM-ENT-ABS"),
  ("NUM-ENT-DIVIS","NUM-ENT-MCM"),("NUM-ENT-MUL","NUM-ENT-DIVIS"))
# --- Números: racionales ---
e(("NUM-ENT-DIVIS","NUM-FRA-CONC"),("NUM-FRA-CONC","NUM-FRA-SIMP"),
  ("NUM-ENT-MCM","NUM-FRA-ADI"),("NUM-FRA-SIMP","NUM-FRA-ADI"),
  ("NUM-FRA-CONC","NUM-FRA-MUL"),("NUM-FRA-SIMP","NUM-FRA-MUL"),
  ("NUM-FRA-ADI","NUM-FRA-SIG"),("NUM-FRA-MUL","NUM-FRA-SIG"),
  ("NUM-ENT-ADI","NUM-FRA-SIG"),
  ("NUM-FRA-CONC","NUM-DEC-FRA"),("NUM-DEC-OPER","NUM-DEC-FRA"),
  ("NUM-ENT-PRIOR","NUM-DEC-OPER"),
  ("NUM-FRA-CONC","NUM-RAC-ORDEN"),("NUM-DEC-FRA","NUM-RAC-ORDEN"),
  ("NUM-ENT-REC","NUM-RAC-ORDEN"),("NUM-RAC-ORDEN","NUM-RAC-RECTA"))
# --- Números: porcentaje ---
e(("NUM-FRA-CONC","NUM-POR-CONC"),("NUM-DEC-FRA","NUM-POR-CONC"),
  ("NUM-POR-CONC","NUM-POR-PARTE"),("NUM-POR-CONC","NUM-POR-TASA"),
  ("NUM-POR-CONC","NUM-POR-TOTAL"),("NUM-FRA-MUL","NUM-POR-PARTE"),
  ("NUM-POR-PARTE","NUM-POR-VAR"),("NUM-POR-VAR","NUM-POR-INV"),
  ("NUM-POR-TOTAL","NUM-POR-INV"),("NUM-POR-VAR","NUM-POR-SUCE"))
# --- Números: potencias ---
e(("NUM-ENT-MUL","NUM-POT-CONC"),("NUM-POT-CONC","NUM-POT-SIG"),
  ("NUM-ENT-MUL","NUM-POT-SIG"),("NUM-POT-CONC","NUM-POT-PROD"),
  ("NUM-POT-PROD","NUM-POT-POT"),("NUM-POT-PROD","NUM-POT-DIST"),
  ("NUM-POT-PROD","NUM-POT-CERO"),("NUM-POT-CERO","NUM-POT-NEG"),
  ("NUM-FRA-MUL","NUM-POT-FRA"),("NUM-POT-DIST","NUM-POT-FRA"),
  ("NUM-POT-NEG","NUM-POT-RAC"),("NUM-POT-FRA","NUM-POT-RAC"),
  ("NUM-POT-NEG","NUM-POT-CIENT"),("NUM-POT-PROD","NUM-POT-CIENT"))
# --- Números: raíces ---
e(("NUM-POT-CONC","NUM-RAI-CONC"),("NUM-RAI-CONC","NUM-RAI-SIG"),
  ("NUM-POT-SIG","NUM-RAI-SIG"),("NUM-POT-RAC","NUM-RAI-EQ"),
  ("NUM-RAI-CONC","NUM-RAI-EQ"),("NUM-RAI-CONC","NUM-RAI-DESC"),
  ("NUM-ENT-DIVIS","NUM-RAI-DESC"),("NUM-RAI-EQ","NUM-RAI-MUL"),
  ("NUM-RAI-DESC","NUM-RAI-ADI"),("NUM-RAI-MUL","NUM-RAI-RAC"),
  ("NUM-FRA-MUL","NUM-RAI-RAC"))
# --- Números: reales (M2) ---
e(("NUM-RAI-CONC","NUM-REA-CLAS"),("NUM-DEC-FRA","NUM-REA-CLAS"),
  ("NUM-REA-CLAS","NUM-REA-IRR"),("NUM-RAI-ADI","NUM-REA-IRR"),
  ("NUM-RAC-ORDEN","NUM-REA-ORD"),("NUM-REA-CLAS","NUM-REA-ORD"),
  ("NUM-REA-CLAS","NUM-REA-CONJ"))
# --- Números: financiera (M2) ---
e(("NUM-POR-VAR","NUM-FIN-SIM"),("NUM-POT-CONC","NUM-FIN-COM"),
  ("NUM-POR-SUCE","NUM-FIN-COM"),("NUM-FIN-SIM","NUM-FIN-DIST"),
  ("NUM-FIN-COM","NUM-FIN-DIST"),("NUM-FIN-DIST","NUM-FIN-CRED"),
  ("NUM-FIN-COM","NUM-FIN-CAP"),("NUM-POR-VAR","NUM-FIN-REAJ"),
  ("NUM-FIN-REAJ","NUM-FIN-CRED"))
# --- Números: logaritmos (M2) ---
e(("NUM-POT-NEG","NUM-LOG-CONC"),("NUM-POT-CONC","NUM-LOG-CONC"),
  ("NUM-LOG-CONC","NUM-LOG-REL"),("NUM-RAI-EQ","NUM-LOG-REL"),
  ("NUM-POT-RAC","NUM-LOG-REL"),("NUM-LOG-CONC","NUM-LOG-PROD"),
  ("NUM-POT-PROD","NUM-LOG-PROD"),("NUM-LOG-PROD","NUM-LOG-POT"),
  ("NUM-POT-POT","NUM-LOG-POT"),("NUM-LOG-POT","NUM-LOG-BASE"),
  ("NUM-LOG-BASE","NUM-LOG-ECU"),("NUM-POT-CIENT","NUM-LOG-BASE"))

# --- Álgebra: expresiones ---
e(("NUM-ENT-PRIOR","ALG-EXP-VAL"),("NUM-POT-SIG","ALG-EXP-VAL"),
  ("NUM-POT-FRA","ALG-EXP-VAL"),("ALG-EXP-LENG","ALG-EXP-VAL"),
  ("ALG-EXP-LENG","ALG-EXP-TERM"),("NUM-ENT-MUL","ALG-EXP-TERM"),
  ("ALG-EXP-TERM","ALG-EXP-ADI"),("ALG-EXP-ADI","ALG-EXP-MUL"),
  ("ALG-EXP-MUL","ALG-EXP-DIV"),("NUM-POT-PROD","ALG-EXP-POT"),
  ("ALG-EXP-MUL","ALG-EXP-POT"),("ALG-EXP-DIV","ALG-FRA-ALG"),
  ("NUM-FRA-SIMP","ALG-FRA-ALG"))
# --- Álgebra: notables y factorización ---
e(("ALG-EXP-MUL","ALG-NOT-BIN2"),("NUM-POT-CONC","ALG-NOT-BIN2"),
  ("ALG-NOT-BIN2","ALG-NOT-SUMDIF"),("ALG-NOT-BIN2","ALG-NOT-TERCOM"),
  ("ALG-NOT-BIN2","ALG-NOT-BIN3"),
  ("ALG-EXP-MUL","ALG-FAC-COMUN"),("ALG-NOT-SUMDIF","ALG-FAC-DIFCUAD"),
  ("ALG-NOT-BIN2","ALG-FAC-TRIN"),("ALG-NOT-TERCOM","ALG-FAC-TRINX"),
  ("ALG-FAC-COMUN","ALG-FAC-AGRUP"),
  ("ALG-FAC-COMUN","ALG-FAC-ELEC"),("ALG-FAC-DIFCUAD","ALG-FAC-ELEC"),
  ("ALG-FAC-TRIN","ALG-FAC-ELEC"),("ALG-FAC-TRINX","ALG-FAC-ELEC"),
  ("ALG-FAC-AGRUP","ALG-FAC-ELEC"))
# --- Álgebra: proporcionalidad ---
e(("NUM-FRA-CONC","ALG-PRO-RAZ"),("NUM-POR-CONC","ALG-PRO-RAZ"),
  ("ALG-PRO-RAZ","ALG-PRO-DIR"),("ALG-PRO-RAZ","ALG-PRO-INV"),
  ("ALG-PRO-DIR","ALG-PRO-DIST"),("ALG-PRO-INV","ALG-PRO-DIST"),
  ("ALG-PRO-DIR","ALG-PRO-REP"),("ALG-PRO-DIST","ALG-PRO-COMP"),
  ("ALG-PRO-DIR","ALG-PRO-REPART"))
# --- Álgebra: ecuaciones ---
e(("ALG-EXP-LENG","ALG-ECU-CONC"),("ALG-ECU-CONC","ALG-ECU-LIN"),
  ("ALG-EXP-TERM","ALG-ECU-LIN"),("NUM-ENT-ADI","ALG-ECU-LIN"),
  ("ALG-ECU-LIN","ALG-ECU-PAR"),("ALG-EXP-MUL","ALG-ECU-PAR"),
  ("ALG-ECU-PAR","ALG-ECU-FRA"),("NUM-FRA-ADI","ALG-ECU-FRA"),
  ("NUM-ENT-MCM","ALG-ECU-FRA"),
  ("ALG-ECU-LIN","ALG-ECU-LIT"),("ALG-EXP-DIV","ALG-ECU-LIT"),
  ("ALG-EXP-LENG","ALG-ECU-PLAN"),("ALG-ECU-LIN","ALG-ECU-PLAN"),
  ("ALG-ECU-CONC","ALG-INE-CONC"),("NUM-ENT-REC","ALG-INE-CONC"),
  ("ALG-INE-CONC","ALG-INE-LIN"),("ALG-ECU-LIN","ALG-INE-LIN"),
  ("NUM-ENT-MUL","ALG-INE-LIN"),("ALG-INE-LIN","ALG-INE-REP"),
  ("NUM-RAC-RECTA","ALG-INE-REP"),
  ("ALG-INE-LIN","ALG-INE-PLAN"),("ALG-ECU-PLAN","ALG-INE-PLAN"))
# --- Álgebra: sistemas ---
e(("ALG-ECU-LIN","ALG-SIS-CONC"),("GEO-PLA-COORD","ALG-SIS-CONC"),
  ("ALG-SIS-CONC","ALG-SIS-RES"),("ALG-ECU-LIT","ALG-SIS-RES"),
  ("ALG-SIS-RES","ALG-SIS-PLAN"),("ALG-ECU-PLAN","ALG-SIS-PLAN"),
  ("ALG-SIS-RES","ALG-SIS-TIPO"),("ALG-FLI-GRAF","ALG-SIS-TIPO"))
# --- Álgebra: funciones lineales ---
e(("ALG-EXP-VAL","ALG-FUN-CONC"),("ALG-EXP-LENG","ALG-FUN-CONC"),
  ("ALG-FUN-CONC","ALG-FUN-EVAL"),("ALG-EXP-VAL","ALG-FUN-EVAL"),
  ("ALG-FUN-CONC","ALG-FUN-REP"),("GEO-PLA-COORD","ALG-FUN-REP"),
  ("ALG-FUN-CONC","ALG-FLI-CONC"),("ALG-PRO-DIR","ALG-FLI-CONC"),
  ("ALG-FLI-CONC","ALG-FLI-PEND"),("NUM-FRA-CONC","ALG-FLI-PEND"),
  ("ALG-FLI-PEND","ALG-FLI-PEND-INT"),("ALG-FLI-CONC","ALG-FLI-INTER"),
  ("ALG-FUN-EVAL","ALG-FLI-TAB"),
  ("ALG-FLI-PEND","ALG-FLI-GRAF"),("ALG-FLI-INTER","ALG-FLI-GRAF"),
  ("ALG-FUN-REP","ALG-FLI-GRAF"),("ALG-FLI-TAB","ALG-FLI-GRAF"),
  ("ALG-FLI-PEND-INT","ALG-FLI-MOD"),("ALG-FLI-GRAF","ALG-FLI-MOD"),
  ("ALG-ECU-PLAN","ALG-FLI-MOD"))
# --- Álgebra: cuadrática ---
e(("ALG-ECU-LIN","ALG-CUA-CONC"),("NUM-POT-CONC","ALG-CUA-CONC"),
  ("ALG-CUA-CONC","ALG-CUA-INC"),("ALG-FAC-COMUN","ALG-CUA-INC"),
  ("ALG-CUA-CONC","ALG-CUA-FAC"),("ALG-FAC-TRINX","ALG-CUA-FAC"),
  ("ALG-FAC-ELEC","ALG-CUA-FAC"),
  ("ALG-CUA-CONC","ALG-CUA-FOR"),("NUM-RAI-CONC","ALG-CUA-FOR"),
  ("NUM-RAI-DESC","ALG-CUA-FOR"),("ALG-EXP-VAL","ALG-CUA-FOR"),
  ("ALG-CUA-FOR","ALG-CUA-DIS"),
  ("ALG-CUA-FAC","ALG-CUA-PLAN"),("ALG-ECU-PLAN","ALG-CUA-PLAN"),
  ("ALG-CUA-CONC","ALG-FCU-CONC"),("ALG-FUN-CONC","ALG-FCU-CONC"),
  ("ALG-FCU-CONC","ALG-FCU-PARAM"),("ALG-FCU-CONC","ALG-FCU-VERT"),
  ("ALG-ECU-LIT","ALG-FCU-VERT"),("ALG-FCU-VERT","ALG-FCU-MAXMIN"),
  ("ALG-CUA-FAC","ALG-FCU-CEROS"),("ALG-FCU-CONC","ALG-FCU-CEROS"),
  ("ALG-FCU-VERT","ALG-FCU-GRAF"),("ALG-FCU-CEROS","ALG-FCU-GRAF"),
  ("ALG-FCU-PARAM","ALG-FCU-GRAF"),("ALG-FLI-GRAF","ALG-FCU-GRAF"),
  ("ALG-FCU-MAXMIN","ALG-FCU-MOD"),("ALG-CUA-PLAN","ALG-FCU-MOD"))
# --- Álgebra: exponencial, log, trig (M2) ---
e(("ALG-EXP-POT","ALG-FPO-CONC"),("ALG-FCU-CONC","ALG-FPO-CONC"),
  ("ALG-FPO-CONC","ALG-FPO-GRAF"),("NUM-POT-SIG","ALG-FPO-GRAF"),
  ("ALG-FCU-GRAF","ALG-FPO-GRAF"),
  ("NUM-POT-RAC","ALG-FEX-CONC"),("ALG-FUN-CONC","ALG-FEX-CONC"),
  ("ALG-FPO-CONC","ALG-FEX-CONC"),
  ("ALG-FEX-CONC","ALG-FEX-GRAF"),("ALG-FLI-GRAF","ALG-FEX-GRAF"),
  ("ALG-FEX-GRAF","ALG-FEX-MOD"),("NUM-FIN-COM","ALG-FEX-MOD"),
  ("NUM-LOG-ECU","ALG-FEX-MOD"),
  ("NUM-LOG-CONC","ALG-FLO-CONC"),("ALG-FEX-CONC","ALG-FLO-CONC"),
  ("ALG-FLO-CONC","ALG-FLO-GRAF"),("ALG-FEX-GRAF","ALG-FLO-GRAF"),
  ("NUM-FRA-MUL","ALG-FTR-RAD"),("GEO-TRI-RAZ","ALG-FTR-RAD"),
  ("ALG-FTR-RAD","ALG-FTR-SEN"),("ALG-FUN-REP","ALG-FTR-SEN"),
  ("ALG-FTR-SEN","ALG-FTR-COS"),("ALG-FTR-COS","ALG-FTR-PARAM"),
  ("ALG-FCU-PARAM","ALG-FTR-PARAM"),("ALG-FTR-PARAM","ALG-FTR-MOD"))

# --- Geometría: figuras ---
e(("GEO-FIG-CLAS","GEO-FIG-ELEM"),("GEO-FIG-CLAS","GEO-PER-POL"),
  ("NUM-POT-CONC","GEO-PIT-HIP"),("NUM-RAI-CONC","GEO-PIT-HIP"),
  ("GEO-FIG-CLAS","GEO-PIT-HIP"),
  ("GEO-PIT-HIP","GEO-PIT-CAT"),("ALG-ECU-LIT","GEO-PIT-CAT"),
  ("NUM-RAI-DESC","GEO-PIT-CAT"),
  ("GEO-PIT-HIP","GEO-PIT-INV"),("GEO-PIT-CAT","GEO-PIT-APL"),
  ("GEO-PIT-INV","GEO-PIT-APL"),
  ("GEO-PER-POL","GEO-ARE-TRI"),("GEO-FIG-ELEM","GEO-ARE-TRI"),
  ("NUM-FRA-MUL","GEO-ARE-TRI"),
  ("GEO-ARE-TRI","GEO-ARE-PAR"),("GEO-ARE-PAR","GEO-ARE-TRAP"),
  ("ALG-EXP-VAL","GEO-ARE-TRAP"),
  ("GEO-CIR-ELEM","GEO-CIR-PER"),("GEO-CIR-PER","GEO-CIR-ARE"),
  ("NUM-POT-CONC","GEO-CIR-ARE"),
  ("GEO-CIR-ARE","GEO-CIR-SECT"),("ALG-PRO-DIR","GEO-CIR-SECT"),
  ("GEO-ARE-TRAP","GEO-ARE-COMP"),("GEO-CIR-ARE","GEO-ARE-COMP"),
  ("GEO-UNI-SUP","GEO-ARE-COMP"),("NUM-ENT-DIVIS","GEO-UNI-SUP"))
# --- Geometría: cuerpos ---
e(("GEO-FIG-CLAS","GEO-CUE-RED"),("GEO-CUE-RED","GEO-CUE-ARE-PRI"),
  ("GEO-ARE-PAR","GEO-CUE-ARE-PRI"),
  ("GEO-CUE-RED","GEO-CUE-ARE-CIL"),("GEO-CIR-ARE","GEO-CUE-ARE-CIL"),
  ("GEO-CIR-PER","GEO-CUE-ARE-CIL"),
  ("GEO-CUE-ARE-PRI","GEO-CUE-VOL-PRI"),
  ("GEO-CUE-ARE-CIL","GEO-CUE-VOL-CIL"),("ALG-ECU-LIT","GEO-CUE-VOL-CIL"),
  ("GEO-CUE-VOL-PRI","GEO-CUE-ARE-VOL"),("GEO-CUE-ARE-PRI","GEO-CUE-ARE-VOL"),
  ("GEO-CUE-VOL-PRI","GEO-CUE-DESP"),("NUM-POR-VAR","GEO-CUE-DESP"),
  ("GEO-CUE-VOL-PRI","GEO-CUE-UNID"),("GEO-UNI-SUP","GEO-CUE-UNID"))
# --- Geometría: plano y transformaciones ---
e(("NUM-ENT-REC","GEO-PLA-COORD"),("GEO-PLA-COORD","GEO-PLA-REG"),
  ("ALG-INE-REP","GEO-PLA-REG"),
  ("GEO-PLA-COORD","GEO-PLA-VEC"),("GEO-PLA-VEC","GEO-PLA-VEC-OP"),
  ("NUM-ENT-ADI","GEO-PLA-VEC-OP"),
  ("GEO-PLA-VEC-OP","GEO-TRA-TRAS"),
  ("GEO-PLA-COORD","GEO-TRA-ROT-90"),("GEO-TRA-ROT-90","GEO-TRA-ROT-CEN"),
  ("GEO-TRA-TRAS","GEO-TRA-ROT-CEN"),
  ("GEO-PLA-COORD","GEO-TRA-REF-EJE"),("GEO-TRA-REF-EJE","GEO-TRA-REF-REC"),
  ("GEO-TRA-REF-EJE","GEO-TRA-SIM-CEN"),("GEO-TRA-ROT-90","GEO-TRA-SIM-CEN"),
  ("GEO-TRA-TRAS","GEO-TRA-COMP"),("GEO-TRA-ROT-CEN","GEO-TRA-COMP"),
  ("GEO-TRA-REF-REC","GEO-TRA-COMP"),("GEO-TRA-SIM-CEN","GEO-TRA-COMP"),
  ("GEO-TRA-COMP","GEO-TRA-INV"),
  ("GEO-TRA-TRAS","GEO-TRA-PROP"),("GEO-TRA-REF-EJE","GEO-TRA-PROP"),
  ("GEO-TRA-ROT-90","GEO-TRA-PROP"))
# --- Geometría: semejanza ---
e(("ALG-PRO-DIR","GEO-SEM-CONC"),("GEO-FIG-CLAS","GEO-SEM-CONC"),
  ("GEO-SEM-CONC","GEO-SEM-CRIT"),("GEO-SEM-CONC","GEO-SEM-LADO"),
  ("ALG-ECU-LIN","GEO-SEM-LADO"),
  ("GEO-SEM-LADO","GEO-SEM-ESC"),("ALG-PRO-DIR","GEO-SEM-ESC"),
  ("GEO-SEM-CONC","GEO-SEM-AREA"),("GEO-ARE-TRI","GEO-SEM-AREA"),
  ("NUM-POT-CONC","GEO-SEM-AREA"),
  ("GEO-SEM-AREA","GEO-SEM-VOL"),("GEO-CUE-VOL-PRI","GEO-SEM-VOL"),
  ("GEO-SEM-CRIT","GEO-SEM-TALES"),("ALG-PRO-RAZ","GEO-SEM-TALES"))
# --- Geometría M2 ---
e(("GEO-SEM-CONC","GEO-HOM-CONC"),("GEO-SEM-TALES","GEO-HOM-CONC"),
  ("GEO-HOM-CONC","GEO-HOM-NEG"),("NUM-ENT-MUL","GEO-HOM-NEG"),
  ("GEO-HOM-CONC","GEO-HOM-COORD"),("GEO-PLA-COORD","GEO-HOM-COORD"),
  ("GEO-PIT-HIP","GEO-TRI-RAZ"),("GEO-SEM-CRIT","GEO-TRI-RAZ"),
  ("NUM-FRA-CONC","GEO-TRI-RAZ"),
  ("GEO-TRI-RAZ","GEO-TRI-NOT"),("GEO-TRI-RAZ","GEO-TRI-DESP"),
  ("ALG-ECU-LIT","GEO-TRI-DESP"),
  ("GEO-TRI-DESP","GEO-TRI-APL"),("GEO-TRI-NOT","GEO-TRI-APL"),
  ("GEO-TRI-RAZ","GEO-TRI-IDEN"),("ALG-NOT-BIN2","GEO-TRI-IDEN"),
  ("GEO-CIR-ELEM","GEO-CIRC-CEN"),("GEO-CIRC-CEN","GEO-CIRC-INS"),
  ("GEO-CIR-SECT","GEO-CIRC-ARC"),("GEO-CIRC-CEN","GEO-CIRC-ARC"),
  ("GEO-CIRC-INS","GEO-CIRC-CUE"),("GEO-SEM-CRIT","GEO-CIRC-CUE"),
  ("GEO-CIRC-CUE","GEO-CIRC-SEC"),
  ("GEO-CUE-ARE-CIL","GEO-ESF-ARE"),("NUM-POT-CONC","GEO-ESF-ARE"),
  ("GEO-CUE-VOL-CIL","GEO-ESF-VOL"),("GEO-ESF-ARE","GEO-ESF-VOL"),
  ("GEO-PLA-COORD","GEO-REC-DIST"),("GEO-PIT-HIP","GEO-REC-DIST"),
  ("ALG-FLI-CONC","GEO-REC-ECU"),("ALG-FLI-PEND","GEO-REC-ECU"),
  ("GEO-REC-ECU","GEO-REC-PAR"),("GEO-REC-PAR","GEO-REC-PERP"),
  ("ALG-FLI-PEND","GEO-REC-PERP"),("NUM-FRA-MUL","GEO-REC-PERP"),
  ("GEO-REC-PAR","GEO-REC-INT"),("ALG-SIS-TIPO","GEO-REC-INT"))

# --- Estadística ---
e(("EST-DAT-VAR","EST-TAB-ABS"),("EST-TAB-ABS","EST-TAB-REL"),
  ("NUM-FRA-CONC","EST-TAB-REL"),("NUM-POR-TASA","EST-TAB-REL"),
  ("EST-TAB-ABS","EST-TAB-ACUM"),
  ("EST-TAB-ABS","EST-GRA-BAR"),("EST-TAB-REL","EST-GRA-CIRC"),
  ("EST-GRA-BAR","EST-GRA-LIN"),("ALG-FLI-GRAF","EST-GRA-LIN"),
  ("EST-GRA-BAR","EST-GRA-PICT"),("ALG-PRO-DIR","EST-GRA-PICT"),
  ("EST-DAT-VAR","EST-GRA-ELEC"),("EST-GRA-CIRC","EST-GRA-ELEC"),
  ("EST-GRA-BAR","EST-GRA-ELEC"),("EST-GRA-LIN","EST-GRA-ELEC"),
  ("EST-GRA-ELEC","EST-GRA-INT"),("EST-GRA-LIN","EST-GRA-INT"),
  ("NUM-FRA-ADI","EST-PRO-CAL"),("EST-TAB-ABS","EST-PRO-CAL"),
  ("EST-PRO-CAL","EST-PRO-TAB"),("ALG-EXP-VAL","EST-PRO-TAB"),
  ("EST-TAB-REL","EST-PRO-TAB"),
  ("EST-PRO-CAL","EST-PRO-PROP"),
  ("NUM-RAC-ORDEN","EST-POS-MEDIANA"),("EST-TAB-ABS","EST-POS-MEDIANA"),
  ("EST-POS-MEDIANA","EST-POS-CUAR-CAL"),
  ("EST-POS-CUAR-CAL","EST-POS-CUAR-INT"),("NUM-POR-TASA","EST-POS-CUAR-INT"),
  ("EST-POS-CUAR-INT","EST-POS-PERC"),
  ("EST-POS-CUAR-CAL","EST-POS-CAJ-CONS"),
  ("EST-POS-CAJ-CONS","EST-POS-CAJ-LEC"),("EST-POS-CUAR-INT","EST-POS-CAJ-LEC"),
  ("EST-POS-CAJ-LEC","EST-POS-CAJ-COMP"),
  ("EST-POS-CUAR-CAL","EST-POS-RIC"),("EST-POS-CAJ-LEC","EST-POS-RIC"))
# --- Dispersión M2 ---
e(("EST-PRO-CAL","EST-DIS-VAR"),("NUM-POT-CONC","EST-DIS-VAR"),
  ("EST-DIS-VAR","EST-DIS-DESV"),("NUM-RAI-CONC","EST-DIS-DESV"),
  ("EST-DIS-DESV","EST-DIS-INT"),("EST-POS-RIC","EST-DIS-INT"),
  ("EST-DIS-INT","EST-DIS-COMP"),("EST-POS-CAJ-COMP","EST-DIS-COMP"))
# --- Probabilidad ---
e(("EST-DAT-VAR","PRO-EXP-MUES"),("PRO-EXP-MUES","PRO-EVE-LAP"),
  ("NUM-FRA-CONC","PRO-EVE-LAP"),("ALG-PRO-RAZ","PRO-EVE-LAP"),
  ("PRO-EVE-LAP","PRO-EVE-COMP"),("NUM-FRA-ADI","PRO-EVE-COMP"),
  ("PRO-EVE-LAP","PRO-EVE-ESC"),("NUM-POR-CONC","PRO-EVE-ESC"),
  ("NUM-DEC-FRA","PRO-EVE-ESC"),
  ("PRO-EXP-MUES","PRO-CON-MULT"),("PRO-CON-MULT","PRO-CON-ARB"),
  ("PRO-EVE-LAP","PRO-ADI-EXC"),("NUM-FRA-ADI","PRO-ADI-EXC"),
  ("PRO-ADI-EXC","PRO-ADI-NOEXC"),("PRO-EVE-COMP","PRO-ADI-NOEXC"),
  ("PRO-EVE-LAP","PRO-MUL-IND"),("NUM-FRA-MUL","PRO-MUL-IND"),
  ("PRO-CON-ARB","PRO-MUL-IND"),
  ("PRO-MUL-IND","PRO-MUL-DEP"))
# --- Probabilidad M2 ---
e(("PRO-MUL-DEP","PRO-CON-CONC"),("PRO-EVE-LAP","PRO-CON-CONC"),
  ("PRO-CON-CONC","PRO-CON-CAL"),("NUM-FRA-MUL","PRO-CON-CAL"),
  ("EST-TAB-ABS","PRO-CON-TAB"),("PRO-CON-CAL","PRO-CON-TAB"),
  ("PRO-CON-CAL","PRO-CON-IND"),("PRO-MUL-IND","PRO-CON-IND"),
  ("PRO-CON-CAL","PRO-CON-TOT"),("PRO-CON-TAB","PRO-CON-TOT"),
  ("PRO-CON-MULT","PRO-COM-FACT"),("PRO-COM-FACT","PRO-COM-PERM"),
  ("PRO-COM-PERM","PRO-COM-REP"),("PRO-COM-PERM","PRO-COM-COMB"),
  ("NUM-FRA-SIMP","PRO-COM-COMB"),
  ("PRO-COM-COMB","PRO-COM-DIST"),("PRO-COM-REP","PRO-COM-DIST"),
  ("PRO-MUL-IND","PRO-BIN-CONC"),("PRO-COM-DIST","PRO-BIN-CONC"),
  ("PRO-BIN-CONC","PRO-BIN-CAL"),("PRO-COM-COMB","PRO-BIN-CAL"),
  ("NUM-POT-CONC","PRO-BIN-CAL"),
  ("EST-PRO-CAL","PRO-NOR-CONC"),("EST-DIS-DESV","PRO-NOR-CONC"),
  ("PRO-NOR-CONC","PRO-NOR-EST"),("EST-DIS-DESV","PRO-NOR-EST"),
  ("PRO-NOR-EST","PRO-NOR-REG"),("EST-POS-PERC","PRO-NOR-REG"))
