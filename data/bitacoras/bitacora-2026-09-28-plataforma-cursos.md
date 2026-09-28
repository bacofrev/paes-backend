# Plataforma PAES — Bitácora: Inicio, Cursos, Curso, Clase y Práctica

*Sesión: 28 de septiembre de 2026*

---

## 1. El problema

El login caía directo en una pantalla que practicaba `NUM-POT-PROD`, un código
escrito a mano en `frontend/app/page.tsx`. No había plataforma: ni navegación, ni
cursos, ni clases. Los mockups (`mockups/Flujo 2` y `Flujo 3`) piden dos módulos,
Inicio (vacío por ahora) y Cursos. Cursos muestra los cursos del plan con su
progreso. Desde un curso se entra a Área → Unidad → Clase, y desde la clase se lee
cada sección y se practica.

Regla de Ben: **nada hardcodeado**. Todo contenido o dato viene de la API.

## 2. Decisiones

**Sección = nodo.** El progreso del curso es "X de Y secciones": nodos distintos
de las clases del curso (`v_course_lessons → lesson_nodes`) contra los que están
`mastered` o `lapsed`. `lapsed` cuenta como hecho: se dominó y solo pide un repaso.

**Estado de la clase, en Python (`main.py`, `lesson_state`)**, en este orden:
1. `review` si algún nodo está `revisit` o `lapsed`
2. `completed` si todos están `mastered`
3. `in_progress` si alguno está `in_progress` o `mastered`
4. `available` si algún nodo no tiene prerrequisitos pendientes
5. `locked` en cualquier otro caso

Una clase bloqueada **se puede leer**. Lo único que se bloquea es practicar.

**Bloqueo estricto.** Cuenta cualquier prerrequisito que no esté `rejected`,
aunque no tenga contenido. Hoy `NUM-POT-FRA` queda bloqueada por `NUM-FRA-MUL`,
que no tiene clase ni ítems, y la UI la muestra como "Racionales, próximamente".
Es lo esperado hasta que exista NUM-FRA. Los prerrequisitos pendientes salen de
`_PENDING_PREREQS` en `queries.py`, con la misma regla que
`v_available_nodes.pending_prereqs`, pero en forma de lista, para decir *qué* falta
y *dónde* se enseña.

**El bloqueo lo aplica el backend.** `POST /sessions` (modos `study`/`practice`) y
`GET /nodes/{code}/next` consultan `NODE_ACCESS` (`v_available_nodes`):
- sin fila → 404 `node_not_found` (fuera de alcance da la misma respuesta que no
  existir);
- `pending_prereqs > 0` → 409 `node_locked`;
- `revisit` → 409 `node_in_revisit`, igual que antes.

`/next` también lo revisa porque `node_code` es un parámetro libre y no tiene por
qué coincidir con el nodo de la sesión. Con esto se cierra el pendiente §4 de
`bitacora-2026-09-27-cursos-planes.md`: ya no se puede practicar M2 sabiendo el
código.

**Presentación del curso en la base (migración 075).** Se agregan
`courses.description`, `short_name` e `icon`. `icon` es la clave de un set
genérico de íconos del front (`math`, `book`, `atom`, `flask`, `leaf`, `globe`).
El front sabe dibujar esas claves, pero no sabe qué curso es cuál. M1 y M2 pasan a
llamarse "Matemática M1/M2", como en el mockup.

**`GET /lessons/{code}`**: solo responde si la clase está en algún curso del
estudiante (404 `lesson_not_found` si no). Devuelve el cuerpo, las figuras que ese
cuerpo referencia (el mismo patrón que `VERDICT`) y los nodos con su anchor. El
front corta el cuerpo por `## ` con un `slug()` portado exacto de
`cargar_contenido.py`. Se comprobó sobre los 38 encabezados: 0 diferencias.

**Repaso dentro de la práctica.** Cuando `/next` responde `node_in_revisit`, la
práctica muestra la sección de la clase y un botón "Ya la repasé", que manda
`lesson_viewed` con el `lesson_code` de la URL (`?clase=`).

**Una sesión abierta de otro nodo se cierra.** Si el estudiante pasa a practicar
otra sección, el front cierra la sesión anterior (`/sessions/{id}/end`) y abre la
nueva. Si la sesión abierta es la misma práctica, la retoma.

## 3. Endpoints

- `GET /me`: devuelve `display_name`.
- `GET /courses`: agrega `description`, `short_name`, `icon`, `lesson_count`,
  `total_nodes`, `done_nodes`, `last_activity_at` y `current_node`.
