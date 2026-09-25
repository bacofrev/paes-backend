---
name: crear-clase
description: Produce una clase completa de RankUp (PAES matemática) lista para cargar — alcance de sus nodos, misconceptions del catálogo, cuerpo de la clase, 24 ítems por nodo en 3 niveles, remediaciones y figuras SVG — con tres puntos de control donde Ben aprueba antes de avanzar. Úsala siempre que Ben pida crear, generar, escribir o producir contenido, ejercicios, ítems, una clase, una lección o un nodo (por ejemplo "hagamos LES-NUM-ENT-02", "genera el contenido de ENT-ADI", "necesito ejercicios para potencias"), aunque no diga "skill" ni "clase".
---

# Crear una clase

Los ítems son el combustible de la plataforma: sin banco no hay diagnóstico,
ni práctica, ni remediación. Esta skill produce **una clase completa**
(uno o dos nodos) en calidad de producción. El volumen importa, pero un ítem
malo es peor que uno que falta: mide otra cosa y ensucia la data.

La unidad de trabajo es **la clase**, no el nodo. Si Ben pide un nodo, el
primer paso es ubicarlo en su clase.

## Reglas que no se rompen

1. **Tres puntos de control. En cada uno te detienes y esperas la aprobación
   explícita de Ben.** No avances "mientras tanto". No interpretes silencio
   ni un "ok" ambiguo sobre otra cosa como aprobación.
2. **Nunca cargas nada en producción.** Generas migraciones; Ben las corre.
3. **Una sesión por unidad a la vez.** Antes de empezar, corre `git status`.
   Si hay cambios sin commitear en el catálogo de la unidad
   (`data/contenido/misconceptions/<UNIDAD>.yaml`) o en otra clase de la misma
   unidad, detente y avisa: otra sesión puede estar trabajando ahí.
4. **El cargador real manda.** Esta skill describe criterios pedagógicos. El
   formato exacto del YAML lo define `cargar_contenido.py` del repo y las
   clases ya cargadas. Si algo de acá contradice al cargador, sigue al
   cargador y avisa la contradicción.
5. **No edites contenido ya cargado para que pase una validación.** Si el
   error está en una clase, un ítem o un catálogo que ya existe en la base,
   detente y avisa. Nunca reordenes las alternativas de un ítem cargado: las
   respuestas guardadas apuntan a la fila por `(item_id, label)` y quedarían
   asociadas a otro texto y otro error sin ningún aviso.
6. **Los códigos son inmutables** una vez cargados (ítems, misconceptions,
   remediaciones, figuras). Un código nuevo es una entidad nueva.

## Antes de empezar: contexto que tienes que leer

Lee esto del repo, no lo asumas:

- El grafo: nombre, nivel (M1 o M2), prerrequisitos e hijos de cada nodo.
- El catálogo de la unidad, si existe: `data/contenido/misconceptions/<UNIDAD>.yaml`.
- Las clases ya producidas de la misma unidad (continuidad de tono, numeración
  de ítems, qué quedó derivado a este nodo) y al menos una clase de otra unidad
  como referencia de formato.
- `data/loaders/cargar_contenido.py` y `cargar_misconceptions.py` actuales, y
  `data/loaders/figuras.py` si la clase lleva figuras.
- La última bitácora que mencione la unidad.
- Si Ben entrega material propio (presentación, guía), úsalo como guía de tono
  y secuencia, **no** como fuente de alcance: suele cubrir una unidad entera.

## Flujo

### Paso 1 — Alcance y misconceptions → CONTROL 1

Lee `referencias/alcance-y-agrupacion.md` y `referencias/misconceptions.md`.

Presenta a Ben, en este orden:

1. **Qué nodos van en la clase** y por qué, según las reglas de agrupación.
2. **Alcance de cada nodo**: qué entra, qué queda fuera y a qué nodo se deriva
   cada cosa que queda fuera. Marca todo lo que el material de Ben incluye y
   este nodo no.
3. **Misconceptions propuestas**, en una tabla: código, error, ejemplo, el
   mecanismo (la regla equivocada que aplica el estudiante) y el ítem que la
   separa de la más parecida. Todas con origen `hipotesis`, salvo las que
   salgan de ítems DEMRE (`demre`, citando el ítem).
