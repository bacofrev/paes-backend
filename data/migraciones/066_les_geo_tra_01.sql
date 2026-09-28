-- =====================================================================
-- LES-GEO-TRA-01 — El plano cartesiano, puntos y cuadrantes
-- Generado por cargar_contenido.py desde LES-GEO-TRA-01.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-PLA-COORD-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 218" width="274" height="218" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Hay un punto marcado, P." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="234" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="234" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="234" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="234" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="234" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="246" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="186" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="252,104 243,99.5 243,108.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="234" y1="100.5" x2="234" y2="107.5" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="P" data-x="-6" data-y="4" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="62" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 192" width="248" height="192" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Los puntos A y B están a la misma altura." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="208" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="208" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="208" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="208" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="220" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="160" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="226,104 217,99.5 217,108.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="100.5" y1="156" x2="107.5" y2="156" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="78" x2="107.5" y2="78" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="-4" data-y="2" cx="52" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="6" data-y="2" cx="182" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="96" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="52" y="65" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="182" y="65" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 296" width="352" height="296" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, Q." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="312" y1="26" x2="312" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="312" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="312" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="312" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="312" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="312" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="312" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="312" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="312" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="312" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="312" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="324" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="264" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="330,130 321,125.5 321,134.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="130" y1="126.5" x2="130" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="260" y1="126.5" x2="260" y2="133.5" stroke-width="1.3"/>
  <line x1="286" y1="126.5" x2="286" y2="133.5" stroke-width="1.3"/>
  <line x1="312" y1="126.5" x2="312" y2="133.5" stroke-width="1.3"/>
  <line x1="152.5" y1="260" x2="159.5" y2="260" stroke-width="1.3"/>
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="Q" data-x="4" data-y="-3" cx="260" cy="208" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="286" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="312" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="149" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="149" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="328" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="273" y="208" font-size="14" text-anchor="middle" dominant-baseline="central">Q</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 270" width="326" height="270" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, R." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="298" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="238" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="304,104 295,99.5 295,108.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="234" y1="100.5" x2="234" y2="107.5" stroke-width="1.3"/>
  <line x1="260" y1="100.5" x2="260" y2="107.5" stroke-width="1.3"/>
  <line x1="286" y1="100.5" x2="286" y2="107.5" stroke-width="1.3"/>
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="R" data-x="0" data-y="-4" cx="156" cy="208" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="286" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="149" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="148" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="169" y="208" font-size="14" text-anchor="middle" dominant-baseline="central">R</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 192" width="248" height="192" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Están marcados tres vértices de un rectángulo: A, B y C." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="208" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="208" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="208" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="208" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="220" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="160" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="226,104 217,99.5 217,108.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="100.5" y1="156" x2="107.5" y2="156" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="78" x2="107.5" y2="78" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="-4" data-y="-2" cx="52" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="6" data-y="-2" cx="182" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="6" data-y="4" cx="182" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="96" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="192" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="192" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 196 244" width="196" height="244" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Los puntos A y B están en una misma vertical." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="156" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="156" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="156" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="156" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="156" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="156" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="168" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="78" y1="212" x2="78" y2="14" stroke-width="1.3"/>
  <polygon points="174,104 165,99.5 165,108.5" fill="currentColor" stroke="none"/>
  <polygon points="78,8 73.5,17 82.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="74.5" y1="208" x2="81.5" y2="208" stroke-width="1.3"/>
  <line x1="74.5" y1="182" x2="81.5" y2="182" stroke-width="1.3"/>
  <line x1="74.5" y1="156" x2="81.5" y2="156" stroke-width="1.3"/>
  <line x1="74.5" y1="130" x2="81.5" y2="130" stroke-width="1.3"/>
  <line x1="74.5" y1="78" x2="81.5" y2="78" stroke-width="1.3"/>
  <line x1="74.5" y1="52" x2="81.5" y2="52" stroke-width="1.3"/>
  <line x1="74.5" y1="26" x2="81.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="2" data-y="-6" cx="104" cy="182" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="2" data-y="4" cx="104" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="71" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="71" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="70" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="172" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="90" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="117" y="182" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="117" y="52" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 322" width="326" height="322" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad y el cuadrilátero ABCD." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="286" x2="286" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="286" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="298" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="290" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="304,156 295,151.5 295,160.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="234" y1="152.5" x2="234" y2="159.5" stroke-width="1.3"/>
  <line x1="260" y1="152.5" x2="260" y2="159.5" stroke-width="1.3"/>
  <line x1="286" y1="152.5" x2="286" y2="159.5" stroke-width="1.3"/>
  <line x1="152.5" y1="286" x2="159.5" y2="286" stroke-width="1.3"/>
  <line x1="152.5" y1="260" x2="159.5" y2="260" stroke-width="1.3"/>
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-3,2;B=1,4;C=3,-2;D=-2,-3" points="78,104 182,52 234,208 104,234" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-3" data-y="2" cx="78" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="1" data-y="4" cx="182" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="3" data-y="-2" cx="234" cy="208" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="D" data-x="-2" data-y="-3" cx="104" cy="234" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="286" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="149" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="149" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="149" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="148" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="68" y="94" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="192" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="244" y="219" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="94" y="245" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-08$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 322" width="326" height="322" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad y cuatro puntos marcados: A, B, C y D." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="286" x2="286" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="286" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="182" x2="298" y2="182" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="290" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="304,182 295,177.5 295,186.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="178.5" x2="26" y2="185.5" stroke-width="1.3"/>
  <line x1="52" y1="178.5" x2="52" y2="185.5" stroke-width="1.3"/>
  <line x1="78" y1="178.5" x2="78" y2="185.5" stroke-width="1.3"/>
  <line x1="104" y1="178.5" x2="104" y2="185.5" stroke-width="1.3"/>
  <line x1="156" y1="178.5" x2="156" y2="185.5" stroke-width="1.3"/>
  <line x1="182" y1="178.5" x2="182" y2="185.5" stroke-width="1.3"/>
  <line x1="208" y1="178.5" x2="208" y2="185.5" stroke-width="1.3"/>
  <line x1="234" y1="178.5" x2="234" y2="185.5" stroke-width="1.3"/>
  <line x1="260" y1="178.5" x2="260" y2="185.5" stroke-width="1.3"/>
  <line x1="286" y1="178.5" x2="286" y2="185.5" stroke-width="1.3"/>
  <line x1="126.5" y1="286" x2="133.5" y2="286" stroke-width="1.3"/>
  <line x1="126.5" y1="260" x2="133.5" y2="260" stroke-width="1.3"/>
  <line x1="126.5" y1="234" x2="133.5" y2="234" stroke-width="1.3"/>
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="-2" data-y="5" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="5" data-y="-2" cx="260" cy="234" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="2" data-y="5" cx="182" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="D" data-x="-1" data-y="4" cx="104" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="260" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="286" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="123" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="123" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="123" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="130" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="122" y="194" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="170" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="68" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="270" y="245" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="192" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="94" y="68" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-09$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 242 194" width="242" height="194" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 5 y el 10. Hay un punto marcado, P." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="48" y1="26" x2="48" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="70" y1="26" x2="70" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="92" y1="26" x2="92" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="114" y1="26" x2="114" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="136" y1="26" x2="136" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="158" y1="26" x2="158" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="180" y1="26" x2="180" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="202" y1="26" x2="202" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="158" x2="202" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="136" x2="202" y2="136" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="114" x2="202" y2="114" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="92" x2="202" y2="92" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="70" x2="202" y2="70" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="48" x2="202" y2="48" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="202" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="92" x2="214" y2="92" stroke-width="1.3"/>
  <line class="eje-y" x1="114" y1="162" x2="114" y2="14" stroke-width="1.3"/>
  <polygon points="220,92 211,87.5 211,96.5" fill="currentColor" stroke="none"/>
  <polygon points="114,8 109.5,17 118.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="88.5" x2="26" y2="95.5" stroke-width="1.3"/>
  <line x1="48" y1="88.5" x2="48" y2="95.5" stroke-width="1.3"/>
  <line x1="70" y1="88.5" x2="70" y2="95.5" stroke-width="1.3"/>
  <line x1="92" y1="88.5" x2="92" y2="95.5" stroke-width="1.3"/>
  <line x1="136" y1="88.5" x2="136" y2="95.5" stroke-width="1.3"/>
  <line x1="158" y1="88.5" x2="158" y2="95.5" stroke-width="1.3"/>
  <line x1="180" y1="88.5" x2="180" y2="95.5" stroke-width="1.3"/>
  <line x1="202" y1="88.5" x2="202" y2="95.5" stroke-width="1.3"/>
  <line x1="110.5" y1="158" x2="117.5" y2="158" stroke-width="1.3"/>
  <line x1="110.5" y1="136" x2="117.5" y2="136" stroke-width="1.3"/>
  <line x1="110.5" y1="114" x2="117.5" y2="114" stroke-width="1.3"/>
  <line x1="110.5" y1="70" x2="117.5" y2="70" stroke-width="1.3"/>
  <line x1="110.5" y1="48" x2="117.5" y2="48" stroke-width="1.3"/>
  <line x1="110.5" y1="26" x2="117.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="P" data-x="15" data-y="-10" cx="180" cy="136" r="3.2" fill="currentColor" stroke="none"/>
  <text x="136" y="105" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="158" y="105" font-size="11" text-anchor="middle" dominant-baseline="central">10</text>
  <text x="107" y="70" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="107" y="48" font-size="11" text-anchor="end" dominant-baseline="central">10</text>
  <text x="106" y="104" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="218" y="80" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="126" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="193" y="136" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-10$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 166" width="248" height="166" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Hay tres puntos marcados: A, B y C." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="208" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="208" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="208" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="208" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="78" x2="220" y2="78" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="134" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="226,78 217,73.5 217,82.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="74.5" x2="26" y2="81.5" stroke-width="1.3"/>
  <line x1="52" y1="74.5" x2="52" y2="81.5" stroke-width="1.3"/>
  <line x1="78" y1="74.5" x2="78" y2="81.5" stroke-width="1.3"/>
  <line x1="130" y1="74.5" x2="130" y2="81.5" stroke-width="1.3"/>
  <line x1="156" y1="74.5" x2="156" y2="81.5" stroke-width="1.3"/>
  <line x1="182" y1="74.5" x2="182" y2="81.5" stroke-width="1.3"/>
  <line x1="208" y1="74.5" x2="208" y2="81.5" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="104" x2="107.5" y2="104" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="-4" data-y="2" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="4" data-y="-2" cx="156" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="6" data-y="0" cx="182" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <text x="130" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="156" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="96" y="90" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="66" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="166" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="182" y="65" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-11$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 296" width="300" height="296" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad, ejes rotulados. Hay un punto marcado, T." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="260" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="260" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="260" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="260" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="260" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="260" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="260" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="272" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="264" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="278,104 269,99.5 269,108.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="234" y1="100.5" x2="234" y2="107.5" stroke-width="1.3"/>
  <line x1="260" y1="100.5" x2="260" y2="107.5" stroke-width="1.3"/>
  <line x1="152.5" y1="260" x2="159.5" y2="260" stroke-width="1.3"/>
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="T" data-x="-3" data-y="-5" cx="78" cy="234" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="149" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−6</text>
  <text x="149" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="148" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="65" y="234" font-size="14" text-anchor="middle" dominant-baseline="central">T</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-12$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 270" width="326" height="270" role="img" aria-label="Los ejes dividen el plano en cuatro cuadrantes. El primero, arriba a la derecha, tiene x positiva e y positiva; el segundo, arriba a la izquierda, x negativa e y positiva; el tercero, abajo a la izquierda, las dos negativas; el cuarto, abajo a la derecha, x positiva e y negativa." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="286" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="298" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="238" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="304,130 295,125.5 295,134.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="130" y1="126.5" x2="130" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="260" y1="126.5" x2="260" y2="133.5" stroke-width="1.3"/>
  <line x1="286" y1="126.5" x2="286" y2="133.5" stroke-width="1.3"/>
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="221" y="65" font-size="16" text-anchor="middle" dominant-baseline="central">I</text>
  <text x="221" y="91" font-size="13" text-anchor="middle" dominant-baseline="central">(+, +)</text>
  <text x="91" y="65" font-size="16" text-anchor="middle" dominant-baseline="central">II</text>
  <text x="91" y="91" font-size="13" text-anchor="middle" dominant-baseline="central">(−, +)</text>
  <text x="91" y="169" font-size="16" text-anchor="middle" dominant-baseline="central">III</text>
  <text x="91" y="195" font-size="13" text-anchor="middle" dominant-baseline="central">(−, −)</text>
  <text x="221" y="169" font-size="16" text-anchor="middle" dominant-baseline="central">IV</text>
  <text x="221" y="195" font-size="13" text-anchor="middle" dominant-baseline="central">(+, −)</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-13$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 244" width="274" height="244" role="img" aria-label="El punto M está una unidad a la izquierda del eje y y tres unidades arriba del eje x. Líneas punteadas bajan de M a cada eje: M = (−1, 3)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="234" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="234" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="234" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="234" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="234" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="246" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="212" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="252,130 243,125.5 243,134.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="156" y1="126.5" x2="156" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="guia" x1="104" y1="52" x2="104" y2="130" stroke-width="1.1" stroke-dasharray="3 3"/>
  <line class="guia" x1="104" y1="52" x2="130" y2="52" stroke-width="1.1" stroke-dasharray="3 3"/>
  <circle class="punto" data-nombre="M" data-x="-1" data-y="3" cx="104" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="123" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="94" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-PLA-COORD-14$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 222 166" width="222" height="166" role="img" aria-label="Plano con cuadrícula donde solo están rotulados el 3 y el 6 en cada eje: cada cuadrado vale 3 unidades. El punto K está dos cuadrados a la izquierda y uno abajo: K = (−6, −3)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="182" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="182" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="182" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="182" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="182" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="78" x2="194" y2="78" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="134" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="200,78 191,73.5 191,82.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="74.5" x2="26" y2="81.5" stroke-width="1.3"/>
  <line x1="52" y1="74.5" x2="52" y2="81.5" stroke-width="1.3"/>
  <line x1="78" y1="74.5" x2="78" y2="81.5" stroke-width="1.3"/>
  <line x1="130" y1="74.5" x2="130" y2="81.5" stroke-width="1.3"/>
  <line x1="156" y1="74.5" x2="156" y2="81.5" stroke-width="1.3"/>
  <line x1="182" y1="74.5" x2="182" y2="81.5" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="104" x2="107.5" y2="104" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <line class="guia" x1="52" y1="104" x2="52" y2="78" stroke-width="1.1" stroke-dasharray="3 3"/>
  <line class="guia" x1="52" y1="104" x2="104" y2="104" stroke-width="1.1" stroke-dasharray="3 3"/>
  <circle class="punto" data-nombre="K" data-x="-6" data-y="-3" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <text x="130" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="156" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="96" y="90" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="198" y="66" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">K</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-TRA-001$c$, $c$¿Cuáles son las coordenadas del punto $P$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-COORD-01$c$::text),
  ($c$M1-TRA-002$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-003$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-004$c$, $c$¿Cuál descripción corresponde al punto $(5, -2)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-005$c$, $c$¿Cuál es la distancia entre los puntos $A$ y $B$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-COORD-02$c$::text),
  ($c$M1-TRA-006$c$, $c$¿Cuáles son las coordenadas del punto $Q$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-COORD-03$c$::text),
  ($c$M1-TRA-007$c$, $c$Considera las siguientes afirmaciones:

I. El punto $(-3, 0)$ está sobre el eje $x$.

II. El punto $(4, -5)$ está en el cuarto cuadrante.

III. El punto $(0, 2)$ está en el primer cuadrante.

¿Cuál o cuáles son correctas?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-008$c$, $c$¿Cuáles son las coordenadas del punto $R$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-COORD-04$c$::text),
  ($c$M1-TRA-009$c$, $c$¿Cuál de los puntos de la figura tiene coordenadas $(-2, 5)$?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-COORD-08$c$::text),
  ($c$M1-TRA-010$c$, $c$Los puntos $A$, $B$ y $C$ son tres vértices del rectángulo $ABCD$. ¿Cuáles son las coordenadas del vértice $D$?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-COORD-05$c$::text),
  ($c$M1-TRA-011$c$, $c$¿Cuál es la distancia entre los puntos $A$ y $B$?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-COORD-06$c$::text),
  ($c$M1-TRA-012$c$, $c$Considera las siguientes afirmaciones:

I. El punto $(3, -1)$ está $1$ unidad bajo el eje $x$.

II. El punto $(-2, 5)$ está $2$ unidades a la izquierda del eje $y$.

III. El punto $(0, -4)$ está en el tercer cuadrante.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-013$c$, $c$En el mapa de un pueblo se usa un plano cartesiano: la plaza está en el origen, el eje $x$ apunta al este, el eje $y$ al norte y cada cuadra mide $1$ unidad. La biblioteca está $3$ cuadras al oeste y $2$ cuadras al norte de la plaza. ¿Cuáles son sus coordenadas y en qué cuadrante está?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-014$c$, $c$Un punto está en el segundo cuadrante, a $2$ unidades del eje $x$ y a $5$ unidades del eje $y$. ¿Cuáles son sus coordenadas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-015$c$, $c$¿Cuáles son las coordenadas del vértice $C$ y en qué cuadrante está?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-COORD-07$c$::text),
  ($c$M1-TRA-016$c$, $c$Un punto tiene abscisa negativa y ordenada igual a $0$. ¿Dónde está?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-017$c$, $c$Considera las siguientes afirmaciones:

I. Todos los puntos del segundo cuadrante tienen abscisa negativa.

II. Si un punto tiene ordenada $0$, está sobre el eje $y$.

III. El origen está en el primer cuadrante.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-018$c$, $c$¿Cuáles son las coordenadas del punto $P$?$c$, 3, $c$propio$c$::text, $c$FIG-PLA-COORD-09$c$::text),
  ($c$M1-TRA-019$c$, $c$Considera las siguientes afirmaciones:

I. La distancia entre $(-4, 1)$ y $(3, 1)$ es $7$ unidades.

II. La distancia entre $(2, -3)$ y $(2, 4)$ es $8$ unidades.

III. El punto $(0, -4)$ está sobre el eje $x$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-020$c$, $c$Sean $a$ y $b$ números positivos. ¿Cuál de las siguientes afirmaciones es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-021$c$, $c$Considera las siguientes afirmaciones sobre los puntos de la figura:

I. $A = (-4, 2)$

II. $B$ está en el cuarto cuadrante.

III. $C = (0, 6)$

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, $c$FIG-PLA-COORD-10$c$::text),
  ($c$M1-TRA-022$c$, $c$Una hormiga camina en línea recta por la cuadrícula desde el punto $(-3, 4)$ hasta el punto $(2, 4)$. ¿Cuántas unidades recorre y entre qué cuadrantes se mueve?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-023$c$, $c$¿Cuál es la ordenada del punto $T$?$c$, 3, $c$propio$c$::text, $c$FIG-PLA-COORD-11$c$::text),
  ($c$M1-TRA-024$c$, $c$En un mapa cuadriculado, la casa de Ana está en el punto $(-3, -2)$ y la de Beto en el punto $(4, -2)$. Cada unidad es una cuadra. ¿A cuántas cuadras están una de otra y en qué cuadrante está cada casa?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-TRA-001$c$, $c$A$c$, $c$$(-3, 2)$$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-001$c$, $c$B$c$, $c$$(-6, 4)$$c$, true, null),
  ($c$M1-TRA-001$c$, $c$C$c$, $c$$(4, -6)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-001$c$, $c$D$c$, $c$$(6, 4)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-002$c$, $c$A$c$, $c$El punto $(-2, 7)$ está en el segundo cuadrante.$c$, true, null),
  ($c$M1-TRA-002$c$, $c$B$c$, $c$El punto $(5, -1)$ está en el segundo cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-002$c$, $c$C$c$, $c$El punto $(0, -4)$ está en el tercer cuadrante.$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-002$c$, $c$D$c$, $c$El punto $(0, -4)$ está sobre el eje $x$.$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-003$c$, $c$A$c$, $c$El punto $(0, 5)$ está sobre el eje $x$.$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-003$c$, $c$B$c$, $c$El punto $(-5, 0)$ está en el segundo cuadrante.$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-003$c$, $c$C$c$, $c$El punto $(2, 7)$ está $7$ unidades a la derecha del eje $y$.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-003$c$, $c$D$c$, $c$El punto $(0, 5)$ está sobre el eje $y$.$c$, true, null),
  ($c$M1-TRA-004$c$, $c$A$c$, $c$Está $5$ unidades a la derecha del eje $y$ y $2$ unidades bajo el eje $x$, en el segundo cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-004$c$, $c$B$c$, $c$Está $5$ unidades a la derecha del eje $y$ y $2$ unidades sobre el eje $x$, en el primer cuadrante.$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-004$c$, $c$C$c$, $c$Está $5$ unidades a la derecha del eje $y$ y $2$ unidades bajo el eje $x$, en el cuarto cuadrante.$c$, true, null),
  ($c$M1-TRA-004$c$, $c$D$c$, $c$Está $2$ unidades a la derecha del eje $y$ y $5$ unidades bajo el eje $x$, en el cuarto cuadrante.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-005$c$, $c$A$c$, $c$$5$ unidades$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-005$c$, $c$B$c$, $c$$2$ unidades$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-005$c$, $c$C$c$, $c$$10$ unidades$c$, true, null),
  ($c$M1-TRA-005$c$, $c$D$c$, $c$$6$ unidades$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-006$c$, $c$A$c$, $c$$(5, -4)$$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-006$c$, $c$B$c$, $c$$(-3, 4)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-006$c$, $c$C$c$, $c$$(4, 3)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-006$c$, $c$D$c$, $c$$(4, -3)$$c$, true, null),
  ($c$M1-TRA-007$c$, $c$A$c$, $c$I, II y III$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-007$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-007$c$, $c$C$c$, $c$Solo I$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-007$c$, $c$D$c$, $c$Solo II$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-008$c$, $c$A$c$, $c$$(0, -4)$$c$, true, null),
  ($c$M1-TRA-008$c$, $c$B$c$, $c$$(-4, 0)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-008$c$, $c$C$c$, $c$$(0, -5)$$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-008$c$, $c$D$c$, $c$$(0, 4)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-009$c$, $c$A$c$, $c$El punto $C$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-009$c$, $c$B$c$, $c$El punto $B$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-009$c$, $c$C$c$, $c$El punto $D$$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-009$c$, $c$D$c$, $c$El punto $A$$c$, true, null),
  ($c$M1-TRA-010$c$, $c$A$c$, $c$$(-4, 4)$$c$, true, null),
  ($c$M1-TRA-010$c$, $c$B$c$, $c$$(4, -4)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-010$c$, $c$C$c$, $c$$(4, 4)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-010$c$, $c$D$c$, $c$$(-2, 2)$$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-011$c$, $c$A$c$, $c$$5$ unidades$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-011$c$, $c$B$c$, $c$$2$ unidades$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-011$c$, $c$C$c$, $c$$10$ unidades$c$, true, null),
  ($c$M1-TRA-011$c$, $c$D$c$, $c$$6$ unidades$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-012$c$, $c$A$c$, $c$Solo I$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-012$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-012$c$, $c$C$c$, $c$Solo II$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-012$c$, $c$D$c$, $c$I, II y III$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-013$c$, $c$A$c$, $c$$(2, -3)$, en el cuarto cuadrante.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-013$c$, $c$B$c$, $c$$(-3, 2)$, en el segundo cuadrante.$c$, true, null),
  ($c$M1-TRA-013$c$, $c$C$c$, $c$$(-3, 2)$, en el cuarto cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-013$c$, $c$D$c$, $c$$(3, 2)$, en el primer cuadrante.$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-014$c$, $c$A$c$, $c$$(5, -2)$$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-014$c$, $c$B$c$, $c$$(5, 2)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-014$c$, $c$C$c$, $c$$(-2, 5)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-014$c$, $c$D$c$, $c$$(-5, 2)$$c$, true, null),
  ($c$M1-TRA-015$c$, $c$A$c$, $c$$(3, -2)$, en el segundo cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-015$c$, $c$B$c$, $c$$(-2, 3)$, en el segundo cuadrante.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-015$c$, $c$C$c$, $c$$(3, -2)$, en el cuarto cuadrante.$c$, true, null),
  ($c$M1-TRA-015$c$, $c$D$c$, $c$$(3, 2)$, en el primer cuadrante.$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-016$c$, $c$A$c$, $c$Sobre el eje $x$, a la izquierda del origen.$c$, true, null),
  ($c$M1-TRA-016$c$, $c$B$c$, $c$Sobre el eje $y$, bajo el origen.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-016$c$, $c$C$c$, $c$En el segundo cuadrante.$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-016$c$, $c$D$c$, $c$Sobre el eje $y$, porque su ordenada es $0$.$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-017$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-017$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-017$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-017$c$, $c$D$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-018$c$, $c$A$c$, $c$$(-10, 15)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-018$c$, $c$B$c$, $c$$(15, -10)$$c$, true, null),
  ($c$M1-TRA-018$c$, $c$C$c$, $c$$(3, -2)$$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-018$c$, $c$D$c$, $c$$(15, 10)$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-019$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-019$c$, $c$B$c$, $c$Solo II$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-019$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-019$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-020$c$, $c$A$c$, $c$El punto $(-a, b)$ está en el segundo cuadrante.$c$, true, null),
  ($c$M1-TRA-020$c$, $c$B$c$, $c$El punto $(0, b)$ está en el primer cuadrante.$c$, false, $c$PLA-COORD-EJECUAD$c$),
  ($c$M1-TRA-020$c$, $c$C$c$, $c$El punto $(a, -b)$ está en el segundo cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-020$c$, $c$D$c$, $c$El punto $(a, 0)$ está sobre el eje $y$.$c$, false, $c$PLA-COORD-EJECERO$c$),
  ($c$M1-TRA-021$c$, $c$A$c$, $c$Solo I$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-021$c$, $c$B$c$, $c$Solo II$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-021$c$, $c$C$c$, $c$Solo III$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-021$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-022$c$, $c$A$c$, $c$$5$ unidades; pasa del cuarto al primer cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-022$c$, $c$B$c$, $c$$1$ unidad; pasa del segundo al primer cuadrante.$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-022$c$, $c$C$c$, $c$$5$ unidades; pasa del segundo al primer cuadrante.$c$, true, null),
  ($c$M1-TRA-022$c$, $c$D$c$, $c$$6$ unidades; pasa del segundo al primer cuadrante.$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-023$c$, $c$A$c$, $c$$-5$$c$, true, null),
  ($c$M1-TRA-023$c$, $c$B$c$, $c$$-3$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-023$c$, $c$C$c$, $c$$5$$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-023$c$, $c$D$c$, $c$$-6$$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-024$c$, $c$A$c$, $c$A $1$ cuadra; la de Ana en el tercer cuadrante y la de Beto en el cuarto.$c$, false, $c$PLA-COORD-SINSIGNO$c$),
  ($c$M1-TRA-024$c$, $c$B$c$, $c$A $7$ cuadras; la de Ana en el tercer cuadrante y la de Beto en el cuarto.$c$, true, null),
  ($c$M1-TRA-024$c$, $c$C$c$, $c$A $8$ cuadras; la de Ana en el tercer cuadrante y la de Beto en el cuarto.$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-024$c$, $c$D$c$, $c$A $7$ cuadras; la de Ana en el tercer cuadrante y la de Beto en el segundo.$c$, false, $c$PLA-COORD-CUADNUM$c$)
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
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-001$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-002$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-003$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-004$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-005$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-006$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-007$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-008$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-009$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-010$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-011$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-012$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-013$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-014$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-015$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-016$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-017$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-018$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-019$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-020$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-021$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-022$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-023$c$),
  ($c$GEO-PLA-COORD$c$, $c$M1-TRA-024$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-PLA-COORD-ORDEN$c$, $c$PLA-COORD-ORDEN$c$, $c$Primero la x, después la y$c$, $c$Cambiaste el orden de las coordenadas. Por ejemplo, un punto que está
$1$ unidad a la derecha y $6$ abajo lo escribiste $(-6, 1)$.

**En el par $(x, y)$, la primera coordenada es la horizontal y la
segunda la vertical. Siempre en ese orden.**

Para el punto de arriba: camina por el eje $x$, $1$ a la derecha,
$x = 1$. Después baja $6$, $y = -6$. El punto es $(1, -6)$.

$(-6, 1)$ es otro punto: $6$ a la izquierda y $1$ arriba, en otro
cuadrante.

Un control rápido: lee el par en voz alta como «derecha o izquierda,
después arriba o abajo». Si el primer número te hace subir o bajar,
está al revés.$c$),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$PLA-COORD-SINSIGNO$c$, $c$Izquierda y abajo llevan signo menos$c$, $c$Anotaste cuánto se aleja el punto de cada eje, pero no hacia dónde.
Por ejemplo, un punto que está $5$ a la izquierda y $7$ abajo lo
escribiste $(5, 7)$.

