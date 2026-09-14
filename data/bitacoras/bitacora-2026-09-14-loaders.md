# Bitácora 2026-09-14 — Loaders y procedencia del contenido

Sesión que empezó arreglando un bug de columnas y terminó destapando que
el YAML había dejado de ser la fuente de lo que hay en producción.

---

## 1. Lo que se cerró

### 1.1 El loader ya no escribe columnas muertas

`cargar_contenido.py` seguía insertando `pool` y `role` en `node_items`,
columnas eliminadas por la migración `026_un_item_un_nodo.sql`. Es el
mismo hallazgo que tiró `GET /next` con `column ni.pool does not exist`:
la columna se borró, pero el código que la escribía quedó apuntando al
nombre viejo.

Cambios:

- **`node_items` escribe solo `(node_id, item_id)`.**
- **`on conflict do nothing`, no `do update`.** Si el ítem ya vive en
  otro nodo, NO se mueve. Moverlo por upsert reescribiría a qué nodo
  cuentan sus respuestas históricas. La verificación del final aborta si
  el ítem no está en el nodo que declara el YAML.
- **`secondary` pasó a ser falla dura.** Lo que un ítem detecta de otros
  nodos ya lo dicen sus distractores vía `misconceptions.node_id`.
  Se borraron las 24 ocurrencias en los cinco YAML.
- **Se sacaron `begin`/`commit`** del SQL emitido — `psql -1` ya abre la
  transacción (acordado desde la 030).

### 1.2 Se eliminó el loader duplicado

`entrega_loader.py` era `cargar_contenido.py` con un chequeo extra
(códigos repetidos entre clases) y el mismo docstring. Por eso el olvido
de `pool`/`role` estaba en dos lugares. El arreglo partió del más
completo y quedó un solo archivo.

Al buscarlo en disco no apareció: ya no existía.

### 1.3 Cargar dejó de ser publicar

Hallazgo no planificado: el loader inserta ítems como `'draft'`, y
`NEXT_ITEM` filtra por `i.status = 'active'`. **La próxima clase cargada
no habría servido ni un ítem** — y no con error, con un 404 `sin_items`
que parece "se acabaron los ejercicios".

Los 105 ítems que hoy están `active` fueron promovidos a mano, sin
registro de cuándo ni por quién.

Decisión de Ben: **la promoción la hace él, y tiene que ser explícita.**
El loader ahora cierra cada migración con un bloque de publicación
comentado:

- los `curated` listados para `update items set status = 'active'`
- los `generated` nombrados y explícitamente afuera (§4.5: no se publican
  sin validar el mapeo distractor→misconception)
- `remediations` y `lessons` en `update` separados, para poder publicar
  ítems y dejar la clase en draft
- la query de verificación

Nada corre al cargar. El registro de qué se publicó y cuándo queda en el
archivo commiteado.

---

## 2. Lo que se destapó: el YAML no era la fuente

### 2.1 `LES-NUM-POT-01.yaml` no estaba en el repo

La clase existía en producción (la cargó `018_les_num_pot_01.sql`) pero
su YAML no estaba en `data/contenido/`. `git ls-tree` sobre el commit de
la mudanza confirmó que ya no estaba el 11: nunca entró a git.

El validador lo detectó solo. Las clases 03, 04 y 05 fallaron con
"errores detectables sin remediación en toda la unidad NUM-POT:
POT-CONC-FACTOR, POT-CONC-MULT, POT-SIG-NEG". **Esas tres remediaciones
vivían en la 01.** La regla de evaluar cobertura por unidad y no por
archivo es lo que hizo visible la pérdida.

Apareció en `~/Downloads` con `mdfind`. Completa, con las tres
remediaciones. Copiada al repo y commiteada.

### 2.2 Cuatro ítems vivos en producción sin fuente

`M1-POT-206`, `207`, `208` y `308`: `active` en la base, servidos al
estudiante, ausentes de todo YAML. No se podían corregir — no había
archivo donde editarlos.

Se recuperaron con una query a `items` + `item_options` +
`misconceptions` y se reinsertaron en `LES-NUM-POT-02.yaml`. El loader
ahora emite 34 ítems (27 curated), que es lo que hay en la base.

### 2.3 Las migraciones 001–025 no están en el repo

`data/migraciones/` empieza en la 026. Todo el contenido cargado —las
cinco clases, las misconceptions, el grafo— entró por archivos que ya no
existen. Por eso `esquema_actual.sql` es la reconstrucción del esquema:
no hay historia que replayear.

