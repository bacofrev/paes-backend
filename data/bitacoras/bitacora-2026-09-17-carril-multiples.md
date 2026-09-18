# Plataforma PAES — Bitácora: varios carriles en paralelo por alumno

*Sesión: 17 de septiembre de 2026 — cierra la pregunta 3 de
`bitacora-2026-09-17-carril-implementacion.md` (distractor del carril
que mapea a otra misconception)*

---

## 1. Qué cambió

**`ACTIVE_LANE_ITEM` ahora elige "el carril en turno", no cualquier
carril `active`.** Antes bastaba con que el ítem coincidiera con la
`position` actual de CUALQUIER fila `active` del alumno. Ahora primero
se resuelve, con una CTE, cuál es el carril más antiguo por
`entered_at` (desempate por `misconception_id`, aunque un empate real
de timestamp es prácticamente imposible) y recién después se compara
su ítem actual contra el respondido. Si el ítem coincide con la
`position` de un carril que **no** es el más antiguo, la query no
devuelve nada — ese carril existe, está `active`, pero todavía no le
toca, así que no se lo trata como si el alumno lo estuviera
respondiendo.

**`_update_misconception_lane` dejó de ser `if/else` y pasa a ser dos
pasos independientes**, separados en `_advance_lane` y
`_trigger_misconception`:

1. Si el ítem era el del carril en turno: avanza, resuelve o traba
   *esa* misconception según acertó/falló — exactamente como antes,
   sin mirar a qué misconception apuntaba el distractor elegido.
2. Si la respuesta falló y el distractor mapea a una misconception
   (sea la misma que se acaba de procesar en el paso 1, sea otra, sea
   ninguna porque el ítem no pertenecía a ningún carril): esa
   misconception dispara su carril con las reglas de siempre —
   `MISCONCEPTION_REMEDIATION_READY`, el log si no hay remediación, y
   `LANE_TRIGGER`.

Los dos pasos corren siempre que apliquen, no se excluyen entre sí. Es
la implementación literal de "el carril A avanza por acierto/error,
sin importar a qué misconception apuntaba el distractor" + "un error
con nombre cuenta siempre, sin importar en qué ítem apareció".

**No hace falta nada nuevo para que convivan varios `active`:** la PK
de `student_misconceptions` ya es `(student_id, misconception_id)`, así
que dos misconceptions distintas para el mismo alumno son, sin más,
dos filas. `LANE_TRIGGER` tampoco necesitó cambios — su `on conflict`
ya operaba por esa misma PK, ajeno a cuántas otras filas `active` tenga
el alumno.

**Actualicé los comentarios de la migración 031** (tabla y columna
`entered_at`) para que digan explícitamente que varias filas `active`
en paralelo son el caso esperado, y que `entered_at` es lo que decide
el turno. La migración todavía no se corrió contra ninguna base, así
que la edité en el archivo en vez de sumar una `032`.

---

## 2. Verificación de `ACTIVE_LANE_ITEM`

No hay entorno de pruebas (`CLAUDE.md`: no hay suite todavía), así que
esto es lectura de la query, no una corrida contra datos:

- La CTE filtra `student_id` + `status = 'active'`, ordena por
  `entered_at` y corta con `limit 1` — devuelve como máximo una fila,
  siempre la más vieja cuando hay más de una.
- El `join` de afuera busca la `remediation_items` de ESA fila
  puntual, no de todas las `active`. Si el ítem respondido coincide
  con la `position` de una fila `active` más nueva, esa fila ni entra
  en la CTE, así que el `join` no tiene con qué compararla — la query
  devuelve cero filas, correcto.
- Desempate por `misconception_id` en el `order by`: cubre el caso
  (irreal en la práctica, dos disparos en el mismo microsegundo)
  donde dos filas tuvieran exactamente el mismo `entered_at`, para que
  la elección sea determinística y no dependa del plan de ejecución.

---

## 3. Preguntas abiertas

De la ronda anterior, la 3 queda cerrada por este cambio. Siguen
abiertas:

1. **`locked → ?` por revisar la clase** (sin cambios: sigue sin
   disparador, tal como se pidió desde el principio).

Y aparece una nueva, directamente consecuencia de este cambio:

2. **El orden por `entered_at` no tiene ningún efecto visible
   todavía.** `GET /next` sigue sin consultar el carril — lo dijimos
   en la bitácora de la implementación original y sigue siendo cierto.
   Que exista "el carril en turno" solo importa hoy para interpretar
   una coincidencia (que el alumno responda, por el flujo normal, el
   mismo ítem que resulta ser la `position` actual de una fila
   `active`). Nada todavía hace que el alumno **vea** el carril en
   turno antes que los demás. El día que `GET /next` (o lo que sea que
   sirva remediation_items) se conecte, "el más antiguo primero" es la
   regla a implementar ahí — este cambio la deja lista del lado de los
   datos, no la ejecuta.
3. **Sin tope de carriles en cola.** Nada impide que un alumno
   acumule varias filas `active` esperando turno indefinidamente si
   sigue fallando misconceptions distintas sin nunca resolver la más
   vieja (más probable mientras el punto 2 siga sin resolverse, porque
   hoy nada lo empuja a enfrentar el carril en turno). No sé si eso es
   el comportamiento esperado o si en algún momento hace falta un
   límite — no lo decidí, lo dejo para cuando se conecte el enrutamiento
   real.

---

## 4. Lo que no toqué

- `LANE_RESOLVE`, `LANE_ADVANCE`, `LANE_LOCK`, `LANE_NEXT_POSITION_EXISTS`,
  `MISCONCEPTION_REMEDIATION_READY`: sin cambios — ya operaban por
  `misconception_id` puntual, ajenas a cuántas otras filas existan.
- No agregué un chequeo para saltear `_trigger_misconception` cuando la
  misconception que dispara es la misma que la que se acaba de avanzar
  en `_advance_lane` (el caso más común: el propio distractor del
  carril apunta a la misconception que se está remediando).
  `LANE_TRIGGER` ya no hace nada en ese caso porque la fila sigue
  `active`, así que es una consulta de más, no un bug — no lo optimicé
  porque hoy no hay señal de que importe a esta escala.
- Sin índice nuevo para la CTE de `ACTIVE_LANE_ITEM`: filtra por
  `student_id` (ya cubierto por la PK) y el volumen esperado de filas
  `active` por alumno es chico. Si eso deja de ser cierto, es un
  `create index` aparte, no algo para anticipar ahora.
