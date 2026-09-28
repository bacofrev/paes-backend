-- =====================================================================
-- LES-GEO-TRA-04 — Rotaciones y simetría central
-- Generado por cargar_contenido.py desde LES-GEO-TRA-04.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-ROT-90-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 374 370" width="374" height="370" role="img" aria-label="Plano con cuadrícula, el triángulo F y cuatro triángulos numerados del 1 al 4." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="48" y1="26" x2="48" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="70" y1="26" x2="70" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="92" y1="26" x2="92" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="114" y1="26" x2="114" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="136" y1="26" x2="136" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="158" y1="26" x2="158" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="180" y1="26" x2="180" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="202" y1="26" x2="202" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="224" y1="26" x2="224" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="246" y1="26" x2="246" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="268" y1="26" x2="268" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="290" y1="26" x2="290" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="312" y1="26" x2="312" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="334" y1="26" x2="334" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="334" x2="334" y2="334" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="312" x2="334" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="290" x2="334" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="268" x2="334" y2="268" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="246" x2="334" y2="246" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="224" x2="334" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="202" x2="334" y2="202" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="180" x2="334" y2="180" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="158" x2="334" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="136" x2="334" y2="136" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="114" x2="334" y2="114" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="92" x2="334" y2="92" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="70" x2="334" y2="70" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="48" x2="334" y2="48" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="334" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="180" x2="346" y2="180" stroke-width="1.3"/>
  <line class="eje-y" x1="180" y1="338" x2="180" y2="14" stroke-width="1.3"/>
  <polygon points="352,180 343,175.5 343,184.5" fill="currentColor" stroke="none"/>
  <polygon points="180,8 175.5,17 184.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="176.5" x2="26" y2="183.5" stroke-width="1.3"/>
  <line x1="48" y1="176.5" x2="48" y2="183.5" stroke-width="1.3"/>
  <line x1="70" y1="176.5" x2="70" y2="183.5" stroke-width="1.3"/>
  <line x1="92" y1="176.5" x2="92" y2="183.5" stroke-width="1.3"/>
  <line x1="114" y1="176.5" x2="114" y2="183.5" stroke-width="1.3"/>
  <line x1="136" y1="176.5" x2="136" y2="183.5" stroke-width="1.3"/>
  <line x1="158" y1="176.5" x2="158" y2="183.5" stroke-width="1.3"/>
  <line x1="202" y1="176.5" x2="202" y2="183.5" stroke-width="1.3"/>
  <line x1="224" y1="176.5" x2="224" y2="183.5" stroke-width="1.3"/>
  <line x1="246" y1="176.5" x2="246" y2="183.5" stroke-width="1.3"/>
  <line x1="268" y1="176.5" x2="268" y2="183.5" stroke-width="1.3"/>
  <line x1="290" y1="176.5" x2="290" y2="183.5" stroke-width="1.3"/>
  <line x1="312" y1="176.5" x2="312" y2="183.5" stroke-width="1.3"/>
  <line x1="334" y1="176.5" x2="334" y2="183.5" stroke-width="1.3"/>
  <line x1="176.5" y1="334" x2="183.5" y2="334" stroke-width="1.3"/>
  <line x1="176.5" y1="312" x2="183.5" y2="312" stroke-width="1.3"/>
  <line x1="176.5" y1="290" x2="183.5" y2="290" stroke-width="1.3"/>
  <line x1="176.5" y1="268" x2="183.5" y2="268" stroke-width="1.3"/>
  <line x1="176.5" y1="246" x2="183.5" y2="246" stroke-width="1.3"/>
  <line x1="176.5" y1="224" x2="183.5" y2="224" stroke-width="1.3"/>
  <line x1="176.5" y1="202" x2="183.5" y2="202" stroke-width="1.3"/>
  <line x1="176.5" y1="158" x2="183.5" y2="158" stroke-width="1.3"/>
  <line x1="176.5" y1="136" x2="183.5" y2="136" stroke-width="1.3"/>
  <line x1="176.5" y1="114" x2="183.5" y2="114" stroke-width="1.3"/>
  <line x1="176.5" y1="92" x2="183.5" y2="92" stroke-width="1.3"/>
  <line x1="176.5" y1="70" x2="183.5" y2="70" stroke-width="1.3"/>
  <line x1="176.5" y1="48" x2="183.5" y2="48" stroke-width="1.3"/>
  <line x1="176.5" y1="26" x2="183.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=1,4;=3,4;=1,6" points="202,92 246,92 202,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-4,1;=-4,3;=-6,1" points="92,158 92,114 48,158" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=4,-1;=4,-3;=6,-1" points="268,202 268,246 312,202" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-1,-4;=-3,-4;=-1,-6" points="158,268 114,268 158,312" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=4,1;=4,3;=6,1" points="268,158 268,114 312,158" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="172" y="192" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="350" y="168" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="192" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="216.67" y="77.33" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="77.33" y="143.33" font-size="13" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="282.67" y="216.67" font-size="13" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="143.33" y="282.67" font-size="13" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="282.67" y="143.33" font-size="13" text-anchor="middle" dominant-baseline="central">4</text>
