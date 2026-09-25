# Ítems

## Contenido

1. Volumen y cobertura
2. Niveles de dificultad
3. Tipos de ítem
4. El enunciado
5. Los distractores (lo más importante)
6. Posición de la correcta
7. Códigos y formato
8. Ejemplos buenos y malos

---

## 1. Volumen y cobertura

- **24 ítems por nodo, 8 por nivel.** El criterio de dominio necesita al menos
  8 respuestas, y cada remediación consume ítems nuevos.
- **Cada misconception del nodo en al menos 6 ítems**, para que su remediación
  tenga 6 ítems de práctica. Si una misconception no da para 6 sin forzar,
  quédate en lo que sea genuino (mínimo 4) y avísalo en el control 2.
- La misconception central del nodo puede aparecer en más de la mitad de los
  ítems. Cualquier otra que pase la mitad es sospechosa de comodín.

**Antes de escribir un solo enunciado, arma la matriz de cobertura:** una
tabla con los 24 ítems, su nivel, su tipo y las tres misconceptions de sus
distractores. Revisa los conteos en la matriz. Es mucho más barato mover una
misconception en la matriz que reescribir un ítem.

## 2. Niveles de dificultad

La dificultad viene de **lo que el estudiante tiene que entender**, nunca de
números más feos o cuentas más largas.

| Nivel | Qué exige | Ejemplos (ENT-REC) |
|---|---|---|
| 1 | Una idea, un paso, sin contexto o con contexto directo | ¿Cuál desigualdad es verdadera? · ¿Qué número está 3 a la izquierda de 1? |
| 2 | Varias piezas o dos pasos: ordenar una lista, encadenar (antecesor del antecesor), leer una figura con escala | Ordena −4, 2, −9, 0 · La tercera marca a la izquierda del 0 si las marcas van de 2 en 2 |
| 3 | Formato PAES: traducir un contexto a símbolos y después operar, afirmaciones I/II/III, figuras donde hay que deducir la escala, casos límite, enunciados generales ("siempre verdadera") | Posiciones bajo el mar ordenadas · I, II, III sobre orden y sucesor |

Un ítem de nivel 3 debe parecerse a un ítem PAES real. Revisa los ítems
oficiales del tema antes de escribir el nivel 3.

## 3. Tipos de ítem

Varía los tipos dentro de cada nivel. Más de 3 ítems iguales en forma y
distinto número es desperdicio: el estudiante aprende el formato, no el
concepto.

| Tipo | Forma | Cuándo sirve |
|---|---|---|
| Resultado | "¿Qué número...?" alternativas numéricas | Procedimientos. Distractores = resultados de cada regla equivocada |
| Comparación | "¿Cuál es mayor/menor?", "¿cuál desigualdad es verdadera?" | Orden, magnitudes |
| Ordenar | Lista, alternativas = ordenamientos | Orden con varios elementos |
| Afirmación | Cada alternativa es una afirmación completa | Cuando el tipo "resultado" no da tres distractores genuinos |
| Valor + afirmación | "−10, que es menor que −8" | Para separar misconceptions que dan el mismo valor (ítem 008 de ENT-REC) |
| I, II, III | Tres afirmaciones, alternativas = combinaciones | Nivel 3. Cada combinación incorrecta = aceptar o rechazar una afirmación por una misconception |
| Contexto | Situación real que hay que traducir | Siempre con al menos un distractor de traducción (CTXSIGNO) |
| Lectura de figura | Recta, gráfico, figura geométrica | Si la PAES lo evalúa con figura. **Nunca describas en texto lo que debería ser figura** |
| General | "Sean p y q tales que... ¿cuál es siempre verdadera?" | Nivel 3 |

Evita:

- "Todas las anteriores" y "ninguna de las anteriores": no apuntan a una
  misconception.
- Enunciados negativos ("¿cuál es falsa?"). Si es inevitable, la negación va
  en **negrita**.
- Preguntas de memoria pura (definiciones) salvo que la PAES las evalúe.

## 4. El enunciado

- **Tuteo chileno neutro:** "considera", "ordena", "¿cuál es...?". Nunca voseo
  ("considerá", "fijate"). Sin chilenismos fuertes ni garabatos.
- **Matemática en LaTeX** entre `$...$`. Negativos como `$-7$`. Listas con
  `$-9,\\ -4,\\ 0$` (en YAML con comillas dobles la barra va doble).
- **Contextos chilenos y plausibles:** temperaturas de ciudades chilenas,
  pisos subterráneos, saldos en pesos, metros bajo el mar. Datos inventados,
  pero verosímiles. Sin marcas, personas reales ni temas sensibles.
- **Nombres de personas variados** (Sofía, Tomás, Ana, Luis...). No repitas
  el mismo nombre en la clase.
- Un enunciado = una pregunta. Sin información de relleno, salvo que el nivel
  3 lo pida para parecerse a la PAES.
- Para I, II, III usa bloque literal (`stem: |`) con una línea en blanco entre
  afirmaciones; si no, el markdown las junta en un párrafo.
