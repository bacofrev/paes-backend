-- =====================================================================
-- LES-NUM-ENT-07 — Valor absoluto
-- Generado por cargar_contenido.py desde LES-NUM-ENT-07.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-ENT-ABS-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 76" width="500" height="76" role="img" aria-label="Recta numérica con 12 marcas equiespaciadas. rótulos: 0; 1. puntos marcados: P; Q; R; S; T" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <line class="eje" x1="14" y1="36" x2="486" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="494,36 484,31 484,41"/>
  <line class="marca" data-valor="-5" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-3" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-1" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="0" x="230" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="1" x="270" y="64" text-anchor="middle">1</text>
  <circle class="punto" data-valor="-4" cx="70" cy="36" r="4.5"/>
  <text class="nombre" x="70" y="18" text-anchor="middle" font-weight="600">P</text>
  <circle class="punto" data-valor="-3" cx="110" cy="36" r="4.5"/>
  <text class="nombre" x="110" y="18" text-anchor="middle" font-weight="600">Q</text>
  <circle class="punto" data-valor="-1" cx="190" cy="36" r="4.5"/>
  <text class="nombre" x="190" y="18" text-anchor="middle" font-weight="600">R</text>
  <circle class="punto" data-valor="2" cx="310" cy="36" r="4.5"/>
  <text class="nombre" x="310" y="18" text-anchor="middle" font-weight="600">S</text>
  <circle class="punto" data-valor="5" cx="430" cy="36" r="4.5"/>
  <text class="nombre" x="430" y="18" text-anchor="middle" font-weight="600">T</text>
