# Plataforma PAES — Bitácora: el criterio de dominio rechaza

*Sesión cerrada: 14 de septiembre de 2026*

---

## 1. Qué se cerró

**El criterio de dominio fue probado contra casos que debían fallar, y
falló como corresponde.** Es el pendiente que venía arrastrándose desde
la bitácora del 08: `min_hard_correct` nunca se había verificado contra
un alumno que tuviera que ser rechazado.

Hasta hoy, "dominado" era una afirmación sin evidencia de que discriminara.
Es el mismo riesgo que se le encontró al prototipo de Figma en agosto
—completitud disfrazada de dominio— pero escondido en una función SQL en
vez de en una estrella dorada.

---

## 2. La simulación

`sim_criterio_dominio.sql`. Cuatro alumnos sintéticos, uno por cada
condición del criterio, todo dentro de una transacción que termina en
`rollback`. No deja nada en la base.

Nodo elegido automáticamente por tener munición suficiente
(≥8 ítems bajo el piso de dificultad, ≥2 sobre el piso):
**`NUM-POT-PROD` — Producto y cociente de igual base**, 14 ítems.

### Resultado

| alumno | condición probada | resp. | correctas | difíciles ok | p_correct | esperado | obtenido | |
|---|---|---|---|---|---|---|---|---|
| A-solo-faciles | `min_hard_correct` | 8 | 8 | 0 | 0.9000 | in_progress | in_progress | PASA |
| B-pocos-items | `min_items` | 5 | 5 | 2 | 0.8571 | in_progress | in_progress | PASA |
| C-tasa-baja | `p_threshold` | 8 | 4 | 2 | 0.5000 | in_progress | in_progress | PASA |
| D-cumple | ninguna | 8 | 7 | 2 | 0.8000 | mastered | **mastered** | PASA |

Las tres guardias cortan por separado. El que cumple pasa. La puerta del
bucle cierra.

---

## 3. La función, verificada de paso

`pg_get_functiondef('recompute_node_mastery')` confirma lo que la
bitácora del 08 dejó como duda: el filtro por `purpose` y `role`
desapareció junto con las columnas que borró la `026`. El comentario
ahora dice *"un ítem mide un nodo: no hay pool ni role que filtrar"*,
consistente con el `UNIQUE` en `node_items.item_id`.

**No es deuda. Queda cerrado.**

---

## 4. La decisión de producto que se cerró al pasar

El diagnóstico y el dominio del nodo son preguntas distintas y no se
mezclan:

| | qué responde |
|---|---|
| diagnóstico | **dónde** estás parado — ubica en el mapa |
| bucle del nodo | **si domina o no** — dictamina |

La discusión A/B de la bitácora anterior queda archivada. El diagnóstico
ubica, el nodo dictamina, y el trabajo está en el bucle.

De paso, la query de cobertura de misconceptions dio números que no
bloquean nada pero vale tener anotados: sobre `NUM-POT`, 9 misconceptions
aparecen como distractor en 3 o más nodos distintos, con `POT-CONC-MULT`
en 8 nodos y 41 ítems. Es una sola unidad escrita de corrido, así que no
se puede extrapolar a Álgebra ni Geometría.

---

## 5. El flujo, estado real

Lo que tiene que existir para que un alumno entre a un nodo y salga por
criterio:

| paso | estado |
|---|---|
| 1. Abrir sesión (`POST /sessions`) | ✅ |
| 2. Pedir ejercicio (`GET /next`) | ✅ |
| 3. Responder + recibir el nombre del error y remediación | ✅ verificado en prod |
| 4. Recalcular dominio del nodo | ✅ |
| 5. Que el criterio discrimine | ✅ **cerrado hoy** |
| 6. Cerrar sesión (`POST /sessions/{id}/end`) | ❌ |
| 7. Ver el reporte (`GET /sessions/{id}/report`) | ❌ |
| 8. Frontend | ❌ |

---

## 6. Próximos pasos

1. **`POST /sessions/{id}/end`.** Chico, sin decisiones abiertas.
   Definir qué hace además de escribir `ended_at`.
2. **`GET /sessions/{id}/report`.** La pantalla de salida.
3. **Frontend del bucle**, un nodo, sin CSS.
4. **Decisión de alcance marzo 2027:** solo M1, solo el diagnóstico, o
   mover la fecha.

---

## 7. Deuda anotada, no bloqueante

- **No se sabe si `NUM-POT-PROD` es el único nodo con munición.** El
  script elige el primero que califica. Si fuera el único con 8 fáciles
  + 2 difíciles, nadie puede llegar a `mastered` en los otros 9 nodos.
  Es una query cuando se vuelva a tocar contenido.
- **El camino inverso no está probado:** que un `mastered` vuelva a
  `in_progress` si el alumno se equivoca después. La función recalcula
  desde cero, así que debería andar, pero no está verificado.
- Arrastres del 14 anterior: las clases 01, 03, 04 y 05 pueden tener el
  mismo hueco de ítems que tuvo la 02; el campo `pool` del YAML tiene
  nombre de una columna que ya no existe; `GET current` con sesión
  vencida → `abandoned` + 204 sigue sin probar desde el 11.

---

## 8. Reglas de trabajo, de esta sesión

**Los scripts con tablas temporales no se pegan en el editor de
Supabase.** Cada statement corre en su propia transacción, así que
cualquier `temp table` muere antes del siguiente bloque. Es la misma
regla de agosto sobre `BEGIN`/`COMMIT`, con otra cara. Van por `psql -f`
y punto.

**El pager de psql puede hacer parecer que un script se colgó.** `less`
se queda esperando en el primer resultado. Correr con `PSQL_PAGER=cat` y
redirigir a archivo:

```
PSQL_PAGER=cat psql -X -v ON_ERROR_STOP=1 -f archivo.sql "$DATABASE_URL" > out.txt 2>&1
tail -40 out.txt
```

**En `create temp table` con definición de columnas, `on commit drop` va
después del paréntesis.** Solo en la forma `as select` va antes.

**Probar que algo rechaza cuesta menos que descubrirlo con usuarios
adentro.** 20 minutos de simulación contra tres sesiones de frontend
construidas sobre una puerta que no cierra.

**La IA da velocidad, no oficio.** El juicio de decidir *qué* probar fue
la parte cara y no la escribió la máquina. Los dos errores del script
—pager y sintaxis— son exactamente lo que un dev con Postgres en los
dedos no habría cometido.