**Las coordenadas llevan signo: a la izquierda del eje $y$ la abscisa
es negativa, y bajo el eje $x$ la ordenada es negativa.**

Ese punto es $(-5, -7)$. $(5, 7)$ está en el cuadrante opuesto.

Lo mismo al medir distancias: entre $x = -7$ y $x = 1$ hay $7$ saltos
hasta el $0$ y $1$ más hasta el $1$. Son $8$ unidades, no $7 - 1 = 6$.

Un control rápido: si tu punto está a la izquierda o abajo del origen,
alguna de sus coordenadas tiene que ser negativa.$c$),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$PLA-COORD-CUADNUM$c$, $c$Los cuadrantes giran contra el reloj$c$, $c$Numeraste los cuadrantes en el orden equivocado. Por ejemplo, dijiste
que $(6, -2)$ está en el segundo cuadrante.

**Los cuadrantes se numeran en sentido contrario a los punteros del
reloj: I arriba a la derecha, II arriba a la izquierda, III abajo a la
izquierda, IV abajo a la derecha.**

Por signos:

- I: $(+, +)$
- II: $(-, +)$
- III: $(-, -)$
- IV: $(+, -)$

$(6, -2)$ tiene $x$ positiva e $y$ negativa: está en el IV.

Un control rápido: el II está **arriba**, sobre el I, pero a la
izquierda. Si tu «segundo cuadrante» está abajo, giraste al revés.$c$),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$PLA-COORD-EJECERO$c$, $c$Si la x es 0, el punto está sobre el eje y$c$, $c$Confundiste sobre qué eje está un punto. Por ejemplo, dijiste que
$(0, 7)$ está sobre el eje $x$.

