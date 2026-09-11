# Bitácora — 2026-09-08 (sesión de tarde)

Cierre del loop de `NUM-POT` y construcción de la infraestructura local.
La sesión empezó como "carguemos las clases que faltan" y terminó siendo
la sesión en que el proyecto dejó de vivir solo dentro de Supabase.

---

## 1. Decisión de arranque: no abrir unidad nueva

`NUM-POT` ya estaba cerrada (10/10 nodos, 105 ítems, 42 misconceptions).
No faltaban clases.

Se decidió **cerrar el loop antes de escribir más contenido**. Razones:

- Nunca se había visto el sistema funcionar con un humano.
- `recompute_node_mastery()` no se llamaba desde la API.
- Todo el contenido estaba en `draft`: no se servía nada.

---

## 2. Lo que se ejecutó

### `024_publicar_num_pot.sql`
`draft → active` en items, remediations y lessons.

Verificación (confirmada con `select`, no con `raise notice`):

| Check | Valor | Esperado |
|---|---|---|
| items activos | 105 | 105 |
| clases activas | 5 | 5 |
| errores detectables sin remediación activa | 0 | 0 |
| nodos con menos de 8 curated activos | 0 | 0 |

La tercera fila es la que importa: **todo distractor diagnóstico tiene
texto que mostrar.** La promesa del producto quedó respaldada por datos.

Dos reglas que quedaron escritas en esa migración:

- Los ítems se publican por `role='primary'`, no por `secondary`.
- Las remediaciones se publican por **dónde se detecta el error**, no por
  `misconceptions.node_id` (que dice dónde se *enseña*).

### `025_fix_recompute_pool.sql`
Reemplaza a la `012`, que **se escribió el 5 de septiembre y nunca se
corrió**. Tres sesiones creyendo que un bug estaba arreglado.

Incluyó prueba de humo que **ejecuta** la función (plpgsql no valida SQL
hasta correrlo) y reproceso completo del historial.

### `026_un_item_un_nodo.sql`
Elimina `node_items.pool` y `node_items.role`. Ver sección 3.

### `027` / `028_mc_num_pot.sql`
Se agregó la columna `misconceptions.example` (no existía en la base
aunque sí en el YAML). La `028` la generó el cargador; reemplaza a la
`027`, escrita a mano.

---

## 3. Decisión de diseño: un ítem, un nodo

**La decisión más importante de la sesión, y la tomó Ben.**

El argumento: un ítem de geometría cuyos distractores codifican errores
de álgebra **mide** geometría y **detecta** álgebra. Si se usara para
evaluar el nodo de álgebra, habría que darle distractores de geometría —
y termina siendo mal ítem en los dos lados.

De ahí salió la separación correcta:

- **Lo que el ítem mide** → un nodo. Juicio editorial, no derivable.
- **Lo que el ítem detecta** → varios nodos. Derivable de
  `item_options.misconception_id` → `misconceptions.nodo`.

`secondary` era un tercer canal redundante para la segunda pregunta, más
grueso, escrito a mano, y que nadie leía: `recompute_node_mastery()`
filtraba `role='primary'`, o sea que la columna existía **para marcar
filas que el sistema descarta**.

Se eliminaron 24 filas `secondary` (respaldo re-insertable extraído
antes) y se impuso la regla con `unique (item_id)`.

`pool` cayó por el mismo razonamiento de Ben: curado o no curado es
propiedad del **ítem**, no de la relación nodo-ítem.

**Efecto lateral:** los ítems multinodo tapaban candidatos de fusión. Con
un ítem por nodo, si cuesta decidir a cuál pertenece, ahí hay un
`⚠fusión` que encontrar. Quedan 4 pendientes.

**Bug encontrado de paso:** `v_node_coverage` contaba las filas
`secondary` sin filtrar por `role`, mientras `recompute_node_mastery()`
sí las descartaba. La vista que decía "este nodo está listo" y la
función que decidía `mastered` **no contaban lo mismo**. Se arregló al
recrear la vista.

---

## 4. El hallazgo que reencuadró todo

**Los cargadores nunca habían corrido.** 1.114 líneas entre los dos,
tratadas toda la sesión como infraestructura existente.

El pipeline real era: Claude escribe el YAML, Claude escribe el SQL, Ben
pega en Supabase.

Consecuencias que esto explica:

- El `secondary` "olvidado dos veces" no fue descuido: **nada lo
  verificaba**. El `validar()` de 512 líneas nunca se ejecutó.