</svg>
$c$),
  ($c$FIG-ENT-ABS-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 420 76" width="420" height="76" role="img" aria-label="Recta numérica con 10 marcas equiespaciadas. rótulos: 0; 4. puntos marcados: M; N" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <line class="eje" x1="14" y1="36" x2="406" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="414,36 404,31 404,41"/>
  <line class="marca" data-valor="-8" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-6" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="8" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="10" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="0" x="190" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="4" x="270" y="64" text-anchor="middle">4</text>
  <circle class="punto" data-valor="-6" cx="70" cy="36" r="4.5"/>
  <text class="nombre" x="70" y="18" text-anchor="middle" font-weight="600">M</text>
  <circle class="punto" data-valor="8" cx="350" cy="36" r="4.5"/>
  <text class="nombre" x="350" y="18" text-anchor="middle" font-weight="600">N</text>
</svg>
$c$),
  ($c$FIG-ENT-ABS-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 220 118" width="220" height="118" role="img" aria-label="Recta numérica de −14 a 14 con marcas cada 7. Desde el 0 salen dos arcos, uno hasta el −14 y otro hasta el 14, los dos rotulados con la distancia 14" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="206" y2="36" stroke="currentColor" stroke-width="1.3" />
  <polygon points="6,36 16,31 16,41" />
  <polygon points="214,36 204,31 204,41" />
  <line class="marca" data-valor="-14" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-7" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="0" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="7" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="14" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3" />
  <text class="rotulo" data-valor="-14" x="30" y="64" text-anchor="middle">−14</text>
  <text class="rotulo" data-valor="-7" x="70" y="64" text-anchor="middle">−7</text>
  <text class="rotulo" data-valor="0" x="110" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="7" x="150" y="64" text-anchor="middle">7</text>
  <text class="rotulo" data-valor="14" x="190" y="64" text-anchor="middle">14</text>
  <circle class="punto" data-valor="-14" cx="30" cy="36" r="4.5" />
  <circle class="punto" data-valor="14" cx="190" cy="36" r="4.5" />
  </g>
  <path class="salto" data-desde="0" data-hasta="-14" fill="none" stroke="currentColor" stroke-width="1.3" d="M110,68 Q70,8 30,68" />
  <polygon class="punta" points="30,68 30.68,60.04 37.09,64.31" />
  <text class="cambio" data-valor="-14" x="70" y="33" text-anchor="middle" font-weight="600">14</text>
  <path class="salto" data-desde="0" data-hasta="14" fill="none" stroke="currentColor" stroke-width="1.3" d="M110,68 Q150,8 190,68" />
  <polygon class="punta" points="190,68 182.91,64.31 189.32,60.04" />
  <text class="cambio" data-valor="14" x="150" y="33" text-anchor="middle" font-weight="600">14</text>
</svg>
$c$),
  ($c$FIG-ENT-ABS-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 76" width="780" height="76" role="img" aria-label="Recta numérica de −9 a 9. Están marcados los quince enteros que cumplen que su valor absoluto es menor o igual que 7, del −7 al 7" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <line class="eje" x1="14" y1="36" x2="766" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="774,36 764,31 764,41"/>
  <line class="marca" data-valor="-9" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-8" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-7" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-6" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-5" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-3" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-1" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="510" y1="29" x2="510" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="550" y1="29" x2="550" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="590" y1="29" x2="590" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="630" y1="29" x2="630" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="7" x1="670" y1="29" x2="670" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="8" x1="710" y1="29" x2="710" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="9" x1="750" y1="29" x2="750" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="-9" x="30" y="64" text-anchor="middle">−9</text>
  <text class="rotulo" data-valor="-7" x="110" y="64" text-anchor="middle">−7</text>
  <text class="rotulo" data-valor="0" x="390" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="7" x="670" y="64" text-anchor="middle">7</text>
  <text class="rotulo" data-valor="9" x="750" y="64" text-anchor="middle">9</text>
  <circle class="punto" data-valor="-7" cx="110" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-6" cx="150" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-5" cx="190" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-4" cx="230" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-3" cx="270" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-2" cx="310" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-1" cx="350" cy="36" r="4.5"/>
  <circle class="punto" data-valor="0" cx="390" cy="36" r="4.5"/>
  <circle class="punto" data-valor="1" cx="430" cy="36" r="4.5"/>
  <circle class="punto" data-valor="2" cx="470" cy="36" r="4.5"/>
  <circle class="punto" data-valor="3" cx="510" cy="36" r="4.5"/>
  <circle class="punto" data-valor="4" cx="550" cy="36" r="4.5"/>
  <circle class="punto" data-valor="5" cx="590" cy="36" r="4.5"/>
  <circle class="punto" data-valor="6" cx="630" cy="36" r="4.5"/>
  <circle class="punto" data-valor="7" cx="670" cy="36" r="4.5"/>
</svg>
$c$),
  ($c$FIG-ENT-ABS-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 118" width="500" height="118" role="img" aria-label="Recta numérica de −8 a 3. Un arco va del −7 al 0, rotulado 7, y otro del 0 al 2, rotulado 2" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="486" y2="36" stroke="currentColor" stroke-width="1.3" />
  <polygon points="6,36 16,31 16,41" />
  <polygon points="494,36 484,31 484,41" />
  <line class="marca" data-valor="-8" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-7" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-6" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-5" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-4" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-3" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-2" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="-1" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="0" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="1" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="2" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3" />
  <line class="marca" data-valor="3" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3" />
  <text class="rotulo" data-valor="-7" x="70" y="64" text-anchor="middle">−7</text>
  <text class="rotulo" data-valor="0" x="350" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="2" x="430" y="64" text-anchor="middle">2</text>
  <circle class="punto" data-valor="-7" cx="70" cy="36" r="4.5" />
  <circle class="punto" data-valor="2" cx="430" cy="36" r="4.5" />
  </g>
  <path class="salto" data-desde="-7" data-hasta="0" fill="none" stroke="currentColor" stroke-width="1.3" d="M70,68 Q210,8 350,68" />
  <polygon class="punta" points="350,68 342.05,68.78 345.08,61.70" />
  <text class="cambio" data-valor="7" x="210" y="33" text-anchor="middle" font-weight="600">7</text>
  <path class="salto" data-desde="0" data-hasta="2" fill="none" stroke="currentColor" stroke-width="1.3" d="M350,68 Q390,8 430,68" />
  <polygon class="punta" points="430,68 422.91,64.31 429.32,60.04" />
  <text class="cambio" data-valor="2" x="390" y="33" text-anchor="middle" font-weight="600">2</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M2-ENT-001$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-002$c$, $c$¿Cuál de las siguientes desigualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-003$c$, $c$¿Qué valores de $x$ cumplen $|x| = -6$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-004$c$, $c$¿Cuántos números enteros $x$ cumplen $|x| \leq 3$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-005$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-006$c$, $c$En la recta numérica, el punto $A$ está en $-5$ y el punto $B$ está en $3$. ¿Cuál afirmación es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-007$c$, $c$¿Cuáles son los valores de $-|-6|$ y de $-|4|$, en ese orden?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-008$c$, $c$¿Cuántos números enteros $x$ cumplen $|x| < 5$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-009$c$, $c$¿Cuál de las siguientes opciones ordena de menor a mayor las expresiones $|-7|,\ |3|,\ -|5|,\ |0|$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-010$c$, $c$¿Qué números cumplen $|x| = 9$ y qué números cumplen $|x| = -3$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-011$c$, $c$Frente a la costa de Valparaíso, un buzo está a 12 m bajo el nivel del mar. Justo sobre él, una gaviota vuela a 7 m sobre el nivel del mar. Si el nivel del mar es el $0$, ¿cuál opción indica la posición del buzo y la distancia entre el buzo y la gaviota?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-012$c$, $c$¿Cuáles de los puntos marcados en la recta cumplen $|x| \leq 3$?$c$, 2, $c$propio$c$::text, $c$FIG-ENT-ABS-01$c$::text),
  ($c$M2-ENT-013$c$, $c$Una cámara de frío está programada a $-18$ °C. Sea $v$ la variación de la temperatura respecto de ese valor: positiva si sube y negativa si baja. Para que los alimentos se conserven, debe cumplirse $|v| \leq 4$. Si el termómetro solo marca grados enteros, ¿cuántas lecturas distintas están permitidas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-014$c$, $c$¿Cuántos números enteros cumplen $|x| = 5$, cuántos cumplen $|x| = 0$ y cuántos cumplen $|x| = -5$, en ese orden?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-015$c$, $c$¿Cuántos números enteros **negativos** cumplen $|x| < 6$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-016$c$, $c$Un día de invierno en Ollagüe, a las 5:00 se registraron 9 °C bajo cero y a las 15:00, 6 °C. ¿Cuál afirmación es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-017$c$, $c$Considera las siguientes afirmaciones:

I. Exactamente dos números cumplen $|x| = 12$.

II. Exactamente dos números cumplen $|x| = -12$.

III. Los números $-|-3|$ y $-|8|$ son positivos.

¿Cuál o cuáles son verdaderas?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-018$c$, $c$Considera las siguientes afirmaciones:

I. Hay $11$ números enteros que cumplen $|x| \leq 5$.

II. La distancia entre $-6$ y $2$ en la recta numérica es $8$.

III. Si $|x| = 3$, entonces $x$ puede ser $-3$.

¿Cuál o cuáles son verdaderas?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-019$c$, $c$Sea $k$ un número entero negativo. ¿Cuántos números cumplen $|x| = k$ y cuántos cumplen $|x| = -k$, respectivamente?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-020$c$, $c$¿Cuántos números enteros $x$ cumplen $|x| \leq 50$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-021$c$, $c$En la recta numérica, las marcas están igualmente espaciadas. ¿Cuál es la distancia entre los puntos $M$ y $N$?$c$, 3, $c$propio$c$::text, $c$FIG-ENT-ABS-02$c$::text),
  ($c$M2-ENT-022$c$, $c$Considera las siguientes desigualdades:

I. $|-5| > |2|$

II. $-|-5| < -|2|$

III. $|4| > |-1|$

¿Cuál o cuáles son verdaderas?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-023$c$, $c$Considera las siguientes afirmaciones:

I. La distancia entre $-8$ y $-3$ en la recta numérica es $5$.

II. La distancia entre $-8$ y $3$ en la recta numérica es $5$.

III. Desde $-8$ hasta $3$, incluyendo ambos, hay $12$ números enteros.

¿Cuál o cuáles son verdaderas?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-024$c$, $c$En una fábrica de Rancagua, una pieza se acepta si su error de medida $e$, en milímetros, cumple $|e| \leq 2$. Se midieron seis piezas y sus errores fueron $-4,\ -2,\ 0,\ 1,\ 3$ y $5$. ¿Cuántas piezas se aceptan?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-025$c$, $c$¿Cuál es el valor de $|-2 - 6|$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-026$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-027$c$, $c$En la recta numérica, ¿cuál de las siguientes expresiones corresponde siempre a la distancia entre los números enteros $a$ y $b$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-028$c$, $c$Un día de invierno en Farellones, la temperatura mínima fue de $-7$ °C y la máxima, de $5$ °C. La amplitud térmica se calcula como $|\text{máxima} - \text{mínima}|$. ¿Cuál fue la amplitud térmica ese día?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-029$c$, $c$Si $a$ y $b$ son números enteros tales que $a > b$, ¿a qué expresión es igual $|b - a|$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-030$c$, $c$Si $x$ e $y$ son números enteros tales que $|x| < |y|$, ¿cuál o
cuáles de las siguientes afirmaciones son siempre verdaderas?

I. $x < y$

II. Si $x$ e $y$ son negativos, entonces $x > y$.

III. Si $y$ es positivo, entonces $x < y$.
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M2-ENT-031$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M2-ENT-032$c$, $c$En una carretera, la distancia entre los kilómetros $p$ y $q$ se calcula como $|p - q|$. Un bus está en el kilómetro $14$ y un camión, en el kilómetro $39$. ¿Qué distancia, en kilómetros, los separa?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M2-ENT-033$c$, $c$Considera las siguientes igualdades:

I. $|2 - 9| = 7$

II. $|-5 - 3| = 8$

III. $|-3 + 10| = 7$

¿Cuál o cuáles son verdaderas?
$c$, 3, $c$propio$c$::text, null::text)
) as v(code, stem, difficulty, source, fig_code)
left join figures f on f.code = v.fig_code
on conflict (code) do update
  set stem = excluded.stem,
      author_difficulty = excluded.author_difficulty,
      source = excluded.source,
      figure_id = excluded.figure_id;

