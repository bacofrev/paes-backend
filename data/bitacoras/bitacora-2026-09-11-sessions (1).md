# Bitácora — 2026-09-11 · Diseño de API, tabla `sessions` y loop cerrado

## 1. El marco de diseño de APIs

La sesión empezó con una pregunta de Ben: *cuántas APIs necesitamos y
cómo se diseñan*. La respuesta que ordenó todo lo demás:

**No es "cuántas APIs". Es una API con varios endpoints, y la pregunta
correcta es cuántos momentos tiene la interacción del estudiante.**

Dos reglas derivadas:

- **Un endpoint = un momento de la interacción, no una tabla.** El
  anti-patrón es el CRUD automático (`GET /items`, `POST /nodes`…): da
  25 endpoints y obliga al frontend a reimplementar la lógica de
  negocio. En este producto eso es fatal, porque la selección de ítem y
  la decisión de feedback **son** el producto. Expuestos como CRUD,
  Supabase directo hace lo mismo gratis y el backend sobra.
- **El cliente pregunta, el servidor decide.** El frontend nunca dice
  "dame el ítem X", dice "¿qué sigue?". Por eso `GET /next` no recibe
  `item_id` y por eso `is_correct` no viaja al cliente.

Recorriendo el flujo del usuario salieron seis momentos, no más:

| Endpoint | Momento | Estado al cerrar |
|---|---|---|
| `GET /students/{id}/sessions/current` | abre la app | ✅ **hoy** |
| `POST /sessions` | elige qué hacer | ✅ **hoy** |
| `GET /next` | pide ítem | ✅ (arreglado hoy) |
| `POST /responses` | registra | ✅ (reescrito hoy) |
| `POST /sessions/{id}/end` | cierra | ❌ |
| `GET /sessions/{id}/report` | resultado | ❌ |

El diagnóstico de por qué Ben se sentía perdido: **los dos endpoints
existentes no formaban un ciclo.** Estaba el medio del loop sin
principio ni final, y `POST /responses` exigía un `session_id` que nadie
emitía.

---

## 2. Qué es una sesión — decisión de modelo

Pregunta de Ben: *¿un ingreso del estudiante a la app, o un proceso de
estudio?*

**Un proceso de estudio.** Dos pruebas lo definen:

- **El reporte.** Si la sesión fuera "un ingreso", `GET /report`
  mezclaría un ensayo, después remediación, después diez minutos de
  práctica. No significaría nada.
- **El feedback diferido.** Diferir el diagnóstico es propiedad de
  "estoy midiendo", no de "estoy conectado".

Consecuencia: **el modo no es un atributo raro colgando de la sesión, es
lo que la define.** Una sesión sin modo no es nada.

### 2.1 `context` → `mode`

Ben señaló que `context` no le hacía sentido en esta tabla. Tenía razón,
pero el problema era el nombre del campo, no el campo.

`context` suena a metadato de dónde vino la petición. Lo que hace es
otra cosa: es el interruptor de comportamiento del endpoint.

También se evaluó `type` y se descartó: `type` clasifica lo que la fila
*es*; `mode` dice cómo se *comporta* el sistema mientras dura.

### 2.2 El nombre `sessions` se mantiene

Se consideró `study_sessions`. Se descartó: ya está en
`responses.session_id`, en las rutas y en las bitácoras, y colisionaría
feo (`study_sessions.mode = 'study'`). El riesgo con la sesión de login
se cubre con un `comment on table` y con el hecho de que la auth vive en
`auth.sessions`, otro esquema.

---

## 3. `remediation` deja de ser un modo

Los otros cinco modos los abre alguien con una intención. `remediation`
**no la abre nadie: la dispara el sistema** cuando el estudiante falla
un distractor mapeado, en medio de otra cosa.

Modelada como sesión aparte, practicar y equivocarse generaría: sesión
de práctica → sesión de remediación → sesión de práctica. Tres filas
para un rato de estudio, y el reporte del nodo partido en pedazos.