- Las derivas 22 vs 24 filas y 32 vs 42 misconceptions no eran bugs: eran
  dos artefactos que nadie sincronizaba.
- **No había verificación independiente.** Si Claude genera el YAML y
  también el SQL, un error suyo entra a la base sin que nada lo
  intercepte. El cargador era exactamente ese segundo par de ojos.

Además: **no existía carpeta local.** Ni repo, ni git, ni archivos en el
disco de Ben. El proyecto vivía en Supabase y en el historial del chat.
Esto fue una omisión de Claude: se habló de "los YAML" y de "commitear"
durante siete turnos sin haber dicho nunca que había que crear la
carpeta.

---

## 5. Infraestructura construida (no existía nada de esto)

```
/Users/bacofrev/ben_projects/Paes_data/
  .env                        connection string (session pooler, 5432)
  .venv/                      entorno Python con pyyaml
  contenido/
    LES-NUM-POT-02..05.yaml
    misconceptions/NUM-POT.yaml   (42, reconstruido)
  loaders/
    cargar_misconceptions.py      (corregido y FUNCIONANDO)
    grafo.py                      (244 nodos, 429 aristas, verificado)
  migraciones/
    026, 027, 028
    esquema_actual.sql            (6.454 líneas, pg_dump)
```

- `psql` y `pg_dump` 18.6 instalados (`brew install libpq` + PATH)
- `pg_dump --schema-only` ejecutado: **el problema #6 quedó cerrado**

### El pipeline, funcionando por primera vez

```bash
python3 loaders/cargar_misconceptions.py contenido/misconceptions/NUM-POT.yaml \
  > migraciones/028_mc_num_pot.sql \
  && psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f migraciones/028_mc_num_pot.sql
```

Resultado: `INSERT 0 42` / `DO`.

**El cargador nunca estuvo roto — solo nunca se había ejecutado.** El
único cambio que necesitó fue emitir `example`. Se le quitaron
`begin`/`commit` para que `psql -1` maneje la transacción.

**La aduana funciona:** con un `origin` inválido y un nodo vacío
inyectados a propósito, rechazó las dos, listó los tres problemas y **no
emitió una sola línea de SQL**.

---

## 6. Aprendizajes

**Confirmar la herramienta, no solo el comando.** Seis turnos escribiendo
bloques de verificación con `RAISE NOTICE` que el editor de Supabase no
muestra, pidiendo una salida que la herramienta nunca iba a dar. Nunca se
preguntó *cómo* se estaban corriendo las migraciones.

**Regla derivada:** mientras se trabaje desde el editor de Supabase, toda
verificación va con `select`, no con `raise notice`.

**Preguntar antes de diagnosticar.** Se mandaron queries para averiguar
si existía la columna `role` cuando bastaba preguntar "¿la ves en la
tabla?". Ben lo señaló y tenía razón.

**Un tema por turno.** Ben lo pidió explícitamente y era correcto: se
estaban abriendo 3-4 frentes por respuesta y cerrando pocos.

**Una columna que solo marca filas que el sistema descarta no es
información, es un filtro disfrazado de dato.**

**El campo que se olvida es el campo que no hace nada.** `secondary` se
olvidó dos veces porque su ausencia no rompía nada.

**Postgres no rastrea dependencias dentro de plpgsql.** Un `drop column`
sobre una columna que usa una función pasa sin error y deja la función
rota en silencio. Por eso la `026` reescribe la función **antes** de
borrar las columnas.

---

## 7. Estado del producto

| | |
|---|---|
| Contenido publicado y verificado | ✅ |
| `recompute_node_mastery()` correcto | ✅ |
| Historial reprocesado | ✅ (2 respuestas) |
| Esquema respaldado | ✅ |
| Pipeline YAML → Supabase | ✅ |
| `POST /responses` llama al recompute | ❌ **bloquea el loop** |
| Criterio probado contra un caso que deba rechazar | ❌ |
| Frontend | ❌ |

Evidencia total en la base: **2 respuestas**, dos estudiantes, ambas en
`NUM-POT-PROD`. Nadie ha llegado nunca a `mastered`.

---

## 8. Siguientes pasos

### Inmediato — cierra el loop

**1. Aplicar el diff de `POST /responses`.** Es el único bloqueo real.

En `queries.py`:

```python
RECOMPUTE_FOR_ITEM = """
select recompute_node_mastery(%(student_id)s::uuid, ni.node_id)
from node_items ni
where ni.item_id = %(item_id)s::uuid
"""
```

En el handler, **antes del branch de feedback**:

