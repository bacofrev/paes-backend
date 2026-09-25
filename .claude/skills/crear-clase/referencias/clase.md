# El cuerpo de la clase (`lesson_body`)

La clase es lo que el estudiante lee antes de practicar. No compite con un
libro: compite con el profe de preu que le explica en cinco minutos lo que el
colegio no le explicó. Tiene que dejarlo listo para los ítems de nivel 1 y 2,
y con la idea correcta para enfrentar el nivel 3.

## Tono

- **Como un buen profe de preu hablándole a un estudiante de 4° medio.**
  Directo, cercano, seguro. Segunda persona (**tú**), nunca voseo.
- **Frases cortas.** Un párrafo = una idea.
- **Sin relleno motivacional.** Nada de "¡Genial!", "¡Vamos!", "Es muy fácil",
  "Como todos sabemos". Tampoco condescendencia: el estudiante no es un niño.
- **Nombra el error antes de que ocurra.** "Este es el caso que más se
  equivoca" y después la regla que lo evita. La clase conoce las
  misconceptions del catálogo y las desarma por adelantado, sin mencionar sus
  códigos.
- **Da una comprobación rápida** cuando exista ("entre dos negativos, el mayor
  es el más cerca del 0"; "el sucesor siempre es mayor"). Es lo que el
  estudiante se lleva a la prueba.
- Sin chilenismos fuertes, sin garabatos, sin memes.
- Si Ben entregó material propio, imita su forma de presentar las ideas.

## Estructura

```markdown
Una a tres frases de entrada: qué se aprende y para qué sirve en lo que viene.

## <Título del nodo>          <- una sección ## por nodo; su slug es el anchor

### <Habilidad 1>
### <Habilidad 2>
...
```

- **Una sola sección `##` por nodo.** El anchor de la clase es el slug de ese
  título (minúsculas, sin tildes, espacios a guiones). Si la clase tiene dos
  nodos, hay dos `##`, en el orden del grafo.
- **Subsecciones `###` por habilidad**, siguiendo este orden:
  1. el concepto o la definición, desde lo que el estudiante ya sabe;
  2. **la regla** (en negrita, una frase);
  3. **el caso difícil**, donde vive la misconception central, con su
     comprobación rápida;
  4. los casos especiales (cero, escala, antecesor/sucesor...);
  5. el contexto: cómo se traduce una situación a símbolos, y el orden
     correcto (primero traducir, después operar o comparar).
- **Largo:** entre 450 y 900 palabras por nodo. Si pasa de 900, probablemente
  estás enseñando algo de otro nodo.
- **Los recursos sin evaluar** (definidos en el alcance) aparecen como apoyo,
  sin volverse contenido propio.

## Ejemplos dentro de la clase

- **Ningún ejemplo de la clase puede ser un ítem del banco.** Ni los mismos
  números, ni el mismo contexto con los mismos datos. La clase los muestra
  resueltos y el ítem quedaría regalado. En ENT-REC la primera versión
  explicaba "de −2 a 3 hay 5 saltos", que era la respuesta exacta de un ítem.
  Escribe la clase **después** de los ítems, eligiendo números que no estén
  tomados. `revisar_clase.py` detecta coincidencias con números, pero no las
  de contexto: revísalas a mano.
- Usa números que hagan visible la idea. Para orden de negativos, dos
  negativos donde la magnitud engaña (−8 y −5), no −1 y −2.
- Un ejemplo resuelto por habilidad basta. La práctica está en los ítems.

## Figuras en la clase

Una figura en la clase se justifica cuando **explica algo que el texto no
puede explicar igual de rápido**. Pregúntate: ¿qué entiende el estudiante
mirando la figura que no entendería leyendo?

**Pon figura cuando:**

- el concepto es espacial: la recta, el plano, una figura geométrica, un
  gráfico, una transformación;
- el banco tiene ítems de lectura de figura: la clase tiene que enseñar a leer
  **ese tipo** de figura (con otra figura, nunca la de un ítem);
- la idea se ve mejor que se dice: la recta que se extiende de N a Z, el
  ángulo recto que marca la altura, la simetría.

**No pongas figura cuando:**

- solo adorna (un termómetro dibujado al lado de un ejemplo de temperatura);
- repite lo que ya dice el texto;
- es una lista de números en fila: eso se escribe en LaTeX
  (`$$-3 \quad -2 \quad -1 \quad 0$$`).

**Cada figura de la clase se especifica antes de generarla:**

```
FIG-ENT-REC-03
Qué explica: una recta con escala 25 en que solo 0 y 25 están rotulados;
  el estudiante tiene que ver que la escala se deduce de dos marcas.
Condiciones: marcas equiespaciadas, 0 y 25 rotulados, punto P en −75 sin
  rótulo numérico.
Dónde va: sección "Leer una recta con escala", después de la regla.
aria-label: "Recta numérica con marcas cada 25 unidades..."
```

Se inserta en el markdown con `![](fig:FIG-ENT-REC-03)`, en el punto exacto
del texto. Es la única forma de imagen permitida. Formato y reglas de
generación: `figuras.md`.

## Qué no va en la clase

- Nada de otro nodo, salvo los recursos sin evaluar.
- Nada de HTML crudo ni imágenes con URL.
- Nada que prometa algo que la plataforma no hace ("haz clic en...").
- Códigos de misconceptions ni vocabulario interno ("nodo raíz", "distractor").