</svg>
$c$),
  ($c$FIG-ROT-90-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 322" width="326" height="322" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad y el punto A." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <circle class="punto" data-nombre="A" data-x="4" data-y="2" cx="260" cy="104" r="3.2" fill="currentColor" stroke="none"/>
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
  <text x="270" y="94" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
</svg>
$c$),
  ($c$FIG-ROT-90-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 244" width="326" height="244" role="img" aria-label="Plano cartesiano con el triángulo F y su imagen F' por una rotación con centro en el origen." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="298" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="212" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=1,1;=4,1;=1,3" points="182,130 260,130 182,78" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-1,1;=-1,4;=-3,1" points="130,130 130,52 78,130" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
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
  <text x="208" y="117" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="117" y="104" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F'</text>
</svg>
$c$),
  ($c$FIG-ROT-90-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 244" width="274" height="244" role="img" aria-label="Plano cartesiano con un triángulo; uno de sus vértices está marcado como P." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="182" x2="246" y2="182" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="212" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="252,182 243,177.5 243,186.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="178.5" x2="26" y2="185.5" stroke-width="1.3"/>
  <line x1="52" y1="178.5" x2="52" y2="185.5" stroke-width="1.3"/>
  <line x1="78" y1="178.5" x2="78" y2="185.5" stroke-width="1.3"/>
  <line x1="104" y1="178.5" x2="104" y2="185.5" stroke-width="1.3"/>
  <line x1="130" y1="178.5" x2="130" y2="185.5" stroke-width="1.3"/>
  <line x1="182" y1="178.5" x2="182" y2="185.5" stroke-width="1.3"/>
  <line x1="208" y1="178.5" x2="208" y2="185.5" stroke-width="1.3"/>
  <line x1="234" y1="178.5" x2="234" y2="185.5" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="P=-3,2;=-1,2;=-3,5" points="78,130 130,130 78,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="P" data-x="-3" data-y="2" cx="78" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="" data-x="-1" data-y="2" cx="130" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="" data-x="-3" data-y="5" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="148" y="194" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="170" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="68" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
</svg>
$c$),
  ($c$FIG-ROT-90-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 244" width="326" height="244" role="img" aria-label="El punto P(5, 2) girado 90° en sentido antihorario alrededor del origen llega a P'(−2, 5). Los segmentos punteados desde el origen miden lo mismo y forman un ángulo recto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="286" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="182" x2="298" y2="182" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="212" x2="130" y2="14" stroke-width="1.3"/>
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
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="segmento" x1="130" y1="182" x2="260" y2="130" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="130" y1="182" x2="78" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="P" data-x="5" data-y="2" cx="260" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="-2" data-y="5" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
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
  <text x="273" y="130" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="65" y="52" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
  <text x="143" y="143" font-size="12" text-anchor="middle" dominant-baseline="central">90°</text>
</svg>
$c$),
  ($c$FIG-ROT-CEN-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 244" width="300" height="244" role="img" aria-label="Plano cartesiano con el punto A y el punto C marcados." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="260" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="260" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="260" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="260" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="260" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="272" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="212" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="278,130 269,125.5 269,134.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="156" y1="126.5" x2="156" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="260" y1="126.5" x2="260" y2="133.5" stroke-width="1.3"/>
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="3" data-y="2" cx="208" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="1" data-y="-1" cx="156" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="260" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="123" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="218" y="68" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="166" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-ROT-CEN-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 260" width="352" height="260" role="img" aria-label="Plano con cuadrícula, el punto C, el triángulo T y cuatro triángulos numerados del 1 al 4." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="48" y1="26" x2="48" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="70" y1="26" x2="70" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="92" y1="26" x2="92" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="114" y1="26" x2="114" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="136" y1="26" x2="136" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="158" y1="26" x2="158" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="180" y1="26" x2="180" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="202" y1="26" x2="202" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="224" y1="26" x2="224" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="246" y1="26" x2="246" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="268" y1="26" x2="268" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="290" y1="26" x2="290" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="312" y1="26" x2="312" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="224" x2="312" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="202" x2="312" y2="202" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="180" x2="312" y2="180" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="158" x2="312" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="136" x2="312" y2="136" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="114" x2="312" y2="114" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="92" x2="312" y2="92" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="70" x2="312" y2="70" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="48" x2="312" y2="48" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="312" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="180" x2="324" y2="180" stroke-width="1.3"/>
  <line class="eje-y" x1="158" y1="228" x2="158" y2="14" stroke-width="1.3"/>
  <polygon points="330,180 321,175.5 321,184.5" fill="currentColor" stroke="none"/>
  <polygon points="158,8 153.5,17 162.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="176.5" x2="26" y2="183.5" stroke-width="1.3"/>
  <line x1="48" y1="176.5" x2="48" y2="183.5" stroke-width="1.3"/>
  <line x1="70" y1="176.5" x2="70" y2="183.5" stroke-width="1.3"/>
  <line x1="92" y1="176.5" x2="92" y2="183.5" stroke-width="1.3"/>
  <line x1="114" y1="176.5" x2="114" y2="183.5" stroke-width="1.3"/>
  <line x1="136" y1="176.5" x2="136" y2="183.5" stroke-width="1.3"/>
  <line x1="180" y1="176.5" x2="180" y2="183.5" stroke-width="1.3"/>
  <line x1="202" y1="176.5" x2="202" y2="183.5" stroke-width="1.3"/>
  <line x1="224" y1="176.5" x2="224" y2="183.5" stroke-width="1.3"/>
  <line x1="246" y1="176.5" x2="246" y2="183.5" stroke-width="1.3"/>
  <line x1="268" y1="176.5" x2="268" y2="183.5" stroke-width="1.3"/>
  <line x1="290" y1="176.5" x2="290" y2="183.5" stroke-width="1.3"/>
  <line x1="312" y1="176.5" x2="312" y2="183.5" stroke-width="1.3"/>
  <line x1="154.5" y1="224" x2="161.5" y2="224" stroke-width="1.3"/>
  <line x1="154.5" y1="202" x2="161.5" y2="202" stroke-width="1.3"/>
  <line x1="154.5" y1="158" x2="161.5" y2="158" stroke-width="1.3"/>
  <line x1="154.5" y1="136" x2="161.5" y2="136" stroke-width="1.3"/>
  <line x1="154.5" y1="114" x2="161.5" y2="114" stroke-width="1.3"/>
  <line x1="154.5" y1="92" x2="161.5" y2="92" stroke-width="1.3"/>
  <line x1="154.5" y1="70" x2="161.5" y2="70" stroke-width="1.3"/>
  <line x1="154.5" y1="48" x2="161.5" y2="48" stroke-width="1.3"/>
  <line x1="154.5" y1="26" x2="161.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=4,3;=6,3;=4,5" points="246,114 290,114 246,70" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=2,3;=2,5;=0,3" points="202,114 202,70 158,114" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-3,4;=-3,6;=-5,4" points="92,92 92,48 48,92" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=4,1;=4,-1;=6,1" points="246,158 246,202 290,158" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-1,1;=-1,3;=-3,1" points="136,158 136,114 92,158" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="C" data-x="3" data-y="2" cx="224" cy="136" r="3.2" fill="currentColor" stroke="none"/>
  <text x="150" y="192" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="328" y="168" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="170" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="260.67" y="99.33" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">T</text>
  <text x="187.33" y="99.33" font-size="13" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="77.33" y="77.33" font-size="13" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="260.67" y="172.67" font-size="13" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="121.33" y="143.33" font-size="13" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="234" y="147" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-ROT-CEN-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 378 348" width="378" height="348" role="img" aria-label="Plano cartesiano con un triángulo, uno de cuyos vértices está marcado como A, y el punto C." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="312" y1="26" x2="312" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="338" y1="26" x2="338" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="312" x2="338" y2="312" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="286" x2="338" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="338" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="338" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="338" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="338" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="338" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="338" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="338" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="338" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="338" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="338" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="208" x2="350" y2="208" stroke-width="1.3"/>
  <line class="eje-y" x1="182" y1="316" x2="182" y2="14" stroke-width="1.3"/>
  <polygon points="356,208 347,203.5 347,212.5" fill="currentColor" stroke="none"/>
  <polygon points="182,8 177.5,17 186.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="204.5" x2="26" y2="211.5" stroke-width="1.3"/>
  <line x1="52" y1="204.5" x2="52" y2="211.5" stroke-width="1.3"/>
  <line x1="78" y1="204.5" x2="78" y2="211.5" stroke-width="1.3"/>
  <line x1="104" y1="204.5" x2="104" y2="211.5" stroke-width="1.3"/>
  <line x1="130" y1="204.5" x2="130" y2="211.5" stroke-width="1.3"/>
  <line x1="156" y1="204.5" x2="156" y2="211.5" stroke-width="1.3"/>
  <line x1="208" y1="204.5" x2="208" y2="211.5" stroke-width="1.3"/>
  <line x1="234" y1="204.5" x2="234" y2="211.5" stroke-width="1.3"/>
  <line x1="260" y1="204.5" x2="260" y2="211.5" stroke-width="1.3"/>
  <line x1="286" y1="204.5" x2="286" y2="211.5" stroke-width="1.3"/>
  <line x1="312" y1="204.5" x2="312" y2="211.5" stroke-width="1.3"/>
  <line x1="338" y1="204.5" x2="338" y2="211.5" stroke-width="1.3"/>
  <line x1="178.5" y1="312" x2="185.5" y2="312" stroke-width="1.3"/>
  <line x1="178.5" y1="286" x2="185.5" y2="286" stroke-width="1.3"/>
  <line x1="178.5" y1="260" x2="185.5" y2="260" stroke-width="1.3"/>
  <line x1="178.5" y1="234" x2="185.5" y2="234" stroke-width="1.3"/>
  <line x1="178.5" y1="182" x2="185.5" y2="182" stroke-width="1.3"/>
  <line x1="178.5" y1="156" x2="185.5" y2="156" stroke-width="1.3"/>
  <line x1="178.5" y1="130" x2="185.5" y2="130" stroke-width="1.3"/>
  <line x1="178.5" y1="104" x2="185.5" y2="104" stroke-width="1.3"/>
  <line x1="178.5" y1="78" x2="185.5" y2="78" stroke-width="1.3"/>
  <line x1="178.5" y1="52" x2="185.5" y2="52" stroke-width="1.3"/>
  <line x1="178.5" y1="26" x2="185.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-3,4;=-5,4;=-3,6" points="104,104 52,104 104,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-3" data-y="4" cx="104" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="" data-x="-5" data-y="4" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="" data-x="-3" data-y="6" cx="104" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="1" data-y="1" cx="208" cy="182" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−6</text>
  <text x="52" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="78" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="104" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="130" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="156" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="208" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="234" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="260" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="286" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="312" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="338" y="221" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="175" y="312" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="175" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="175" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="175" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="175" y="182" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="175" y="156" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="175" y="130" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="175" y="104" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="175" y="78" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="175" y="52" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="175" y="26" font-size="11" text-anchor="end" dominant-baseline="central">7</text>
  <text x="174" y="220" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="354" y="196" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="117" y="104" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="218" y="193" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-ROT-CEN-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 218" width="274" height="218" role="img" aria-label="El punto P(2, 1) girado 90° en sentido antihorario alrededor de C(−1, 0) llega a P'(−2, 3). Los segmentos punteados desde C miden lo mismo y forman un ángulo recto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="246" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="186" x2="130" y2="14" stroke-width="1.3"/>
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
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="segmento" x1="104" y1="130" x2="182" y2="104" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="104" y1="130" x2="78" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="C" data-x="-1" data-y="0" cx="104" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P" data-x="2" data-y="1" cx="182" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="-2" data-y="3" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="94" y="120" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="195" y="104" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="65" y="52" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
</svg>
$c$),
  ($c$FIG-SIM-CEN-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 330 326" width="330" height="326" role="img" aria-label="Plano con cuadrícula, el triángulo F y cuatro triángulos numerados del 1 al 4." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="48" y1="26" x2="48" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="70" y1="26" x2="70" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="92" y1="26" x2="92" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="114" y1="26" x2="114" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="136" y1="26" x2="136" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="158" y1="26" x2="158" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="180" y1="26" x2="180" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="202" y1="26" x2="202" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="224" y1="26" x2="224" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="246" y1="26" x2="246" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="268" y1="26" x2="268" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="290" y1="26" x2="290" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="290" x2="290" y2="290" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="268" x2="290" y2="268" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="246" x2="290" y2="246" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="224" x2="290" y2="224" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="202" x2="290" y2="202" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="180" x2="290" y2="180" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="158" x2="290" y2="158" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="136" x2="290" y2="136" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="114" x2="290" y2="114" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="92" x2="290" y2="92" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="70" x2="290" y2="70" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="48" x2="290" y2="48" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="290" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="136" x2="302" y2="136" stroke-width="1.3"/>
  <line class="eje-y" x1="180" y1="294" x2="180" y2="14" stroke-width="1.3"/>
  <polygon points="308,136 299,131.5 299,140.5" fill="currentColor" stroke="none"/>
  <polygon points="180,8 175.5,17 184.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="132.5" x2="26" y2="139.5" stroke-width="1.3"/>
  <line x1="48" y1="132.5" x2="48" y2="139.5" stroke-width="1.3"/>
  <line x1="70" y1="132.5" x2="70" y2="139.5" stroke-width="1.3"/>
  <line x1="92" y1="132.5" x2="92" y2="139.5" stroke-width="1.3"/>
  <line x1="114" y1="132.5" x2="114" y2="139.5" stroke-width="1.3"/>
  <line x1="136" y1="132.5" x2="136" y2="139.5" stroke-width="1.3"/>
  <line x1="158" y1="132.5" x2="158" y2="139.5" stroke-width="1.3"/>
  <line x1="202" y1="132.5" x2="202" y2="139.5" stroke-width="1.3"/>
  <line x1="224" y1="132.5" x2="224" y2="139.5" stroke-width="1.3"/>
  <line x1="246" y1="132.5" x2="246" y2="139.5" stroke-width="1.3"/>
  <line x1="268" y1="132.5" x2="268" y2="139.5" stroke-width="1.3"/>
  <line x1="290" y1="132.5" x2="290" y2="139.5" stroke-width="1.3"/>
  <line x1="176.5" y1="290" x2="183.5" y2="290" stroke-width="1.3"/>
  <line x1="176.5" y1="268" x2="183.5" y2="268" stroke-width="1.3"/>
  <line x1="176.5" y1="246" x2="183.5" y2="246" stroke-width="1.3"/>
  <line x1="176.5" y1="224" x2="183.5" y2="224" stroke-width="1.3"/>
  <line x1="176.5" y1="202" x2="183.5" y2="202" stroke-width="1.3"/>
  <line x1="176.5" y1="180" x2="183.5" y2="180" stroke-width="1.3"/>
  <line x1="176.5" y1="158" x2="183.5" y2="158" stroke-width="1.3"/>
  <line x1="176.5" y1="114" x2="183.5" y2="114" stroke-width="1.3"/>
  <line x1="176.5" y1="92" x2="183.5" y2="92" stroke-width="1.3"/>
  <line x1="176.5" y1="70" x2="183.5" y2="70" stroke-width="1.3"/>
  <line x1="176.5" y1="48" x2="183.5" y2="48" stroke-width="1.3"/>
  <line x1="176.5" y1="26" x2="183.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=1,2;=4,2;=1,4" points="202,92 268,92 202,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-1,-2;=-4,-2;=-1,-4" points="158,180 92,180 158,224" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=1,-2;=4,-2;=1,-4" points="202,180 268,180 202,224" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-2,1;=-2,4;=-4,1" points="136,114 136,48 92,114" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-6,-6;=-3,-6;=-6,-4" points="48,268 114,268 48,224" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="172" y="148" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="306" y="124" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="192" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="224" y="77.33" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="136" y="194.67" font-size="13" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="224" y="194.67" font-size="13" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="121.33" y="92" font-size="13" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="70" y="253.33" font-size="13" text-anchor="middle" dominant-baseline="central">4</text>
</svg>
$c$),
  ($c$FIG-SIM-CEN-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 270" width="300" height="270" role="img" aria-label="Plano cartesiano con el punto A y el punto C marcados." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="26" y1="234" x2="260" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="260" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="260" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="260" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="260" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="260" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="260" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="272" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="238" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="278,156 269,151.5 269,160.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="234" y1="152.5" x2="234" y2="159.5" stroke-width="1.3"/>
  <line x1="260" y1="152.5" x2="260" y2="159.5" stroke-width="1.3"/>
  <line x1="126.5" y1="234" x2="133.5" y2="234" stroke-width="1.3"/>
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="A" data-x="-2" data-y="3" cx="78" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="1" data-y="1" cx="156" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="123" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="123" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="122" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="68" y="68" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="166" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-SIM-CEN-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 218" width="274" height="218" role="img" aria-label="El punto P(3, 3), el centro C(0, 1) y el simétrico P'(−3, −1) están en una misma recta, con C justo al medio entre P y P'." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="246" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="186" x2="130" y2="14" stroke-width="1.3"/>
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
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="segmento" x1="208" y1="52" x2="52" y2="156" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="P" data-x="3" data-y="3" cx="208" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="0" data-y="1" cx="130" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="-3" data-y="-1" cx="52" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="218" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="143" y="104" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="42" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-TRA-145$c$, $c$¿Cuál es la imagen del punto $P(3, 1)$ al rotarlo $90°$ en sentido antihorario alrededor del origen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-146$c$, $c$¿Cuál es la imagen del punto $Q(-2, 5)$ al rotarlo $180°$ alrededor del origen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-147$c$, $c$¿Cuál es la imagen del punto $(4, -3)$ al rotarlo $90°$ en sentido horario alrededor del origen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-148$c$, $c$¿Cuál de las figuras numeradas es la imagen de $F$ al rotarla $90°$ en sentido antihorario alrededor del origen?$c$, 1, $c$propio$c$::text, $c$FIG-ROT-90-01$c$::text),
  ($c$M1-TRA-149$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-150$c$, $c$Un brazo robótico está fijo en el origen y su extremo está en el punto $(2, 4)$. Si el brazo gira $90°$ en sentido antihorario, ¿dónde queda su extremo?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-151$c$, $c$¿Cuál es la imagen del punto $A$ al rotarlo $90°$ en sentido antihorario alrededor del origen?$c$, 1, $c$propio$c$::text, $c$FIG-ROT-90-02$c$::text),
  ($c$M1-TRA-152$c$, $c$Un punto del primer cuadrante se rota $90°$ en sentido antihorario alrededor del origen. ¿Dónde queda su imagen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-153$c$, $c$El triángulo de vértices $A(1, 1)$, $B(3, 1)$ y $C(1, 4)$ se rota $90°$ en sentido antihorario alrededor del origen. ¿Cuáles son los vértices de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-154$c$, $c$Al rotar un punto $P$ en $90°$ en sentido antihorario alrededor del origen, se obtiene $P'(-5, 2)$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-155$c$, $c$¿Cuál es la imagen del punto $(3, -2)$ al rotarlo $270°$ en sentido antihorario alrededor del origen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-156$c$, $c$Considera las siguientes afirmaciones sobre rotaciones de $90°$ en sentido antihorario alrededor del origen:

I. La imagen de $(2, 0)$ es $(0, 2)$.

II. La imagen de $(1, 3)$ es $(3, 1)$.

III. La imagen de $(4, 1)$ es $(1, -4)$.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-157$c$, $c$Una rueda de la fortuna tiene su centro en el origen. Una de sus cabinas está en el punto $(-3, -5)$. Si la rueda gira $90°$ en sentido antihorario, ¿dónde queda esa cabina?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-158$c$, $c$Rotar un punto dos veces seguidas en $90°$, en sentido antihorario y alrededor del origen, es lo mismo que:$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-159$c$, $c$$F'$ es la imagen de $F$ por una rotación con centro en el origen. ¿Cuál es esa rotación?$c$, 2, $c$propio$c$::text, $c$FIG-ROT-90-03$c$::text),
  ($c$M1-TRA-160$c$, $c$Sean $a$ y $b$ números positivos. ¿Cuál es la imagen de $(a, b)$ al rotarlo $90°$ en sentido horario alrededor del origen, y en qué cuadrante queda?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-161$c$, $c$Considera las siguientes afirmaciones sobre rotaciones alrededor del origen:

I. Al rotar $(3, 0)$ en $90°$ en sentido antihorario, se obtiene $(0, 3)$.

II. Al rotar $(1, 2)$ en $180°$, se obtiene $(-1, -2)$.

III. Al rotar $(2, 5)$ en $90°$ en sentido antihorario, se obtiene $(5, 2)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-162$c$, $c$En un juego, el tablero cuadriculado gira $90°$ en sentido horario alrededor del origen. Una pieza estaba en el punto $(-4, 1)$. ¿Dónde queda después del giro?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-163$c$, $c$Al rotar un punto $P$ en $90°$ en sentido antihorario alrededor del origen se obtiene $(3, -6)$. ¿Qué se obtiene si, en cambio, $P$ se rota $180°$ alrededor del origen?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-164$c$, $c$El cuadrado de vértices $(1, 1)$, $(3, 1)$, $(3, 3)$ y $(1, 3)$ se rota $180°$ alrededor del origen. ¿Cuál de los siguientes puntos es un vértice de la imagen?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-165$c$, $c$El triángulo de la figura se rota $90°$ en sentido horario alrededor del origen. ¿Dónde queda el vértice $P$?$c$, 3, $c$propio$c$::text, $c$FIG-ROT-90-04$c$::text),
  ($c$M1-TRA-166$c$, $c$Sea $b$ un número positivo. ¿Cuál es la imagen del punto $(0, b)$ al rotarlo $90°$ en sentido antihorario alrededor del origen?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-167$c$, $c$El centro de las aspas de un molino está en el origen y la punta de un aspa está en $(4, 3)$. El molino gira $270°$ en sentido horario. ¿Dónde queda la punta de esa aspa?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-168$c$, $c$Considera las siguientes afirmaciones sobre rotaciones alrededor del origen:

I. Al rotar $(0, -2)$ en $90°$ en sentido antihorario, se obtiene $(2, 0)$.

II. La regla del giro de $90°$ en sentido antihorario es $(x, y) \to (y, -x)$.

III. La regla del giro de $180°$ es $(x, y) \to (-x, y)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-169$c$, $c$¿Cuál es la imagen del punto $P(4, 1)$ al rotarlo $90°$ en sentido antihorario alrededor del punto $C(1, 1)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-170$c$, $c$¿Cuál es la imagen del punto $P(5, 2)$ al rotarlo $180°$ alrededor del punto $C(2, 1)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-171$c$, $c$¿Cuál es la imagen del punto $A$ al rotarlo $90°$ en sentido antihorario alrededor del punto $C$?$c$, 1, $c$propio$c$::text, $c$FIG-ROT-CEN-01$c$::text),
  ($c$M1-TRA-172$c$, $c$¿Cuál de las siguientes afirmaciones sobre la rotación alrededor de un punto $C$ es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-173$c$, $c$Una puerta giratoria tiene su eje en el punto $(2, 3)$, y el borde de una de sus hojas está en $(5, 3)$. Si la puerta gira $90°$ en sentido antihorario, ¿dónde queda ese borde?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-174$c$, $c$¿Cuál es la imagen del punto $P(0, 3)$ al rotarlo $180°$ alrededor del punto $C(1, 1)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-175$c$, $c$¿Cuál es la imagen del punto $P(-1, 2)$ al rotarlo $90°$ en sentido horario alrededor del punto $C(1, 0)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-176$c$, $c$¿Cuál de las figuras numeradas es la imagen de $T$ al rotarla $90°$ en sentido antihorario alrededor del punto $C$?$c$, 1, $c$propio$c$::text, $c$FIG-ROT-CEN-02$c$::text),
  ($c$M1-TRA-177$c$, $c$El triángulo de vértices $A(2, 1)$, $B(4, 1)$ y $D(2, 3)$ se rota $90°$ en sentido antihorario alrededor del vértice $A$. ¿Cuáles son los vértices de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-178$c$, $c$Al rotar un punto $P$ en $90°$ en sentido antihorario alrededor de $C(1, 2)$ se obtiene $P'(3, 5)$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-179$c$, $c$Considera las siguientes afirmaciones:

I. Al rotar alrededor de un punto $C$, el punto $C$ no se mueve.

II. Al rotar $(3, 1)$ en $180°$ alrededor de $(1, 1)$, se obtiene $(-1, 1)$.

III. Al rotar $(2, 0)$ en $90°$ en sentido antihorario alrededor de $(0, 1)$, se obtiene $(0, 2)$.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-180$c$, $c$Un aspa de un ventilador gira alrededor del punto $(-1, -1)$ y su punta está en $(2, -1)$. Si el aspa gira $180°$, ¿dónde queda la punta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-181$c$, $c$Un giro de $180°$ lleva el punto $A(1, 4)$ al punto $A'(5, 0)$. ¿Cuál es el centro del giro?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-182$c$, $c$¿Cuál es la imagen del punto $P(-2, 4)$ al rotarlo $90°$ en sentido antihorario alrededor del punto $C(-2, 1)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-183$c$, $c$Un reloj está dibujado en un plano cuadriculado con su centro en $(3, 3)$. A las 12:00, la punta del minutero está en $(3, 7)$. ¿Dónde está la punta a las 12:15, cuando el minutero giró $90°$ en sentido horario?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-184$c$, $c$Sea $C(a, b)$ un punto. ¿Cuál es la imagen de $(x, y)$ al rotarlo $180°$ alrededor de $C$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-185$c$, $c$Considera las siguientes afirmaciones:

I. Al rotar un punto alrededor de $C$, su imagen queda a la misma distancia de $C$ que el punto.

II. Rotar un punto alrededor de $C$ da el mismo resultado que rotarlo alrededor del origen.

III. Al rotar $(4, 2)$ en $90°$ en sentido antihorario alrededor de $(1, 2)$, se obtiene $(0, 3)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-186$c$, $c$Una noria tiene su centro en $(0, 10)$ y una cabina está en su punto más bajo, $(0, 2)$. Si la noria gira $90°$ en sentido antihorario, ¿dónde queda esa cabina?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-187$c$, $c$Un giro de $90°$ en sentido antihorario lleva el punto $A(4, 1)$ al punto $A'(1, 4)$. ¿Cuál es el centro del giro?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-188$c$, $c$Sea $C(a, b)$ un punto. ¿Cuál es la imagen de $(a + 2, b)$ al rotarlo $90°$ en sentido antihorario alrededor de $C$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-189$c$, $c$El triángulo de la figura se rota $180°$ alrededor del punto $C$. ¿Dónde queda el vértice $A$?$c$, 3, $c$propio$c$::text, $c$FIG-ROT-CEN-03$c$::text),
  ($c$M1-TRA-190$c$, $c$Considera las siguientes afirmaciones:

I. Al rotar $(3, 1)$ en $90°$ en sentido horario alrededor de $(1, 1)$, se obtiene $(1, -1)$.

II. Al rotar $(3, 1)$ en $90°$ en sentido antihorario alrededor de $(1, 1)$, se obtiene $(-1, 3)$.

III. Al rotar $(3, 1)$ en $180°$ alrededor de $(1, 1)$, se obtiene $(-2, 0)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-191$c$, $c$En el plano de una oficina, un escritorio rectangular se gira $180°$ alrededor de su centro, que está en $(4, -2)$. Una de sus esquinas está en $(6, -1)$. ¿Dónde queda esa esquina?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-192$c$, $c$¿Cuál es la imagen del punto $P(-3, 1)$ al rotarlo $90°$ en sentido antihorario alrededor del punto $C(-1, -1)$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-193$c$, $c$¿Cuál es el simétrico del punto $P(4, -3)$ respecto del origen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-194$c$, $c$¿Cuál es el simétrico del punto $P(5, 1)$ respecto del punto $C(2, 3)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-195$c$, $c$¿Cuál de las figuras numeradas es la simétrica de $F$ respecto del origen?$c$, 1, $c$propio$c$::text, $c$FIG-SIM-CEN-01$c$::text),
  ($c$M1-TRA-196$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-197$c$, $c$¿Cuál es el simétrico del punto $A(-2, -6)$ respecto del origen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-198$c$, $c$Un logotipo tiene simetría central respecto del origen. Si el punto $(3, 5)$ pertenece al logotipo, ¿cuál de los siguientes puntos también le pertenece?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-199$c$, $c$¿Cuál es el simétrico del punto $P(1, 2)$ respecto del punto $C(3, 0)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-200$c$, $c$Los puntos $A(-3, 2)$ y $A'(5, -4)$ son simétricos respecto de un punto. ¿Cuál es ese punto?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-201$c$, $c$El triángulo de vértices $A(1, 1)$, $B(4, 1)$ y $C(1, 3)$ se transforma por simetría central respecto del origen. ¿Cuáles son los vértices de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-202$c$, $c$El punto $P'(-1, 4)$ es el simétrico de un punto $P$ respecto de $C(2, 1)$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-203$c$, $c$Considera las siguientes afirmaciones:

I. El simétrico de $(2, -5)$ respecto del origen es $(-2, 5)$.

II. El simétrico de $(3, 1)$ respecto de $(1, 1)$ es $(-3, -1)$.

III. El simétrico de $(0, 4)$ respecto del origen es $(4, 0)$.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-204$c$, $c$El centro de una cancha rectangular está en el origen. Un jugador está en $(-12, 5)$ y su compañero está en la posición simétrica respecto del centro. ¿Dónde está el compañero?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-205$c$, $c$¿A qué distancia está el punto $(0, 3)$ de su simétrico respecto del origen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-206$c$, $c$El simétrico de un punto $P$ respecto de $C(-1, 2)$ es $P'(3, 2)$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-207$c$, $c$¿Cuál es el simétrico del punto $A$ respecto del punto $C$?$c$, 2, $c$propio$c$::text, $c$FIG-SIM-CEN-02$c$::text),
  ($c$M1-TRA-208$c$, $c$Sean $A(a, b)$ y $C(c, d)$ dos puntos. ¿Cuál es el simétrico de $A$ respecto de $C$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-209$c$, $c$Considera las siguientes afirmaciones sobre la simetría central:

I. Si un triángulo tiene su punta hacia arriba, su simétrico respecto de un punto tiene la punta hacia abajo.

II. El centro de simetría es el punto medio del segmento que une un punto con su simétrico.

III. La simetría central respecto del origen equivale a una rotación de $90°$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-210$c$, $c$Un robot de limpieza está en $(7, -2)$ y debe ir al punto simétrico respecto de su estación de carga, que está en $(3, 1)$. ¿A qué punto debe ir?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-211$c$, $c$El simétrico del punto $(4, a)$ respecto de $(1, 3)$ es el punto $(b, 2)$. ¿Cuál es el valor de $a + b$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-212$c$, $c$El cuadrilátero $ABCD$ tiene simetría central respecto del punto $M(1, 1)$: $C$ es el simétrico de $A$ y $D$ es el simétrico de $B$. Si $A(-2, 3)$ y $B(4, 4)$, ¿cuáles son $C$ y $D$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-213$c$, $c$Un punto $(a, b)$ está en el segundo cuadrante. ¿En qué cuadrante está su simétrico respecto del origen?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-214$c$, $c$Considera las siguientes afirmaciones:

I. El simétrico de $(-1, 4)$ respecto de $(2, 2)$ es $(5, 0)$.

II. El simétrico de $(6, 0)$ respecto de $(3, 3)$ es $(-3, 3)$.

III. El simétrico de $(2, 5)$ respecto del origen es $(2, -5)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-215$c$, $c$Un mosaico tiene simetría central respecto del punto $(-2, 0)$. Una de sus baldosas está en $(1, 4)$. ¿Dónde está la baldosa simétrica?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-216$c$, $c$¿Cuál de las siguientes afirmaciones sobre la simetría respecto de un punto $C$ es correcta?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-TRA-145$c$, $c$A$c$, $c$$(-3, 1)$$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-145$c$, $c$B$c$, $c$$(-1, 3)$$c$, true, null),
  ($c$M1-TRA-145$c$, $c$C$c$, $c$$(1, -3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-145$c$, $c$D$c$, $c$$(1, 3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-146$c$, $c$A$c$, $c$$(2, -5)$$c$, true, null),
  ($c$M1-TRA-146$c$, $c$B$c$, $c$$(-5, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-146$c$, $c$C$c$, $c$$(5, -2)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-146$c$, $c$D$c$, $c$$(2, 5)$$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-147$c$, $c$A$c$, $c$$(-3, 4)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-147$c$, $c$B$c$, $c$$(-4, -3)$$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-147$c$, $c$C$c$, $c$$(-3, -4)$$c$, true, null),
  ($c$M1-TRA-147$c$, $c$D$c$, $c$$(3, 4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-148$c$, $c$A$c$, $c$La figura 2$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-148$c$, $c$B$c$, $c$La figura 3$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-148$c$, $c$C$c$, $c$La figura 4$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-148$c$, $c$D$c$, $c$La figura 1$c$, true, null),
  ($c$M1-TRA-149$c$, $c$A$c$, $c$Al rotar un punto $90°$ alrededor del origen, sus dos coordenadas cambian de signo.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-149$c$, $c$B$c$, $c$Al rotar un punto $180°$ alrededor del origen, sus dos coordenadas cambian de signo.$c$, true, null),
  ($c$M1-TRA-149$c$, $c$C$c$, $c$Al rotar un punto $90°$ alrededor del origen, sus coordenadas se intercambian sin cambiar de signo.$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-149$c$, $c$D$c$, $c$Al rotar el punto $(1, 0)$ en $90°$ antihorario alrededor del origen, queda en $(0, -1)$.$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-150$c$, $c$A$c$, $c$$(4, 2)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-150$c$, $c$B$c$, $c$$(4, -2)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-150$c$, $c$C$c$, $c$$(-2, 4)$$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-150$c$, $c$D$c$, $c$$(-4, 2)$$c$, true, null),
  ($c$M1-TRA-151$c$, $c$A$c$, $c$$(-4, 2)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-151$c$, $c$B$c$, $c$$(2, 4)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-151$c$, $c$C$c$, $c$$(-2, 4)$$c$, true, null),
  ($c$M1-TRA-151$c$, $c$D$c$, $c$$(2, -4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-152$c$, $c$A$c$, $c$En el segundo cuadrante.$c$, true, null),
  ($c$M1-TRA-152$c$, $c$B$c$, $c$En el cuarto cuadrante.$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-152$c$, $c$C$c$, $c$En el tercer cuadrante.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-152$c$, $c$D$c$, $c$En el primer cuadrante.$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-153$c$, $c$A$c$, $c$$A'(-1, -1)$, $B'(-3, -1)$ y $C'(-1, -4)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-153$c$, $c$B$c$, $c$$A'(1, -1)$, $B'(1, -3)$ y $C'(4, -1)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-153$c$, $c$C$c$, $c$$A'(1, 1)$, $B'(1, 3)$ y $C'(4, 1)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-153$c$, $c$D$c$, $c$$A'(-1, 1)$, $B'(-1, 3)$ y $C'(-4, 1)$$c$, true, null),
  ($c$M1-TRA-154$c$, $c$A$c$, $c$$(2, -5)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-154$c$, $c$B$c$, $c$$(5, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-154$c$, $c$C$c$, $c$$(2, 5)$$c$, true, null),
  ($c$M1-TRA-154$c$, $c$D$c$, $c$$(-2, -5)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-155$c$, $c$A$c$, $c$$(2, 3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-155$c$, $c$B$c$, $c$$(-2, -3)$$c$, true, null),
  ($c$M1-TRA-155$c$, $c$C$c$, $c$$(-3, 2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-155$c$, $c$D$c$, $c$$(-2, 3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-156$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-156$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-156$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-156$c$, $c$D$c$, $c$Solo III$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-157$c$, $c$A$c$, $c$$(-5, -3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-157$c$, $c$B$c$, $c$$(3, 5)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-157$c$, $c$C$c$, $c$$(5, -3)$$c$, true, null),
  ($c$M1-TRA-157$c$, $c$D$c$, $c$$(-5, 3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-158$c$, $c$A$c$, $c$Rotarlo $180°$ alrededor del origen.$c$, true, null),
  ($c$M1-TRA-158$c$, $c$B$c$, $c$Rotarlo $360°$ alrededor del origen.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-158$c$, $c$C$c$, $c$Reflejarlo respecto de un eje.$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-158$c$, $c$D$c$, $c$Dejarlo donde estaba.$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-159$c$, $c$A$c$, $c$Un giro de $180°$.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-159$c$, $c$B$c$, $c$Un giro de $90°$ en sentido antihorario.$c$, true, null),
  ($c$M1-TRA-159$c$, $c$C$c$, $c$No es un giro: es un reflejo respecto del eje $y$.$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-159$c$, $c$D$c$, $c$Un giro de $90°$ en sentido horario.$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-160$c$, $c$A$c$, $c$$(b, a)$, en el primer cuadrante.$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-160$c$, $c$B$c$, $c$$(-a, -b)$, en el tercer cuadrante.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-160$c$, $c$C$c$, $c$$(-b, a)$, en el segundo cuadrante.$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-160$c$, $c$D$c$, $c$$(b, -a)$, en el cuarto cuadrante.$c$, true, null),
  ($c$M1-TRA-161$c$, $c$A$c$, $c$I, II y III$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-161$c$, $c$B$c$, $c$Solo I$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-161$c$, $c$C$c$, $c$Solo II$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-161$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-162$c$, $c$A$c$, $c$$(1, 4)$$c$, true, null),
  ($c$M1-TRA-162$c$, $c$B$c$, $c$$(1, -4)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-162$c$, $c$C$c$, $c$$(4, -1)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-162$c$, $c$D$c$, $c$$(-1, -4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-163$c$, $c$A$c$, $c$$(-6, -3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-163$c$, $c$B$c$, $c$$(-3, 6)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-163$c$, $c$C$c$, $c$$(6, 3)$$c$, true, null),
  ($c$M1-TRA-163$c$, $c$D$c$, $c$$(6, -3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-164$c$, $c$A$c$, $c$$(-1, 3)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-164$c$, $c$B$c$, $c$$(-3, -3)$$c$, true, null),
  ($c$M1-TRA-164$c$, $c$C$c$, $c$$(1, 3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-164$c$, $c$D$c$, $c$$(-3, 1)$$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-165$c$, $c$A$c$, $c$$(2, -3)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-165$c$, $c$B$c$, $c$$(-2, -3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-165$c$, $c$C$c$, $c$$(3, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-165$c$, $c$D$c$, $c$$(2, 3)$$c$, true, null),
  ($c$M1-TRA-166$c$, $c$A$c$, $c$$(-b, 0)$$c$, true, null),
  ($c$M1-TRA-166$c$, $c$B$c$, $c$$(0, b)$: el punto no se mueve.$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-166$c$, $c$C$c$, $c$$(0, -b)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-166$c$, $c$D$c$, $c$$(b, 0)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-167$c$, $c$A$c$, $c$$(3, 4)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-167$c$, $c$B$c$, $c$$(3, -4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-167$c$, $c$C$c$, $c$$(-3, 4)$$c$, true, null),
  ($c$M1-TRA-167$c$, $c$D$c$, $c$$(-4, -3)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-168$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-168$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-168$c$, $c$C$c$, $c$Solo III$c$, false, $c$TRA-ROT90-SOLOSIGNO$c$),
  ($c$M1-TRA-168$c$, $c$D$c$, $c$Solo II$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-169$c$, $c$A$c$, $c$$(0, 3)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-169$c$, $c$B$c$, $c$$(-1, 4)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-169$c$, $c$C$c$, $c$$(-1, 2)$$c$, false, $c$TRA-ROTCEN-VUELVEMAL$c$),
  ($c$M1-TRA-169$c$, $c$D$c$, $c$$(1, 4)$$c$, true, null),
  ($c$M1-TRA-170$c$, $c$A$c$, $c$$(-5, -2)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-170$c$, $c$B$c$, $c$$(-3, -1)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-170$c$, $c$C$c$, $c$$(-1, 0)$$c$, true, null),
  ($c$M1-TRA-170$c$, $c$D$c$, $c$$(1, 4)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-171$c$, $c$A$c$, $c$$(-2, 3)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-171$c$, $c$B$c$, $c$$(-2, 1)$$c$, true, null),
  ($c$M1-TRA-171$c$, $c$C$c$, $c$$(-3, 2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-171$c$, $c$D$c$, $c$$(4, -3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-172$c$, $c$A$c$, $c$Al rotar un punto alrededor de $C$, su distancia a $C$ no cambia.$c$, true, null),
  ($c$M1-TRA-172$c$, $c$B$c$, $c$Al rotar alrededor de $C$, se puede usar la misma regla que alrededor del origen.$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-172$c$, $c$C$c$, $c$Para rotar alrededor de $C$, basta restar $C$ al punto y aplicar la regla del origen.$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-172$c$, $c$D$c$, $c$Para rotar alrededor de $C$, se resta $C$, se aplica la regla del origen y se vuelve a restar $C$.$c$, false, $c$TRA-ROTCEN-VUELVEMAL$c$),
  ($c$M1-TRA-173$c$, $c$A$c$, $c$$(-3, 5)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-173$c$, $c$B$c$, $c$$(0, 3)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-173$c$, $c$C$c$, $c$$(2, 6)$$c$, true, null),
  ($c$M1-TRA-173$c$, $c$D$c$, $c$$(-2, 0)$$c$, false, $c$TRA-ROTCEN-VUELVEMAL$c$),
  ($c$M1-TRA-174$c$, $c$A$c$, $c$$(-1, 0)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-174$c$, $c$B$c$, $c$$(2, -1)$$c$, true, null),
  ($c$M1-TRA-174$c$, $c$C$c$, $c$$(1, -2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-174$c$, $c$D$c$, $c$$(0, -3)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-175$c$, $c$A$c$, $c$$(3, 2)$$c$, true, null),
  ($c$M1-TRA-175$c$, $c$B$c$, $c$$(2, 1)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-175$c$, $c$C$c$, $c$$(2, 2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-175$c$, $c$D$c$, $c$$(-1, -2)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-176$c$, $c$A$c$, $c$La figura 2$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-176$c$, $c$B$c$, $c$La figura 4$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-176$c$, $c$C$c$, $c$La figura 3$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-176$c$, $c$D$c$, $c$La figura 1$c$, true, null),
  ($c$M1-TRA-177$c$, $c$A$c$, $c$$(2, 1)$, $(2, 3)$ y $(0, 1)$$c$, true, null),
  ($c$M1-TRA-177$c$, $c$B$c$, $c$$(0, 0)$, $(0, 2)$ y $(-2, 0)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-177$c$, $c$C$c$, $c$$(-1, 2)$, $(-1, 4)$ y $(-3, 2)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-177$c$, $c$D$c$, $c$$(2, 1)$, $(2, -1)$ y $(4, 1)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-178$c$, $c$A$c$, $c$$(5, -3)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-178$c$, $c$B$c$, $c$$(3, -2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-178$c$, $c$C$c$, $c$$(-2, 4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-178$c$, $c$D$c$, $c$$(4, 0)$$c$, true, null),
  ($c$M1-TRA-179$c$, $c$A$c$, $c$Solo III$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-179$c$, $c$B$c$, $c$Solo I$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-179$c$, $c$C$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-179$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-180$c$, $c$A$c$, $c$$(-3, 0)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-180$c$, $c$B$c$, $c$$(-4, -1)$$c$, true, null),
  ($c$M1-TRA-180$c$, $c$C$c$, $c$$(-2, 1)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-180$c$, $c$D$c$, $c$$(-1, 2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-181$c$, $c$A$c$, $c$$(3, 2)$$c$, true, null),
  ($c$M1-TRA-181$c$, $c$B$c$, $c$El origen$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-181$c$, $c$C$c$, $c$$(6, 4)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-181$c$, $c$D$c$, $c$$(4, -4)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-182$c$, $c$A$c$, $c$$(-4, -2)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-182$c$, $c$B$c$, $c$$(1, 1)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-182$c$, $c$C$c$, $c$$(-3, 0)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-182$c$, $c$D$c$, $c$$(-5, 1)$$c$, true, null),
  ($c$M1-TRA-183$c$, $c$A$c$, $c$$(7, -3)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-183$c$, $c$B$c$, $c$$(4, 0)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-183$c$, $c$C$c$, $c$$(7, 3)$$c$, true, null),
  ($c$M1-TRA-183$c$, $c$D$c$, $c$$(-1, 3)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-184$c$, $c$A$c$, $c$$(-x,\ -y)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-184$c$, $c$B$c$, $c$$(2a - x,\ 2b - y)$$c$, true, null),
  ($c$M1-TRA-184$c$, $c$C$c$, $c$$(a - x,\ b - y)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-184$c$, $c$D$c$, $c$$(a - y + b,\ b + x - a)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-185$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-185$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-185$c$, $c$C$c$, $c$I, II y III$c$, false, $c$TRA-ROTCEN-VUELVEMAL$c$),
  ($c$M1-TRA-185$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-186$c$, $c$A$c$, $c$$(8, 0)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-186$c$, $c$B$c$, $c$$(-8, 10)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-186$c$, $c$C$c$, $c$$(8, 10)$$c$, true, null),
  ($c$M1-TRA-186$c$, $c$D$c$, $c$$(-2, 0)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-187$c$, $c$A$c$, $c$$(4, 4)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-187$c$, $c$B$c$, $c$$(1, 1)$$c$, true, null),
  ($c$M1-TRA-187$c$, $c$C$c$, $c$$(0, 0)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-187$c$, $c$D$c$, $c$$\left(\frac{5}{2}, \frac{5}{2}\right)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-188$c$, $c$A$c$, $c$$(a,\ b - 2)$$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-188$c$, $c$B$c$, $c$$(-b,\ a + 2)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-188$c$, $c$C$c$, $c$$(0,\ 2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-188$c$, $c$D$c$, $c$$(a,\ b + 2)$$c$, true, null),
  ($c$M1-TRA-189$c$, $c$A$c$, $c$$(-2, -3)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-189$c$, $c$B$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-189$c$, $c$C$c$, $c$$(3, -4)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-189$c$, $c$D$c$, $c$$(4, -3)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-190$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-190$c$, $c$B$c$, $c$Solo III$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-190$c$, $c$C$c$, $c$Solo II$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-190$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$TRA-ROT90-SENTIDO$c$),
  ($c$M1-TRA-191$c$, $c$A$c$, $c$$(-6, 1)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-191$c$, $c$B$c$, $c$$(-2, -1)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-191$c$, $c$C$c$, $c$$(3, 0)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-191$c$, $c$D$c$, $c$$(2, -3)$$c$, true, null),
  ($c$M1-TRA-192$c$, $c$A$c$, $c$$(-1, -1)$$c$, false, $c$TRA-ROTCEN-VUELVEMAL$c$),
  ($c$M1-TRA-192$c$, $c$B$c$, $c$$(-2, -2)$$c$, false, $c$TRA-ROTCEN-NOVUELVE$c$),
  ($c$M1-TRA-192$c$, $c$C$c$, $c$$(-3, -3)$$c$, true, null),
  ($c$M1-TRA-192$c$, $c$D$c$, $c$$(-1, -3)$$c$, false, $c$TRA-ROTCEN-ORIGEN$c$),
  ($c$M1-TRA-193$c$, $c$A$c$, $c$$(4, 3)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-193$c$, $c$B$c$, $c$$(-4, 3)$$c$, true, null),
  ($c$M1-TRA-193$c$, $c$C$c$, $c$$(3, 4)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-193$c$, $c$D$c$, $c$$(-3, 4)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-194$c$, $c$A$c$, $c$$(-3, 2)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-194$c$, $c$B$c$, $c$$(4, 6)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-194$c$, $c$C$c$, $c$$(-1, 5)$$c$, true, null),
  ($c$M1-TRA-194$c$, $c$D$c$, $c$$(-5, -1)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-195$c$, $c$A$c$, $c$La figura 1$c$, true, null),
  ($c$M1-TRA-195$c$, $c$B$c$, $c$La figura 4$c$, false, $c$TRA-SIMCEN-SINGIRAR$c$),
  ($c$M1-TRA-195$c$, $c$C$c$, $c$La figura 3$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-195$c$, $c$D$c$, $c$La figura 2$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-196$c$, $c$A$c$, $c$La simetría respecto del origen equivale a reflejar en el eje $x$.$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-196$c$, $c$B$c$, $c$La simetría respecto del origen lleva la figura al cuadrante opuesto sin girarla.$c$, false, $c$TRA-SIMCEN-SINGIRAR$c$),
  ($c$M1-TRA-196$c$, $c$C$c$, $c$La simetría respecto del origen equivale a una rotación de $90°$.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-196$c$, $c$D$c$, $c$La simetría respecto del origen equivale a una rotación de $180°$ alrededor del origen.$c$, true, null),
  ($c$M1-TRA-197$c$, $c$A$c$, $c$$(-2, 6)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-197$c$, $c$B$c$, $c$$(6, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-197$c$, $c$C$c$, $c$$(-6, -2)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-197$c$, $c$D$c$, $c$$(2, 6)$$c$, true, null),
  ($c$M1-TRA-198$c$, $c$A$c$, $c$$(-5, 3)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-198$c$, $c$B$c$, $c$$(-3, -5)$$c$, true, null),
  ($c$M1-TRA-198$c$, $c$C$c$, $c$$(5, 3)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-198$c$, $c$D$c$, $c$$(-3, 5)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-199$c$, $c$A$c$, $c$$(2, -2)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-199$c$, $c$B$c$, $c$$(1, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-199$c$, $c$C$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-199$c$, $c$D$c$, $c$$(-1, -2)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-200$c$, $c$A$c$, $c$$(1, -1)$$c$, true, null),
  ($c$M1-TRA-200$c$, $c$B$c$, $c$$(8, -6)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-200$c$, $c$C$c$, $c$El origen$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-200$c$, $c$D$c$, $c$No hay tal punto, porque $A$ y $A'$ no comparten ninguna coordenada.$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-201$c$, $c$A$c$, $c$$A'(-4, -3)$, $B'(-1, -3)$ y $C'(-4, -1)$$c$, false, $c$TRA-SIMCEN-SINGIRAR$c$),
  ($c$M1-TRA-201$c$, $c$B$c$, $c$$A'(-1, 1)$, $B'(-4, 1)$ y $C'(-1, 3)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-201$c$, $c$C$c$, $c$$A'(-1, -1)$, $B'(-4, -1)$ y $C'(-1, -3)$$c$, true, null),
  ($c$M1-TRA-201$c$, $c$D$c$, $c$$A'(-1, 1)$, $B'(-1, 4)$ y $C'(-3, 1)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-202$c$, $c$A$c$, $c$$(3, -3)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-202$c$, $c$B$c$, $c$$(1, -4)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-202$c$, $c$C$c$, $c$$(-1, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-202$c$, $c$D$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-203$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-203$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-203$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-203$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-204$c$, $c$A$c$, $c$$(12, -5)$$c$, true, null),
  ($c$M1-TRA-204$c$, $c$B$c$, $c$$(12, 5)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-204$c$, $c$C$c$, $c$$(-5, -12)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-204$c$, $c$D$c$, $c$$(5, -12)$$c$, false, $c$TRA-ROT90-SOLOCAMBIA$c$),
  ($c$M1-TRA-205$c$, $c$A$c$, $c$$0$ unidades$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-205$c$, $c$B$c$, $c$$6$ unidades$c$, true, null),
  ($c$M1-TRA-205$c$, $c$C$c$, $c$$3$ unidades$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-205$c$, $c$D$c$, $c$$7$ unidades$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-206$c$, $c$A$c$, $c$$(-5, 2)$$c$, true, null),
  ($c$M1-TRA-206$c$, $c$B$c$, $c$$(-1, 6)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-206$c$, $c$C$c$, $c$$(-3, -2)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-206$c$, $c$D$c$, $c$$(-4, 0)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-207$c$, $c$A$c$, $c$$(2, -3)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-207$c$, $c$B$c$, $c$$(-1, -2)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-207$c$, $c$C$c$, $c$$(3, -2)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-207$c$, $c$D$c$, $c$$(4, -1)$$c$, true, null),
  ($c$M1-TRA-208$c$, $c$A$c$, $c$$(2c - a,\ b)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-208$c$, $c$B$c$, $c$$(c - a,\ d - b)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-208$c$, $c$C$c$, $c$$(2c - a,\ 2d - b)$$c$, true, null),
  ($c$M1-TRA-208$c$, $c$D$c$, $c$$(-a,\ -b)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-209$c$, $c$A$c$, $c$I, II y III$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-209$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-209$c$, $c$C$c$, $c$Solo I$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-209$c$, $c$D$c$, $c$Solo II$c$, false, $c$TRA-SIMCEN-SINGIRAR$c$),
  ($c$M1-TRA-210$c$, $c$A$c$, $c$$(-1, 4)$$c$, true, null),
  ($c$M1-TRA-210$c$, $c$B$c$, $c$$(6, 5)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-210$c$, $c$C$c$, $c$$(-7, 2)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-210$c$, $c$D$c$, $c$$(-4, 3)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-211$c$, $c$A$c$, $c$$0$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-211$c$, $c$B$c$, $c$$-6$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-211$c$, $c$C$c$, $c$$-2$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-211$c$, $c$D$c$, $c$$2$$c$, true, null),
  ($c$M1-TRA-212$c$, $c$A$c$, $c$$C(3, -2)$ y $D(-3, -3)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-212$c$, $c$B$c$, $c$$C(2, -3)$ y $D(-4, -4)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-212$c$, $c$C$c$, $c$$C(4, -1)$ y $D(-2, -2)$$c$, true, null),
  ($c$M1-TRA-212$c$, $c$D$c$, $c$$C(4, 3)$ y $D(-2, 4)$$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-213$c$, $c$A$c$, $c$En el cuarto cuadrante.$c$, true, null),
  ($c$M1-TRA-213$c$, $c$B$c$, $c$En el primer cuadrante.$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-213$c$, $c$C$c$, $c$En el segundo cuadrante.$c$, false, $c$PLA-COORD-CUADNUM$c$),
  ($c$M1-TRA-213$c$, $c$D$c$, $c$En el tercer cuadrante.$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-214$c$, $c$A$c$, $c$Solo II$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-214$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-214$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-214$c$, $c$D$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-215$c$, $c$A$c$, $c$$(-1, -4)$$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-215$c$, $c$B$c$, $c$$(-5, -4)$$c$, true, null),
  ($c$M1-TRA-215$c$, $c$C$c$, $c$$(-6, 3)$$c$, false, $c$TRA-ROT90-ANGULO$c$),
  ($c$M1-TRA-215$c$, $c$D$c$, $c$$(-3, -4)$$c$, false, $c$TRA-SIMCEN-RESTA$c$),
  ($c$M1-TRA-216$c$, $c$A$c$, $c$Equivale a reflejar respecto de la recta vertical que pasa por $C$.$c$, false, $c$TRA-SIMCEN-EJE$c$),
  ($c$M1-TRA-216$c$, $c$B$c$, $c$Equivale a rotar $180°$ alrededor del origen.$c$, false, $c$TRA-SIMCEN-ORIGEN$c$),
  ($c$M1-TRA-216$c$, $c$C$c$, $c$Equivale a rotar $180°$ alrededor de $C$.$c$, true, null),
  ($c$M1-TRA-216$c$, $c$D$c$, $c$Equivale a rotar $90°$ alrededor de $C$.$c$, false, $c$TRA-ROT90-ANGULO$c$)
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
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-145$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-146$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-147$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-148$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-149$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-150$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-151$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-152$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-153$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-154$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-155$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-156$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-157$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-158$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-159$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-160$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-161$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-162$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-163$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-164$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-165$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-166$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-167$c$),
  ($c$GEO-TRA-ROT-90$c$, $c$M1-TRA-168$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-169$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-170$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-171$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-172$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-173$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-174$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-175$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-176$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-177$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-178$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-179$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-180$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-181$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-182$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-183$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-184$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-185$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-186$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-187$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-188$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-189$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-190$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-191$c$),
  ($c$GEO-TRA-ROT-CEN$c$, $c$M1-TRA-192$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-193$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-194$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-195$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-196$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-197$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-198$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-199$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-200$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-201$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-202$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-203$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-204$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-205$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-206$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-207$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-208$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-209$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-210$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-211$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-212$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-213$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-214$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-215$c$),
  ($c$GEO-TRA-SIM-CEN$c$, $c$M1-TRA-216$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$TRA-ROT90-SENTIDO$c$, $c$Antihorario lleva el primer cuadrante al segundo$c$, $c$Giraste hacia el lado contrario. Por ejemplo, giraste $(6, 1)$ en $90°$
en sentido antihorario y escribiste $(1, -6)$.

**$90°$ antihorario: $(x, y) \to (-y, x)$. $90°$ horario:
$(x, y) \to (y, -x)$.**

$$(6, 1) \to (-1, 6)$$

$(6, 1)$ está en el primer cuadrante. Girando al contrario de los
punteros del reloj, sube y pasa al segundo cuadrante: la primera
coordenada queda negativa. $(1, -6)$ está en el cuarto: es el giro
horario.

Un control rápido: antes de calcular, decide a qué cuadrante tiene
que llegar el punto. Antihorario avanza I → II → III → IV.$c$),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$TRA-ROT90-SOLOCAMBIA$c$, $c$En un giro de 90° también cambia un signo$c$, $c$Intercambiaste las coordenadas sin cambiar ningún signo. Por ejemplo,
giraste $(6, 1)$ en $90°$ antihorario y escribiste $(1, 6)$.

**Un giro de $90°$ intercambia las coordenadas y cambia el signo de
una de ellas.**

$$(6, 1) \to (-1, 6)$$

Solo intercambiar, $(x, y) \to (y, x)$, es reflejar en la recta
$y = x$: el punto $(1, 6)$ sigue en el primer cuadrante, y un giro de
$90°$ siempre cambia de cuadrante a los puntos que no están sobre un
eje.

Un control rápido: si tu imagen quedó en el mismo cuadrante que el
punto, no giraste $90°$.$c$),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$TRA-ROT90-SOLOSIGNO$c$, $c$Un giro no es una reflexión$c$, $c$Cambiaste un signo sin intercambiar las coordenadas. Por ejemplo,
giraste $(6, 1)$ en $90°$ antihorario y escribiste $(-6, 1)$.

**En un giro de $90°$ las coordenadas se intercambian y una cambia de
signo. En uno de $180°$ cambian las dos de signo.**

$$90°\ \text{antihorario}: (6, 1) \to (-1, 6) \qquad 180°: (6, 1) \to (-6, -1)$$

Cambiar un solo signo es reflejar en un eje: la figura queda dada
vuelta como en un espejo, y un giro nunca hace eso.

Un control rápido: en un giro la distancia al origen no cambia, pero
el punto rota; si tu imagen es el reflejo en un eje, revisa la regla.$c$),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$TRA-ROT90-ANGULO$c$, $c$90° intercambia; 180° solo cambia signos$c$, $c$Usaste la regla de un ángulo para otro. Por ejemplo, giraste $(6, 1)$
en $90°$ y escribiste $(-6, -1)$, que es el giro de $180°$.

**$90°$: se intercambian las coordenadas y una cambia de signo.
$180°$: no se intercambian y cambian las dos de signo.**

$$90°\ \text{antihorario}: (6, 1) \to (-1, 6) \qquad 180°: (6, 1) \to (-6, -1)$$

Un giro de $180°$ son dos giros de $90°$ seguidos:
$(6, 1) \to (-1, 6) \to (-6, -1)$. Con los cuadrantes: $90°$ avanza uno;
$180°$ lleva al cuadrante opuesto.

Un control rápido: cuenta cuántos cuadrantes avanzó tu imagen. Tiene
que ser uno para $90°$ y dos para $180°$.$c$),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$TRA-ROTCEN-ORIGEN$c$, $c$Gira alrededor del centro que te dan$c$, $c$Giraste respecto del origen aunque el centro era otro punto. Por
ejemplo, para girar $(6, 2)$ en $90°$ antihorario alrededor de
$C(3, 2)$ escribiste $(-2, 6)$.

**Para girar alrededor de $C$: resta $C$, gira con la regla del
origen y vuelve a sumar $C$.**

$$(6, 2) - (3, 2) = (3, 0) \to (0, 3) \to (0, 3) + (3, 2) = (3, 5)$$

La regla $(x, y) \to (-y, x)$ solo sirve cuando el centro es el
origen. Con otro centro, primero hay que mirar el punto «desde» $C$.

Un control rápido: el punto y su imagen tienen que estar a la misma
distancia de $C$. $(6, 2)$ está a $3$ de $C$; $(3, 5)$ también.$c$),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$TRA-ROTCEN-NOVUELVE$c$, $c$Después de girar, vuelve a sumar el centro$c$, $c$Restaste el centro y giraste, pero te faltó el último paso. Por
ejemplo, para girar $(6, 2)$ en $90°$ antihorario alrededor de
$C(3, 2)$ escribiste $(0, 3)$.

**Girar respecto de $C$ son tres pasos: restar $C$, girar y sumar
$C$.**

$(0, 3)$ es la posición de la imagen **vista desde $C$**. Para saber
dónde queda en el plano, se le suma $C$:

$$(0, 3) + (3, 2) = (3, 5)$$

Un control rápido: el centro no se mueve. Si tu imagen quedó cerca del
origen y el centro está lejos, te faltó sumar $C$.$c$),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$TRA-ROTCEN-VUELVEMAL$c$, $c$Al volver se suma el centro$c$, $c$Restaste el centro dos veces: antes de girar y otra vez al final. Por
ejemplo, para $(6, 2)$ alrededor de $C(3, 2)$ llegaste a $(0, 3)$ y
después hiciste $(0, 3) - (3, 2) = (-3, 1)$.

**El primer paso resta $C$; el último paso lo suma. Así se deshace el
cambio de lugar del comienzo.**

$$(0, 3) + (3, 2) = (3, 5)$$

Es como una traslación de ida y vuelta: primero llevas todo para que
$C$ quede en el origen, giras, y después lo devuelves a su lugar.

Un control rápido: prueba con el propio $C$. Restar $C$ da $(0, 0)$,
girarlo da $(0, 0)$, y al final tiene que volver a $C$.$c$),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$TRA-SIMCEN-EJE$c$, $c$En la simetría central cambian las dos coordenadas$c$, $c$Reflejaste en un eje en vez de hacer la simetría respecto de un
punto. Por ejemplo, para el simétrico de $(6, -2)$ respecto del origen
escribiste $(6, 2)$.

**El simétrico respecto del origen es $(-x, -y)$: cambian las dos
coordenadas. Respecto de $C$, es $2C - P$.**

$$(6, -2) \to (-6, 2)$$

El punto pasa al otro lado del origen, en la misma recta: queda en el
cuadrante opuesto. Cambiar una sola coordenada lo deja al otro lado de
un eje, que es otra transformación.

Un control rápido: el centro tiene que quedar justo al medio entre el
punto y su simétrico. El punto medio entre $(6, -2)$ y $(6, 2)$ es
$(6, 0)$, no el origen.$c$),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$TRA-SIMCEN-ORIGEN$c$, $c$Usa el centro que te dan$c$, $c$Hiciste la simetría respecto del origen aunque el centro era otro
punto. Por ejemplo, para el simétrico de $(6, -2)$ respecto de
$C(1, 1)$ escribiste $(-6, 2)$.

**Respecto de un centro $C$, el simétrico es $P' = 2C - P$.**

$$2 \cdot (1, 1) - (6, -2) = (2 - 6,\ 2 + 2) = (-4, 4)$$

Cambiar los signos solo funciona cuando el centro es $(0, 0)$, porque
ahí $2C$ vale cero.

Un control rápido: calcula el punto medio entre $P$ y tu respuesta.
Tiene que dar $C$: entre $(6, -2)$ y $(-4, 4)$ da $(1, 1)$.$c$),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$TRA-SIMCEN-RESTA$c$, $c$El centro queda al medio, no en un extremo$c$, $c$Calculaste $C - P$ y lo diste como el simétrico. Por ejemplo, para el
simétrico de $(6, -2)$ respecto de $C(1, 1)$ escribiste $(-5, 3)$.

**El simétrico está al otro lado de $C$, a la misma distancia: hay que
ir de $P$ a $C$ y seguir la misma cantidad. Eso es $P' = 2C - P$.**

De $(6, -2)$ a $(1, 1)$ se avanza $(-5, 3)$. Avanzando lo mismo desde
$C$:

$$(1, 1) + (-5, 3) = (-4, 4)$$

$C - P$ es solo el desplazamiento; falta sumarlo desde $C$.

Un control rápido: el punto medio entre $P$ y su simétrico es $C$. Si
no lo es, la respuesta está mal.$c$),
  ($c$REM-TRA-SIMCEN-SINGIRAR$c$, $c$TRA-SIMCEN-SINGIRAR$c$, $c$La simetría central deja la figura de cabeza$c$, $c$Llevaste la figura al lado opuesto sin girarla, como si la hubieras
trasladado.

**La simetría central es un giro de $180°$: cada punto pasa al otro
lado del centro, así que la figura queda de cabeza.**

Si un triángulo tiene la punta hacia arriba y el ángulo recto a la
izquierda, su simétrico respecto del origen tiene la punta hacia abajo
y el ángulo recto a la derecha.

Una figura que aparece en el cuadrante opuesto mirando hacia el mismo
lado fue trasladada, no reflejada respecto de un punto.

Un control rápido: calcula el simétrico de cada vértice con $(-x, -y)$
en vez de mover la figura entera.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-TRA-ROT90-SENTIDO$c$, $c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$REM-TRA-ROT90-ANGULO$c$, $c$REM-TRA-ROTCEN-ORIGEN$c$, $c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$REM-TRA-SIMCEN-EJE$c$, $c$REM-TRA-SIMCEN-ORIGEN$c$, $c$REM-TRA-SIMCEN-RESTA$c$, $c$REM-TRA-SIMCEN-SINGIRAR$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-150$c$, 1::smallint),
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-151$c$, 2::smallint),
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-159$c$, 3::smallint),
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-160$c$, 4::smallint),
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-167$c$, 5::smallint),
  ($c$REM-TRA-ROT90-SENTIDO$c$, $c$M1-TRA-168$c$, 6::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-149$c$, 1::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-150$c$, 2::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-157$c$, 3::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-158$c$, 4::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-164$c$, 5::smallint),
  ($c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$M1-TRA-165$c$, 6::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-146$c$, 1::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-147$c$, 2::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-158$c$, 3::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-159$c$, 4::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-164$c$, 5::smallint),
  ($c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$M1-TRA-166$c$, 6::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-160$c$, 1::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-179$c$, 2::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-187$c$, 3::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-189$c$, 4::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-193$c$, 5::smallint),
  ($c$REM-TRA-ROT90-ANGULO$c$, $c$M1-TRA-194$c$, 6::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-172$c$, 1::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-173$c$, 2::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-180$c$, 3::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-181$c$, 4::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-188$c$, 5::smallint),
  ($c$REM-TRA-ROTCEN-ORIGEN$c$, $c$M1-TRA-189$c$, 6::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-172$c$, 1::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-173$c$, 2::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-180$c$, 3::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-182$c$, 4::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-189$c$, 5::smallint),
  ($c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$M1-TRA-190$c$, 6::smallint),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$M1-TRA-169$c$, 1::smallint),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$M1-TRA-172$c$, 2::smallint),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$M1-TRA-173$c$, 3::smallint),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$M1-TRA-185$c$, 4::smallint),
  ($c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$M1-TRA-192$c$, 5::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-196$c$, 1::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-197$c$, 2::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-204$c$, 3::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-205$c$, 4::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-213$c$, 5::smallint),
  ($c$REM-TRA-SIMCEN-EJE$c$, $c$M1-TRA-214$c$, 6::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-199$c$, 1::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-200$c$, 2::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-206$c$, 3::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-207$c$, 4::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-212$c$, 5::smallint),
  ($c$REM-TRA-SIMCEN-ORIGEN$c$, $c$M1-TRA-214$c$, 6::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-199$c$, 1::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-200$c$, 2::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-206$c$, 3::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-207$c$, 4::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-211$c$, 5::smallint),
  ($c$REM-TRA-SIMCEN-RESTA$c$, $c$M1-TRA-212$c$, 6::smallint),
  ($c$REM-TRA-SIMCEN-SINGIRAR$c$, $c$M1-TRA-195$c$, 1::smallint),
  ($c$REM-TRA-SIMCEN-SINGIRAR$c$, $c$M1-TRA-196$c$, 2::smallint),
  ($c$REM-TRA-SIMCEN-SINGIRAR$c$, $c$M1-TRA-201$c$, 3::smallint),
  ($c$REM-TRA-SIMCEN-SINGIRAR$c$, $c$M1-TRA-209$c$, 4::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-GEO-TRA-04$c$, $c$GEO-TRA$c$, $c$Rotaciones y simetría central$c$, $c$Rotar es girar una figura alrededor de un punto fijo sin deformarla. Con
giros de $90°$ las coordenadas se transforman con reglas simples, y la
simetría central resulta ser un giro de $180°$.

## Rotación en múltiplos de 90°

### Girar alrededor del origen

Al rotar un punto alrededor del origen, el punto se mueve sobre una
circunferencia: su distancia al origen no cambia. El **sentido
antihorario** es el contrario a los punteros del reloj.

![](fig:FIG-ROT-90-05)

$P(5, 2)$ girado $90°$ en sentido antihorario llega a $P'(-2, 5)$.

### Las tres reglas

**$90°$ antihorario: $(x, y) \to (-y,\ x)$.**

**$90°$ horario (o $270°$ antihorario): $(x, y) \to (y,\ -x)$.**

**$180°$ (en cualquier sentido): $(x, y) \to (-x,\ -y)$.**

En un giro de $90°$ las coordenadas **se intercambian y una cambia de
signo**. Si solo las intercambias, reflejaste en la recta $y = x$; si
solo cambias un signo, reflejaste en un eje. Ninguna de las dos es un
giro.

El error más común es girar hacia el lado contrario. Un control rápido
con los cuadrantes: un giro de $90°$ antihorario lleva el primer
cuadrante al segundo, el segundo al tercero, y así. Por ejemplo,
$(-6, 1)$ girado $90°$ en sentido horario queda en $(1, 6)$: pasó del
segundo cuadrante al primero, que es el giro al revés.

Y $180°$ no es $90°$: con $180°$ cambian los dos signos y las
coordenadas no se intercambian. $(-7, 3) \to (7, -3)$.

### Figuras

Para girar una figura se gira cada vértice con la misma regla. La imagen
tiene la misma forma, el mismo tamaño y la misma orientación de su
recorrido: un giro no la da vuelta como un espejo.

## Rotación respecto de un punto

### Tres pasos

Si el centro de giro es un punto $C$ distinto del origen, se hace así:

1. **Resta $C$** al punto: obtienes su posición vista desde $C$.
2. **Gira** ese vector con la regla del origen.
3. **Suma $C$** al resultado.

![](fig:FIG-ROT-CEN-04)

Para girar $P(2, 1)$ en $90°$ antihorario alrededor de $C(-1, 0)$:

$$P - C = (3, 1) \quad\to\quad (-1, 3) \quad\to\quad (-1, 3) + (-1, 0) = (-2, 3)$$

El paso que más se olvida es el tercero. Sin él, el resultado queda
girado alrededor del origen, lejos de $C$.

Un control rápido: el centro $C$ no se mueve, y el punto y su imagen
tienen que quedar a la misma distancia de $C$.

## Simetría central

### Un giro de 180°

El simétrico de $P$ respecto de un punto $C$ es el punto $P'$ que queda
al otro lado de $C$, en la misma recta y a la misma distancia. **Es lo
mismo que girar $P$ en $180°$ alrededor de $C$.**

![](fig:FIG-SIM-CEN-03)

**Respecto del origen: $(x, y) \to (-x, -y)$. Respecto de $C$:
$P' = 2C - P$.**

En la figura, $2 \cdot (0, 1) - (3, 3) = (-3, -1)$.

No es una reflexión en un eje: en la simetría central cambian **las
dos** coordenadas (respecto del origen). Y como es un giro, la figura
queda «de cabeza»: lo que apuntaba hacia arriba apunta hacia abajo.

### El centro está al medio

$C$ es el **punto medio** entre $P$ y $P'$. Si conoces un punto y su
simétrico, el centro es el promedio de sus coordenadas. Por ejemplo,
para $(-4, 7)$ y $(2, -1)$ el centro es $(-1, 3)$.$c$, 4::smallint)
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
  ($c$LES-GEO-TRA-04$c$, $c$GEO-TRA-ROT-90$c$, 1::smallint, $c$rotacion-en-multiplos-de-90$c$),
  ($c$LES-GEO-TRA-04$c$, $c$GEO-TRA-ROT-CEN$c$, 2::smallint, $c$rotacion-respecto-de-un-punto$c$),
  ($c$LES-GEO-TRA-04$c$, $c$GEO-TRA-SIM-CEN$c$, 3::smallint, $c$simetria-central$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-TRA-145$c$, $c$M1-TRA-146$c$, $c$M1-TRA-147$c$, $c$M1-TRA-148$c$, $c$M1-TRA-149$c$, $c$M1-TRA-150$c$, $c$M1-TRA-151$c$, $c$M1-TRA-152$c$, $c$M1-TRA-153$c$, $c$M1-TRA-154$c$, $c$M1-TRA-155$c$, $c$M1-TRA-156$c$, $c$M1-TRA-157$c$, $c$M1-TRA-158$c$, $c$M1-TRA-159$c$, $c$M1-TRA-160$c$, $c$M1-TRA-161$c$, $c$M1-TRA-162$c$, $c$M1-TRA-163$c$, $c$M1-TRA-164$c$, $c$M1-TRA-165$c$, $c$M1-TRA-166$c$, $c$M1-TRA-167$c$, $c$M1-TRA-168$c$, $c$M1-TRA-169$c$, $c$M1-TRA-170$c$, $c$M1-TRA-171$c$, $c$M1-TRA-172$c$, $c$M1-TRA-173$c$, $c$M1-TRA-174$c$, $c$M1-TRA-175$c$, $c$M1-TRA-176$c$, $c$M1-TRA-177$c$, $c$M1-TRA-178$c$, $c$M1-TRA-179$c$, $c$M1-TRA-180$c$, $c$M1-TRA-181$c$, $c$M1-TRA-182$c$, $c$M1-TRA-183$c$, $c$M1-TRA-184$c$, $c$M1-TRA-185$c$, $c$M1-TRA-186$c$, $c$M1-TRA-187$c$, $c$M1-TRA-188$c$, $c$M1-TRA-189$c$, $c$M1-TRA-190$c$, $c$M1-TRA-191$c$, $c$M1-TRA-192$c$, $c$M1-TRA-193$c$, $c$M1-TRA-194$c$, $c$M1-TRA-195$c$, $c$M1-TRA-196$c$, $c$M1-TRA-197$c$, $c$M1-TRA-198$c$, $c$M1-TRA-199$c$, $c$M1-TRA-200$c$, $c$M1-TRA-201$c$, $c$M1-TRA-202$c$, $c$M1-TRA-203$c$, $c$M1-TRA-204$c$, $c$M1-TRA-205$c$, $c$M1-TRA-206$c$, $c$M1-TRA-207$c$, $c$M1-TRA-208$c$, $c$M1-TRA-209$c$, $c$M1-TRA-210$c$, $c$M1-TRA-211$c$, $c$M1-TRA-212$c$, $c$M1-TRA-213$c$, $c$M1-TRA-214$c$, $c$M1-TRA-215$c$, $c$M1-TRA-216$c$);
  if c <> 72 then
    raise exception 'items: se esperaban 72, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-145$c$, $c$M1-TRA-146$c$, $c$M1-TRA-147$c$, $c$M1-TRA-148$c$, $c$M1-TRA-149$c$, $c$M1-TRA-150$c$, $c$M1-TRA-151$c$, $c$M1-TRA-152$c$, $c$M1-TRA-153$c$, $c$M1-TRA-154$c$, $c$M1-TRA-155$c$, $c$M1-TRA-156$c$, $c$M1-TRA-157$c$, $c$M1-TRA-158$c$, $c$M1-TRA-159$c$, $c$M1-TRA-160$c$, $c$M1-TRA-161$c$, $c$M1-TRA-162$c$, $c$M1-TRA-163$c$, $c$M1-TRA-164$c$, $c$M1-TRA-165$c$, $c$M1-TRA-166$c$, $c$M1-TRA-167$c$, $c$M1-TRA-168$c$, $c$M1-TRA-169$c$, $c$M1-TRA-170$c$, $c$M1-TRA-171$c$, $c$M1-TRA-172$c$, $c$M1-TRA-173$c$, $c$M1-TRA-174$c$, $c$M1-TRA-175$c$, $c$M1-TRA-176$c$, $c$M1-TRA-177$c$, $c$M1-TRA-178$c$, $c$M1-TRA-179$c$, $c$M1-TRA-180$c$, $c$M1-TRA-181$c$, $c$M1-TRA-182$c$, $c$M1-TRA-183$c$, $c$M1-TRA-184$c$, $c$M1-TRA-185$c$, $c$M1-TRA-186$c$, $c$M1-TRA-187$c$, $c$M1-TRA-188$c$, $c$M1-TRA-189$c$, $c$M1-TRA-190$c$, $c$M1-TRA-191$c$, $c$M1-TRA-192$c$, $c$M1-TRA-193$c$, $c$M1-TRA-194$c$, $c$M1-TRA-195$c$, $c$M1-TRA-196$c$, $c$M1-TRA-197$c$, $c$M1-TRA-198$c$, $c$M1-TRA-199$c$, $c$M1-TRA-200$c$, $c$M1-TRA-201$c$, $c$M1-TRA-202$c$, $c$M1-TRA-203$c$, $c$M1-TRA-204$c$, $c$M1-TRA-205$c$, $c$M1-TRA-206$c$, $c$M1-TRA-207$c$, $c$M1-TRA-208$c$, $c$M1-TRA-209$c$, $c$M1-TRA-210$c$, $c$M1-TRA-211$c$, $c$M1-TRA-212$c$, $c$M1-TRA-213$c$, $c$M1-TRA-214$c$, $c$M1-TRA-215$c$, $c$M1-TRA-216$c$);
  if c <> 288 then
    raise exception 'item_options: se esperaban 288, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-145$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-146$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-147$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-148$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-149$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-150$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-151$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-152$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-153$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-154$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-155$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-156$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-157$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-158$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-159$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-160$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-161$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-162$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-163$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-164$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-165$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-166$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-167$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-168$c$, $c$GEO-TRA-ROT-90$c$),
      ($c$M1-TRA-169$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-170$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-171$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-172$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-173$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-174$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-175$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-176$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-177$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-178$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-179$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-180$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-181$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-182$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-183$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-184$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-185$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-186$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-187$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-188$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-189$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-190$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-191$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-192$c$, $c$GEO-TRA-ROT-CEN$c$),
      ($c$M1-TRA-193$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-194$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-195$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-196$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-197$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-198$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-199$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-200$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-201$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-202$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-203$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-204$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-205$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-206$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-207$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-208$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-209$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-210$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-211$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-212$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-213$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-214$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-215$c$, $c$GEO-TRA-SIM-CEN$c$),
      ($c$M1-TRA-216$c$, $c$GEO-TRA-SIM-CEN$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 72 then
    raise exception 'node_items: 72 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-145$c$, $c$M1-TRA-146$c$, $c$M1-TRA-147$c$, $c$M1-TRA-148$c$, $c$M1-TRA-149$c$, $c$M1-TRA-150$c$, $c$M1-TRA-151$c$, $c$M1-TRA-152$c$, $c$M1-TRA-153$c$, $c$M1-TRA-154$c$, $c$M1-TRA-155$c$, $c$M1-TRA-156$c$, $c$M1-TRA-157$c$, $c$M1-TRA-158$c$, $c$M1-TRA-159$c$, $c$M1-TRA-160$c$, $c$M1-TRA-161$c$, $c$M1-TRA-162$c$, $c$M1-TRA-163$c$, $c$M1-TRA-164$c$, $c$M1-TRA-165$c$, $c$M1-TRA-166$c$, $c$M1-TRA-167$c$, $c$M1-TRA-168$c$, $c$M1-TRA-169$c$, $c$M1-TRA-170$c$, $c$M1-TRA-171$c$, $c$M1-TRA-172$c$, $c$M1-TRA-173$c$, $c$M1-TRA-174$c$, $c$M1-TRA-175$c$, $c$M1-TRA-176$c$, $c$M1-TRA-177$c$, $c$M1-TRA-178$c$, $c$M1-TRA-179$c$, $c$M1-TRA-180$c$, $c$M1-TRA-181$c$, $c$M1-TRA-182$c$, $c$M1-TRA-183$c$, $c$M1-TRA-184$c$, $c$M1-TRA-185$c$, $c$M1-TRA-186$c$, $c$M1-TRA-187$c$, $c$M1-TRA-188$c$, $c$M1-TRA-189$c$, $c$M1-TRA-190$c$, $c$M1-TRA-191$c$, $c$M1-TRA-192$c$, $c$M1-TRA-193$c$, $c$M1-TRA-194$c$, $c$M1-TRA-195$c$, $c$M1-TRA-196$c$, $c$M1-TRA-197$c$, $c$M1-TRA-198$c$, $c$M1-TRA-199$c$, $c$M1-TRA-200$c$, $c$M1-TRA-201$c$, $c$M1-TRA-202$c$, $c$M1-TRA-203$c$, $c$M1-TRA-204$c$, $c$M1-TRA-205$c$, $c$M1-TRA-206$c$, $c$M1-TRA-207$c$, $c$M1-TRA-208$c$, $c$M1-TRA-209$c$, $c$M1-TRA-210$c$, $c$M1-TRA-211$c$, $c$M1-TRA-212$c$, $c$M1-TRA-213$c$, $c$M1-TRA-214$c$, $c$M1-TRA-215$c$, $c$M1-TRA-216$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$PLA-COORD-CONTEO$c$, $c$PLA-COORD-CUADNUM$c$, $c$PLA-COORD-ORDEN$c$, $c$PLA-VEC-SUMA$c$, $c$TRA-REFEJE-INTERCAMBIA$c$, $c$TRA-REFEJE-PROYECTA$c$, $c$TRA-ROT90-ANGULO$c$, $c$TRA-ROT90-SENTIDO$c$, $c$TRA-ROT90-SOLOCAMBIA$c$, $c$TRA-ROT90-SOLOSIGNO$c$, $c$TRA-ROTCEN-NOVUELVE$c$, $c$TRA-ROTCEN-ORIGEN$c$, $c$TRA-ROTCEN-VUELVEMAL$c$, $c$TRA-SIMCEN-EJE$c$, $c$TRA-SIMCEN-ORIGEN$c$, $c$TRA-SIMCEN-RESTA$c$, $c$TRA-SIMCEN-SINGIRAR$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-148$c$, $c$FIG-ROT-90-01$c$),
      ($c$M1-TRA-151$c$, $c$FIG-ROT-90-02$c$),
      ($c$M1-TRA-159$c$, $c$FIG-ROT-90-03$c$),
      ($c$M1-TRA-165$c$, $c$FIG-ROT-90-04$c$),
      ($c$M1-TRA-171$c$, $c$FIG-ROT-CEN-01$c$),
      ($c$M1-TRA-176$c$, $c$FIG-ROT-CEN-02$c$),
      ($c$M1-TRA-189$c$, $c$FIG-ROT-CEN-03$c$),
      ($c$M1-TRA-195$c$, $c$FIG-SIM-CEN-01$c$),
      ($c$M1-TRA-207$c$, $c$FIG-SIM-CEN-02$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 9 then
    raise exception 'figure_id: 9 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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

-- 72 ítems (72 curated), 288 alternativas, 17 misconceptions referenciadas,
-- 11 remediaciones, 12 figuras, 1 clase sobre 3 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 72 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-TRA-145$c$, $c$M1-TRA-146$c$, $c$M1-TRA-147$c$, $c$M1-TRA-148$c$, $c$M1-TRA-149$c$, $c$M1-TRA-150$c$, $c$M1-TRA-151$c$, $c$M1-TRA-152$c$, $c$M1-TRA-153$c$, $c$M1-TRA-154$c$, $c$M1-TRA-155$c$, $c$M1-TRA-156$c$, $c$M1-TRA-157$c$, $c$M1-TRA-158$c$, $c$M1-TRA-159$c$, $c$M1-TRA-160$c$, $c$M1-TRA-161$c$, $c$M1-TRA-162$c$, $c$M1-TRA-163$c$, $c$M1-TRA-164$c$, $c$M1-TRA-165$c$, $c$M1-TRA-166$c$, $c$M1-TRA-167$c$, $c$M1-TRA-168$c$, $c$M1-TRA-169$c$, $c$M1-TRA-170$c$, $c$M1-TRA-171$c$, $c$M1-TRA-172$c$, $c$M1-TRA-173$c$, $c$M1-TRA-174$c$, $c$M1-TRA-175$c$, $c$M1-TRA-176$c$, $c$M1-TRA-177$c$, $c$M1-TRA-178$c$, $c$M1-TRA-179$c$, $c$M1-TRA-180$c$, $c$M1-TRA-181$c$, $c$M1-TRA-182$c$, $c$M1-TRA-183$c$, $c$M1-TRA-184$c$, $c$M1-TRA-185$c$, $c$M1-TRA-186$c$, $c$M1-TRA-187$c$, $c$M1-TRA-188$c$, $c$M1-TRA-189$c$, $c$M1-TRA-190$c$, $c$M1-TRA-191$c$, $c$M1-TRA-192$c$, $c$M1-TRA-193$c$, $c$M1-TRA-194$c$, $c$M1-TRA-195$c$, $c$M1-TRA-196$c$, $c$M1-TRA-197$c$, $c$M1-TRA-198$c$, $c$M1-TRA-199$c$, $c$M1-TRA-200$c$, $c$M1-TRA-201$c$, $c$M1-TRA-202$c$, $c$M1-TRA-203$c$, $c$M1-TRA-204$c$, $c$M1-TRA-205$c$, $c$M1-TRA-206$c$, $c$M1-TRA-207$c$, $c$M1-TRA-208$c$, $c$M1-TRA-209$c$, $c$M1-TRA-210$c$, $c$M1-TRA-211$c$, $c$M1-TRA-212$c$, $c$M1-TRA-213$c$, $c$M1-TRA-214$c$, $c$M1-TRA-215$c$, $c$M1-TRA-216$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-TRA-ROT90-SENTIDO$c$, $c$REM-TRA-ROT90-SOLOCAMBIA$c$, $c$REM-TRA-ROT90-SOLOSIGNO$c$, $c$REM-TRA-ROT90-ANGULO$c$, $c$REM-TRA-ROTCEN-ORIGEN$c$, $c$REM-TRA-ROTCEN-NOVUELVE$c$, $c$REM-TRA-ROTCEN-VUELVEMAL$c$, $c$REM-TRA-SIMCEN-EJE$c$, $c$REM-TRA-SIMCEN-ORIGEN$c$, $c$REM-TRA-SIMCEN-RESTA$c$, $c$REM-TRA-SIMCEN-SINGIRAR$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-GEO-TRA-04$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-TRA-145$c$, $c$M1-TRA-146$c$, $c$M1-TRA-147$c$, $c$M1-TRA-148$c$, $c$M1-TRA-149$c$, $c$M1-TRA-150$c$, $c$M1-TRA-151$c$, $c$M1-TRA-152$c$, $c$M1-TRA-153$c$, $c$M1-TRA-154$c$, $c$M1-TRA-155$c$, $c$M1-TRA-156$c$, $c$M1-TRA-157$c$, $c$M1-TRA-158$c$, $c$M1-TRA-159$c$, $c$M1-TRA-160$c$, $c$M1-TRA-161$c$, $c$M1-TRA-162$c$, $c$M1-TRA-163$c$, $c$M1-TRA-164$c$, $c$M1-TRA-165$c$, $c$M1-TRA-166$c$, $c$M1-TRA-167$c$, $c$M1-TRA-168$c$, $c$M1-TRA-169$c$, $c$M1-TRA-170$c$, $c$M1-TRA-171$c$, $c$M1-TRA-172$c$, $c$M1-TRA-173$c$, $c$M1-TRA-174$c$, $c$M1-TRA-175$c$, $c$M1-TRA-176$c$, $c$M1-TRA-177$c$, $c$M1-TRA-178$c$, $c$M1-TRA-179$c$, $c$M1-TRA-180$c$, $c$M1-TRA-181$c$, $c$M1-TRA-182$c$, $c$M1-TRA-183$c$, $c$M1-TRA-184$c$, $c$M1-TRA-185$c$, $c$M1-TRA-186$c$, $c$M1-TRA-187$c$, $c$M1-TRA-188$c$, $c$M1-TRA-189$c$, $c$M1-TRA-190$c$, $c$M1-TRA-191$c$, $c$M1-TRA-192$c$, $c$M1-TRA-193$c$, $c$M1-TRA-194$c$, $c$M1-TRA-195$c$, $c$M1-TRA-196$c$, $c$M1-TRA-197$c$, $c$M1-TRA-198$c$, $c$M1-TRA-199$c$, $c$M1-TRA-200$c$, $c$M1-TRA-201$c$, $c$M1-TRA-202$c$, $c$M1-TRA-203$c$, $c$M1-TRA-204$c$, $c$M1-TRA-205$c$, $c$M1-TRA-206$c$, $c$M1-TRA-207$c$, $c$M1-TRA-208$c$, $c$M1-TRA-209$c$, $c$M1-TRA-210$c$, $c$M1-TRA-211$c$, $c$M1-TRA-212$c$, $c$M1-TRA-213$c$, $c$M1-TRA-214$c$, $c$M1-TRA-215$c$, $c$M1-TRA-216$c$) group by 1;