**Decisión: se empieza limpio desde la 026.** Replayear historia perdida
no le sirve a nadie; el esquema está reconstruido y la base funciona.

### 2.4 `cargar_misconceptions.py` sobreescrito y recuperado

El loader nuevo se pegó por error encima de `cargar_misconceptions.py`.
Se recuperó con `git checkout --`. Si el archivo no hubiera estado
versionado, no había cómo. La mudanza al monorepo del 11 salvó dos
archivos en una hora.

---

## 3. Lo que falló al verificar (y cómo se detectó)

Dos veces se dio por bueno algo que no lo era:

- **`head -3` de un archivo vacío no imprime nada**, y
  `python3 archivo_vacio.py` termina con código 0. Cuatro "OK" seguidos
  que no validaron nada. El pegado no se había guardado.
- **`grep -c "PUBLICACIÓN"` dio 0** una semana después: había quedado la
  versión anterior del loader.

En ambos casos el indicador decía éxito y no había pasado nada. Es el
mismo patrón de la bitácora del 08: el prompt decía `(.venv)` y el venv
estaba roto.

**Regla: la verificación cuenta salida, no exit code.**
`python3 loader.py archivo.yaml | wc -l` — cero líneas es una falla.

---

## 4. Decisión de producto: qué muestra el diagnóstico

Abierta desde el 08, parcialmente resuelta.

El diagnóstico barre muchos nodos con 2–3 ítems cada uno. Ningún nodo
llega a `mastered` con `min_items 8`, así que la barra de dominio del
modo `study` no aplica. Y afirmar "tu error es X" con n=1 o n=2 es
adivinar: si se dice fuerte y se erra, se quema la promesa entera; si se
dice tibio, es lo mismo que hace cualquier preu.

**Lo que se resolvió: cada modo dice lo que su evidencia le permite.**

| | evidencia | cobertura | qué afirma |
|---|---|---|---|
| diagnóstico | 2–3 ítems/nodo | 40 nodos | **dónde** estás parado |
| práctica | 8+ ítems/nodo | 1 nodo | **qué** estás haciendo mal |

El diagnóstico ubica en el mapa y ordena por dónde atacar. La práctica
nombra el error, porque ahí sí se vio tres veces. El pitch no se rompe:
se cumple más tarde y con fundamento.

**Consecuencia incómoda anotada:** el diagnóstico deja de ser la pantalla
de venta. "Tenés flojo estos cinco nodos" es lo que da cualquier ensayo
con puntaje por eje. El momento donde el producto se ve distinto se
corre a la primera sesión de práctica.

**Lo que queda abierto — primera decisión del próximo chat:**

- **A.** Aceptarlo. El demo de venta es la pantalla de práctica.
- **B.** El diagnóstico muestra hipótesis marcadas como tales ("vimos dos
  señales de que podrías estar sumando exponentes — lo confirmamos en los
  próximos ejercicios"). Honesto y le da al estudiante un motivo concreto
  para hacer la primera práctica. Más frágil: exige una regla de cuántas
  señales bastan y una pantalla que distinga visualmente hipótesis de
  hallazgo.

---

## 5. Próximos pasos, en orden

1. **Cerrar A o B del diagnóstico.** Bloquea el report: sin saber qué
   muestra, no se puede escribir.
2. **`POST /sessions/{id}/end`.** Más chico y sin decisiones abiertas.
3. **`GET /sessions/{id}/report`.** La pantalla de salida del diagnóstico
   y del ensayo, y la pantalla del demo.
4. **Decisión de alcance marzo 2027:** solo M1, solo el diagnóstico, o
   mover la fecha. NUM-POT quedó completa y calibrada, que era la
   condición para decidir.

### Deuda anotada, no bloqueante

- **Las clases 01, 03, 04 y 05 pueden tener el mismo hueco que la 02.**
  Los cuatro ítems aparecieron por comparar contra una copia vieja; para
  las otras no hay con qué comparar. Se detecta contando ítems por clase
  en la base contra lo que emite el loader.
- **El campo `pool` del YAML tiene nombre de una columna que ya no
  existe.** Hoy alimenta el bloque de publicación (`curated` → se
  publica). Renombrarlo es un `sed` en cinco archivos.
- **`GET current` con sesión vencida → `abandoned` + 204** sigue sin
  probar, desde el 11.

---

## 6. Commits

```
57604d7  fix(loaders): node_items sin pool/role, secondary prohibido;
         recupera LES-NUM-POT-01
e6d6681  feat(loaders): bloque de publicacion; recupera 4 items de la 02
         desde produccion
```
