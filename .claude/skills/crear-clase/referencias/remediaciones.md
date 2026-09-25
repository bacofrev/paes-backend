# Remediaciones

La remediación aparece en el veredicto cuando el estudiante eligió un
distractor. Ataca **la regla equivocada** que ese distractor delata. Después
el estudiante practica en un ítem **nuevo** que ataca la misma misconception:
nunca se le pide reintentar el mismo ítem.

El contenido es determinista y versionado: se escribe acá, lo valida Ben y no
se genera en tiempo real.

## Una por misconception

- Una remediación por cada misconception del nodo que se use como distractor.
  `revisar_clase.py` marca las que faltan.
- Código: `REM-<CÓDIGO DE LA MISCONCEPTION>` (ej. `REM-ENT-REC-MAGN`).
- **6 ítems de práctica** en `items`, todos con esa misconception entre sus
  distractores, repartidos entre los tres niveles.

## Estructura del cuerpo

1. **Qué hiciste**, en segunda persona y sin culpa, con un caso concreto:
   "Elegiste como mayor al negativo con el número más grande, como si −8 fuera
   mayor que −5 porque 8 > 5."
2. **La regla correcta desde el suelo**: desde la definición o desde la
   figura, no desde "acuérdate que". En negrita, una frase.
3. **Un ejemplo resuelto** con números distintos a todos los ítems del banco.
4. **Una comprobación rápida** que el estudiante pueda aplicar solo en la
   prueba ("si te moviste a la izquierda, tu respuesta tiene que ser menor que
   el punto de partida").

Largo: 120 a 220 palabras. Si necesitas más, estás explicando dos cosas.

## Título

La regla dicha en positivo, corta, que se pueda recordar: "El sucesor siempre
está a la derecha", "Se cuentan saltos, no números", "El 0 no es el piso".
No el nombre del error.

## Reglas

- **Se sostiene sola.** Nunca "repasa X" ni "como viste en la clase". Si
  necesita un concepto de un prerrequisito, lo explica en una línea. En nodos
  raíz esto es obligatorio: no hay a dónde mandar al estudiante.
- **Ejemplos que no regalan ítems.** Ni los números ni el contexto de ningún
  ítem del banco, en especial de sus 6 ítems de práctica: el estudiante los ve
  justo después. Pasó dos veces en ENT-REC (la remediación de escala resolvía
  el ítem que venía a continuación).
- **Mismo tono que la clase**: directo, tú, sin voseo, sin relleno.
- Figuras: igual que en la clase (`![](fig:CODIGO)`), independientes de las de
  los ítems.

## Ejemplo (ENT-REC)

```yaml
  - code: REM-ENT-REC-DIRECCION
    misconception: ENT-REC-DIRECCION
    title: A la izquierda se baja, a la derecha se sube
    body: |
      Te moviste hacia el lado contrario: para ir a la izquierda
      sumaste, como si "4 a la izquierda de 6" fuera $10$.

      En la recta los números crecen hacia la derecha. Por eso:

      - Moverse a la **derecha** es ir hacia números **mayores**.
      - Moverse a la **izquierda** es ir hacia números **menores**.

      $$2 \leftarrow 3 \leftarrow 4 \leftarrow 5 \leftarrow 6$$

      Cuatro saltos a la izquierda de $6$ llegan a $2$, no a $10$.

      Esto no cambia al cruzar el cero. Dos a la izquierda de $1$ es $-1$:
      sigues bajando, aunque ahora aparezca el signo menos.

      Un control rápido: si te moviste a la izquierda, tu respuesta tiene
      que ser **menor** que el punto de partida.
    items: [M1-ENT-002, M1-ENT-006, M1-ENT-007, M1-ENT-014, M1-ENT-016, M1-ENT-018]
```
