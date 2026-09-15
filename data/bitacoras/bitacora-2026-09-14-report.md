# Plataforma PAES — Bitácora: el bucle tiene salida

*Sesión cerrada: 14 de septiembre de 2026 (noche)*
*Continúa `bitacora-2026-09-14-end.md`*

---

## 1. Qué se cerró

**`GET /sessions/{id}/report` existe y la escalera de guardias está
verificada.** Es el paso 7, y con él **el bucle completo existe de punta a
punta en backend**.

| paso | estado |
|---|---|
| 1. Abrir sesión (`POST /sessions`) | ✅ |
| 2. Pedir ejercicio (`GET /next`) | ✅ |
| 3. Responder + nombre del error y remediación | ✅ |
| 4. Recalcular dominio del nodo | ✅ |
| 5. Que el criterio discrimine | ✅ |
| 6. Cerrar sesión (`POST /sessions/{id}/end`) | ✅ |
| 7. Ver el reporte (`GET /sessions/{id}/report`) | ✅ **hoy** |
| 8. Frontend | ❌ |

---

## 2. La decisión que definió el endpoint

La pregunta anotada en la bitácora anterior era *qué muestra cada modo*.
Resultó ser la pregunta equivocada. La correcta era **de qué entidad habla
la pantalla**.

Dos opciones, misma sesión:

| | qué contesta | de dónde salen los números |
|---|---|---|
| A — espejo de la sesión | "cómo me fue recién" | `where session_id = <esta>` |
| B — estado del nodo | "dónde estoy parado" | historia acumulada del alumno en ese nodo |

**Se eligió B.** El `session_id` no es el sujeto de la frase: es un filtro
de ventana temporal que decide *qué nodos mostrar*. Los números salen de
`node_mastery`.

El argumento que decidió: con 8 respuestas, A dice "75%" y ese número no
significa nada —la próxima sesión puede decir 50% sin que haya cambiado
nada real—. Y en A un error aparece dos veces y parece un resbalón; en B
aparece siete veces en tres sesiones y es un diagnóstico. **La segunda
frase es el pitch; la primera no.**

### 2.1 Consecuencias que se cerraron al pasar

- **Sin ramas por modo.** Un `mock_exam` y un `practice` devuelven la
  misma forma: cambia cuántos nodos trae la lista y cuánta evidencia tiene
  cada uno, no la estructura. El problema de los cinco reports se disolvió.
- **El report existe siempre, también en sesiones `abandoned`.** Es
  consecuencia directa de la regla del `end` (*nada puede pasar al cerrar
  que el camino de expiración no pueda hacer también*). Gatear el report
  por `status` habría recreado las dos clases de sesión por la puerta de
  atrás.
- **No se recalcula nada.** `node_mastery` ya persiste `items_answered`,
  `items_correct`, `hard_correct` y `p_correct`. Reimplementar el criterio
  en la query habría creado un segundo lugar con la misma lógica.
- **Se devuelven todos los nodos tocados, sin ordenar ni cortar.** Un
  ensayo va a traer ~20 nodos y la mayoría sin evidencia. Ordenar es barato
  después; botar información en el backend es una decisión que el frontend
  no puede deshacer.
- **`planned_item_count` va crudo, junto al conteo real.** No se deriva un
  `completo: true/false` — el umbral de qué cuenta como ensayo completo es
  un juicio que puede cambiar. Misma regla que ya aplica a `responses` y a
  `status`.

---

## 3. La escalera de guardias

Cuando un nodo está `in_progress` fallan a menudo varias condiciones a la
vez. La pantalla nombra **una sola**: la primera que corta, en orden de
menor a mayor evidencia.

| orden | guardia | qué dice |
|---|---|---|
| 1 | `min_items` | "te vimos poco" — no hay juicio que dar |
| 2 | `p_threshold` | "te está costando" — hay evidencia y es mala |
| 3 | `min_hard_correct` | "te falta subir de dificultad" — vas bien, falta techo |

El orden no es arbitrario: decirle "te faltan ejercicios difíciles" a
alguien con 3 respuestas es absurdo. Y si ya tiene volumen y tasa buena, el
techo de dificultad es la frase más accionable, porque dice qué pedir
después.

`blocked_by` se devuelve como valor enumerado, no como texto para el
alumno. La redacción es del frontend.

---

## 4. Evidencia

Los cuatro casos contra datos reales del primer día cayeron **todos** en
`min_items` (1 y 2 respuestas). `p_threshold`, `min_hard_correct` y
`mastered` no se habían ejecutado nunca. Se montó la simulación.

Cuatro alumnos sintéticos sobre `NUM-POT-PROD`, reutilizando nodo, pool y
plan de respuestas de `sim_criterio_dominio.sql` sin tocarlos.

| alumno | respuestas | esperado | obtenido | |
|---|---|---|---|---|
| A-solo-fáciles | 8 resp, 8 ok, 0 difíciles | `min_hard_correct` | `min_hard_correct` | PASA |
| B-pocos-items | 5 resp, 5 ok, 2 difíciles | `min_items` | `min_items` | PASA |
| C-tasa-baja | 8 resp, 4 ok, 2 difíciles | `p_threshold` | `p_threshold` | PASA |
| D-cumple | 8 resp, 7 ok, 2 difíciles | `mastered` | `mastered`, `blocked_by: null` | PASA |

