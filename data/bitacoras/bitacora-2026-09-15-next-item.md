# Plataforma PAES — Bitácora: NEXT_ITEM pasa a filtrar por sesión

*Sesión: 15 de septiembre de 2026*

---

## 1. Qué se pidió

`NEXT_ITEM` excluía ítems ya respondidos por `student_id`, es decir, para
siempre. Eso hace imposible que `review` vuelva a mostrar un ítem — y
`030_one_response_per_session_item.sql` (11 de septiembre) ya había
dejado escrito por qué eso está mal: *"un ítem se responde una vez por
sesión, no una vez para siempre"*. `NEXT_ITEM` nunca se actualizó para
vivir de acuerdo a esa regla.

---

## 2. Qué cambié

**`queries.py` — `NEXT_ITEM`**: el filtro `not exists` pasó de
`r.student_id = %(student_id)s` a `r.session_id = %(session_id)s`.
Ahora excluye ítems respondidos *en la sesión actual*, no en toda la
historia del alumno.

**`main.py` — `GET /students/{student_id}/nodes/{node_code}/next`**:
el endpoint no recibía `session_id` en ningún lado — no había forma de
saber cuál es "la sesión actual" sin agregarlo. Lo sumé como query param
obligatorio (`session_id: str`) y lo paso a la query en vez de
`student_id`, que ya no lo usa.

Esto es plomería, no una regla de negocio: sin un `session_id` en algún
lado de la request, "no repetir dentro de la sesión" no se puede
implementar. Lo que decidí ahí, acotado a lo mínimo:

- Tomar `session_id` como parámetro explícito del cliente, igual que ya
  hace `POST /responses`. La alternativa — resolverlo server-side vía
  `CURRENT_SESSION` a partir de `student_id` — evita depender de un
  valor que manda el cliente, pero exige decidir qué pasa si no hay
  sesión `in_progress` (¿404? ¿todavía sin filtro?), que es una pregunta
  nueva que el endpoint no tenía antes. Elegí la opción que no la abre.
- **No agregué validación de pertenencia ni de estado.** `POST
  /responses` sí valida que la sesión exista, esté `in_progress` y sea
  del alumno (`main.py:85-92`) antes de confiar en ella. `next_item` no
  hace nada de eso: si le pasan un `session_id` de otro alumno, o ya
  cerrado, la query igual corre y excluye por esa sesión sin quejarse.
  No lo agregué porque la tarea pedía *solo* el cambio del filtro y
  esto ya es meter una decisión de validación nueva — lo marco acá en
  vez de inventarla.

No toqué `recompute_node_mastery`, `RECOMPUTE_FOR_ITEM`, ni ningún
índice o constraint. El cambio es exclusivamente el filtro de selección
de ítems.

---

## 3. Qué encontré que asume `(student_id, item_id)` único

**Nada a nivel de esquema.** No hay `UNIQUE` ni índice sobre
`(student_id, item_id)` en `responses` — de hecho `030` lo descartó a
propósito por esta misma razón (ver su comentario y
`bitacora-2026-09-11-sessions.md:279-282`). El único índice de
unicidad relevante es `responses_one_per_session_item` sobre
`(session_id, item_id)`, que este cambio respeta: sigue sin ser posible
que la misma sesión reciba el mismo ítem dos veces.

**A nivel de lógica sí hay una asunción, en `recompute_node_mastery`**
(`data/migraciones/026_un_item_un_nodo.sql:62-73`, idéntica en
`esquema_actual.sql`):

```sql
with ultimas as (
  select distinct on (r.item_id)
         r.item_id, r.option_id, r.created_at, i.author_difficulty
  from responses r
  join node_items ni on ni.node_id = p_node
  join items i on i.id = r.item_id
  where r.student_id = p_student
  order by r.item_id, r.created_at desc
)
```

Esto ya colapsa todas las respuestas de un alumno a un mismo ítem —
sin importar en qué sesión— a **una sola fila: la más reciente**. Antes
de este cambio eso solo podía pasar por un doble-submit (lo que `030`
resolvía del lado de "no insertar dos filas"); a partir de ahora puede
pasar legítimamente, porque `review` va a volver a mostrar el mismo
ítem en otra sesión a propósito. La función no se rompe — sigue
corriendo y sigue devolviendo un número— pero el criterio de "cuál
respuesta cuenta" que hasta hoy era incidental pasa a ser parte real del
comportamiento del producto. Ver la decisión abierta correspondiente
abajo.

