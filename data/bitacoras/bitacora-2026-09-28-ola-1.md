# Plataforma PAES — Bitácora: ola 1 de clases

*Sesión: 27–28 de septiembre de 2026*

---

## 1. Qué se hizo

Las 10 clases de la ola 1 del plan de clases, producidas de corrido **sin
los tres controles de crear-clase**: Ben pidió dejar todas las preguntas
para una revisión al final. Nada está cargado ni commiteado.

| Clase | Nodos | Ítems | Códigos | Migración |
|---|---|---|---|---|
| LES-NUM-ENT-03 | MUL | 24 | M1-ENT-049..072 | 061 |
| LES-NUM-ENT-04 | PRIOR | 24 | M1-ENT-073..096 | 062 |
| LES-NUM-ENT-05 | DIVIS, MCM | 48 | M1-ENT-097..144 | 063 |
| LES-ALG-EXP-03 | TERM, ADI | 48 | M1-EXP-046..093 | 064 |
| LES-EST-DAT-01 | DAT-VAR, TAB-ABS, TAB-ACUM | 72 | M1-DAT-001..072 | 065 |
| LES-GEO-TRA-01 | PLA-COORD | 24 | M1-TRA-001..024 | 066 |
| LES-GEO-TRA-02 | PLA-VEC, PLA-VEC-OP, TRA-TRAS | 72 | M1-TRA-025..096 | 067 |
| LES-GEO-TRA-03 | TRA-REF-EJE, TRA-REF-REC | 48 | M1-TRA-097..144 | 068 |
| LES-GEO-TRA-04 | TRA-ROT-90, TRA-ROT-CEN, TRA-SIM-CEN | 72 | M1-TRA-145..216 | 069 |
| LES-GEO-FIG-01 | FIG-CLAS, FIG-ELEM, PER-POL | 72 | M1-FIG-001..072 | 070 |

Catálogos: 056 NUM-ENT (+25), 057 ALG-EXP (+10), 058 EST-DAT (18, nuevo),
059 GEO-TRA (37, nuevo), 060 GEO-FIG (21, nuevo). Las 111 misconceptions
nuevas son `hipotesis`. El upsert de 056 y 057 reescribe también las
entradas ya cargadas, pero se comparó contra la base: ninguna difiere.

## 2. Decisiones

**Un distractor puede usar una misconception de un nodo previo.** Antes,
el cargador solo aceptaba misconceptions del catálogo de la unidad de la
clase. Eso obligaba a copiar errores entre catálogos (el precedente fue
`POT-CONC-ORDEN`), con dos definiciones del mismo error. Ahora
`cargar_contenido.py` lee **todos** los catálogos y acepta una
misconception si su nodo está en la clase o es ancestro del nodo del ítem
en `grafo.py`. El catálogo sigue siendo por unidad: ahí se define lo que
se puede equivocar dentro de la lección. `revisar_clase.py` y la skill
aceptan `--catalogo` como directorio.

**Los 10 pares de NUM-POT que rompían la regla se resolvieron sin tocar
ítems.** Primero quedaron como excepción en el cargador. Revisados uno a
uno con Ben, los ítems estaban bien en todos los casos y el problema era
del grafo o del catálogo:

- **Faltaban 4 aristas** (migración 071, `grafo.py`):
  - PRIOR → POT-CONC: $3 \cdot 2^3 = 216$ es un error de prioridad.
  - POT-SIG → POT-FRA: $(-1/2)^4$.
  - POT-POT → POT-DIST: $(2x^3)^2$.
  - POT-DIST → POT-NEG: $(a/b)^{-3}$.

  No hay ciclos y se respeta el orden de las clases.
- **POT-CERO-INV estaba en NUM-POT-NEG**, un nodo posterior al de los
  ítems que la usan. Es un error sobre el exponente cero (su remediación
  enseña $a^0 = 1$), así que pasa a NUM-POT-CERO (migración 072).

La lista de excepciones se borró del cargador y las 19 clases pasan sin
ella.

**Una misconception tiene como máximo 3 segmentos.** `code_text` admite 4
y la remediación es `REM-<mc>`. Para nodos de 4 segmentos, el nodo se
comprime: `PLA-VECOP-*`, `TRA-REFEJE-*`, `TRA-REFREC-*`, `TRA-ROT90-*`,
`TRA-ROTCEN-*`, `TRA-SIMCEN-*`.

**Las tablas son arrays de KaTeX.** El frontend no tiene remark-gfm, así
que las tablas de EST-DAT van como `$$\begin{array}{|c|c|}\hline …$$`.

**Las figuras se generan con script y asserts**, como las anteriores:
`plano_svg.py` (plano cartesiano) y `figura_svg.py` (polígonos) son
módulos. Los generadores `generar_geo_tra_0{1..4}.py` y
`generar_geo_fig_01.py` verifican la geometría y los choques de rótulos.

## 3. Revisión con Ben

- Misconceptions: Ben las revisó y quedan todas, como `hipotesis`.
- Se aprobó la convención de códigos comprimidos (3 segmentos).
- Publicación: una sola migración para la ola (073) en vez de una por
  clase.
- Ben revisó todo el contenido y pidió subirlo.
- **Nodo nuevo GEO-FIG-ANG «Suma de ángulos interiores»** (migración
  074). Ben: «es bien basal en geo». Nivel `pre`, como CLAS.
  - Aristas: CLAS → ANG, ANG → SEM-CRIT (el tercer ángulo del criterio
    AA) y ANG → CIRC-INS.
  - Va en una clase propia, LES-GEO-FIG-08, en la ola 2; sostiene 11
    clases. El 07 ya estaba tomado por el sector circular (M2).

## 4. Carga

056–074 aplicadas en producción el 28 sep 2026, en orden y sin errores.
Verificado después de cargar:

- las 10 clases están `active`;
- los 504 ítems tienen 4 alternativas y 1 correcta;
- hay 111 remediaciones activas;
- quedan 193 misconceptions en total;
- POT-CERO-INV quedó en NUM-POT-CERO;
- GEO-FIG-ANG existe con sus 3 aristas.

Antes de aplicar se confirmó que los ítems de POT-CERO-INV tenían 0
respuestas.

## 5. Abierto

- `PLA-COORD-ESCALA` y `PLA-COORD-CONTEO` se parecen a errores de la recta
  numérica (NUM-ENT-REC): ¿se fusionan con esas?
- `plan-de-clases.md` no recalcula cuántas clases dependen de cada una
  con las aristas nuevas. Por ejemplo, ENT-04 pasa de 82 a 111 porque
  ahora sostiene todo NUM-POT.
