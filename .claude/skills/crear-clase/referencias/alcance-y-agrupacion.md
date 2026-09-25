# Alcance y agrupación

## Agrupar nodos en una clase

Reglas de Ben (cerradas):

1. **Nunca M1 con M2** en la misma clase.
2. Si una clase agrupa nodos, son **del mismo nivel y uno es prerrequisito
   directo del otro**.
3. **Una clase puede tener un solo nodo.** Los nodos pesados (muchas
   misconceptions, operatoria con muchos casos) van solos.
4. La clase no bloquea nada: un nodo se desbloquea cuando sus prerrequisitos
   están `mastered`, sin importar a qué clase pertenecen. Por eso **la
   continuidad pedagógica entre dos nodos la garantiza el grafo, no la
   clase**. "Se explican mejor juntos" no basta para agruparlos.
5. El orden de los nodos en la clase y su `position` no pueden contradecir
   una arista del grafo.

Ejemplo real (NUM-ENT): REC sola; ADI sola (el más pesado de la unidad); MUL
sola, porque ya incluye la división y agrupa las reglas de signos. Se
descartó REC+ADI: la clase se habría visto "0 de 2" mientras ADI no tuviera
contenido, y el argumento de continuidad no se sostenía.

## Definir el alcance de un nodo

El alcance es la decisión que más cambia el resultado. Para cada nodo:

- **Entra:** las habilidades que el nombre del nodo promete, en su forma PAES.
  Incluye las variantes que la PAES evalúa (en ENT-REC: rectas con escala
  distinta de 1, contexto).
- **Queda fuera:** todo lo que pertenece a otro nodo del grafo. Nombra el nodo
  destino. Si no hay nodo destino, avísale a Ben: es un hueco del grafo.
- **Recursos sin evaluar:** conceptos de otro nodo que ayudan a explicar pero
  que no se evalúan acá. En ENT-REC, el valor absoluto (nodo M2) aparece en el
  texto como "el mayor es el más cerca del 0" y ningún ítem lo mide.

### La regla que ordena todo: un ítem mide un nodo

Si un ítem de este nodo necesita otra habilidad que puede fallar por su
cuenta, el error no se puede atribuir. Ejemplo: ubicar 3/4 en la recta dentro
de ENT-REC. Si el estudiante falla, no sabes si falló la recta o la fracción.
Ese ítem pertenece a RAC-RECTA.

Consecuencia práctica: los números y conceptos de los ítems solo pueden venir
de **este nodo y sus ancestros**. Nada de un nodo posterior.

### Nodos raíz

Si el nodo no tiene prerrequisitos, no hay dónde "bajar" al estudiante que
falla. La clase no puede asumir nada más que lo elemental, y las
remediaciones tienen que sostenerse completamente solas.

### Material de Ben

Cuando Ben entrega su presentación o guía, casi siempre cubre una unidad
entera en una sola clase de aula. Úsala para:

- el tono y el orden en que él presenta las ideas;
- los ejemplos que él usa (cambiando los números);
- detectar qué omite: la presentación de enteros no tenía nada sobre **orden**,
  que era la mitad del nodo y donde vivían los errores.

No la uses para decidir el alcance.

## Qué presentar en el control 1

```
Clase propuesta: LES-<EJE>-<UNIDAD>-NN = <NODO> [+ <NODO>]
Motivo: <regla que aplica>

<NODO> — alcance
  Entra: ...
  Fuera: ... (-> NODO-DESTINO)
  Recurso sin evaluar: ...
  Del material de Ben queda fuera: ...
```
