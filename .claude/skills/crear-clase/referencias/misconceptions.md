# Misconceptions

Una misconception no es "se equivocó". Es **una regla equivocada que el
estudiante aplica con consistencia** y que produce una respuesta predecible.
Todo el producto se apoya en eso: el distractor que elige delata la regla, y
la remediación ataca esa regla.

## Cómo identificarlas

Fuentes, en orden de peso:

1. **Ítems oficiales DEMRE y su clavijero** (`origin: demre`). Los distractores
   de un ítem oficial fueron diseñados para capturar errores reales. Para cada
   ítem oficial del tema, reconstruye qué regla equivocada lleva a cada
   distractor. Cita el ítem.
2. **La experiencia de Ben en aula** (`origin: docente`). Solo Ben asigna este
   origen, en el control 1.
3. **Didáctica de la matemática y razonamiento propio** (`origin: hipotesis`).
   Todo lo que propongas parte acá.

Método para generar candidatas, por cada habilidad del alcance:

- ¿Qué regla de un tema anterior se traslada mal? (el orden de los naturales
  aplicado a negativos: −7 > −3)
- ¿Qué parte de la definición se omite o se invierte? (sucesor "el que sigue al
  leer", no "el de la derecha")
- ¿Qué se cuenta mal? (contar números en vez de saltos)
- ¿Qué se lee mal en una figura? (cada marca vale 1)
- ¿Qué se traduce mal del lenguaje al símbolo? ("bajo cero" como positivo)
- ¿Dónde se detiene un procedimiento antes de tiempo? (quedarse en el 0)

## Cómo escribirlas

```yaml
  - code: ENT-REC-MAGN
    name: Compara negativos por su magnitud
    nodo: NUM-ENT-REC
    area: NUM
    origin: hipotesis
    description: >-
      Mecanismo: qué regla aplica el estudiante y de dónde la trae. Qué la
      distingue de la misconception más parecida.
    example: "-7 > -3"
```

- **Código:** `<UNIDAD>-<NODO>-<SLUG>`. El formato de código admite 4
  segmentos como máximo. El slug es corto, en mayúsculas, sin guiones
  (`CTXSIGNO`, no `CTX-SIGNO`).
- **Más granular de lo que parece necesario.** El esquema permite fusionar
  misconceptions (`merged_into`) pero no separarlas. Si dudas entre una o dos,
  son dos.
- **Descripción con el mecanismo**, no con el síntoma. "Elige el de número más
  grande porque traslada el orden de los naturales" sirve para escribir una
  remediación; "compara mal los negativos" no.
- Las que Ben no ha visto pero se mantienen, lo dicen en la descripción
  (ejemplo real: ENT-REC-ESCALA, "sin observación en aula; se mantiene porque
  la PAES usa rectas con escala").

## Separar misconceptions parecidas

Para cada par que pueda confundirse, escribe **el ítem que las separa**: uno
donde dan respuestas distintas. Si no existe ese ítem, probablemente son la
misma misconception.

Ejemplo real de ENT-REC:

| Misconception | Falla en | No falla en |
|---|---|---|
| SINSIGNO (ignora el signo al comparar) | −8 vs 5 | "3 a la izquierda de 5" |
| DIRECCION (invierte izquierda y derecha) | "3 a la izquierda de 5" = 8, incluso con puros positivos | comparar −8 vs 5 |
| SUCESOR (se aleja del 0 con negativos) | sucesor de −4 = −5 | sucesor de 4 |

Con sucesor y negativos, DIRECCION y SUCESOR dan la misma respuesta. Por eso
DIRECCION solo se usa en ítems de desplazamiento. Cuando dos misconceptions
colisionan en un tipo de ítem, anótalo en la descripción.

## Misconceptions de otros nodos

Un distractor puede apuntar a una misconception catalogada en otro nodo (los
ítems no se comparten; las misconceptions sí). Úsalo cuando el error de un
prerrequisito aparece de verdad en este tipo de ítem. Nunca deduzcas el nodo
de un ítem a partir de las misconceptions de sus distractores.

## Validación humana (control 1)

Ninguna misconception se usa en un ítem antes de que Ben apruebe la lista.
Ben:

- marca las que ha visto en clase → `docente`;
- descarta las que no existen o están mal planteadas;
- puede agregar las que faltan.

Después de ítems reales con estudiantes, la frecuencia sirve para priorizar,
no para validar: el mapeo distractor → misconception es determinista por
construcción.

## Señales de una mala misconception

- Solo se puede meter como distractor copiando la respuesta correcta sin el
  signo, con un dígito cambiado, etc. Eso es relleno, no una regla.
- No tiene un ítem que la separe de otra.
- Su remediación sería "fíjate bien" (no hay regla que corregir).
- Aparece en casi todos los ítems porque "siempre se puede armar" (ocurrió dos
  veces en ENT-REC: primero con CERO, después con SINSIGNO).