**Efecto secundario ya anotado, no descubierto hoy:**
`bitacora-2026-09-14-criterio.md §7` ya dejaba registrado sin probar
*"que un `mastered` vuelva a `in_progress` si el alumno se equivoca
después"*. Revisando `recompute_node_mastery` para esta tarea encontré
por qué eso es más delicado de lo que esa nota sugiere:

```sql
insert into node_mastery (..., first_mastered_at, ...)
values (
  ...,
  case when v_status = 'mastered'
       then coalesce(v_prev_mastered, v_last) end,   -- NULL si no es 'mastered'
  ...
)
on conflict (student_id, node_id) do update set
  ...
  first_mastered_at = excluded.first_mastered_at,
  ...
```

Si el estado recalculado deja de ser `'mastered'`, la columna que se
escribe es `NULL` (la expresión `case` no tiene `else`), y el `on
conflict` la pisa. O sea: si un nodo pasa de `mastered` a `in_progress`,
la fecha en que se dominó por primera vez se borra, no se preserva. Y
si vuelve a `mastered` más tarde, `v_prev_mastered` ya la va a leer en
`NULL`, así que el nodo va a registrar una fecha de "primera vez
dominado" que no es la primera vez real.

Esto no lo causa mi cambio — ya era posible antes con solo agregar más
ítems al nodo — pero repetir ítems en `review` es exactly el mecanismo
que hace que un alumno vuelva a fallar algo que ya tenía bien, así que
la probabilidad de pisarlo sube con este cambio. Lo dejo anotado, sin
tocar la función.

---

## 4. Decisiones abiertas (no las resolví)

1. **La que ya tenías vos:** si un alumno responde el mismo ítem en dos
   sesiones, ¿el criterio de dominio cuenta las dos respuestas o solo
   la última? — **Nota:** el código de hecho ya tiene un comportamiento
   hoy (última respuesta gana, ver §3), pero no encontré evidencia de
   que haya sido una decisión de producto para este caso — el
   comentario que lo justifica (*"una fila por ítem distinto"*) es de
   la migración `026`, escrita cuando repetir un ítem entre sesiones
   todavía no era posible en la práctica. Que el código ya se comporte
   de una manera no significa que sea la manera correcta ahora que este
   cambio lo hace alcanzable.

2. **`first_mastered_at` se borra si el nodo deja de estar `mastered`**
   (§3). ¿Debería conservarse la primera fecha de dominio aunque el
   estado retroceda? ¿O es correcto que un retroceso invalide el
   "dominado" anterior por completo, fecha incluida?

3. **`items_answered` / `p_correct` después de un retroceso.** Si la
   respuesta vieja era correcta y la nueva es incorrecta (o viceversa),
   el nodo puede pasar de `mastered` a `in_progress` — o al revés — sin
   que el alumno haya respondido ningún ítem *nuevo*. ¿Es el
   comportamiento esperado que repetir un ítem en modo `review` pueda,
   por sí solo, cambiar el estado de dominio de un nodo que no se tocó
   en la sesión actual?

4. **Validación de `session_id` en `GET /next`** (§2): hoy no se
   verifica que la sesión exista, esté `in_progress` ni sea del alumno
   del path. `POST /responses` sí hace esas tres validaciones antes de
   confiar en el `session_id` que manda el cliente. ¿`next_item`
   debería replicar esa validación, o alcanza con que el filtro sea
   best-effort porque lo único que arriesga es repetir o no repetir un
   ítem (no hay escritura ni feedback de por medio)?

5. **`mastery_config.validity_days` / `v_node_mastery.effective_status
   = 'lapsed'`** (`esquema_actual.sql:4110-4128`): existe una vista que
   ya calcula que un nodo `mastered` "vence" si pasó mucho tiempo desde
   la última respuesta — pensada, se lee, para alimentar a `review`.
   Ningún endpoint ni query en `main.py`/`queries.py` la usa todavía.
   No es parte de esta tarea, pero es la pieza que falta para que
   `review` sepa *qué* nodos repasar, no solo que ahora *puede*
   repasarlos.

---

## 5. Lo que no toqué

- `recompute_node_mastery` — ningún cambio, ninguna corrección del
  hallazgo de `first_mastered_at`.
- `RECOMPUTE_FOR_ITEM`, `node_mastery`, `mastery_config` — sin cambios.
- Ningún índice, constraint ni migración nueva.
- Sin validación nueva en `next_item` (ver decisión abierta #4).
