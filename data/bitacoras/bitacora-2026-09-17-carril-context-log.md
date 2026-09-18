# Plataforma PAES — Bitácora: context server-side + log del guard

*Sesión: 17 de septiembre de 2026 — cierra dos de las preguntas abiertas
de `bitacora-2026-09-17-carril-implementacion.md`*

---

## 1. `responses.context = 'remediation'`, decidido en el backend

**Regla implementada, literal a como la diste:** `'remediation'` si el
ítem respondido es el que corresponde a la `position` actual de un
carril `active`; si no, el modo de la sesión. El cliente no manda
`context` — nunca lo mandó, no cambió eso.

**Dónde vive:** en `create_response`, antes del `insert`. Antes, la
consulta que detecta "este ítem es del carril" (`ACTIVE_LANE_ITEM`)
corría una sola vez, después de `INSERT_RESPONSE` y de `VERDICT`, solo
para decidir si avanzar el carril. Ahora corre **antes** del insert,
porque hace falta para escribir `context`, y el resultado (`lane`) se
reutiliza más abajo para `_update_misconception_lane` — sigue siendo
una sola consulta por respuesta, no dos. Si hubiera sido una consulta
para decidir `context` y otra distinta para avanzar el carril, las dos
podrían haber desacordado (una diciendo que es del carril, la otra que
no) por una condición de carrera de milisegundos entre ambas lecturas
dentro de la misma transacción — con una sola lectura compartida, esa
inconsistencia no puede pasar.

**`diagnostic`/`mock_exam` nunca es `'remediation'`:** implementado
literal — la consulta ni se ejecuta cuando `session["mode"] in
NO_FEEDBACK`. `lane` queda `None`, `context` cae en el modo de la
sesión. No fue necesario ningún caso especial: es la misma rama que ya
existía para no calcular `VERDICT` en esos modos.

**Un detalle que no estaba en tu instrucción y decidí por consistencia
con la regla tal como la escribiste:** si el alumno **omite** el ítem
del carril (`option_id` es `null`), `context` igual queda
`'remediation'` — tu regla dice "si el ítem servido salió de
remediation_items porque había carril activo", sin condicionar a que
la haya respondido. Lo que no pasa en ese caso es que el carril
avance: sin `option_id` no hay `VERDICT`, y sin `VERDICT` no se sabe si
acertó o no, así que `_update_misconception_lane` ni se llama (misma
regla que ya regía para todo el resto de las respuestas omitidas). El
carril se queda tal como estaba; solo cambió la etiqueta de esa fila en
`responses`.

---

## 2. El guard de `LANE_TRIGGER` ahora loguea

**Se mantiene, como dijiste.** Pero cambié cómo está construido para
poder loguear bien:

Antes, el guard vivía adentro del `insert` (`where exists (...)`), y
eso mezclaba dos motivos distintos para que la fila no cambiara: "no
hay remediación" y "ya estaba `active`/`locked`, no le toca cambiar".
Ambos dan cero filas afectadas — no hay forma de loguear solo el
primero mirando el resultado del `insert`.

Lo separé en dos pasos: `MISCONCEPTION_REMEDIATION_READY` (query nueva,
sola: ¿existe una remediación `active` con `position = 1` para esta
misconception?) se corre primero, en Python. Si no hay:

```python
logger.warning(
    "misconception %s disparada sin remediación activa con "
    "ítems: no se crea/reingresa carril",
    misconception_id,
)
```

y listo, no se llama a `LANE_TRIGGER`. Si hay, se llama a
`LANE_TRIGGER` — que ahora es un `insert ... on conflict` liso, sin el
`where exists` de antes; el guard de contenido ya se resolvió afuera.

**Por qué separarlo y no dejar el guard adentro del insert con un
`raise notice`:** un `raise notice` de Postgres no llega al logger de
la aplicación ni a donde Railway junta los logs del proceso Python; iba
a quedar invisible salvo que alguien mirara el log de la conexión a la
base directamente. Con el `logging.warning` de Python sale por stderr
del proceso `fastapi`/`uvicorn`, que es lo que Railway captura.

**No hay handler ni configuración extra.** `logging.getLogger(__name__)`
con nivel por defecto: Python manda los `WARNING` a stderr sin que
nadie lo configure (`logging.lastResort`). Si el día de mañana se
quiere un logging estructurado o mandado a otro lado, es un cambio en
`db.py`/`main.py` al iniciar la app, no algo que dependa de este
código.

---

## 3. Estado de las preguntas abiertas anteriores

De `bitacora-2026-09-17-carril-implementacion.md §4`:

1. **`responses.context = 'remediation'`** — **cerrada**, implementada
   como se describe en §1.
2. **El guard de `LANE_TRIGGER`** — **cerrada**: se mantiene y ahora
   loguea.
3. **Distractor del carril que mapea a otra misconception** — sigue
   abierta, no la tocó este cambio.
4. **`locked → ?` por revisar la clase** — sigue abierta, sigue sin
   disparador, tal como se pidió.

No hay preguntas nuevas que agregar más allá de estas dos: 3 y 4 se
mantienen sin cambios respecto de la bitácora anterior.