**La remediación es un tramo dentro de una sesión.**

Modos finales, cinco: `diagnostic`, `mock_exam`, `study`, `practice`,
`review`. Cada uno se justifica porque cambia tres cosas ejecutables:

| mode | de dónde salen los ítems | feedback | cómo termina |
|---|---|---|---|
| `diagnostic` | barrido ancho, 1-2 por nodo | diferido | n fijo |
| `mock_exam` | forma de ensayo completa | diferido | n fijo |
| `study` | ítems anclados a la clase | inmediato | se acaba la clase |
| `practice` | cualquier ítem del nodo | inmediato | abierto |
| `review` | cola FSRS, cruza nodos | inmediato | se acaba la cola |

**Consecuencia pendiente:** `responses` igual necesita marcar qué
respuestas fueron post-remediación — valen distinto para dominio, porque
vienen inmediatamente después de que le explicaron el error. Va como
columna escrita por el backend, no aportada por el cliente.

---

## 4. Decisiones de producto

### 4.1 Una sola sesión abierta por estudiante

Planteado por Ben desde el caso real: *estaba estudiando en el celular,
abro el PC, ¿qué se abre?*

La sesión en la que estaba. Y eso obliga a un endpoint que no estaba en
la lista: **`GET current`**, porque el celular y el PC no se hablan
entre ellos; lo único que comparten es la base.

Con `current` en su lugar, `POST /sessions` duplicado deja de ser flujo
normal y pasa a ser lo que debía: un error (409).

### 4.2 El caso "Potencias a medias y quiere dar un ensayo"

Ben lo levantó y parecía romper la regla. No la rompe:

- Un `mock_exam` son 60+ ítems y más de una hora. No se hace de pasada.
- **Abandonar no destruye nada.** El progreso vive en `responses` y
  `node_mastery`, no en la sesión. La sesión es el envoltorio del rato
  de trabajo. Si abandona Potencias y vuelve mañana, `GET /next` no le
  repite los ítems ya respondidos porque esa regla mira `responses`.

Por eso el 409 devuelve `answered`: para que el frontend pueda decir
"llevás 7 ejercicios" en vez de un mensaje genérico. **Ese conteo se
deriva con un `count`, no se guarda en una columna.**

### 4.3 Expiración

- 24 h para `study`, `practice`, `review`
- 3 h para `mock_exam`, `diagnostic` (retomar un ensayo al otro día mide
  otra cosa)

`GET current` la marca `abandoned` y devuelve 204. Eso además evita que
el índice único deje a un estudiante trabado por una sesión zombi.

**Hardcodeado en un dict de Python, no en tabla.** Se evaluó
`session_modes` con `expires_after`. Se descartó: una tabla de 5 filas
no es un backoffice, los valores dejan de estar versionados, y quedarían
**tres** listas de modos (check constraint, `Literal` de Pydantic,
tabla) que pueden desincronizarse. Cuando exista la pantalla que la
edite, mover el dict a tabla son 20 minutos — y ahí se hace bien, con FK
desde `sessions` reemplazando el check.

### 4.4 FSRS se dispara por el fallo, no por la remediación

Corrección a una hipótesis de Ben. La secuencia real es: responde mal →
FSRS reprograma → *además* se le muestra la remediación. Dos efectos
hermanos de la misma causa.

Colgar la programación de la remediación deja dos agujeros:

- Falla un ítem cuyo distractor **no** tiene misconception mapeada. No
  hay remediación, pero el nodo igual lapsó. No se reprogramaría.
- Alguna vez se va a querer mostrar remediación sin tocar el calendario
  (el estudiante pide ver la explicación de nuevo).

### 4.5 Calendario por misconception — decidido, no construido

