# Plataforma PAES — Bitácora: LES-ALG-EXP-01, lenguaje algebraico

*Sesión: 25 y 26 de septiembre de 2026*

---

## 1. Qué se hizo

Primera clase del eje ALG: **ALG-EXP-LENG** (M1), sola, con la skill
`crear-clase`. Catálogo nuevo de la unidad ALG-EXP con 17 misconceptions,
45 ítems (M1-EXP-001 a 045, 15 por nivel), 17 remediaciones y el cuerpo de
la clase. Sin figuras.

Migraciones 045 (catálogo) y 046 (clase, como `draft`) aplicadas y
verificadas el 26 de septiembre. **La 047 (publicación) no se aplicó**: el
modo automático la bloqueó como deploy a producción. Hasta que Ben la corra,
el estudiante no ve nada de esta clase.

Se partió por álgebra porque NUM-ENT tenía otra sesión abierta
(LES-NUM-ENT-02). LENG es el único nodo de ALG sin prerrequisitos: TERM,
VAL y ECU-LIN cuelgan de ENT-MUL, ENT-PRIOR y ENT-ADI.

---

## 2. Control 1: alcance y misconceptions

**Alcance.** Entra: traducir en los dos sentidos, vocabulario de la guía
MA 10 de Ben (doble/cuadrado, triple/cubo, parte, semisuma, exceso,
opuesto, inverso), alcance de cada operación, contexto (edades, dinero,
comparaciones, tasas), consecutivos, pares e impares, números de dos cifras
y patrones. Fuera: valorizar (EXP-VAL), reducir y monomios (EXP-TERM),
suprimir paréntesis (EXP-ADI), ecuaciones (ECU-PLAN), porcentajes,
fracciones de una cantidad y razones.

**Notación sin ancestro.** Cuadrado y cubo, opuesto, par/impar y patrones
dependen de nodos que no son ancestros de LENG (NUM-POT-CONC, NUM-ENT-REC,
NUM-ENT-DIVIS). Ben decidió incluirlos igual ("mejor que conozcan más
cosas"). Entran solo como notación: ningún ítem pide calcular una potencia
ni operar con negativos. Los patrones van en nivel 3 y se construyen desde
el enunciado, sin comprobar valores (eso sería EXP-VAL).

**Misconceptions.** No se descartó ninguna. Ben marcó las 17 como
`docente`: LINEAL, SOBREAGRUPA, ORDENRESTA, ADITIVO, PARTEMUL, JUXTA,
INVREL, NUEVAVAR, CONSEC, TIEMPO, EXCESO (las 11 propuestas al comienzo) y
POTMUL, OPUINV, PARCONSEC, PATRDIF, DIGITOS, TASA (las que aparecieron al
ampliar el alcance). Ben aclaró que EXCESO y SOBREAGRUPA son reales, que
eran las dos que yo veía más dudosas.

**Volumen.** Con 17 misconceptions, 24 ítems no alcanzan: dan 72
distractores y hacen falta ~102 para que cada misconception tenga 6 ítems
de práctica. Se subió a 45. Ben dejó como regla fija que el banco lleva los
ítems que haga falta ("más es mejor").

---

## 3. Control 2

Ben aprobó sin cambios. Quedaron anotados como débiles, para revisar con
datos reales: TASA "15" y PARTEMUL "n/15" (014), PARTEMUL "12a − b/2"
(034), OPUINV "2x − (−y)" (039), ADITIVO en 026, 031 y 038, CONSEC con
pares (010, 044) y "Ninguna de ellas" (041).

Decisiones propias:

- Amplié cuatro definiciones: EXCESO incluye la resta invertida, ADITIVO y
  PARTEMUL cubren los dos sentidos, y PARCONSEC incluye usar paso 2 con
  consecutivos cualesquiera.
- El 014 (escalera) y el 027 (bidón) llevan PATRDIF fuera del nivel 3,
  porque son tasas directas, no patrones de figuras.
- La clase no usa tablas: el front no tiene remark-gfm.

---

## 4. Abierto

- **Aplicar la 047** para publicar la clase.
- Ítem de patrón con figura de palitos. El 031 lo describe en texto; con
  figura, el alumno tendría que deducir el +3 contando, que es como lo
  pregunta la PAES.
- Una clase aparte para patrones y secuencias: hoy no tienen nodo en el
  grafo.
- ADITIVO es la misconception más usada (14 de 45). Hay que ver si en los
  ítems de patrones está actuando como comodín.