-- 2. item_options — la señal diagnóstica -----------------------------
-- Upsert sobre (item_id, label), que ya tiene índice único.
-- No se borra: responses.option_id apunta acá con on delete restrict,
-- y el delete rompería la publicación apenas exista una respuesta.
insert into item_options (item_id, label, body, is_correct, misconception_id)
select i.id, v.label, v.body, v.is_correct, m.id
from (values
  ($c$M2-ENT-001$c$, $c$A$c$, $c$$|-9| = |9|$$c$, true, null),
  ($c$M2-ENT-001$c$, $c$B$c$, $c$$|7| = -7$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-001$c$, $c$C$c$, $c$$|x| = -1$ se cumple para $x = 1$ y para $x = -1$$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-001$c$, $c$D$c$, $c$$-|-4| = 4$ y también $-|4| = 4$$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-002$c$, $c$A$c$, $c$$|-8| < |5|$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-002$c$, $c$B$c$, $c$$|3| < |-2|$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-002$c$, $c$C$c$, $c$$|-2| < |-9|$$c$, true, null),
  ($c$M2-ENT-002$c$, $c$D$c$, $c$$-9 > -4$ y $|-9| > |-4|$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M2-ENT-003$c$, $c$A$c$, $c$Solo $x = -6$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-003$c$, $c$B$c$, $c$Ningún valor de $x$$c$, true, null),
  ($c$M2-ENT-003$c$, $c$C$c$, $c$$x = 6$ y $x = -6$$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-003$c$, $c$D$c$, $c$Solo $x = 6$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-004$c$, $c$A$c$, $c$$4$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-004$c$, $c$B$c$, $c$$6$$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-004$c$, $c$C$c$, $c$Infinitos: todos los menores o iguales que $3$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-004$c$, $c$D$c$, $c$$7$$c$, true, null),
  ($c$M2-ENT-005$c$, $c$A$c$, $c$Solo un número cumple $|x| = 8$: el $8$.$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-005$c$, $c$B$c$, $c$Dos números cumplen $|x| = 11$: el $11$ y el $-11$.$c$, true, null),
  ($c$M2-ENT-005$c$, $c$C$c$, $c$Dos números cumplen $|x| = -2$: el $2$ y el $-2$.$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-005$c$, $c$D$c$, $c$Las expresiones $-|-5|$ y $-|5|$ son iguales a $5$.$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-006$c$, $c$A$c$, $c$La distancia entre $A$ y $B$ es $8$, y $A$ es menor que $B$.$c$, true, null),
  ($c$M2-ENT-006$c$, $c$B$c$, $c$La distancia entre $A$ y $B$ es $2$, y $A$ es menor que $B$.$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-006$c$, $c$C$c$, $c$La distancia entre $A$ y $B$ es $9$, y $A$ es menor que $B$.$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-006$c$, $c$D$c$, $c$La distancia entre $A$ y $B$ es $8$, y $A$ es mayor que $B$.$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M2-ENT-007$c$, $c$A$c$, $c$$6$ y $-4$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-007$c$, $c$B$c$, $c$$-6$ y $4$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-007$c$, $c$C$c$, $c$$6$ y $4$$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-007$c$, $c$D$c$, $c$$-6$ y $-4$$c$, true, null),
  ($c$M2-ENT-008$c$, $c$A$c$, $c$$5$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-008$c$, $c$B$c$, $c$$8$$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-008$c$, $c$C$c$, $c$$9$$c$, true, null),
  ($c$M2-ENT-008$c$, $c$D$c$, $c$Infinitos: todos los mayores que $-5$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-009$c$, $c$A$c$, $c$$-|5|,\ |0|,\ |3|,\ |-7|$$c$, true, null),
  ($c$M2-ENT-009$c$, $c$B$c$, $c$$|-7|,\ -|5|,\ |0|,\ |3|$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-009$c$, $c$C$c$, $c$$|3|,\ |0|,\ -|5|,\ |-7|$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-009$c$, $c$D$c$, $c$$|0|,\ |3|,\ -|5|,\ |-7|$$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-010$c$, $c$A$c$, $c$$|x| = 9$: solo el $9$. $|x| = -3$: solo el $-3$.$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-010$c$, $c$B$c$, $c$$|x| = 9$: solo el $-9$. $|x| = -3$: solo el $3$.$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-010$c$, $c$C$c$, $c$$|x| = 9$: el $9$ y el $-9$. $|x| = -3$: el $3$ y el $-3$.$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-010$c$, $c$D$c$, $c$$|x| = 9$: el $9$ y el $-9$. $|x| = -3$: ningún número.$c$, true, null),
  ($c$M2-ENT-011$c$, $c$A$c$, $c$Posición: $-12$ m. Distancia: $5$ m.$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-011$c$, $c$B$c$, $c$Posición: $-12$ m. Distancia: $19$ m.$c$, true, null),
  ($c$M2-ENT-011$c$, $c$C$c$, $c$Posición: $-12$ m. Distancia: $20$ m.$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-011$c$, $c$D$c$, $c$Posición: $12$ m. Distancia: $5$ m.$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M2-ENT-012$c$, $c$A$c$, $c$Solo $S$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-012$c$, $c$B$c$, $c$$Q$, $R$ y $S$$c$, true, null),
  ($c$M2-ENT-012$c$, $c$C$c$, $c$$P$, $Q$, $R$ y $S$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-012$c$, $c$D$c$, $c$$Q$, $R$, $S$ y $T$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-013$c$, $c$A$c$, $c$$9$$c$, true, null),
  ($c$M2-ENT-013$c$, $c$B$c$, $c$$5$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-013$c$, $c$C$c$, $c$$8$$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-013$c$, $c$D$c$, $c$Infinitas, porque la temperatura puede bajar sin límite$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-014$c$, $c$A$c$, $c$$1$, $1$ y $0$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-014$c$, $c$B$c$, $c$$2$, $1$ y $2$$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-014$c$, $c$C$c$, $c$$2$, $1$ y $0$$c$, true, null),
  ($c$M2-ENT-014$c$, $c$D$c$, $c$$1$, $1$ y $1$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-015$c$, $c$A$c$, $c$$4$$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-015$c$, $c$B$c$, $c$$5$$c$, true, null),
  ($c$M2-ENT-015$c$, $c$C$c$, $c$Ninguno$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-015$c$, $c$D$c$, $c$Infinitos$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-016$c$, $c$A$c$, $c$Las temperaturas se diferencian en 3 °C, y la más fría fue la de las 5:00.$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-016$c$, $c$B$c$, $c$Las temperaturas se diferencian en 16 °C, y la más fría fue la de las 5:00.$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-016$c$, $c$C$c$, $c$Las temperaturas se diferencian en 15 °C, y la más fría fue la de las 15:00.$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M2-ENT-016$c$, $c$D$c$, $c$Las temperaturas se diferencian en 15 °C, y la más fría fue la de las 5:00.$c$, true, null),
  ($c$M2-ENT-017$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M2-ENT-017$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-017$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-017$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-018$c$, $c$A$c$, $c$Solo II$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-018$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-018$c$, $c$C$c$, $c$Solo II y III$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-018$c$, $c$D$c$, $c$I, II y III$c$, true, null),
  ($c$M2-ENT-019$c$, $c$A$c$, $c$Dos y dos$c$, false, $c$ENT-ABS-NEGSOL$c$),
  ($c$M2-ENT-019$c$, $c$B$c$, $c$Ninguno y uno$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-019$c$, $c$C$c$, $c$Ninguno y dos$c$, true, null),
  ($c$M2-ENT-019$c$, $c$D$c$, $c$Uno y uno$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-020$c$, $c$A$c$, $c$$51$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-020$c$, $c$B$c$, $c$$100$$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-020$c$, $c$C$c$, $c$$101$$c$, true, null),
  ($c$M2-ENT-020$c$, $c$D$c$, $c$Infinitos: todos los mayores o iguales que $-50$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-021$c$, $c$A$c$, $c$$2$$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-021$c$, $c$B$c$, $c$$14$$c$, true, null),
  ($c$M2-ENT-021$c$, $c$C$c$, $c$$7$$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M2-ENT-021$c$, $c$D$c$, $c$$15$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-022$c$, $c$A$c$, $c$I, II y III$c$, true, null),
  ($c$M2-ENT-022$c$, $c$B$c$, $c$Solo III$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-022$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-022$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$ENT-ABS-SIGNOFUERA$c$),
  ($c$M2-ENT-023$c$, $c$A$c$, $c$Solo I$c$, false, $c$ENT-ABS-SALTOS$c$),
  ($c$M2-ENT-023$c$, $c$B$c$, $c$Solo III$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-023$c$, $c$C$c$, $c$I, II y III$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-023$c$, $c$D$c$, $c$Solo I y III$c$, true, null),
  ($c$M2-ENT-024$c$, $c$A$c$, $c$$4$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-024$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-ABS-UNASOL$c$),
  ($c$M2-ENT-024$c$, $c$C$c$, $c$$3$$c$, true, null),
  ($c$M2-ENT-024$c$, $c$D$c$, $c$$5$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-025$c$, $c$A$c$, $c$$-8$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-025$c$, $c$B$c$, $c$$8$$c$, true, null),
  ($c$M2-ENT-025$c$, $c$C$c$, $c$$-4$$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-025$c$, $c$D$c$, $c$$4$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M2-ENT-026$c$, $c$A$c$, $c$$|-3 + 9| = 12$$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-026$c$, $c$B$c$, $c$$|-3 - 5| = -2$$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-026$c$, $c$C$c$, $c$$|10 - 4| = -6$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-026$c$, $c$D$c$, $c$$|4 - 11| = 7$$c$, true, null),
  ($c$M2-ENT-027$c$, $c$A$c$, $c$$|a - b|$$c$, true, null),
  ($c$M2-ENT-027$c$, $c$B$c$, $c$$a - b$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-027$c$, $c$C$c$, $c$$|a| - |b|$$c$, false, $c$ENT-ABS-DISTTAM$c$),
  ($c$M2-ENT-027$c$, $c$D$c$, $c$$a + b$$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-028$c$, $c$A$c$, $c$$2$ °C$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M2-ENT-028$c$, $c$B$c$, $c$$-2$ °C$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-028$c$, $c$C$c$, $c$$12$ °C$c$, true, null),
  ($c$M2-ENT-028$c$, $c$D$c$, $c$$-12$ °C$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-029$c$, $c$A$c$, $c$$b - a$$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-029$c$, $c$B$c$, $c$$a - b$$c$, true, null),
  ($c$M2-ENT-029$c$, $c$C$c$, $c$$a + b$$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-029$c$, $c$D$c$, $c$$|b| - |a|$$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-030$c$, $c$A$c$, $c$Solo II y III$c$, true, null),
  ($c$M2-ENT-030$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-030$c$, $c$C$c$, $c$Solo III$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M2-ENT-030$c$, $c$D$c$, $c$Solo II$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-031$c$, $c$A$c$, $c$$|7 - 15| = 22$$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-031$c$, $c$B$c$, $c$$|7 - 15| = -8$$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-031$c$, $c$C$c$, $c$$|7 - 15| = 8$$c$, true, null),
  ($c$M2-ENT-031$c$, $c$D$c$, $c$$|15 - 7| = -8$$c$, false, $c$ENT-ABS-CAMBIA$c$),
  ($c$M2-ENT-032$c$, $c$A$c$, $c$$53$$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-032$c$, $c$B$c$, $c$$-25$$c$, false, $c$ENT-ABS-DISTRIB$c$),
  ($c$M2-ENT-032$c$, $c$C$c$, $c$$26$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M2-ENT-032$c$, $c$D$c$, $c$$25$$c$, true, null),
  ($c$M2-ENT-033$c$, $c$A$c$, $c$I, II y III$c$, true, null),
  ($c$M2-ENT-033$c$, $c$B$c$, $c$Solo III$c$, false, $c$ENT-ABS-PARENT$c$),
  ($c$M2-ENT-033$c$, $c$C$c$, $c$Solo II$c$, false, $c$ENT-ABS-QUITASIGNO$c$),
  ($c$M2-ENT-033$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$ENT-ABS-DISTRIB$c$)
) as v(item_code, label, body, is_correct, mc_code)
join items i on i.code = v.item_code
left join misconceptions m on m.code = v.mc_code
on conflict (item_id, label) do update
  set body = excluded.body,
      is_correct = excluded.is_correct,
      misconception_id = excluded.misconception_id;

