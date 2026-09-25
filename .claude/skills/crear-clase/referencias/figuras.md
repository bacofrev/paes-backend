# Figuras

## Decisiones cerradas

- **Una tabla `figures` compartida** por ítems, clases y remediaciones.
  - Ítem: campo `figure: <CÓDIGO>` (el cargador lo traduce a `items.figure_id`).
  - Clase y remediación: `![](fig:<CÓDIGO>)` dentro del markdown, en el punto
    exacto del texto.
- **Solo SVG**, guardado como texto. Sin PNG, sin URLs, sin Storage.
- **Colores: solo `currentColor` y `none`.** La plataforma está en modo oscuro
  por defecto; una figura en negro fijo desaparece. El cargador rechaza
  colores fijos.
- **Código `FIG-<UNIDAD>-<NODO>-NN`** (ej. `FIG-ENT-REC-01`), correlativo por
  nodo, igual para ítems, clases y remediaciones. **Sin segmento
  descriptivo**: el código de una figura de clase llega al front, y uno como
  `ESC` (escala) anunciaría el tema. El código es inmutable.
- **Una figura de ítem nunca aparece en una clase ni en una remediación.** El
  cargador lo bloquea. Las figuras de clase son independientes: se diseñan
  para explicar, no para evaluar.
- Archivos en `data/contenido/figuras/<CÓDIGO>.svg`, junto al script `.py` que
  los genera.
- Todavía **no** hay figuras en las alternativas. Si un ítem las necesita,
  detente y avisa.

## Cuándo lleva figura un ítem

Cuando la PAES evalúa esa habilidad con figura, o cuando describir la figura
en texto cambia lo que el ítem mide. Una recta con escala descrita en texto
mide lectura y le entrega al estudiante la escala resuelta. Con figura, la
escala se deduce de dos marcas rotuladas, que es justo lo que la
misconception ESCALA pone a prueba.

Si el ítem lleva figura, **el enunciado no repite lo que la figura muestra**.

## Cómo se genera una figura

**Nunca a mano ni "a ojo".** Toda figura sale de un script que:

1. calcula las posiciones desde las **condiciones geométricas** (tangencia,
   perpendicularidad, colinealidad, equiespaciado, valores exactos sobre la
   recta);
2. **verifica cada condición con `assert`** antes de escribir el SVG;
3. verifica también lo que la figura **no** debe afirmar;
4. escribe un SVG con `currentColor`, `viewBox` y `aria-label`.

El punto 3 viene de un caso real: al recrear una figura PAES de dos
circunferencias tangentes, la secante RW quedó pasando exactamente por el
centro O. A la vista no se notaba nada raro, pero la figura afirmaba que NW
era un diámetro, cosa que el original no dice. Un estudiante que usara eso
llegaría a un resultado falso. Quedó un assert que impide que la secante
pase por O.

**Rectas numéricas:** usa el generador del repo
(`recta(min, max, paso, rotulos, puntos)` en `data/loaders/recta.py`). Para una recta de ítem, rotula
solo lo necesario para deducir la escala.

**Figuras de escala que el generador no cubre** (termómetro vertical, por
ejemplo): usa `data/contenido/figuras/generar_ent_rec.py` como modelo. Lee las
alternativas del YAML para verificar que ningún rótulo caiga en la respuesta
ni en un distractor, y que la respuesta no se dibuje como punto.

**Geometría:** usa `scripts/ejemplo_figuras_geometria.py` como modelo
(funciones auxiliares, asserts, estilo). Escribe un script por figura o por
clase y déjalo en el repo junto a las figuras, para poder regenerarlas.

## Lo que exige el cargador

Las reglas viven en `data/loaders/figuras.py` (`validar_svg`); ese archivo
manda si algo de acá no calza. Todo script de figuras debe pasar su salida
por `validar_svg` antes de escribirla. En resumen:

- XML válido, raíz `<svg>` con `xmlns`, `viewBox` y `aria-label`.
- **`fill` en la raíz** (`currentColor` o `none`): el default de SVG es negro.
- Sin `script`, `foreignObject`, `image`, `style`, animación, atributos `on*`
  ni `href` externos.
- `fill`, `stroke` y demás colores: solo `currentColor` o `none`.
- `width` y `height` iguales al `viewBox`: así una figura alta y angosta no
  se estira a todo el ancho de la columna.

## Estilo

- Trazo de 1.1 a 1.4 px, extremos redondeados.
- Rótulos de puntos en mayúscula; lados y variables en cursiva; ángulos con
  letras griegas.
- Tipografía: `Manrope, Verdana, sans-serif`.
- Nada decorativo: ni sombras, ni rellenos de color, ni fondos.
- Tamaño menor a 50 KB (una figura normal pesa 2 o 3 KB).

## Especificación antes de generar

Para cada figura, escribe primero:

```
FIG-<UNIDAD>-<NODO>-NN
Uso: ítem M1-XXX-NNN | clase, sección "..." | remediación REM-...
Qué muestra / qué explica: ...
Condiciones que se verifican: ...
Lo que NO debe afirmar: ...
aria-label: ...
```

## Revisión (control 2)

Genera una vista previa PNG de cada figura en **modo oscuro** (color de trazo
claro sobre fondo oscuro) y en modo claro, e inclúyela en el reporte. Revisa a
ojo que:

- los rótulos no se monten sobre líneas ni sobre otros rótulos;
- nada se salga del `viewBox`;
- la figura se lea al ancho de un celular.
