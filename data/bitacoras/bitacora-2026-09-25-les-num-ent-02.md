# Plataforma PAES — Bitácora: LES-NUM-ENT-02, adición y sustracción de enteros

*Sesión: 25 de septiembre de 2026*

---

## 1. Qué se hizo

Clase completa de **NUM-ENT-ADI** (M1), sola, con la skill `crear-clase`:
6 misconceptions nuevas en el catálogo de NUM-ENT, 24 ítems
(M1-ENT-025 a 048), 6 remediaciones, el cuerpo de la clase y 7 figuras.
Migraciones 042 (catálogo), 043 (clase, como `draft`) y 044 (publicación),
aplicadas y verificadas el mismo día.

---

## 2. Control 1: alcance y misconceptions

**Alcance.** Entra: sumas de igual y distinto signo, la resta como suma del
opuesto (incluye restar un negativo), cadenas de 3 o 4 términos, paréntesis
de un nivel que se calculan por dentro, la suma en la recta, contexto y
variación. Fuera: la regla de signos (ENT-MUL), la mezcla con × y ÷
(ENT-PRIOR), suprimir paréntesis cambiando signos (ALG-EXP-ADI), fracciones
y decimales negativos, y ecuaciones.

**Valor absoluto.** Ben preguntó si meterlo en esta clase. No se puede: la
regla de agrupación prohíbe mezclar M1 con M2, y en el grafo ABS cuelga de
REC, no de ADI. Queda como recurso sin evaluar ("tamaño" = distancia al 0,
sin notación `|x|`). **ENT-ABS va en su propia clase, que es la siguiente.**

**Misconceptions.** Ben marcó las seis como vistas en aula (`docente`):

| Código | Ejemplo |
|---|---|
| ENT-ADI-REGLAMUL | −3 − 5 = 8 |
| ENT-ADI-MAGNOP | −7 + 3 = −10 |
| ENT-ADI-INVIERTE | 3 − 7 = 4 |
| ENT-ADI-DOBLENEG | 5 − (−3) = 2 |
| ENT-ADI-RESTAGRUPA | 10 − 3 + 2 = 5 |
| ENT-ADI-VARORDEN | de −3 °C a 5 °C: variación −8 |

**Descartada: ENT-ADI-SIGNOPRIM** ("pone el signo del primer término",
−2 + 9 = −7). No había evidencia de que fuera una regla estable y no un
descuido, y solo se separaba de INVIERTE en un tipo de ítem.

**Corrección posterior al control.** En el control 1 se dijo que MAGNOP y
DOBLENEG coincidían en `a − (−b)`. Es falso: con la regla "deja el signo del
negativo", `5 − (−3)` da −2 con MAGNOP y 2 con DOBLENEG. Donde MAGNOP sí
coincide es con RESTAGRUPA, en cadenas `a − b + c` con a < b. Quedó así en
el catálogo, y ningún ítem usa esas dos juntas.

---

## 3. Control 2: producción

- Cuatro misconceptions en 12 ítems cada una (MAGNOP, REGLAMUL, INVIERTE y
  DOBLENEG, el 50%), RESTAGRUPA en 8 y VARORDEN en 6. Diez distractores
  apuntan a misconceptions de REC: CTXSIGNO 4, CONTEO 4, DIRECCION 1 y
  MAGN 1.
- **Distractores débiles que Ben decidió mantener:**
  - INVIERTE aplicada con dos negativos (025, 030, 048), que estira la
    definición del catálogo.
  - REGLAMUL en `a − (−b)` (029, 034, 043): no está claro que el
    estudiante con esa regla no llegue a la correcta.
  - DOBLENEG en 045 D, con una derivación conceptual y no numérica.
  - MAGNOP en 039 D, que requiere agrupar positivos y negativos antes.

  **Son los primeros a revisar cuando haya respuestas reales.** Si alguno no
  lo elige nadie, es relleno.
- **Figuras en la clase.** Ben pidió una figura por concepto. Se agregaron
  6 (FIG-ENT-ADI-02 a 07) y se extendió `generar_ent_adi.py` con saltos:
  arcos con flecha sobre la recta, rotulados con el cambio. El rótulo se
  calcula de los extremos. Hay asserts de que cada arco cae exacto en su
  marca y de que ningún arco pasa por un rótulo; este último salió de un
  caso real en la figura de cadenas. La sección de contexto quedó sin
  figura.
- Para que cupieran en una recta legible se cambiaron tres ejemplos de la
  clase: −18 + 12, 7 − (−5) y −10 + 20 − 15.

---

## 4. Carga

Se revisó la base antes de aplicar: la 041 estaba aplicada, los códigos
nuevos no existían y el nodo estaba activo. Después se aplicaron 042, 043
y 044 con `psql -1`. Verificación:

- 6 misconceptions `docente`.
- 24 ítems `active` en NUM-ENT-ADI, todos con 4 alternativas y 1 correcta.
- 6 remediaciones `active` con 6 ítems cada una.
- La clase activa en la posición 2, con su anchor.
- 7 figuras.

---

## 5. Qué quedó abierto

- **ENT-ABS**: próxima clase, M2, sola.
- **`generar_ent_adi.py` tiene `recta_con_saltos`**, que puede servir a otras
  unidades (FRA-SIG, vectores). Si se reutiliza, conviene moverla a
  `data/loaders/recta.py`.
- Revisar los distractores débiles de la sección 3 con datos reales.
- Nada commiteado todavía. La base ya tiene la clase; el código no necesita
  cambios para servirla.