-- 3. node_items — un ítem, un nodo ----------------------------------
-- do nothing a propósito: si el ítem ya vive en otro nodo, NO se mueve.
-- Moverlo reescribe a qué nodo cuentan sus respuestas históricas.
-- La verificación del final revienta si el nodo no coincide.
insert into node_items (node_id, item_id)
select n.id, i.id
from (values
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-001$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-002$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-003$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-004$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-005$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-006$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-007$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-008$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-009$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-010$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-011$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-012$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-013$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-014$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-015$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-016$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-017$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-018$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-019$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-020$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-021$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-022$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-023$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-024$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-025$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-026$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-027$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-028$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-029$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-030$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-031$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-032$c$),
  ($c$NUM-ENT-ABS$c$, $c$M2-ENT-033$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$ENT-ABS-CAMBIA$c$, $c$El valor absoluto no cambia el signo, mide una distancia$c$, $c$Le cambiaste el signo a un número positivo, como si $|30|$ fuera
$-30$. Seguramente viste que $|-30| = 30$ y te quedaste con la idea
de que las barras "dan vuelta el signo".

Pero el valor absoluto no es una regla de signos. Es una distancia:

**$|a|$ es la distancia entre $a$ y el $0$ en la recta.**

El $30$ está a $30$ unidades del $0$, así que $|30| = 30$. El $-30$
también está a $30$ unidades, así que $|-30| = 30$. Al negativo se
le va el signo porque una distancia no tiene dirección, no porque
las barras cambien signos. Al positivo no le pasa nada.

Lo mismo al buscar qué números cumplen $|x| = 30$: sirven el $30$
y el $-30$, no solo el $-30$.

Un control rápido: el resultado de un valor absoluto **nunca es
negativo**. Si te dio $-30$, algo se dio vuelta.$c$),
  ($c$REM-ENT-ABS-PARENT$c$, $c$ENT-ABS-PARENT$c$, $c$Las barras siempre hacen algo con los negativos$c$, $c$Trataste las barras como si fueran un paréntesis y dejaste el número
igual: $|-30|$ te quedó $-30$.

Las barras no son un paréntesis. Preguntan otra cosa:

**$|a|$ es la distancia entre $a$ y el $0$, y una distancia nunca
es negativa.**

El $-30$ está a $30$ unidades del $0$, así que $|-30| = 30$.

Esto cambia la forma de comparar. $-30$ es menor que $20$, pero
$|-30| = 30$ es mayor que $|20| = 20$: el $-30$ está más lejos del
$0$. Al comparar valores absolutos comparas distancias, no los
números.

También cambia los conteos. Los enteros con $|x| \leq 20$ no son
"todos los menores que $20$": son los que están a $20$ unidades del
$0$ o menos, del $-20$ al $20$. El $-30$ no entra.

Un control rápido: si dentro de las barras hay un negativo, el
resultado **tiene que ser positivo**.$c$),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$ENT-ABS-SIGNOFUERA$c$, $c$Las barras solo tocan lo que está dentro$c$, $c$Dejaste positivo algo que tenía un signo menos fuera de las barras,
como si $-|-20|$ fuera $20$.