- `GET /courses/{code}`: devuelve `areas → units → lessons → nodes`, con `state`,
  `done/total` y `blocking_prereqs` por clase, y `done_lessons/total_lessons` y
  `has_review` por unidad. `pending_prereqs` por nodo pasa de un número a una lista.
- `GET /lessons/{code}`: endpoint nuevo.

## 4. Pendiente / ojo

- **Un prerrequisito `lapsed` vuelve a bloquear.** `v_available_nodes` exige
  `effective_status = 'mastered'`, y `validity_days` es 60. Un nodo dominado hace
  más de 60 días bloquea a sus descendientes hasta que se vuelva a practicar. Se
  mantuvo la regla de la vista para no cambiar el criterio sin decidirlo, pero
  probablemente `lapsed` no debería bloquear.
- Skill Tree: el botón está, deshabilitado ("Pronto"). No hay mockup de esa pantalla.
- "Rinde en diciembre" (tarjeta de usuario del mockup): no existe el dato.

## 5. El carril de remediación, acotado a la sección

**El bug.** Al practicar Enteros aparecían ítems de Potencias. El carril de
remediación es del estudiante, no de la sesión: `NEXT_LANE_ITEM` tomaba el
carril activo más antiguo (tres de Potencias, del 24-09, cuando el front
practicaba `NUM-POT-PROD` fijo). Prefería ítems del nodo de la sesión, pero si
no había ninguno, servía uno de otro nodo. En este caso, además, era un nodo
bloqueado para el estudiante.

**Decisión de Ben: practicar una sección sirve solo ítems de esa sección**,
también en la remediación. Un carril sin ítems pendientes en el nodo que se
practica espera, sigue `active`, hasta que el estudiante practique un nodo donde
sí tenga. Se pierde la vuelta automática a un prerrequisito ("Este viene de…")
a cambio de que la práctica sea predecible.

**Implementación.** El carril en turno deja de ser "el activo más antiguo" y
pasa a ser "el activo más antiguo **que tenga un ítem de remediación sin
responder en este pase y en este nodo**" (`_carril_en_turno(node_filter)` en
`queries.py`). Tiene que ser por nodo y no global: con un turno global, un
carril viejo de Potencias taparía uno de Enteros al practicar Enteros, y
`/responses` no reconocería como remediación el ítem que acaba de servir `/next`.
Ambos usan la misma regla. `/next` la aplica al nodo de la URL y `/responses`
al nodo del ítem respondido, antes de insertar la respuesta. Como un carril solo
pasa a `locked` cuando no le queda ningún ítem sin responder en ningún nodo, uno
que espera no se traba.

Se eliminaron `item_node_code`/`item_node_name` de `/next` y el aviso "Este
viene de…" del front: el ítem del carril ahora siempre es del mismo nodo.

## 6. La espera al cargar: viajes a la base, no queries

**Medición.** Cada query tardaba ~200 ms, lo mismo que un `select 1`. Todo ese
tiempo es red: Supabase está en `us-west-1` y el backend local corre en Chile. Y
cada request hacía 6 o 7 viajes, uno tras otro: la auth pedía `BEGIN`, la query de
baja y `COMMIT`, y después el endpoint repetía `BEGIN`, sus 2–3 queries y `COMMIT`
(`pool.connection()` abre y cierra una transacción aunque solo se lea). Resultado:
1,2–1,5 s por pantalla en local.

**Arreglo.**
- `db.read_connection()`: conexión en autocommit, así que no hay `BEGIN` ni
  `COMMIT`. Se devuelve al pool con autocommit apagado.
- `auth.read_as_student` → `StudentReads.fetch(...)`: manda la revisión de baja y
  todas las queries del endpoint en un solo pipeline de psycopg, que es un solo
  viaje. La baja se sigue revisando antes de devolver nada.
- `COURSE_CONTENT` y `LESSON_NODES` pasan a filtrar por código, no por id, para
  poder viajar junto con la query que decide la propiedad. Si esa query dice que
  no, las filas se descartan.
- `get_current_student`, que usan los endpoints de escritura, también revisa la
  baja en `read_connection`: 1 viaje en vez de 3.

Resultado en local: `/me`, `/courses`, `/courses/M1` y `/lessons/…` pasaron de
~1.250–1.450 ms a ~190–210 ms. Se probó que el pipeline funciona a través del
pooler en modo transacción.

**Front.** Caché en memoria por path (`lib/cache.ts`): lo ya visto se pinta al
instante y se refresca por detrás. Se borra al cerrar sesión. Mientras carga algo
nuevo se muestran skeletons.

**Pendiente.** Revisar la región de Railway: si no está en US West, cada viaje en
producción cruza el continente.