**El caso A es el que vale.** Es el único donde falla `min_hard_correct`
con evidencia suficiente encima: `items_answered` 8 (cumple el piso),
`p_correct` 0.9 (sobre 0.7), `hard_correct` 0 contra un mínimo de 2. La
escalera revisó las dos primeras, no cortó, y recién ahí nombró la tercera.
Si el orden estuviera mal, A habría salido `min_items` como los otros.

Archivos: `sim_report_escalera.sql` (setup + veredicto) y
`sim_report_cleanup.sql` (el `DELETE`, reutilizable).

---

## 5. Los umbrales: mejor de lo pedido

El requisito era no hardcodearlos. La implementación hizo algo más:

```
mastery_config  (version=1, p_threshold=0.700, min_items=8,
                 min_difficulty=3, min_hard_correct=2)

SESSION_REPORT_NODES  ...  mc.version = nm.config_version
```

El join no va contra la config **activa**, va contra la que usó
`recompute_node_mastery` **para calcular esa fila**. Si un umbral se mueve
hoy, el report sigue explicando cada fila con el criterio que la evaluó, en
vez de acusar de "te faltan difíciles" a alguien medido con otra vara.

Es la regla de siempre —no congelar juicios, derivar al leer— aplicada a
los umbrales en vez de a los datos. **Vale como principio, no como
detalle de implementación.**

---

## 6. La cagada chica que se arregló en vez de anotarse

`SESSION_BY_ID` se extendió con `planned_item_count` para el report. Eso
rompió una garantía escrita el viernes: que esa query y `CLOSE_SESSION`
devolvieran las mismas columnas en el mismo orden, porque el handler de
`end` retorna una u otra según el camino.

No explotaba —`serialize_session()` nombra los campos uno por uno, así que
se comía la columna de más—. Pero la propiedad dejó de verificarse en el
SQL y pasó a depender del serializer. El día que alguien escriba
`return dict(row)` por comodidad, aparece.

Se agregó `planned_item_count` al `returning` de `CLOSE_SESSION` y se
reprobaron **los dos caminos** del `end`: sesión fresca y sesión ya
cerrada. `ended_at` idéntico byte por byte entre las dos llamadas.

> **Una garantía que se mueve de archivo es una garantía perdida.** Costó
> tres segundos arreglarla y habría costado una tarde encontrarla.

---

## 7. Próximos pasos — los dos son discusión, no código

El frontend es el paso 8, pero **el método de los siete anteriores no
sirve acá**: el diseño se cerraba por argumento antes de escribir código, y
el criterio de "está bien" de una pantalla es visual. Antes de abrir el
editor hay dos cosas que sí se deciden hablando:

1. **Qué muestra la pantalla del bucle y en qué orden aparece.**
   Especialmente el momento del error: es donde el producto cumple o no
   cumple la promesa de que el error tiene nombre.
2. **Si la v1 del frontend usa el report o no.** Es la pantalla del demo,
   pero el bucle se puede probar sin ella. Decidir si entra ahora o
   después del bucle andando.

Y detrás, sin moverse: **la decisión de alcance de marzo 2027** — solo M1,
solo el diagnóstico, o mover la fecha.

---

## 8. Deuda anotada, no bloqueante

- **`planned_item_count` en el encabezado nunca se ejecutó.** Todos los
  casos probados fueron `practice` y `study`, donde es null. No hay ninguna
  sesión `mock_exam` con respuestas en la base. No bloquea el frontend del
  bucle, que no usa ese modo.
- **`target_node_id` no se usa en el report.** Una sesión `practice` sin
  respuestas devuelve cuerpo vacío, aunque se sepa a qué nodo apuntaba.
- **Misconceptions acumuladas por nodo no están en el report.** Es lo más
  incómodo de la v1: es literalmente el pitch. Se sacó porque abre una
  decisión propia (cuántas mostrar, con qué corte de frecuencia).
- Arrastres: `NEXT_ITEM` filtra por `student_id`, así que un ítem no se
  repite **nunca** —no "una vez por sesión", que es la regla que se
  quería—, y eso rompe el modo `review`; `session_id: str` con uuid mal
  formado → 500 en vez de 422 (apareció dos veces más esta sesión); el
  camino inverso del criterio (`mastered` → `in_progress`) sigue sin
  probar; `GET /sessions` (historial) queda **descartado para marzo**.

---

## 9. Reglas de trabajo, de esta sesión

**Cuando una pregunta se traba, revisar si es la pregunta equivocada.** "Qué
muestra cada modo" no tenía respuesta buena; "de qué entidad habla la
pantalla" la resolvió y de paso disolvió el problema de los cinco modos.

**`information_schema.columns` filtrada solo por `table_name` miente.**
Existen `auth.sessions` (15 columnas, Supabase) y `public.sessions` (8, la
del dominio). La query sin `table_schema` las pegó en un resultado y por
dos mensajes se dio por confirmada una columna que podía ser de auth.
Siempre filtrar por esquema.

**Todos los casos verdes pueden estar probando la misma rama.** Los cuatro
primeros del report pasaron y ninguno ejercitó la lógica que se había
discutido: todos cortaron en la primera guardia. Un caso que pasa no dice
qué camino recorrió.

**Los placeholders en comandos hay que reemplazarlos.** Tres 500 seguidos
por pegar `<uuid-de-un-alumno>` literal. Y ese 500 es la deuda del uuid mal
formado, no evidencia sobre el código recién tocado: **un error con datos
de prueba malos no prueba nada.**

**Limpiar no es haber limpiado.** La verificación fue `select count(*)` en
las cuatro tablas **más** un curl al report de una sesión borrada
esperando 404. Lo segundo prueba por HTTP lo que lo primero prueba por SQL.