Las barras actúan solo sobre lo que encierran. El signo de afuera
queda esperando y se aplica después:

**Primero calculas el valor absoluto. Después aplicas el signo que
está fuera de las barras.**

El signo menos delante de un número da su opuesto, el que está al
otro lado del $0$ a la misma distancia:

- $-|-20|$: primero $|-20| = 20$, después el opuesto: $-20$.
- $-|20|$: primero $|20| = 20$, después el opuesto: $-20$.

Por eso $-|a|$ nunca es positivo, venga lo que venga dentro. La
idea de que "el valor absoluto siempre es positivo" vale para lo
que queda **entre** las barras, no para lo de afuera.

Un control rápido: tapa las barras con el dedo. Si a la izquierda
queda un signo menos, el resultado es negativo (o $0$).$c$),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$ENT-ABS-UNASOL$c$, $c$A cada distancia del 0 hay un número por lado$c$, $c$Te quedaste solo con los números positivos: para $|x| = 30$
respondiste el $30$, y te faltó el otro.

$|x| = 30$ pregunta qué números están a $30$ unidades del $0$. Mira
la recta: hay uno a la derecha y otro a la izquierda.

**Si $a$ es positivo, dos números cumplen $|x| = a$: el $a$ y el
$-a$.**

Lo mismo al contar. Los enteros con $|x| \leq 20$ no son solo
$0, 1, 2, \ldots, 20$. También están $-1, -2, \ldots, -20$. En total:

$$20 + 20 + 1 = 41$$

Veinte a cada lado y el $0$ en el medio.

El único caso con un solo número es $|x| = 0$, porque el $0$ no
tiene "otro lado".

Un control rápido: cuando encuentres un número que cumple, pregúntate
si su opuesto también cumple. Casi siempre cumple.$c$),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$ENT-ABS-NEGSOL$c$, $c$Una distancia no puede ser negativa$c$, $c$Buscaste los números que cumplen $|x| = -30$ como si fuera
$|x| = 30$, y respondiste $30$ y $-30$.

Compruébalo: $|30| = 30$, no $-30$. Y $|-30| = 30$, tampoco $-30$.
Ninguno de los dos sirve.

El valor absoluto es una distancia al $0$, y una distancia vale $0$
o más. Nunca es negativa.

**Ningún número cumple que su valor absoluto sea igual a un número
negativo.**

Antes de buscar, mira el lado derecho:

- $|x| = 30$: positivo, lo cumplen dos números.
- $|x| = 0$: lo cumple solo el $0$.
- $|x| = -30$: negativo, no lo cumple ninguno.

Un control rápido: reemplaza tu respuesta en la igualdad. Si al
lado izquierdo te queda un número positivo y al derecho uno
negativo, no puede ser igual.$c$),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$ENT-ABS-DISTTAM$c$, $c$Si el 0 queda al medio, las distancias se suman$c$, $c$Para la distancia entre dos puntos restaste sus distancias al $0$.
Así, entre $-20$ y $30$ te habría dado $30 - 20 = 10$.

Eso solo funciona cuando los dos puntos están del mismo lado del
$0$. Si el $0$ queda entre ellos, el camino de uno al otro pasa por
el $0$:

- Del $-20$ al $0$ hay $20$ unidades.
- Del $0$ al $30$ hay $30$ unidades.
- En total: $20 + 30 = 50$.

**Si un punto es negativo y el otro positivo, la distancia es la
suma de sus valores absolutos. Si están al mismo lado, es la
resta.**

Entre $-20$ y $-30$ sí restas: los dos están a la izquierda y los
separan $10$ unidades.

Un control rápido: si el $0$ queda entre los dos puntos, la
distancia tiene que ser **mayor** que cada uno de sus valores
absolutos.$c$),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$ENT-ABS-SALTOS$c$, $c$Contar números no es medir la distancia$c$, $c$Para contar los enteros de un tramo mediste su largo, y te faltó
uno. Los enteros con $|x| \leq 20$ te habrían dado $40$, porque del
$-20$ al $20$ hay $40$ unidades.

Pero la distancia cuenta **saltos**, y aquí te preguntan por
**números**. Mira un caso chico, los enteros del $-2$ al $2$:

$$-2 \quad -1 \quad 0 \quad 1 \quad 2$$

Son $5$ números y solo $4$ saltos entre ellos. Siempre hay un
número más que saltos, porque se cuentan los dos extremos.

**Cantidad de enteros de un tramo = largo del tramo + 1.**

Para $|x| \leq 20$: el largo es $40$, así que son $41$ enteros.
Otra forma de verlo: $20$ a cada lado y el $0$.

Un control rápido: si el tramo es simétrico alrededor del $0$ e
incluye el $0$, la cantidad de enteros **es impar**.$c$),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$ENT-ABS-DISTRIB$c$, $c$Primero se calcula lo de adentro, después las barras$c$, $c$Le sacaste el valor absoluto a cada número por separado, como si
$|20 - 50|$ fuera $|20| - |50| = -30$.

Las barras no se reparten entre los términos. Encierran **una sola
cantidad**: el resultado de la operación de adentro.

**Primero haces la operación que está dentro de las barras. Después
tomas el valor absoluto del resultado.**

- $|20 - 50| = |-30| = 30$
- $|-20 + 50| = |30| = 30$, no $20 + 50 = 70$.

Separar las barras cambia el resultado cada vez que adentro hay
números de distinto signo, o una resta que cruza el $0$.

Un control rápido: el resultado de un valor absoluto nunca es
negativo. Si te dio $-30$, repartiste las barras.$c$),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$ENT-ABS-QUITASIGNO$c$, $c$Las barras no borran los signos de adentro$c$, $c$Borraste los signos menos que estaban dentro de las barras y
sumaste todo, como si $|40 - 70|$ fuera $40 + 70 = 110$.

El valor absoluto hace positivo **el resultado**, no cada número ni
cada operación. El menos de $40 - 70$ es una resta de verdad, y hay
que hacerla:

**Primero calculas lo de adentro, con todos sus signos. Después
tomas el valor absoluto.**

$$|40 - 70| = |-30| = 30$$

Piénsalo en la recta: $|40 - 70|$ es la distancia entre $40$ y
$70$. Están a $30$ unidades, no a $110$.

Con letras pasa lo mismo: $|b - a|$ nunca es $b + a$. Es $b - a$ o
$a - b$, el que no sea negativo.