```python
async with db.pool.connection() as con:
    await con.execute(queries.INSERT_RESPONSE, data)

    await con.execute(queries.RECOMPUTE_FOR_ITEM, {
        "student_id": data["student_id"],
        "item_id": data["item_id"],
    })

    if payload.context in NO_FEEDBACK or payload.option_id is None:
        return {"recorded": True}
```

**Va antes del `if` a propósito**: si va después, `diagnostic` y
`mock_exam` se van por el `return` temprano y nunca actualizan el
mastery — justo los dos modos que más evidencia generan. Diferir el
feedback ≠ no registrar la evidencia.

Debe ir **dentro** del mismo `async with`: el pool no está en autocommit,
el commit ocurre al salir del bloque.

**2. Probar end-to-end.** Una respuesta real con `context: "practice"`, y
verificar que `computed_at` en `node_mastery` sea de hace segundos.

**3. Correr la simulación** (`sim_pasada_num_pot_prod.sql`), reescrita
para el editor o corrida con `psql`. Prueba que el criterio **rechaza**:
`min_hard_correct` nunca se ha probado contra un caso que deba fallar.

### Corto plazo

**4. Arreglar `cargar_contenido.py`.** Emite `pool` y `role`: todo `.sql`
que produzca hoy falla. Se dejó roto a propósito, ruidoso y visible.
Borrar `entrega_loader.py` (duplicado, nunca corrió).

**5. Reconstruir `LES-NUM-POT-01.yaml`.** 26 ítems, no apareció en el
rescate. Reconstruible desde la base, igual que se hizo con el catálogo.

**6. `git init` + primer commit.** Existe la carpeta pero no el control
de versiones. `.gitignore` debe excluir `.env` y `.venv/`.

**7. Tabla `schema_migrations`.** La justificación de postergarla
("hasta que exista un segundo entorno") quedó falsificada: el problema no
era deriva entre entornos, era **no saber en qué estado está el único
entorno**. Es lo que costó tres sesiones con la `012`.

### Pendiente de producto

**8. Pantalla fea.** Un nodo, cero CSS, que diga el nombre del error.
Pendiente desde el 1 de septiembre — cuarta sesión.

**9. Recalcular el costo por nodo** con los 10 nodos reales. El 2,3 h/nodo
salió de la primera sesión, sobre 3 nodos, con curva de aprendizaje.
Ese número decide el alcance de marzo y sigue sin existir.

**10. Decisión de alcance de marzo.** Bloqueada por el punto 9.

### Deuda técnica anotada

- `option_id` no se valida contra `item_id`: un cliente puede mandar la
  alternativa de otro ítem y el insert pasa. Silencioso e irreversible.
- Omitir (`option_id is None`) no da feedback en `practice`/`study`: se
  acumula como incorrecta pero el alumno nunca ve la correcta.
- `/next` no tiene desempate: con 11 ítems sobre 5 niveles de dificultad,
  los empates son seguros y el orden es no determinista.
- `responses.context` acepta solo `diagnostic`, `practice`, `review`,
  `remediation`. **Faltan `study` y `mock_exam`** — sin verificar contra
  la base.
- No hay tabla `sessions`. `responses.session_id` es un uuid suelto sin
  FK. `GET /sessions/{id}/report` —la pantalla del pitch— no tiene de
  dónde leer.
- Falta `student_exams`: el ruteo de M2 está mal hoy.
- 4 candidatos `⚠fusión` en el grafo sin resolver.
- Los `.sql` `001`–`023` no se pueden re-correr (mencionan columnas que
  ya no existen) y faltan `006`, `007`, `010`, `011`, `012`.
  **`esquema_actual.sql` los reemplaza como forma de reconstruir.**

---

## 9. Reglas de trabajo hacia adelante

**El YAML es la fuente de verdad.** Se edita el YAML y se regenera.
Nunca un `update` suelto en Supabase: en el momento en que se edite la
base directamente, los dos artefactos vuelven a divergir.

**Al empezar cada sesión:**

```bash
cd /Users/bacofrev/ben_projects/Paes_data
source .env
source .venv/bin/activate
```

**Después de cada migración**, regenerar el dump:

```bash
pg_dump --schema-only --no-owner --no-privileges "$DATABASE_URL" \
  > migraciones/esquema_actual.sql
```

**El número de migración siempre sube.** Va en la `028`. Nunca se
reutiliza un número ni se edita una que ya corrió.

**Orden de carga:** primero las misconceptions de la unidad, después sus
clases.