**Un punto con $x = 0$ está sobre el eje $y$. Un punto con $y = 0$
está sobre el eje $x$.**

$x = 0$ significa que no te moviste ni a la derecha ni a la izquierda:
sigues sobre la línea vertical que pasa por el origen, que es el eje
$y$. Después subes $7$: $(0, 7)$ queda sobre el eje $y$, arriba del
origen.

Un control rápido: el eje donde está el punto es el de la coordenada
que **no** es cero. En $(0, 7)$ la que no es cero es la $y$.$c$),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$PLA-COORD-EJECUAD$c$, $c$Los puntos de los ejes no son de ningún cuadrante$c$, $c$Pusiste en un cuadrante un punto que está sobre un eje. Por ejemplo,
dijiste que $(-8, 0)$ está en el segundo cuadrante.

**Los cuadrantes son las cuatro regiones que quedan entre los ejes.
Los ejes son la frontera, y sus puntos no pertenecen a ninguno.**

$(-8, 0)$ tiene $y = 0$: está justo sobre el eje $x$, a la izquierda
del origen. No está ni arriba (segundo cuadrante) ni abajo (tercero).

Un control rápido: antes de mirar los signos, revisa si alguna
coordenada es $0$. Si lo es, el punto está sobre un eje y no hay
cuadrante que buscar.$c$),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$PLA-COORD-ESCALA$c$, $c$Primero averigua cuánto vale cada cuadrado$c$, $c$Contaste cuadrados como si cada uno valiera $1$. Por ejemplo, en una
cuadrícula donde los ejes marcan $4, 8, 12$, a un punto que está a
$3$ cuadrados a la derecha le diste abscisa $3$.