Un control rápido: si adentro hay una resta, el resultado tiene que
ser **menor** que el mayor de los dos números.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-ABS-CAMBIA$c$, $c$REM-ENT-ABS-PARENT$c$, $c$REM-ENT-ABS-SIGNOFUERA$c$, $c$REM-ENT-ABS-UNASOL$c$, $c$REM-ENT-ABS-NEGSOL$c$, $c$REM-ENT-ABS-DISTTAM$c$, $c$REM-ENT-ABS-SALTOS$c$, $c$REM-ENT-ABS-DISTRIB$c$, $c$REM-ENT-ABS-QUITASIGNO$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-001$c$, 1::smallint),
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-007$c$, 2::smallint),
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-008$c$, 3::smallint),
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-014$c$, 4::smallint),
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-022$c$, 5::smallint),
  ($c$REM-ENT-ABS-CAMBIA$c$, $c$M2-ENT-024$c$, 6::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-002$c$, 1::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-004$c$, 2::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-010$c$, 3::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-015$c$, 4::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-019$c$, 5::smallint),
  ($c$REM-ENT-ABS-PARENT$c$, $c$M2-ENT-024$c$, 6::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-001$c$, 1::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-005$c$, 2::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-007$c$, 3::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-009$c$, 4::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-017$c$, 5::smallint),
  ($c$REM-ENT-ABS-SIGNOFUERA$c$, $c$M2-ENT-022$c$, 6::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-004$c$, 1::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-008$c$, 2::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-012$c$, 3::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-014$c$, 4::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-018$c$, 5::smallint),
  ($c$REM-ENT-ABS-UNASOL$c$, $c$M2-ENT-020$c$, 6::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-003$c$, 1::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-005$c$, 2::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-010$c$, 3::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-014$c$, 4::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-017$c$, 5::smallint),
  ($c$REM-ENT-ABS-NEGSOL$c$, $c$M2-ENT-019$c$, 6::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-006$c$, 1::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-011$c$, 2::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-016$c$, 3::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-018$c$, 4::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-021$c$, 5::smallint),
  ($c$REM-ENT-ABS-DISTTAM$c$, $c$M2-ENT-023$c$, 6::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-004$c$, 1::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-013$c$, 2::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-015$c$, 3::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-018$c$, 4::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-020$c$, 5::smallint),
  ($c$REM-ENT-ABS-SALTOS$c$, $c$M2-ENT-023$c$, 6::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-025$c$, 1::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-026$c$, 2::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-028$c$, 3::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-029$c$, 4::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-032$c$, 5::smallint),
  ($c$REM-ENT-ABS-DISTRIB$c$, $c$M2-ENT-033$c$, 6::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-026$c$, 1::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-027$c$, 2::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-029$c$, 3::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-031$c$, 4::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-032$c$, 5::smallint),
  ($c$REM-ENT-ABS-QUITASIGNO$c$, $c$M2-ENT-033$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-07$c$, $c$NUM-ENT$c$, $c$Valor absoluto$c$, $c$Ya sabes ubicar los enteros en la recta y compararlos. El valor
absoluto le pone nombre a algo que ya usabas: qué tan lejos del $0$
está un número. Con él vas a comparar distancias, encontrar los números
que están a cierta distancia del $0$ y medir en la recta.

## Valor absoluto

### El valor absoluto es una distancia

El **valor absoluto** de un número es su distancia al $0$ en la
recta. Se escribe con dos barras: $|a|$.

![](fig:FIG-ENT-ABS-03)

El $-14$ y el $14$ están a $14$ unidades del $0$, uno a cada lado:

$$|-14| = 14 \qquad |14| = 14 \qquad |0| = 0$$

**El valor absoluto de un número es su distancia al $0$, y nunca es
negativo.**

Hay dos formas de equivocarse aquí. La primera es pensar que las
barras "cambian el signo": al positivo no le pasa nada, $|14|$ sigue
siendo $14$. La segunda es leer las barras como un paréntesis y dejar
$|-14|$ como $-14$.

Un control rápido: si el resultado de un valor absoluto te dio
negativo, te equivocaste.

### El signo de afuera

Las barras solo actúan sobre lo que está dentro. Un signo menos que
está **fuera** de las barras se aplica después, y da el opuesto: el
número que está al otro lado del $0$, a la misma distancia.

**Primero calculas el valor absoluto, después aplicas el signo de
afuera.**

$$-|-20| = -20 \qquad -|20| = -20$$

Por eso $-|a|$ nunca es positivo. "El valor absoluto siempre es
positivo" vale para lo que queda entre las barras, no para lo de
afuera.

### Comparar valores absolutos

Comparar $|a|$ con $|b|$ es comparar distancias al $0$, no los números.

$$-16 < 5 \qquad \text{pero} \qquad |-16| > |5|$$

El $-16$ es menor, pero está más lejos del $0$. Cuando ordenes
expresiones con barras, primero calcula cada una y después ordena los
resultados como enteros.

### Qué números cumplen $|x| = a$

$|x| = 15$ pregunta qué números están a $15$ unidades del $0$. Hay uno
a cada lado:

**Si $a$ es positivo, dos números cumplen $|x| = a$: el $a$ y el
$-a$.**

El error más común es quedarse solo con el positivo. Hay dos casos
especiales:

- $|x| = 0$ lo cumple un solo número, el $0$.
- $|x| = -15$ no lo cumple ningún número. Ninguno está a una distancia
  negativa del $0$.

Un control rápido: mira primero el lado derecho. Positivo, dos
números; cero, uno; negativo, ninguno.

### Contar los enteros con $|x| \leq a$

$|x| \leq 7$ describe los enteros que están a $7$ unidades del $0$ o
menos. Están a los dos lados, y el $0$ también cuenta:

![](fig:FIG-ENT-ABS-04)

$$-7,\ -6,\ \ldots,\ -1,\ 0,\ 1,\ \ldots,\ 6,\ 7$$

Son $15$: siete a cada lado y el $0$. Aquí hay dos trampas. Una es
contar solo los positivos. La otra es medir la distancia de $-7$ a
$7$, que es $14$, en vez de contar los números: siempre hay un número
más que saltos.

**Los enteros con $|x| \leq a$ son $a$ a cada lado más el $0$.**

Con $<$ el extremo no entra: $|x| < 7$ lo cumplen $13$ enteros, del
$-6$ al $6$.

### Operar dentro de las barras

Si dentro de las barras hay una suma o una resta, las barras
encierran **el resultado**, no cada número por separado.

**Primero haces la operación de adentro. Después tomas el valor
absoluto.**

$$|-18 + 4| = |-14| = 14 \qquad |4 - 18| = |-14| = 14$$

Hay dos atajos que parecen razonables y dan mal. Sacarle el valor
absoluto a cada número, $|-18| + |4| = 22$. Y borrar todos los signos
de adentro, $4 + 18 = 22$ en vez de $4 - 18$. Las barras no hacen
positivo cada número: hacen positivo el resultado.

### Distancia entre dos enteros

Si los dos números están del mismo lado del $0$, la distancia es la
resta de sus valores absolutos. Si el $0$ queda entre ellos, el camino
pasa por el $0$ y las distancias se **suman**:

![](fig:FIG-ENT-ABS-05)

Del $-7$ al $0$ hay $7$ unidades y del $0$ al $2$ hay $2$. La
distancia entre $-7$ y $2$ es $7 + 2 = 9$, no $7 - 2$.

**Con un número negativo y otro positivo, la distancia es
$|a| + |b|$.**

Las dos situaciones caben en una sola expresión: la distancia entre
$a$ y $b$ es $|a - b|$. Entre $-7$ y $2$: $|2 - (-7)| = |2 + 7| = 9$. El
orden de la resta no importa, porque $a - b$ y $b - a$ son opuestos y
tienen el mismo valor absoluto.

Un control rápido: si el $0$ queda al medio, la distancia es mayor que
cada uno de los dos valores absolutos.

### Valor absoluto en contexto

En un contexto, el valor absoluto responde "qué tan lejos" de la
referencia, sin importar hacia qué lado. Primero traduce cada dato a
un entero con su signo (bajo el nivel del mar, bajo cero o subterráneo
es negativo) y después mide.

Una mina está a $25$ m bajo la superficie y una antena a $30$ m sobre
ella. La antena está más lejos de la superficie, porque
$|30| > |-25|$, y las separan $25 + 30 = 55$ m.$c$, 7::smallint)
) as v(code, unit_code, title, body, position)
join units u on u.code = v.unit_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      version = lessons.version
                + (excluded.body is distinct from lessons.body)::int;