- El enunciado no puede depender de una figura que no está.

## 5. Los distractores

Cada distractor es **exactamente la respuesta que produce un estudiante que
aplica la regla equivocada de su misconception**. Nada más.

Reglas:

1. **Tres misconceptions distintas por ítem.** Nunca dos distractores de la
   misma.
2. **Escribe la derivación.** Encima de cada ítem, un comentario YAML con cómo
   sale cada distractor. Ben lo revisa en el control 2 y sirve para auditar
   después:
   ```yaml
   # B MAGN: 2 < 4 entonces "−2 < −4"   C SINSIGNO: 3 < 4   D CERO: 0 es el menor
   ```
3. **Si no hay tercer distractor genuino, rediseña el ítem.** No rellenes. Las
   salidas, en orden:
   - cambia los números para que dos misconceptions que coincidían den
     respuestas distintas (ENT-REC 011: con 4 marcas a la izquierda y 1 a la
     derecha, ESCALA da 5 y SINSIGNO da 15; con otros valores daban lo mismo);
   - cambia al tipo afirmación o valor + afirmación;
   - cambia de tipo de ítem.
   Si nada funciona, avísalo en el control 2.
4. **Relleno prohibido.** Son relleno: la respuesta correcta sin el signo, con
   un dígito cambiado, con dos errores a la vez, o cualquier alternativa que
   ningún estudiante escribiría. En ENT-REC 9 de 17 distractores de SINSIGNO
   eran eso, y salió una misconception nueva (DIRECCION) que era la real.
5. **Colisiones.** Si dos misconceptions producen el mismo valor, la
   alternativa se etiqueta con la que mejor explica el ítem y las demás
   alternativas se buscan por otro lado. Nunca dos alternativas iguales.
6. **Paralelas en forma.** La correcta no puede ser la más larga, la única con
   "porque", la única con unidades, ni la única "redonda". Si una alternativa
   lleva justificación, todas la llevan.
7. **Verifica la correcta con cuidado.** Resuélvela dos veces, por caminos
   distintos si se puede. Un ítem con la correcta mal enseña el error.

## 6. Posición de la correcta

- Reparte las correctas parejo entre A, B, C y D (6 por letra en 24 ítems),
  sin tres iguales seguidas.
- Los distractores conservan su misconception; solo cambia su letra.
- Esto aplica al escribir. **Una vez cargado un ítem, el orden de sus
  alternativas no se toca nunca más** (ver regla 5 de SKILL.md). La plataforma
  va a desordenar las alternativas al mostrarlas; el balance en el YAML es una
  red de seguridad.

## 7. Códigos y formato

- Código: `M1-<UNIDAD>-NNN` o `M2-<UNIDAD>-NNN` según el nivel del nodo.
  Correlativo **por unidad**: si la unidad ya tiene ítems hasta el 024, la
  clase siguiente parte en 025. Revisa la base y las clases existentes.
- `source`: `propio` para ítems escritos acá; si un ítem adapta uno oficial,
  dilo según la convención de las clases existentes.
- Formato exacto: sigue las clases existentes y el cargador actual.

## 8. Ejemplos

**Bueno — tres reglas distintas, cada distractor derivado:**

```yaml
  # B MAGN: 2<4 ⇒ −2<−4   C SINSIGNO: 3<4 ignorando el signo   D CERO: 0 es el piso
  - code: M1-ENT-013
    stem: "¿Cuál de los siguientes números es menor que $-4$?"
    options:
      - {label: A, body: "$-6$", correct: true}
      - {label: B, body: "$-2$", misconception: ENT-REC-MAGN}
      - {label: C, body: "$3$", misconception: ENT-REC-SINSIGNO}
      - {label: D, body: "$0$", misconception: ENT-REC-CERO}
```

**Bueno — valor + afirmación para separar dos errores:**

```yaml
  # B SUCESOR: se aleja del 0   C CONTEO: cuenta el −8   D MAGN: 10 > 8 ⇒ −10 > −8
  stem: "¿Cuál es el antecesor del antecesor de $-8$?"
  options:
    - {body: "$-10$, que es menor que $-8$", correct: true}
    - {body: "$-6$, que es mayor que $-8$", misconception: ENT-REC-SUCESOR}
    - {body: "$-9$, que es menor que $-8$", misconception: ENT-REC-CONTEO}
    - {body: "$-10$, que es mayor que $-8$", misconception: ENT-REC-MAGN}
```

**Malo — relleno (versión descartada del mismo ítem):**

```yaml
  # C: "6" etiquetado SINSIGNO. Nadie calcula el antecesor del antecesor de 8.
  # Es la respuesta correcta sin el signo: no delata ninguna regla.
```

**Malo — describir en texto lo que debería ser figura:**

"En una recta las marcas están separadas de 5 en 5..." mide comprensión
lectora y le entrega resuelta la escala que la misconception ESCALA pone a
prueba. Va con figura, y la figura no dice la escala: el estudiante la deduce
de dos marcas rotuladas.