Ben eligió el camino por misconception sobre el camino por nodo. Por
nodo es Anki con temario ("repasá potencias"); por misconception es el
producto que diferencia ("seguís tratando `a` como si no tuviera
exponente").

Ben objetó que el límite de cantidad de ítems no es real, porque un LLM
genera ejercicios PAES fácil. **Tiene razón sobre la cantidad y no sobre
el límite.** Generar ítems es fácil; generar ítems donde el distractor B
corresponde *exactamente* a `POT-EXP-UNO` y no a otra cosa, no. Un LLM
produce distractores plausibles que colapsan dos misconcepciones en una
alternativa o son alcanzables por dos caminos. Eso no rompe nada
visible: solo degrada el diagnóstico hasta que deja de ser cierto.

**El cuello de botella es la validación, no la cantidad.**

Y quedó resuelto de forma más limpia de lo previsto (ver §6.2): si todo
ítem `active` es curado por definición, el propio `items.status` es la
aduana. Un generado entra como borrador y no llega a `active` sin que
alguien lo valide.

### 4.6 Misconceptions creadas por el estudiante — descartado

Ben lo propuso como exploración. Se descartó para v1:

- Una misconception no es una nota personal: es la llave que conecta un
  distractor con una remediación y con el calendario. Existe **antes**
  de que el estudiante responda.
- Los estudiantes son malos nombrando su propio error. Si supieran cuál
  es, no lo cometerían.
- Con códigos por estudiante, en un mes hay diez mil variantes del mismo
  error y ninguna agregable. Se muere la medición por cohorte.

Lo que sí acomoda al usuario: **que marque, no que cree** ("esto no fue
mi error") como señal de calidad de la taxonomía. Y las misconceptions
nuevas se descubren **desde los datos hacia el autor**: un distractor
sin mapeo marcado mucho más que sus hermanos es un error que existe y no
está nombrado.

### 4.7 Progreso de una lección

Descartado medir "leyó la clase": eso es medir scroll.

**Progreso = `count(nodos con status = 'mastered') / count(nodos de la
lección)`.** Cada nodo pesa igual. Derivado, nunca guardado.

Corrección sobre la formulación inicial de Ben: **no es `p_correct`, es
`status = 'mastered'`.** `p_correct` solo dejaría dominar un nodo con 1
ítem fácil acertado; el criterio real son tres condiciones (`p_correct`,
`min_items 8`, `min_hard_correct 2`) y `status` ya las encapsula.

**Riesgo de producto anotado:** con 5 nodos y `min_items 8`, el
estudiante necesita ~40 respuestas para ver 100%, y la barra marca 0%
durante la primera hora. Ahí se pierden estudiantes. La salida no es
bajar el criterio, es mostrar dos cosas: la barra de dominio (honesta) y
el avance hacia poder medirse ("Potencias: 5 de 8 ejercicios"), que ya
existe como `node_mastery.status = 'in_progress'` con `items_answered`.

---

## 5. Migraciones corridas

### 5.1 `029_sessions.sql`

```sql
create table sessions (
  id, student_id, mode, target_node_id, planned_item_count,
  status, started_at, ended_at,
  constraint sessions_cierre_coherente
    check ((status = 'in_progress') = (ended_at is null))
);
create unique index sessions_una_abierta_por_student
  on sessions (student_id) where status = 'in_progress';
```

Más `responses.session_id` a `not null` y la FK que nunca existió.

**`target_node_id` nullable**: `practice` y `study` apuntan a un nodo;
`diagnostic` y `mock_exam` barren muchos. Sin check por modo a
propósito: `review` puede ser de uno o de varios.

**`planned_item_count` en vez de `items_served`**: un contador hay que
incrementarlo en cada `GET /next` y se desincroniza solo.

**El backfill falló en la primera corrida — y estuvo bien.** La
validación abortó con `session_id compartido entre estudiantes: 1 caso`.
Los UUID de `responses` eran inventados a mano para curl, y uno se había
reusado con dos estudiantes. El arreglo fue **dejar de preservarlos**:
agrupar por `(session_id, student_id, context)` y asignar un uuid nuevo
a cada grupo. El compartido se parte solo en dos sesiones.

Evidencia: `OK — sessions creada, 3 filas, 3 respuestas ligadas`.
Verificado por tres lados: 3 sesiones con 1 respuesta cada una, ninguna
huérfana; insert con `session_id` inventado → `23503 violates foreign
key constraint`; dump regenerado.

El `WARNING: there is no transaction in progress` es cosmético: `psql
-1` ya abre la transacción. **Para las próximas migraciones, sacar
`begin`/`commit` del archivo** — se aplicó en la 030.

### 5.2 `030_one_response_per_session_item.sql`

```sql
create unique index responses_one_per_session_item
  on responses (session_id, item_id);
```

Descubierto **probando**: correr el mismo `POST /responses` dos veces
seguidas devolvía 200 las dos veces. Dos filas para el mismo par
estudiante-ítem, y `RECOMPUTE_FOR_ITEM` corriendo dos veces: dos fallos
contados donde hubo uno.

**Un índice sobre `(student_id, item_id)` habría sido el error.** En
modo `review` el mismo ítem tiene que volver — es todo el sentido de la
repetición espaciada. La regla correcta es más fina: **un ítem se
responde una vez por sesión, no una vez para siempre.**

La fila duplicada se borró antes de crear el índice.

---

## 6. Endpoints

### 6.1 `POST /sessions` y `GET current`

`POST /sessions`, cinco caminos, los cinco probados:

| caso | código | ✓ |
|---|---|---|
| sesión nueva | 201 | ✅ |
| ya hay una abierta | 409 + `session_id`, `mode`, `node_code`, `answered` | ✅ |
| `node_code` inexistente | 404 `node_not_found` | ✅ |
| `mode` inválido | 422 (Pydantic) | ✅ |
| `study`/`practice` sin `node_code` | 422 `node_code_required` | ✅ |

**El pre-chequeo de sesión abierta es redundante con el índice único, a
propósito.** El índice protege de la condición de carrera; el código da
el error con nombre y con datos. Sin el pre-chequeo, el índice tiraría
una excepción cruda que sale como 500. Se agregó `try/except
UniqueViolation` para cubrir la carrera.

**Deuda menor aceptada:** los dos caminos del 409 tienen forma distinta
— el pre-chequeo manda cuatro campos, el except solo `reason`.
Resolverlo exige releer la sesión después del except. La carrera
requiere dos clicks en el mismo milisegundo.

`GET /students/{id}/sessions/current`:

| caso | código | ✓ |
|---|---|---|
| sesión abierta y fresca | 200 con la sesión | ✅ |
| sin sesión abierta | 204 sin cuerpo | ✅ |
| sesión vencida → `abandoned` + 204 | 204 | ❌ **sin probar** |

`timezone.utc` es obligatorio en la comparación: `started_at` viene de
Postgres con zona y restarle una fecha sin zona revienta.

### 6.2 `GET /next` estaba roto — hallazgo no planificado

Al probar el loop, `GET /next` tiró 500:
`column ni.pool does not exist`.

`node_items` había quedado con dos columnas (`node_id`, `item_id`); el
esquema original tenía además `purpose`, `role` y `pool`. Se habían
eliminado por decisión de diseño (un ítem pertenece a un solo nodo; la
distinción primary/secondary no tenía sentido), pero **`queries.py`
seguía apuntando a los nombres viejos**.

Y no eran cosméticas: `where ni.role = 'primary'` filtraba, y `order by
(ni.pool = 'generated')` priorizaba curados sobre generados.

La resolución fue limpia: **si todo ítem `active` es curado por
definición, el orden puede ser solo por dificultad.** `items.status`
absorbe lo que hacía `pool`, y de paso se vuelve la aduana natural para
los ítems generados por LLM (§4.5).

`NEXT_ITEM` final: sin `ni.pool` ni `ni.role`, `order by
i.author_difficulty, i.code`.

### 6.3 `POST /responses` — `mode` desde la sesión

El agujero: el cliente mandaba `context` y ese campo decidía si el
feedback era inmediato o diferido. Un cliente podía abrir una sesión
`mock_exam` y mandar cada respuesta con `context: "practice"` para
sacarle el feedback al ensayo. Además `ResponseIn.context` era `str`
pelado: cualquier cosa entraba y moría en el check constraint como 500.

Ahora: `ResponseIn` pierde `context`, el handler lee `sessions.mode` por
`session_id`, y `responses.context` lo escribe el backend copiando de la
sesión (la columna se mantiene: permite reprocesar sin join).

Tres chequeos, **en este orden a propósito** — cada pregunta asume que
la anterior pasó:

| chequeo | código |
|---|---|
| ¿existe la sesión? | 404 `session_not_found` |
| ¿está abierta? | 409 `session_not_in_progress` |
| ¿es tuya? | 403 `session_not_yours` |

El tercero lo agregó la revisión: sin él, cualquiera podía mandar
respuestas a la sesión de otro estudiante. La migración 029 validó que
eso no pasara en los datos históricos, pero en runtime nada lo impedía.

Más el `try/except UniqueViolation` de la 030 → 409
`item_already_answered_in_session`. El recompute queda **afuera** del
`try`: si el insert falla, no hay nada que recomputar.

### 6.4 Loop completo verificado

```
GET  /next          → 200, ítem sin is_correct expuesto
POST /responses (B) → 200, is_correct false
                      + misconception POT-CONC-MULT
                      + remediación completa
POST /responses (A) → 200, is_correct true, sin misconception
POST /responses (A) → 409 item_already_answered_in_session
```

---

## 7. Infraestructura — monorepo

Había tres carpetas y `Paes_data` **no tenía git**. El cambio de hoy lo
dejó en evidencia: `sessions` toca la migración, el modelo Pydantic y el
handler. Un solo cambio conceptual repartido en repos que nada
relaciona.

Se descartó crear `paes/` como raíz nueva: habría obligado a cambiar el
root directory en Railway. **Se absorbió todo dentro de
`paes-backend/`**, que ya era la raíz del deploy.

```
paes-backend/
  main.py  db.py  queries.py  requirements.txt  Procfile
  data/        (ex Paes_data — migraciones, loaders, contenido)
  frontend/    (vacío, sin su .git)
```

`.gitignore` ampliado **antes** del primer `git add`. Verificado con
`git status --short | grep -E "\.env|node_modules|\.venv"` → vacío.
Railway deployó sin problemas.

**El venv se rompió al mover la carpeta.** El prompt mostraba `(.venv)`
pero `which python3` devolvía `/opt/homebrew/bin/python3`: los venv
guardan rutas absolutas adentro. Se borró y se rehizo.

**Arranque de sesión — son dos venv distintos:**

```bash
cd ~/ben_projects/paes-backend/data     # loaders
source .env && source .venv/bin/activate

cd ~/ben_projects/paes-backend          # backend
source .venv/bin/activate && fastapi dev main.py
```

---

## 8. Estado del producto

| | |
|---|---|
| Tabla `sessions` + FK desde `responses` | ✅ **hoy** |
| `POST /sessions` | ✅ **hoy** |
| `GET sessions/current` | ✅ **hoy** |
| `POST /responses` con `mode` del servidor | ✅ **hoy** |
| Una respuesta por sesión-ítem | ✅ **hoy** |
| `GET /next` (estaba roto) | ✅ **hoy** |
| Monorepo + git en `data/` | ✅ **hoy** |
| Loaders sincronizados con el esquema | ❌ **rotos** |
| `POST /sessions/{id}/end` | ❌ |
| `GET /sessions/{id}/report` | ❌ |
| Salida útil del modo diagnóstico | ❌ |
| Expiración de sesión probada | ❌ |
| Frontend | ❌ |

---

## 9. Pendientes

**1. Los loaders están rotos.** `cargar_contenido.py` y
`entrega_loader.py` siguen generando `insert into node_items (node_id,
item_id, pool, role)` y manejan una lista `secondary` que ya no aplica.
**La próxima carga de contenido va a fallar con el mismo error que tiró
`GET /next`.** Es el pendiente más urgente porque bloquea contenido, no
código.

**2. `POST /sessions/{id}/end` + `GET /sessions/{id}/report`.** Cierran
el ciclo. El report es la pantalla del pitch — y no se puede escribir
sin resolver antes el punto 3, porque hoy un reporte de `diagnostic`
devolvería números sin significado.

**3. Salida del modo diagnóstico.** Con n=1 por nodo, `p_correct` es el
prior y ninguna misconception llega a las 3 apariciones que pide la
vista. Decisión de producto, abierta desde el 08.

**4. Probar la expiración.** Forzar con un `update` que corra
`started_at` hacia atrás y verificar 204 + `abandoned`.

**5. Marca de post-remediación en `responses`.** Esas respuestas valen
distinto para dominio. Escrita por el backend, no por el cliente.

**6. `student_id: str` → `UUID` en los modelos Pydantic.** Hoy un uuid
mal formado sale como 500 en vez de 422. Toca `ResponseIn`, `SessionIn`
y el `::uuid` de los queries.

**7. Inconsistencia menor:** el check constraint de `responses.context`
tiene 6 valores, incluido `'remediation'`, que ya no es un modo válido
de sesión. Se resuelve junto con el punto 5.

---

## 10. Aprendizajes

**El indicador miente, el mecanismo no.** El prompt decía `(.venv)` y el
venv estaba roto. `DATABASE_URL` "estaba cargada" y estaba vacía. La
pregunta correcta no es "¿cómo se prueba esto?" sino **"¿qué tendría que
ser cierto si funciona?"** — de ahí sale el comando. `which`, `echo`, un
`select`: esos no mienten.

**Borrar una columna no borra lo que hacía.** `pool` y `role` se
eliminaron con buen criterio, pero `NEXT_ITEM` siguió apuntando a ellas
y nadie se enteró hasta hoy. Al eliminar una columna hay que preguntar
**qué reglas dependían de ella y dónde viven ahora** — a veces la
respuesta es "en ninguna parte, y está bien", pero tiene que ser una
respuesta, no un olvido. Los loaders todavía cargan ese olvido.

**El cliente declara intención, nunca consecuencia.** `mode` viene del
frontend porque solo el botón sabe qué quiso hacer el estudiante.
`is_correct` no viene del cliente porque es un resultado.

**El backend no confía en el cliente, aunque el cliente sea propio.** No
por malicia: por bugs. Un `"studdy"` por typo escribe filas corruptas
que se descubren tres semanas después en un reporte raro.

**Si podés nombrar la cosa que puede salir mal, no es un 500.** Es un
4xx con nombre. Y cada error que el frontend *pueda resolver* merece un
cuerpo con datos útiles: un 409 pelado no sirve; uno con `answered`
permite ofrecer "retomá donde ibas".

**Una constraint se elige por la regla de producto, no por la
intuición.** `(student_id, item_id)` parecía obvio y habría matado FSRS
antes de construirlo. La pregunta no era "¿puede repetirse un ítem?"
sino "¿cuándo tiene que poder repetirse?".

**Una validación que aborta la migración vale más que una que avisa.**

**Se deriva, no se acumula.** `answered`, el progreso de la lección,
`p_correct`. Contar es barato; un contador desincronizado es caro.

**El YAML es para contenido, no para esquema.** El contenido se edita,
se revalida y se regenera: el loader es la aduana. Una migración de
esquema corre una vez y el SQL es el artefacto original.

**Explicar de a un concepto.** A mitad de sesión Ben cortó con "no
entendí ni una mierda": se le habían tirado cuatro conceptos nuevos
juntos con código encima. Lo que funcionó fue volver a una frase ("una
API es una lista de direcciones") y preguntarle qué parte no cerró.

**Probar es diseñar.** El índice de la 030 no salió de una discusión:
salió de correr el mismo curl dos veces por accidente. Dos de los tres
hallazgos del día (`ni.pool`, la respuesta duplicada) aparecieron
probando, no diseñando.