insert into lesson_nodes (lesson_id, node_id, position, anchor)
select l.id, n.id, v.position, v.anchor
from (values
  ($c$LES-NUM-ENT-07$c$, $c$NUM-ENT-ABS$c$, 1::smallint, $c$valor-absoluto$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$);
  if c <> 33 then
    raise exception 'items: se esperaban 33, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$);
  if c <> 132 then
    raise exception 'item_options: se esperaban 132, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M2-ENT-001$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-002$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-003$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-004$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-005$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-006$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-007$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-008$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-009$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-010$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-011$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-012$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-013$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-014$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-015$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-016$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-017$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-018$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-019$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-020$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-021$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-022$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-023$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-024$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-025$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-026$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-027$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-028$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-029$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-030$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-031$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-032$c$, $c$NUM-ENT-ABS$c$),
      ($c$M2-ENT-033$c$, $c$NUM-ENT-ABS$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 33 then
    raise exception 'node_items: 33 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ABS-CAMBIA$c$, $c$ENT-ABS-DISTRIB$c$, $c$ENT-ABS-DISTTAM$c$, $c$ENT-ABS-NEGSOL$c$, $c$ENT-ABS-PARENT$c$, $c$ENT-ABS-QUITASIGNO$c$, $c$ENT-ABS-SALTOS$c$, $c$ENT-ABS-SIGNOFUERA$c$, $c$ENT-ABS-UNASOL$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M2-ENT-012$c$, $c$FIG-ENT-ABS-01$c$),
      ($c$M2-ENT-021$c$, $c$FIG-ENT-ABS-02$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 2 then
    raise exception 'figure_id: 2 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

  -- Toda figura referenciada en la base (ítems, clases, remediaciones)
  -- tiene que existir en figures y seguir en contenido/figuras/.
  -- Si alguien borró el .svg, el contenido deja de poder regenerarse.
  with refs as (
    select f.code::text as code from items i join figures f on f.id = i.figure_id
    union
    select m[1] from lessons l, regexp_matches(l.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
    union
    select m[1] from remediations r, regexp_matches(r.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
  )
  select string_agg(code, ', ' order by code) into t from refs
   where code not in (select code from figures)
      or not (code = any (array[$c$FIG-ENT-ABS-01$c$, $c$FIG-ENT-ABS-02$c$, $c$FIG-ENT-ABS-03$c$, $c$FIG-ENT-ABS-04$c$, $c$FIG-ENT-ABS-05$c$, $c$FIG-ENT-ADI-01$c$, $c$FIG-ENT-ADI-02$c$, $c$FIG-ENT-ADI-03$c$, $c$FIG-ENT-ADI-04$c$, $c$FIG-ENT-ADI-05$c$, $c$FIG-ENT-ADI-06$c$, $c$FIG-ENT-ADI-07$c$, $c$FIG-ENT-REC-01$c$, $c$FIG-ENT-REC-02$c$, $c$FIG-ENT-REC-03$c$, $c$FIG-ENT-REC-04$c$, $c$FIG-ENT-REC-05$c$]::text[]));
  if t is not null then
    raise exception 'figuras referenciadas en la base que ya no están en contenido/figuras/ (o no están en figures): %', t; end if;

  -- La figura de un ítem no puede aparecer en ninguna clase ni
  -- remediación: filtraría la respuesta.
  select string_agg(distinct f.code, ', ') into t
    from items i join figures f on f.id = i.figure_id
   where f.code in (
     select m[1] from lessons l, regexp_matches(l.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
     union
     select m[1] from remediations r, regexp_matches(r.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m);
  if t is not null then
    raise exception 'figuras de ítem que aparecen en una clase o remediación: %', t; end if;
end
$verif$;

-- 33 ítems (33 curated), 132 alternativas, 16 misconceptions referenciadas,
-- 9 remediaciones, 5 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 33 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-ABS-CAMBIA$c$, $c$REM-ENT-ABS-PARENT$c$, $c$REM-ENT-ABS-SIGNOFUERA$c$, $c$REM-ENT-ABS-UNASOL$c$, $c$REM-ENT-ABS-NEGSOL$c$, $c$REM-ENT-ABS-DISTTAM$c$, $c$REM-ENT-ABS-SALTOS$c$, $c$REM-ENT-ABS-DISTRIB$c$, $c$REM-ENT-ABS-QUITASIGNO$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-07$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$) group by 1;