4. Las misconceptions de otros nodos que planeas usar como distractores.

Pregunta: **¿cuáles has visto en clase?** (pasan a `docente`) y **¿cuáles
descartamos?**

**DETENTE.** No escribas ítems, clase ni remediaciones hasta tener la
aprobación. Después de aprobar, actualiza el catálogo con las marcas de Ben.

### Paso 2 — Producción

Lee `referencias/clase.md`, `referencias/items.md`,
`referencias/remediaciones.md` y `referencias/figuras.md`.

Escribe, en este orden:

1. **Ítems** (24 por nodo). Primero los ítems: la clase y las remediaciones
   eligen sus ejemplos sabiendo qué números ya están tomados.
2. **Remediaciones**, una por misconception del nodo, con 6 ítems de práctica.
3. **Cuerpo de la clase.**
4. **Figuras** que necesiten los ítems y la clase, generadas por script con
   sus condiciones verificadas.

Valida con el cargador real (generando el SQL a un archivo temporal) y corre
la autorrevisión:

```
python3 .claude/skills/crear-clase/scripts/revisar_clase.py \
    data/contenido/<CLASE>.yaml --catalogo data/contenido/misconceptions/<UNIDAD>.yaml
```

Corrige todos los `ERROR`. Cada `AVISO` que quede tiene que ir explicado en el
reporte del control 2.

### Paso 3 — Reporte de autorrevisión → CONTROL 2

Entrega a Ben, antes de que lea el contenido:

- El resultado del cargador (pasa o no).
- Ítems por nivel, uso de cada misconception, posición de las correctas.
- **Los distractores que consideras débiles**, con el motivo. Sé
  dura: si dudas de un distractor, está en la lista.
- Misconceptions que aparecen en más de la mitad de los ítems: ¿es la central
  del nodo (esperable) o se está usando de comodín?
- Ejemplos de la clase o de remediaciones que se parecen a algún ítem.
- Las figuras generadas, con una vista previa en modo oscuro.
- Qué decidiste tú sin preguntar (por ejemplo, un ítem que cambiaste de nivel).

**DETENTE.** Ben revisa. Aplica sus cambios y vuelve a correr cargador y
autorrevisión.

### Paso 4 — Migraciones → CONTROL 3

- Busca el siguiente número libre de migración en `data/migraciones/`.
- Si hay misconceptions nuevas, primero la migración del catálogo; después la
  de la clase.
- La publicación, si el cargador la deja comentada, va en su propia migración.
- Deja los YAML y las migraciones listos para commit, cada migración junto al
  YAML del que salió.

**DETENTE.** Entrega a Ben: archivos creados, orden de carga y las queries de
verificación (misconceptions, ítems activos con 4 alternativas y 1 correcta,
remediaciones con sus ítems, clase con su anchor, nodo activo). **No cargues.**

### Paso 5 — Bitácora

Al cierre, deja una bitácora corta en el formato de las existentes: qué se
decidió en los controles, qué misconceptions se descartaron y por qué, qué
distractores cambió Ben, y qué quedó abierto.

## Cuándo parar y preguntar fuera de los controles

- El nodo pide algo que no cabe en el formato actual (una figura en las
  alternativas, respuesta abierta, más de 4 alternativas).
- Un nodo depende de un prerrequisito que no tiene contenido.
- Una misconception que necesitas pertenece a otro nodo y no existe todavía.
- No encuentras un tercer distractor genuino para un tipo de ítem y la única
  salida sería uno de relleno.
- El material de Ben contradice el grafo.

## Referencias

| Archivo | Cuándo leerlo |
|---|---|
| `referencias/alcance-y-agrupacion.md` | Paso 1 |
| `referencias/misconceptions.md` | Paso 1, y cada vez que armes un distractor |
| `referencias/items.md` | Paso 2, antes de escribir el primer ítem |
| `referencias/clase.md` | Paso 2, antes del cuerpo de la clase |
| `referencias/remediaciones.md` | Paso 2 |
| `referencias/figuras.md` | Paso 2, si algún ítem o la clase necesita figura |
| `scripts/revisar_clase.py` | Paso 2 y 3 |
| `scripts/ejemplo_figuras_geometria.py` | Modelo para figuras de geometría con asserts |