**La escala se deduce de dos marcas rotuladas: la diferencia entre
ellas, dividida por los cuadrados que las separan.**

Si el $4$ y el $8$ están a un cuadrado de distancia, cada cuadrado
vale $4$. Tres cuadrados a la derecha son $12$ unidades: la abscisa es
$12$.

Lo mismo para distancias: $4$ cuadrados de $4$ unidades son $16$
unidades.

Un control rápido: tu coordenada tiene que coincidir con los números
rotulados en los ejes. Si el punto está sobre la marca del $12$, su
coordenada no puede ser $3$.$c$),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$PLA-COORD-CONTEO$c$, $c$Se cuentan saltos, no líneas$c$, $c$Contaste las líneas de la cuadrícula en vez de los espacios entre
ellas. Por ejemplo, entre $(-2, 1)$ y $(3, 1)$ contaste $6$.

**La distancia es la cantidad de saltos de una línea a la siguiente.
La línea de partida no cuenta, porque ahí todavía no has avanzado.**

De $x = -2$ a $x = 3$:

$$-2 \to -1 \to 0 \to 1 \to 2 \to 3$$

Son $6$ números, pero $5$ saltos. La distancia es $5$.

Lo mismo al leer un punto: el eje es la posición $0$, no la $1$.

Un control rápido: si cuentas números, réstale uno. Los saltos
siempre son uno menos que las líneas que tocas.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-PLA-COORD-ORDEN$c$, $c$REM-PLA-COORD-SINSIGNO$c$, $c$REM-PLA-COORD-CUADNUM$c$, $c$REM-PLA-COORD-EJECERO$c$, $c$REM-PLA-COORD-EJECUAD$c$, $c$REM-PLA-COORD-ESCALA$c$, $c$REM-PLA-COORD-CONTEO$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-004$c$, 1::smallint),
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-006$c$, 2::smallint),
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-013$c$, 3::smallint),
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-014$c$, 4::smallint),
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-021$c$, 5::smallint),
  ($c$REM-PLA-COORD-ORDEN$c$, $c$M1-TRA-023$c$, 6::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-005$c$, 1::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-006$c$, 2::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-012$c$, 3::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-013$c$, 4::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-022$c$, 5::smallint),
  ($c$REM-PLA-COORD-SINSIGNO$c$, $c$M1-TRA-023$c$, 6::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-004$c$, 1::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-007$c$, 2::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-014$c$, 3::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-015$c$, 4::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-021$c$, 5::smallint),
  ($c$REM-PLA-COORD-CUADNUM$c$, $c$M1-TRA-022$c$, 6::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-002$c$, 1::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-003$c$, 2::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-007$c$, 3::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-016$c$, 4::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-019$c$, 5::smallint),
  ($c$REM-PLA-COORD-EJECERO$c$, $c$M1-TRA-020$c$, 6::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-003$c$, 1::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-007$c$, 2::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-012$c$, 3::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-016$c$, 4::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-017$c$, 5::smallint),
  ($c$REM-PLA-COORD-EJECUAD$c$, $c$M1-TRA-020$c$, 6::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-001$c$, 1::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-005$c$, 2::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-010$c$, 3::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-011$c$, 4::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-018$c$, 5::smallint),
  ($c$REM-PLA-COORD-ESCALA$c$, $c$M1-TRA-021$c$, 6::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-006$c$, 1::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-008$c$, 2::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-009$c$, 3::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-011$c$, 4::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-022$c$, 5::smallint),
  ($c$REM-PLA-COORD-CONTEO$c$, $c$M1-TRA-023$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-GEO-TRA-01$c$, $c$GEO-TRA$c$, $c$El plano cartesiano, puntos y cuadrantes$c$, $c$El plano cartesiano son dos rectas numéricas cruzadas. Con él cada punto
tiene una dirección exacta, y eso es lo que vas a usar en todas las
transformaciones, en los gráficos de funciones y en los sistemas de
ecuaciones.

## Puntos y coordenadas

### Dos rectas y un par ordenado

El eje horizontal es el **eje $x$** y el vertical, el **eje $y$**. Se
cruzan en el **origen**, el $(0, 0)$. Cada eje es una recta numérica:
en el eje $x$ los positivos van a la derecha; en el eje $y$, hacia
arriba.

Un punto se escribe como un **par ordenado** $(x, y)$:

- la primera coordenada, la **abscisa**, dice cuánto te mueves a la
  derecha (positiva) o a la izquierda (negativa);
- la segunda, la **ordenada**, dice cuánto subes (positiva) o bajas
  (negativa).

**Primero se camina por el eje $x$, después se sube o baja.** El orden
importa: $(2, 5)$ y $(5, 2)$ son puntos distintos.

![](fig:FIG-PLA-COORD-13)

Para leer un punto, baja una línea hasta el eje $x$ (esa es la abscisa)
y lleva otra hasta el eje $y$ (esa es la ordenada). Si el punto está a
la izquierda o abajo, su coordenada lleva signo menos: la distancia al
eje no basta.

### Los cuatro cuadrantes

Los ejes dividen el plano en cuatro **cuadrantes**, que se numeran en
sentido **contrario a los punteros del reloj**, partiendo arriba a la
derecha:

![](fig:FIG-PLA-COORD-12)

El cuadrante lo deciden los signos: $(-7, 1)$ está en el segundo,
porque tiene $x$ negativa e $y$ positiva. Un control rápido: el cuarto
cuadrante está abajo a la derecha, al lado del primero, no al frente.

### Puntos sobre los ejes

Si una coordenada es $0$, el punto está sobre un eje y **no pertenece a
ningún cuadrante**:

- $x = 0$: el punto está sobre el **eje $y$**. Por ejemplo, $(0, -7)$.
- $y = 0$: el punto está sobre el **eje $x$**. Por ejemplo, $(8, 0)$.

Este es el caso que más se confunde. Piénsalo así: si no te moviste a la
derecha ni a la izquierda ($x = 0$), sigues sobre la línea vertical, que
es el eje $y$.

### Cuadrículas con otra escala

No siempre cada cuadrado vale $1$. **La escala se deduce de dos marcas
rotuladas.** Si en el eje aparecen el $3$ y el $6$, cada cuadrado vale
$3$:

![](fig:FIG-PLA-COORD-14)

El punto $K$ está dos cuadrados a la izquierda y uno abajo: $K = (-6,
-3)$, no $(-2, -1)$.

### Distancia entre puntos alineados

Si dos puntos tienen la misma ordenada, están en una misma horizontal, y
la distancia entre ellos es cuánto hay que caminar por el eje $x$. Entre
$(-1, 7)$ y $(5, 7)$ hay $6$ unidades: de $-1$ a $0$ es $1$ y de $0$ a
$5$ son $5$.

**Se cuentan saltos, no líneas.** De $-1$ a $5$ hay $7$ líneas de la
cuadrícula, pero $6$ saltos entre ellas. Y el signo importa: la
distancia no es $5 - 1 = 4$.

### Mapas

En un mapa con el origen en un lugar de referencia, el este suele ser el
eje $x$ positivo y el norte el eje $y$ positivo. Si un almacén está $7$
cuadras al oeste y $3$ al sur de la plaza, sus coordenadas son
$(-7, -3)$: oeste es $x$ negativa, sur es $y$ negativa.$c$, 1::smallint)
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
  ($c$LES-GEO-TRA-01$c$, $c$GEO-PLA-COORD$c$, 1::smallint, $c$puntos-y-coordenadas$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-TRA-001$c$, $c$M1-TRA-002$c$, $c$M1-TRA-003$c$, $c$M1-TRA-004$c$, $c$M1-TRA-005$c$, $c$M1-TRA-006$c$, $c$M1-TRA-007$c$, $c$M1-TRA-008$c$, $c$M1-TRA-009$c$, $c$M1-TRA-010$c$, $c$M1-TRA-011$c$, $c$M1-TRA-012$c$, $c$M1-TRA-013$c$, $c$M1-TRA-014$c$, $c$M1-TRA-015$c$, $c$M1-TRA-016$c$, $c$M1-TRA-017$c$, $c$M1-TRA-018$c$, $c$M1-TRA-019$c$, $c$M1-TRA-020$c$, $c$M1-TRA-021$c$, $c$M1-TRA-022$c$, $c$M1-TRA-023$c$, $c$M1-TRA-024$c$);
  if c <> 24 then
    raise exception 'items: se esperaban 24, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-001$c$, $c$M1-TRA-002$c$, $c$M1-TRA-003$c$, $c$M1-TRA-004$c$, $c$M1-TRA-005$c$, $c$M1-TRA-006$c$, $c$M1-TRA-007$c$, $c$M1-TRA-008$c$, $c$M1-TRA-009$c$, $c$M1-TRA-010$c$, $c$M1-TRA-011$c$, $c$M1-TRA-012$c$, $c$M1-TRA-013$c$, $c$M1-TRA-014$c$, $c$M1-TRA-015$c$, $c$M1-TRA-016$c$, $c$M1-TRA-017$c$, $c$M1-TRA-018$c$, $c$M1-TRA-019$c$, $c$M1-TRA-020$c$, $c$M1-TRA-021$c$, $c$M1-TRA-022$c$, $c$M1-TRA-023$c$, $c$M1-TRA-024$c$);
  if c <> 96 then
    raise exception 'item_options: se esperaban 96, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-001$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-002$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-003$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-004$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-005$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-006$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-007$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-008$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-009$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-010$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-011$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-012$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-013$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-014$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-015$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-016$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-017$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-018$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-019$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-020$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-021$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-022$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-023$c$, $c$GEO-PLA-COORD$c$),
      ($c$M1-TRA-024$c$, $c$GEO-PLA-COORD$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 24 then
    raise exception 'node_items: 24 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-001$c$, $c$M1-TRA-002$c$, $c$M1-TRA-003$c$, $c$M1-TRA-004$c$, $c$M1-TRA-005$c$, $c$M1-TRA-006$c$, $c$M1-TRA-007$c$, $c$M1-TRA-008$c$, $c$M1-TRA-009$c$, $c$M1-TRA-010$c$, $c$M1-TRA-011$c$, $c$M1-TRA-012$c$, $c$M1-TRA-013$c$, $c$M1-TRA-014$c$, $c$M1-TRA-015$c$, $c$M1-TRA-016$c$, $c$M1-TRA-017$c$, $c$M1-TRA-018$c$, $c$M1-TRA-019$c$, $c$M1-TRA-020$c$, $c$M1-TRA-021$c$, $c$M1-TRA-022$c$, $c$M1-TRA-023$c$, $c$M1-TRA-024$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$PLA-COORD-CONTEO$c$, $c$PLA-COORD-CUADNUM$c$, $c$PLA-COORD-EJECERO$c$, $c$PLA-COORD-EJECUAD$c$, $c$PLA-COORD-ESCALA$c$, $c$PLA-COORD-ORDEN$c$, $c$PLA-COORD-SINSIGNO$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-001$c$, $c$FIG-PLA-COORD-01$c$),
      ($c$M1-TRA-005$c$, $c$FIG-PLA-COORD-02$c$),
      ($c$M1-TRA-006$c$, $c$FIG-PLA-COORD-03$c$),
      ($c$M1-TRA-008$c$, $c$FIG-PLA-COORD-04$c$),
      ($c$M1-TRA-009$c$, $c$FIG-PLA-COORD-08$c$),
      ($c$M1-TRA-010$c$, $c$FIG-PLA-COORD-05$c$),
      ($c$M1-TRA-011$c$, $c$FIG-PLA-COORD-06$c$),
      ($c$M1-TRA-015$c$, $c$FIG-PLA-COORD-07$c$),
      ($c$M1-TRA-018$c$, $c$FIG-PLA-COORD-09$c$),
      ($c$M1-TRA-021$c$, $c$FIG-PLA-COORD-10$c$),
      ($c$M1-TRA-023$c$, $c$FIG-PLA-COORD-11$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 11 then
    raise exception 'figure_id: 11 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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
      or not (code = any (array[$c$FIG-ENT-ABS-01$c$, $c$FIG-ENT-ABS-02$c$, $c$FIG-ENT-ABS-03$c$, $c$FIG-ENT-ABS-04$c$, $c$FIG-ENT-ABS-05$c$, $c$FIG-ENT-ADI-01$c$, $c$FIG-ENT-ADI-02$c$, $c$FIG-ENT-ADI-03$c$, $c$FIG-ENT-ADI-04$c$, $c$FIG-ENT-ADI-05$c$, $c$FIG-ENT-ADI-06$c$, $c$FIG-ENT-ADI-07$c$, $c$FIG-ENT-REC-01$c$, $c$FIG-ENT-REC-02$c$, $c$FIG-ENT-REC-03$c$, $c$FIG-ENT-REC-04$c$, $c$FIG-ENT-REC-05$c$, $c$FIG-FIG-CLAS-01$c$, $c$FIG-FIG-CLAS-02$c$, $c$FIG-FIG-CLAS-03$c$, $c$FIG-FIG-CLAS-04$c$, $c$FIG-FIG-CLAS-05$c$, $c$FIG-FIG-CLAS-06$c$, $c$FIG-FIG-CLAS-07$c$, $c$FIG-FIG-ELEM-01$c$, $c$FIG-FIG-ELEM-02$c$, $c$FIG-FIG-ELEM-03$c$, $c$FIG-FIG-ELEM-04$c$, $c$FIG-FIG-ELEM-05$c$, $c$FIG-FIG-ELEM-06$c$, $c$FIG-FIG-ELEM-07$c$, $c$FIG-FIG-ELEM-08$c$, $c$FIG-FIG-ELEM-09$c$, $c$FIG-FIG-ELEM-10$c$, $c$FIG-FIG-ELEM-11$c$, $c$FIG-FIG-ELEM-12$c$, $c$FIG-FIG-ELEM-13$c$, $c$FIG-PER-POL-01$c$, $c$FIG-PER-POL-02$c$, $c$FIG-PER-POL-03$c$, $c$FIG-PER-POL-04$c$, $c$FIG-PER-POL-05$c$, $c$FIG-PER-POL-06$c$, $c$FIG-PER-POL-07$c$, $c$FIG-PER-POL-08$c$, $c$FIG-PER-POL-09$c$, $c$FIG-PER-POL-10$c$, $c$FIG-PER-POL-11$c$, $c$FIG-PER-POL-12$c$, $c$FIG-PER-POL-13$c$, $c$FIG-PER-POL-14$c$, $c$FIG-PLA-COORD-01$c$, $c$FIG-PLA-COORD-02$c$, $c$FIG-PLA-COORD-03$c$, $c$FIG-PLA-COORD-04$c$, $c$FIG-PLA-COORD-05$c$, $c$FIG-PLA-COORD-06$c$, $c$FIG-PLA-COORD-07$c$, $c$FIG-PLA-COORD-08$c$, $c$FIG-PLA-COORD-09$c$, $c$FIG-PLA-COORD-10$c$, $c$FIG-PLA-COORD-11$c$, $c$FIG-PLA-COORD-12$c$, $c$FIG-PLA-COORD-13$c$, $c$FIG-PLA-COORD-14$c$, $c$FIG-PLA-VEC-01$c$, $c$FIG-PLA-VEC-02$c$, $c$FIG-PLA-VEC-03$c$, $c$FIG-PLA-VEC-04$c$, $c$FIG-PLA-VEC-05$c$, $c$FIG-PLA-VEC-06$c$, $c$FIG-PLA-VEC-07$c$, $c$FIG-PLA-VEC-08$c$, $c$FIG-REF-EJE-01$c$, $c$FIG-REF-EJE-02$c$, $c$FIG-REF-EJE-03$c$, $c$FIG-REF-EJE-04$c$, $c$FIG-REF-EJE-05$c$, $c$FIG-REF-REC-01$c$, $c$FIG-REF-REC-02$c$, $c$FIG-REF-REC-03$c$, $c$FIG-REF-REC-04$c$, $c$FIG-REF-REC-05$c$, $c$FIG-ROT-90-01$c$, $c$FIG-ROT-90-02$c$, $c$FIG-ROT-90-03$c$, $c$FIG-ROT-90-04$c$, $c$FIG-ROT-90-05$c$, $c$FIG-ROT-CEN-01$c$, $c$FIG-ROT-CEN-02$c$, $c$FIG-ROT-CEN-03$c$, $c$FIG-ROT-CEN-04$c$, $c$FIG-SIM-CEN-01$c$, $c$FIG-SIM-CEN-02$c$, $c$FIG-SIM-CEN-03$c$, $c$FIG-TRA-TRAS-01$c$, $c$FIG-TRA-TRAS-02$c$, $c$FIG-TRA-TRAS-03$c$, $c$FIG-TRA-TRAS-04$c$, $c$FIG-TRA-TRAS-05$c$, $c$FIG-TRA-TRAS-06$c$, $c$FIG-TRA-TRAS-07$c$, $c$FIG-VEC-OP-01$c$, $c$FIG-VEC-OP-02$c$, $c$FIG-VEC-OP-03$c$, $c$FIG-VEC-OP-04$c$, $c$FIG-VEC-OP-05$c$, $c$FIG-VEC-OP-06$c$, $c$FIG-VEC-OP-07$c$, $c$FIG-VEC-OP-08$c$]::text[]));
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

-- 24 ítems (24 curated), 96 alternativas, 7 misconceptions referenciadas,
-- 7 remediaciones, 14 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 24 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-TRA-001$c$, $c$M1-TRA-002$c$, $c$M1-TRA-003$c$, $c$M1-TRA-004$c$, $c$M1-TRA-005$c$, $c$M1-TRA-006$c$, $c$M1-TRA-007$c$, $c$M1-TRA-008$c$, $c$M1-TRA-009$c$, $c$M1-TRA-010$c$, $c$M1-TRA-011$c$, $c$M1-TRA-012$c$, $c$M1-TRA-013$c$, $c$M1-TRA-014$c$, $c$M1-TRA-015$c$, $c$M1-TRA-016$c$, $c$M1-TRA-017$c$, $c$M1-TRA-018$c$, $c$M1-TRA-019$c$, $c$M1-TRA-020$c$, $c$M1-TRA-021$c$, $c$M1-TRA-022$c$, $c$M1-TRA-023$c$, $c$M1-TRA-024$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-PLA-COORD-ORDEN$c$, $c$REM-PLA-COORD-SINSIGNO$c$, $c$REM-PLA-COORD-CUADNUM$c$, $c$REM-PLA-COORD-EJECERO$c$, $c$REM-PLA-COORD-EJECUAD$c$, $c$REM-PLA-COORD-ESCALA$c$, $c$REM-PLA-COORD-CONTEO$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-GEO-TRA-01$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-TRA-001$c$, $c$M1-TRA-002$c$, $c$M1-TRA-003$c$, $c$M1-TRA-004$c$, $c$M1-TRA-005$c$, $c$M1-TRA-006$c$, $c$M1-TRA-007$c$, $c$M1-TRA-008$c$, $c$M1-TRA-009$c$, $c$M1-TRA-010$c$, $c$M1-TRA-011$c$, $c$M1-TRA-012$c$, $c$M1-TRA-013$c$, $c$M1-TRA-014$c$, $c$M1-TRA-015$c$, $c$M1-TRA-016$c$, $c$M1-TRA-017$c$, $c$M1-TRA-018$c$, $c$M1-TRA-019$c$, $c$M1-TRA-020$c$, $c$M1-TRA-021$c$, $c$M1-TRA-022$c$, $c$M1-TRA-023$c$, $c$M1-TRA-024$c$) group by 1;
