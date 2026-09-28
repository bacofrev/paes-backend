-- =====================================================================
-- LES-GEO-TRA-03 — Reflexiones
-- Generado por cargar_contenido.py desde LES-GEO-TRA-03.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-REF-EJE-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 378 348" width="378" height="348" role="img" aria-label="Plano con cuadrícula, el triángulo F y cuatro triángulos numerados del 1 al 4." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <polygon class="figura" data-vertices="=-5,1;=-2,1;=-5,3" points="52,182 130,182 52,130" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=5,1;=2,1;=5,3" points="312,182 234,182 312,130" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=2,4;=5,4;=2,6" points="234,104 312,104 234,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-5,-1;=-2,-1;=-5,-3" points="52,234 130,234 52,286" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=5,-1;=2,-1;=5,-3" points="312,234 234,234 312,286" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="174" y="220" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="354" y="196" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="69.33" y="173.33" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="277.33" y="173.33" font-size="13" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="251.33" y="95.33" font-size="13" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="69.33" y="260" font-size="13" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="277.33" y="260" font-size="13" text-anchor="middle" dominant-baseline="central">4</text>
</svg>
$c$),
  ($c$FIG-REF-EJE-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 322" width="326" height="322" role="img" aria-label="Plano cartesiano con cuadrícula de una unidad y el punto A." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <circle class="punto" data-nombre="A" data-x="-3" data-y="4" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
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
  <text x="88" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
</svg>
$c$),
  ($c$FIG-REF-EJE-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 378 244" width="378" height="244" role="img" aria-label="Plano cartesiano con el triángulo T y su imagen T' por una reflexión." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="312" y1="26" x2="312" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="338" y1="26" x2="338" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="338" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="338" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="338" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="338" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="338" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="338" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="338" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="338" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="350" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="182" y1="212" x2="182" y2="14" stroke-width="1.3"/>
  <polygon points="356,130 347,125.5 347,134.5" fill="currentColor" stroke="none"/>
  <polygon points="182,8 177.5,17 186.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="130" y1="126.5" x2="130" y2="133.5" stroke-width="1.3"/>
  <line x1="156" y1="126.5" x2="156" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="260" y1="126.5" x2="260" y2="133.5" stroke-width="1.3"/>
  <line x1="286" y1="126.5" x2="286" y2="133.5" stroke-width="1.3"/>
  <line x1="312" y1="126.5" x2="312" y2="133.5" stroke-width="1.3"/>
  <line x1="338" y1="126.5" x2="338" y2="133.5" stroke-width="1.3"/>
  <line x1="178.5" y1="208" x2="185.5" y2="208" stroke-width="1.3"/>
  <line x1="178.5" y1="182" x2="185.5" y2="182" stroke-width="1.3"/>
  <line x1="178.5" y1="156" x2="185.5" y2="156" stroke-width="1.3"/>
  <line x1="178.5" y1="104" x2="185.5" y2="104" stroke-width="1.3"/>
  <line x1="178.5" y1="78" x2="185.5" y2="78" stroke-width="1.3"/>
  <line x1="178.5" y1="52" x2="185.5" y2="52" stroke-width="1.3"/>
  <line x1="178.5" y1="26" x2="185.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=-5,-2;=-2,-2;=-2,3" points="52,182 130,182 130,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=5,-2;=2,-2;=2,3" points="312,182 234,182 234,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−6</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="130" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="260" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="286" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="312" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="338" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="175" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="175" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="175" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="175" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="175" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="175" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="175" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="174" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="354" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="104" y="169" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">T</text>
  <text x="260" y="169" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">T'</text>
</svg>
$c$),
  ($c$FIG-REF-EJE-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 322" width="248" height="322" role="img" aria-label="El punto P(1, 4) y su reflejo P'(1, −4) respecto del eje x: los dos están a 4 unidades del eje, uno arriba y otro abajo, en la misma vertical." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="286" x2="208" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="208" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="208" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="208" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="208" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="208" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="208" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="208" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="220" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="290" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="226,156 217,151.5 217,160.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="100.5" y1="286" x2="107.5" y2="286" stroke-width="1.3"/>
  <line x1="100.5" y1="260" x2="107.5" y2="260" stroke-width="1.3"/>
  <line x1="100.5" y1="234" x2="107.5" y2="234" stroke-width="1.3"/>
  <line x1="100.5" y1="208" x2="107.5" y2="208" stroke-width="1.3"/>
  <line x1="100.5" y1="182" x2="107.5" y2="182" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="104" x2="107.5" y2="104" stroke-width="1.3"/>
  <line x1="100.5" y1="78" x2="107.5" y2="78" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <line class="segmento" x1="130" y1="52" x2="130" y2="260" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="P" data-x="1" data-y="4" cx="130" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="1" data-y="-4" cx="130" cy="260" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="97" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="97" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="97" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="97" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="97" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="97" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="96" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="143" y="52" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="143" y="260" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
  <text x="143" y="104" font-size="12" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="143" y="208" font-size="12" text-anchor="middle" dominant-baseline="central">4</text>
</svg>
$c$),
  ($c$FIG-REF-EJE-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 218" width="326" height="218" role="img" aria-label="Una bandera que apunta a la derecha y su reflejo respecto del eje y, que apunta a la izquierda: la reflexión invierte la orientación." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="298" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=-4,0;=-4,4;=-1,3;=-4,2" points="52,156 52,52 130,78 52,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=4,0;=4,4;=1,3;=4,2" points="260,156 260,52 182,78 260,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="148" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
</svg>
$c$),
  ($c$FIG-REF-REC-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 218" width="300" height="218" role="img" aria-label="Plano cartesiano con la recta vertical x = −1 punteada y el punto A." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="260" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="260" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="260" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="260" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="260" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="272" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="278,156 269,151.5 269,160.5" fill="currentColor" stroke="none"/>
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
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="recta" data-x="-1" x1="130" y1="20" x2="130" y2="188" stroke-width="1.4" stroke-dasharray="6 4"/>
  <circle class="punto" data-nombre="A" data-x="2" data-y="3" cx="208" cy="78" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="148" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="106" y="24" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">x = −1</text>
  <text x="218" y="68" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
</svg>
$c$),
  ($c$FIG-REF-REC-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 322" width="274" height="322" role="img" aria-label="Plano cartesiano con la recta horizontal y = −1 punteada y el triángulo ABC." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="286" x2="234" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="234" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="234" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="234" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="234" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="234" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="234" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="234" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="234" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="246" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="290" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="252,130 243,125.5 243,134.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="130" y1="126.5" x2="130" y2="133.5" stroke-width="1.3"/>
  <line x1="156" y1="126.5" x2="156" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="100.5" y1="286" x2="107.5" y2="286" stroke-width="1.3"/>
  <line x1="100.5" y1="260" x2="107.5" y2="260" stroke-width="1.3"/>
  <line x1="100.5" y1="234" x2="107.5" y2="234" stroke-width="1.3"/>
  <line x1="100.5" y1="208" x2="107.5" y2="208" stroke-width="1.3"/>
  <line x1="100.5" y1="182" x2="107.5" y2="182" stroke-width="1.3"/>
  <line x1="100.5" y1="156" x2="107.5" y2="156" stroke-width="1.3"/>
  <line x1="100.5" y1="104" x2="107.5" y2="104" stroke-width="1.3"/>
  <line x1="100.5" y1="78" x2="107.5" y2="78" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <line class="recta" data-y="-1" x1="20" y1="156" x2="240" y2="156" stroke-width="1.4" stroke-dasharray="6 4"/>
  <polygon class="figura" data-vertices="A=1,1;B=3,1;C=1,3" points="130,104 182,104 130,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="1" data-y="1" cx="130" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="3" data-y="1" cx="182" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="1" data-y="3" cx="130" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="130" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="97" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−6</text>
  <text x="97" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="97" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="97" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="97" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="97" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="97" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="96" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="230" y="168" font-size="13" text-anchor="end" dominant-baseline="central" font-style="italic">y = −1</text>
  <text x="120" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="195" y="104" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="140" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-REF-REC-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 218" width="326" height="218" role="img" aria-label="Plano cartesiano con el triángulo ABC y su imagen A'B'C' por una reflexión." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="286" y1="26" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="286" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="286" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="286" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="286" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="286" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="286" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="286" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="298" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="186" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="304,156 295,151.5 295,160.5" fill="currentColor" stroke="none"/>
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
  <line x1="286" y1="152.5" x2="286" y2="159.5" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-3,2;B=-1,2;C=-3,4" points="52,104 104,104 52,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-3" data-y="2" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="-1" data-y="2" cx="104" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="-3" data-y="4" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <polygon class="figura" data-vertices="A'=5,2;B'=3,2;C'=5,4" points="260,104 208,104 260,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A'" data-x="5" data-y="2" cx="260" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B'" data-x="3" data-y="2" cx="208" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C'" data-x="5" data-y="4" cx="260" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="286" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="122" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="104" y="118" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="42" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="270" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">A'</text>
  <text x="208" y="118" font-size="14" text-anchor="middle" dominant-baseline="central">B'</text>
  <text x="270" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C'</text>
</svg>
$c$),
  ($c$FIG-REF-REC-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 218" width="248" height="218" role="img" aria-label="La recta x = −2 y el punto P(0, 4), que está 2 unidades a su derecha. Su reflejo P'(−4, 4) está 2 unidades a la izquierda de la recta." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="208" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="208" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="208" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="208" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="208" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="208" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="220" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="226,156 217,151.5 217,160.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="recta" data-x="-2" x1="104" y1="20" x2="104" y2="188" stroke-width="1.4" stroke-dasharray="6 4"/>
  <line class="segmento" x1="156" y1="52" x2="52" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="P" data-x="0" data-y="4" cx="156" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="-4" data-y="4" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="148" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="80" y="24" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">x = −2</text>
  <text x="166" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="52" y="39" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
  <text x="130" y="39" font-size="12" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="78" y="39" font-size="12" text-anchor="middle" dominant-baseline="central">2</text>
</svg>
$c$),
  ($c$FIG-REF-REC-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 222 218" width="222" height="218" role="img" aria-label="La recta y = x y el punto Q(4, 1). Su reflejo es Q'(1, 4): las coordenadas se intercambian." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="182" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="182" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="182" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="182" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="182" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="182" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="182" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="156" x2="194" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="52" y1="186" x2="52" y2="14" stroke-width="1.3"/>
  <polygon points="200,156 191,151.5 191,160.5" fill="currentColor" stroke="none"/>
  <polygon points="52,8 47.5,17 56.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="48.5" y1="182" x2="55.5" y2="182" stroke-width="1.3"/>
  <line x1="48.5" y1="130" x2="55.5" y2="130" stroke-width="1.3"/>
  <line x1="48.5" y1="104" x2="55.5" y2="104" stroke-width="1.3"/>
  <line x1="48.5" y1="78" x2="55.5" y2="78" stroke-width="1.3"/>
  <line x1="48.5" y1="52" x2="55.5" y2="52" stroke-width="1.3"/>
  <line x1="48.5" y1="26" x2="55.5" y2="26" stroke-width="1.3"/>
  <line class="recta" data-m="1" x1="26" y1="182" x2="182" y2="26" stroke-width="1.4" stroke-dasharray="6 4"/>
  <line class="segmento" x1="156" y1="130" x2="78" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="Q" data-x="4" data-y="1" cx="156" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="Q'" data-x="1" data-y="4" cx="78" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="45" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="45" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="45" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="45" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="45" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="45" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="44" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="198" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="64" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="156" y="36" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">y = x</text>
  <text x="169" y="130" font-size="14" text-anchor="middle" dominant-baseline="central">Q</text>
  <text x="78" y="39" font-size="14" text-anchor="middle" dominant-baseline="central">Q'</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-TRA-097$c$, $c$¿Cuál es el reflejo del punto $P(3, -5)$ respecto del eje $x$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-098$c$, $c$¿Cuál es el reflejo del punto $Q(-4, 2)$ respecto del eje $y$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-099$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-100$c$, $c$¿Cuál de las figuras numeradas es el reflejo de $F$ respecto del eje $y$?$c$, 1, $c$propio$c$::text, $c$FIG-REF-EJE-01$c$::text),
  ($c$M1-TRA-101$c$, $c$¿Cuál es el reflejo del punto $(-6, -1)$ respecto del eje $y$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-102$c$, $c$En el mapa de un parque, el eje $x$ coincide con un río. Un puente está en el punto $(2, -3)$ y se construirá otro en la posición simétrica respecto del río. ¿Dónde estará el nuevo puente?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-103$c$, $c$¿Cuál es el reflejo del punto $A$ respecto del eje $x$?$c$, 1, $c$propio$c$::text, $c$FIG-REF-EJE-02$c$::text),
  ($c$M1-TRA-104$c$, $c$El triángulo de vértices $A(1, 1)$, $B(4, 1)$ y $C(1, 3)$ se refleja respecto del eje $y$. ¿Cuál es la imagen de $C$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-105$c$, $c$El triángulo de vértices $A(1, 2)$, $B(4, 2)$ y $C(4, 5)$ se refleja respecto del eje $x$. ¿Cuáles son los vértices de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-106$c$, $c$El punto $P'(-2, 7)$ es el reflejo de un punto $P$ respecto del eje $y$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-107$c$, $c$Considera las siguientes afirmaciones:

I. El reflejo de $(3, -1)$ respecto del eje $x$ es $(3, 1)$.

II. El reflejo de $(-2, 4)$ respecto del eje $y$ es $(-2, -4)$.

III. El reflejo de $(5, 2)$ respecto del eje $x$ es $(-5, -2)$.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-108$c$, $c$Un punto del cuarto cuadrante se refleja respecto del eje $y$. ¿Dónde queda su imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-109$c$, $c$¿A qué distancia está el punto $(5, -3)$ de su reflejo respecto del eje $x$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-110$c$, $c$$T'$ es la imagen de $T$ por una reflexión. ¿Respecto de qué recta se reflejó?$c$, 2, $c$propio$c$::text, $c$FIG-REF-EJE-03$c$::text),
  ($c$M1-TRA-111$c$, $c$El segmento de extremos $A(-1, 3)$ y $B(2, 5)$ se refleja respecto del eje $y$. ¿Cuáles son los extremos de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-112$c$, $c$El diseño de una mariposa es simétrico respecto del eje $y$. Un punto del ala izquierda está en $(-4, 3)$. ¿Cuál es el punto que le corresponde en el ala derecha?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-113$c$, $c$Considera las siguientes afirmaciones:

I. Si un punto $P$ está sobre el eje $x$, su reflejo respecto del eje $x$ es el mismo $P$.

II. El reflejo de $(a, b)$ respecto del eje $y$ es $(-a, b)$.

III. Reflejar un punto respecto del eje $x$ y después respecto del eje $y$ equivale a cambiar el signo de sus dos coordenadas.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-114$c$, $c$Un logotipo es simétrico respecto del eje $x$. Si el punto $(-5, 2)$ pertenece al logotipo, ¿cuál de los siguientes puntos también pertenece a él?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-115$c$, $c$El triángulo de vértices $A(2, 1)$, $B(5, 1)$ y $C(2, 4)$ se refleja respecto del eje $y$. ¿Cuál afirmación sobre su imagen $A'B'C'$ es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-116$c$, $c$Un espejo vertical coincide con el eje $y$. Una persona está parada en el punto $(-3, 1)$. ¿A qué distancia está de su reflejo y dónde se ve el reflejo?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-117$c$, $c$Sean $a$ y $b$ números positivos. ¿Cuál es el reflejo del punto $(-a, b)$ respecto del eje $x$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-118$c$, $c$Considera las siguientes afirmaciones:

I. La imagen de un triángulo por una reflexión tiene la orientación invertida.

II. El reflejo de $(2, 3)$ respecto del eje $y$ es $(2, -3)$.

III. El reflejo de $(2, 3)$ respecto del eje $x$ es $(3, 2)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-119$c$, $c$Un punto se refleja respecto del eje $x$ y su imagen es $(-4, 0)$. ¿Cuál era el punto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-120$c$, $c$Una reflexión respecto de uno de los ejes lleva el punto $A(-2, -3)$ al punto $A'(-2, 3)$. ¿Dónde lleva esa misma reflexión al punto $B(4, 1)$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-121$c$, $c$¿Cuál es el reflejo del punto $P(5, 2)$ respecto de la recta $x = 1$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-122$c$, $c$¿Cuál es el reflejo del punto $Q(3, -1)$ respecto de la recta $y = 2$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-123$c$, $c$¿Cuál es el reflejo del punto $(4, -2)$ respecto de la recta $y = x$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-124$c$, $c$¿Cuál es el reflejo del punto $A$ respecto de la recta $x = -1$?$c$, 1, $c$propio$c$::text, $c$FIG-REF-REC-01$c$::text),
  ($c$M1-TRA-125$c$, $c$Los puntos $A(-1, 4)$ y $A'(5, 4)$ son simétricos respecto de una recta. ¿Cuál es esa recta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-126$c$, $c$Un espejo está sobre la recta $x = 3$. Un objeto está en el punto $(1, 2)$. ¿En qué punto se ve su imagen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-127$c$, $c$¿Cuál es el reflejo del punto $(-3, 5)$ respecto de la recta $y = -x$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-128$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-129$c$, $c$El triángulo $ABC$ se refleja respecto de la recta $y = -1$. ¿Cuáles son las coordenadas de la imagen de $C$?$c$, 2, $c$propio$c$::text, $c$FIG-REF-REC-02$c$::text),
  ($c$M1-TRA-130$c$, $c$El punto $P'(-2, 7)$ es el reflejo de un punto $P$ respecto de la recta $x = 3$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-131$c$, $c$El triángulo de vértices $A(1, 3)$, $B(4, 3)$ y $C(4, 5)$ se refleja respecto de la recta $y = x$. ¿Cuáles son los vértices de la imagen?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-132$c$, $c$Considera las siguientes afirmaciones:

I. El reflejo de $(0, 3)$ respecto de la recta $y = 1$ es $(0, -1)$.

II. El reflejo de $(4, 2)$ respecto de la recta $x = 1$ es $(-4, 2)$.

III. El reflejo de $(2, 6)$ respecto de la recta $y = x$ es $(-6, -2)$.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-133$c$, $c$En un tablero, la línea central es la recta $y = 3$. Una ficha en el punto $(2, 7)$ se refleja respecto de esa línea. ¿Dónde queda?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-134$c$, $c$¿A qué distancia está el punto $(5, 1)$ de su reflejo respecto de la recta $x = 2$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-135$c$, $c$Los puntos $A(-2, 5)$ y $B$ son simétricos respecto de la recta $y = x$. ¿Cuáles son las coordenadas de $B$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-136$c$, $c$Los puntos $(a, 3)$ y $(7, 3)$ son simétricos respecto de la recta $x = 2$. ¿Cuál es el valor de $a$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-137$c$, $c$Considera las siguientes afirmaciones:

I. El reflejo de $(a, b)$ respecto de la recta $y = x$ es $(b, a)$.

II. El reflejo de $(3, 1)$ respecto de la recta $x = -1$ es $(-3, 1)$.

III. El reflejo de $(1, 4)$ respecto de la recta $y = 2$ es $(3, 4)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-138$c$, $c$La superficie del agua de un estanque se representa con la recta $y = -2$. Una ampolleta está en el punto $(4, 3)$. ¿En qué punto se ve su reflejo en el agua?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-139$c$, $c$El punto $P(1, 2)$ se refleja respecto de la recta $x = 3$, y su imagen se refleja después respecto del eje $y$. ¿Dónde queda al final?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-140$c$, $c$Sea $k$ un número. ¿Cuál es el reflejo del punto $(x, y)$ respecto de la recta $x = k$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-141$c$, $c$El punto $(a, b)$ coincide con su reflejo respecto de la recta $y = x$. ¿Qué se puede afirmar?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-142$c$, $c$El triángulo $A'B'C'$ es el reflejo del triángulo $ABC$ respecto de una recta. ¿Cuál es esa recta?$c$, 3, $c$propio$c$::text, $c$FIG-REF-REC-03$c$::text),
  ($c$M1-TRA-143$c$, $c$Un diseño es simétrico respecto de la recta $y = 1$. Si el punto $(-2, 4)$ pertenece al diseño, ¿cuál de los siguientes puntos también pertenece a él?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-144$c$, $c$¿Cuál es el reflejo del punto $(-1, -4)$ respecto de la recta $y = -x$?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-TRA-097$c$, $c$A$c$, $c$$(-5, 3)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-097$c$, $c$B$c$, $c$$(-3, -5)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-097$c$, $c$C$c$, $c$$(3, 5)$$c$, true, null),
  ($c$M1-TRA-097$c$, $c$D$c$, $c$$(-3, 5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-098$c$, $c$A$c$, $c$$(2, -4)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-098$c$, $c$B$c$, $c$$(4, 2)$$c$, true, null),
  ($c$M1-TRA-098$c$, $c$C$c$, $c$$(4, -2)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-098$c$, $c$D$c$, $c$$(-4, -2)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-099$c$, $c$A$c$, $c$Al reflejar un punto respecto de un eje, sus coordenadas se intercambian.$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-099$c$, $c$B$c$, $c$Al reflejar un punto respecto del eje $x$, cambia el signo de su abscisa.$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-099$c$, $c$C$c$, $c$Al reflejar un punto respecto de un eje, cambian de signo sus dos coordenadas.$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-099$c$, $c$D$c$, $c$Al reflejar un punto respecto del eje $x$, su abscisa no cambia y su ordenada cambia de signo.$c$, true, null),
  ($c$M1-TRA-100$c$, $c$A$c$, $c$La figura 1$c$, true, null),
  ($c$M1-TRA-100$c$, $c$B$c$, $c$La figura 4$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-100$c$, $c$C$c$, $c$La figura 3$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-100$c$, $c$D$c$, $c$La figura 2$c$, false, $c$TRA-REFEJE-TRASLADA$c$),
  ($c$M1-TRA-101$c$, $c$A$c$, $c$$(6, 1)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-101$c$, $c$B$c$, $c$$(0, -1)$$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-101$c$, $c$C$c$, $c$$(-6, 1)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-101$c$, $c$D$c$, $c$$(6, -1)$$c$, true, null),
  ($c$M1-TRA-102$c$, $c$A$c$, $c$$(2, 0)$$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-102$c$, $c$B$c$, $c$$(-2, -3)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-102$c$, $c$C$c$, $c$$(2, 3)$$c$, true, null),
  ($c$M1-TRA-102$c$, $c$D$c$, $c$$(-2, 3)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-103$c$, $c$A$c$, $c$$(4, 3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-103$c$, $c$B$c$, $c$$(-3, -4)$$c$, true, null),
  ($c$M1-TRA-103$c$, $c$C$c$, $c$$(3, -4)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-103$c$, $c$D$c$, $c$$(3, 4)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-104$c$, $c$A$c$, $c$$(-1, 3)$$c$, true, null),
  ($c$M1-TRA-104$c$, $c$B$c$, $c$$(3, 1)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-104$c$, $c$C$c$, $c$$(1, -3)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-104$c$, $c$D$c$, $c$$(-1, -3)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-105$c$, $c$A$c$, $c$$A'(-1, -2)$, $B'(-4, -2)$ y $C'(-4, -5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-105$c$, $c$B$c$, $c$$A'(-1, 2)$, $B'(-4, 2)$ y $C'(-4, 5)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-105$c$, $c$C$c$, $c$$A'(1, -5)$, $B'(4, -5)$ y $C'(4, -2)$$c$, false, $c$TRA-REFEJE-TRASLADA$c$),
  ($c$M1-TRA-105$c$, $c$D$c$, $c$$A'(1, -2)$, $B'(4, -2)$ y $C'(4, -5)$$c$, true, null),
  ($c$M1-TRA-106$c$, $c$A$c$, $c$$(2, 7)$$c$, true, null),
  ($c$M1-TRA-106$c$, $c$B$c$, $c$$(2, -7)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-106$c$, $c$C$c$, $c$$(7, -2)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-106$c$, $c$D$c$, $c$$(-2, -7)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-107$c$, $c$A$c$, $c$Solo II$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-107$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-107$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-107$c$, $c$D$c$, $c$Solo III$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-108$c$, $c$A$c$, $c$En el primer cuadrante.$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-108$c$, $c$B$c$, $c$En el tercer cuadrante.$c$, true, null),
  ($c$M1-TRA-108$c$, $c$C$c$, $c$En el segundo cuadrante.$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-108$c$, $c$D$c$, $c$Sobre el eje $y$.$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-109$c$, $c$A$c$, $c$$6$ unidades$c$, true, null),
  ($c$M1-TRA-109$c$, $c$B$c$, $c$$10$ unidades$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-109$c$, $c$C$c$, $c$$3$ unidades$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-109$c$, $c$D$c$, $c$$7$ unidades$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-110$c$, $c$A$c$, $c$Respecto de los dos ejes a la vez.$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-110$c$, $c$B$c$, $c$Respecto del eje $x$.$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-110$c$, $c$C$c$, $c$Respecto de la recta $y = x$.$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-110$c$, $c$D$c$, $c$Respecto del eje $y$.$c$, true, null),
  ($c$M1-TRA-111$c$, $c$A$c$, $c$$A'(3, -1)$ y $B'(5, 2)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-111$c$, $c$B$c$, $c$$A'(-1, -3)$ y $B'(2, -5)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-111$c$, $c$C$c$, $c$$A'(1, 3)$ y $B'(-2, 5)$$c$, true, null),
  ($c$M1-TRA-111$c$, $c$D$c$, $c$$A'(1, -3)$ y $B'(-2, -5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-112$c$, $c$A$c$, $c$$(3, -4)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-112$c$, $c$B$c$, $c$$(4, 3)$$c$, true, null),
  ($c$M1-TRA-112$c$, $c$C$c$, $c$$(-4, -3)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-112$c$, $c$D$c$, $c$$(4, -3)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-113$c$, $c$A$c$, $c$Solo III$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-113$c$, $c$B$c$, $c$I, II y III$c$, true, null),
  ($c$M1-TRA-113$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-113$c$, $c$D$c$, $c$Solo I$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-114$c$, $c$A$c$, $c$$(5, 2)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-114$c$, $c$B$c$, $c$$(2, -5)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-114$c$, $c$C$c$, $c$$(-5, -2)$$c$, true, null),
  ($c$M1-TRA-114$c$, $c$D$c$, $c$$(5, -2)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-115$c$, $c$A$c$, $c$$A' = (-2, 1)$, y la imagen conserva la orientación del triángulo.$c$, false, $c$TRA-REFEJE-TRASLADA$c$),
  ($c$M1-TRA-115$c$, $c$B$c$, $c$$A' = (-2, -1)$, y la imagen tiene la orientación invertida.$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-115$c$, $c$C$c$, $c$$A' = (2, -1)$, y la imagen tiene la orientación invertida.$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-115$c$, $c$D$c$, $c$$A' = (-2, 1)$, y la imagen tiene la misma forma y tamaño, pero la orientación invertida.$c$, true, null),
  ($c$M1-TRA-116$c$, $c$A$c$, $c$A $6$ unidades; el reflejo se ve en $(3, 1)$.$c$, true, null),
  ($c$M1-TRA-116$c$, $c$B$c$, $c$A $7$ unidades; el reflejo se ve en $(3, 1)$.$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-116$c$, $c$C$c$, $c$A $3$ unidades; el reflejo se ve en $(0, 1)$.$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-116$c$, $c$D$c$, $c$A $2$ unidades; el reflejo se ve en $(-3, -1)$.$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-117$c$, $c$A$c$, $c$$(-a, -b)$$c$, true, null),
  ($c$M1-TRA-117$c$, $c$B$c$, $c$$(b, -a)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-117$c$, $c$C$c$, $c$$(a, -b)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-117$c$, $c$D$c$, $c$$(a, b)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-118$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-118$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-118$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$TRA-REFEJE-TRASLADA$c$),
  ($c$M1-TRA-118$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-119$c$, $c$A$c$, $c$$(0, -4)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-119$c$, $c$B$c$, $c$$(4, 0)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-119$c$, $c$C$c$, $c$$(-4, 0)$$c$, true, null),
  ($c$M1-TRA-119$c$, $c$D$c$, $c$Cualquier punto de la forma $(-4, b)$$c$, false, $c$TRA-REFEJE-PROYECTA$c$),
  ($c$M1-TRA-120$c$, $c$A$c$, $c$$(-4, -1)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-120$c$, $c$B$c$, $c$$(-4, 1)$$c$, false, $c$TRA-REFEJE-CAMBIAEJE$c$),
  ($c$M1-TRA-120$c$, $c$C$c$, $c$$(1, 4)$$c$, false, $c$TRA-REFEJE-INTERCAMBIA$c$),
  ($c$M1-TRA-120$c$, $c$D$c$, $c$$(4, -1)$$c$, true, null),
  ($c$M1-TRA-121$c$, $c$A$c$, $c$$(-4, 2)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-121$c$, $c$B$c$, $c$$(5, 0)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-121$c$, $c$C$c$, $c$$(-5, 2)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-121$c$, $c$D$c$, $c$$(-3, 2)$$c$, true, null),
  ($c$M1-TRA-122$c$, $c$A$c$, $c$$(1, -1)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-122$c$, $c$B$c$, $c$$(3, 5)$$c$, true, null),
  ($c$M1-TRA-122$c$, $c$C$c$, $c$$(3, 1)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-122$c$, $c$D$c$, $c$$(3, 3)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-123$c$, $c$A$c$, $c$$(-2, 4)$$c$, true, null),
  ($c$M1-TRA-123$c$, $c$B$c$, $c$$(-4, 2)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-123$c$, $c$C$c$, $c$$(4, 2)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-123$c$, $c$D$c$, $c$$(2, -4)$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-124$c$, $c$A$c$, $c$$(-2, 3)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-124$c$, $c$B$c$, $c$$(-3, 3)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-124$c$, $c$C$c$, $c$$(-4, 3)$$c$, true, null),
  ($c$M1-TRA-124$c$, $c$D$c$, $c$$(2, -5)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-125$c$, $c$A$c$, $c$El eje $y$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-125$c$, $c$B$c$, $c$La recta $x = 4$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-125$c$, $c$C$c$, $c$La recta $x = 2$$c$, true, null),
  ($c$M1-TRA-125$c$, $c$D$c$, $c$La recta $y = 2$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-126$c$, $c$A$c$, $c$$(-1, 2)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-126$c$, $c$B$c$, $c$$(1, 4)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-126$c$, $c$C$c$, $c$$(2, 2)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-126$c$, $c$D$c$, $c$$(5, 2)$$c$, true, null),
  ($c$M1-TRA-127$c$, $c$A$c$, $c$$(-5, 3)$$c$, true, null),
  ($c$M1-TRA-127$c$, $c$B$c$, $c$$(3, -5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-127$c$, $c$C$c$, $c$$(-3, -5)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-127$c$, $c$D$c$, $c$$(5, -3)$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-128$c$, $c$A$c$, $c$Al reflejar un punto respecto de la recta $x = 4$, su abscisa no cambia.$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-128$c$, $c$B$c$, $c$Al reflejar un punto respecto de la recta $x = 4$, su ordenada no cambia.$c$, true, null),
  ($c$M1-TRA-128$c$, $c$C$c$, $c$El reflejo de $(2, 5)$ respecto de la recta $y = x$ es $(-5, -2)$.$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-128$c$, $c$D$c$, $c$El reflejo de $(6, 1)$ respecto de la recta $x = 4$ es $(-6, 1)$.$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-129$c$, $c$A$c$, $c$$(1, -3)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-129$c$, $c$B$c$, $c$$(-3, 3)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-129$c$, $c$C$c$, $c$$(1, -4)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-129$c$, $c$D$c$, $c$$(1, -5)$$c$, true, null),
  ($c$M1-TRA-130$c$, $c$A$c$, $c$$(5, 7)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-130$c$, $c$B$c$, $c$$(8, 7)$$c$, true, null),
  ($c$M1-TRA-130$c$, $c$C$c$, $c$$(2, 7)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-130$c$, $c$D$c$, $c$$(-2, -1)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-131$c$, $c$A$c$, $c$$A'(-3, -1)$, $B'(-3, -4)$ y $C'(-5, -4)$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-131$c$, $c$B$c$, $c$$A'(-1, -3)$, $B'(-4, -3)$ y $C'(-4, -5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-131$c$, $c$C$c$, $c$$A'(3, 1)$, $B'(3, 4)$ y $C'(5, 4)$$c$, true, null),
  ($c$M1-TRA-131$c$, $c$D$c$, $c$$A'(1, -3)$, $B'(4, -3)$ y $C'(4, -5)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-132$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-132$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-132$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-132$c$, $c$D$c$, $c$Solo II$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-133$c$, $c$A$c$, $c$$(2, -1)$$c$, true, null),
  ($c$M1-TRA-133$c$, $c$B$c$, $c$$(4, 7)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-133$c$, $c$C$c$, $c$$(2, -4)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-133$c$, $c$D$c$, $c$$(2, -7)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-134$c$, $c$A$c$, $c$$2$ unidades$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-134$c$, $c$B$c$, $c$$8$ unidades$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-134$c$, $c$C$c$, $c$$6$ unidades$c$, true, null),
  ($c$M1-TRA-134$c$, $c$D$c$, $c$$10$ unidades$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-135$c$, $c$A$c$, $c$$(2, -5)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-135$c$, $c$B$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-135$c$, $c$C$c$, $c$$(-5, 2)$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-135$c$, $c$D$c$, $c$$(-2, -5)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-136$c$, $c$A$c$, $c$Ningún valor, porque los dos puntos tienen la misma ordenada.$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-136$c$, $c$B$c$, $c$$-7$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-136$c$, $c$C$c$, $c$$-5$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-136$c$, $c$D$c$, $c$$-3$$c$, true, null),
  ($c$M1-TRA-137$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-137$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-137$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-137$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-138$c$, $c$A$c$, $c$$(-8, 3)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-138$c$, $c$B$c$, $c$$(4, -7)$$c$, true, null),
  ($c$M1-TRA-138$c$, $c$C$c$, $c$$(4, -5)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-138$c$, $c$D$c$, $c$$(4, -3)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-139$c$, $c$A$c$, $c$$(-2, 2)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-139$c$, $c$B$c$, $c$$(-1, 4)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-139$c$, $c$C$c$, $c$$(-5, 2)$$c$, true, null),
  ($c$M1-TRA-139$c$, $c$D$c$, $c$$(1, 2)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-140$c$, $c$A$c$, $c$$(k - x,\ y)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-140$c$, $c$B$c$, $c$$(x,\ 2k - y)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-140$c$, $c$C$c$, $c$$(-x,\ y)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-140$c$, $c$D$c$, $c$$(2k - x,\ y)$$c$, true, null),
  ($c$M1-TRA-141$c$, $c$A$c$, $c$$a = -b$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-141$c$, $c$B$c$, $c$$a = b$$c$, true, null),
  ($c$M1-TRA-141$c$, $c$C$c$, $c$$a = b = 0$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-141$c$, $c$D$c$, $c$$b = 0$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-142$c$, $c$A$c$, $c$El eje $y$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-142$c$, $c$B$c$, $c$La recta $x = 2$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-142$c$, $c$C$c$, $c$La recta $x = 1$$c$, true, null),
  ($c$M1-TRA-142$c$, $c$D$c$, $c$La recta $y = 1$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-143$c$, $c$A$c$, $c$$(4, 4)$$c$, false, $c$TRA-REFREC-RECTAX$c$),
  ($c$M1-TRA-143$c$, $c$B$c$, $c$$(-2, -3)$$c$, false, $c$TRA-REFREC-RESTA$c$),
  ($c$M1-TRA-143$c$, $c$C$c$, $c$$(-2, -4)$$c$, false, $c$TRA-REFREC-EJE$c$),
  ($c$M1-TRA-143$c$, $c$D$c$, $c$$(-2, -2)$$c$, true, null),
  ($c$M1-TRA-144$c$, $c$A$c$, $c$$(4, 1)$$c$, true, null),
  ($c$M1-TRA-144$c$, $c$B$c$, $c$$(-4, -1)$$c$, false, $c$TRA-REFREC-DIAG$c$),
  ($c$M1-TRA-144$c$, $c$C$c$, $c$$(1, 4)$$c$, false, $c$TRA-REFEJE-AMBOS$c$),
  ($c$M1-TRA-144$c$, $c$D$c$, $c$$(-1, 4)$$c$, false, $c$TRA-REFREC-EJE$c$)
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
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-097$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-098$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-099$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-100$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-101$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-102$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-103$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-104$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-105$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-106$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-107$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-108$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-109$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-110$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-111$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-112$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-113$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-114$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-115$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-116$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-117$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-118$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-119$c$),
  ($c$GEO-TRA-REF-EJE$c$, $c$M1-TRA-120$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-121$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-122$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-123$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-124$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-125$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-126$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-127$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-128$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-129$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-130$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-131$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-132$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-133$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-134$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-135$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-136$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-137$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-138$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-139$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-140$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-141$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-142$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-143$c$),
  ($c$GEO-TRA-REF-REC$c$, $c$M1-TRA-144$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$TRA-REFEJE-CAMBIAEJE$c$, $c$En el eje x se conserva la x$c$, $c$Cambiaste la coordenada equivocada. Por ejemplo, reflejaste $(6, -2)$
respecto del eje $x$ y escribiste $(-6, -2)$.

**Al reflejar respecto del eje $x$, la $x$ se queda igual y cambia el
signo de la $y$. Respecto del eje $y$, al revés.**

El eje $x$ es horizontal. Para cruzarlo, el punto tiene que moverse
hacia arriba o hacia abajo, y eso cambia la $y$:

$$(6, -2) \to (6, 2)$$

El punto estaba $2$ unidades bajo el eje; su reflejo queda $2$
unidades arriba, en la misma vertical.

Un control rápido: el punto y su reflejo quedan en una línea
perpendicular al eje. Si reflejas en el eje $x$, están en la misma
vertical, así que tienen la misma $x$.$c$),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$TRA-REFEJE-AMBOS$c$, $c$En un eje cambia una sola coordenada$c$, $c$Cambiaste el signo de las dos coordenadas. Por ejemplo, reflejaste
$(6, -2)$ respecto del eje $x$ y escribiste $(-6, 2)$.

**Una reflexión en un eje cambia solo la coordenada perpendicular al
eje. La otra se queda igual.**

Respecto del eje $x$: $(6, -2) \to (6, 2)$. El punto no se mueve a la
izquierda ni a la derecha; solo cruza el eje.

Cambiar los dos signos lleva el punto al cuadrante opuesto, al otro
lado del **origen**. Esa es otra transformación, la simetría central.

Un control rápido: el punto y su reflejo en un eje siempre comparten
una coordenada.$c$),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$TRA-REFEJE-INTERCAMBIA$c$, $c$Reflejar en un eje no cambia el orden$c$, $c$Intercambiaste las coordenadas. Por ejemplo, reflejaste $(6, -2)$
respecto del eje $x$ y escribiste $(-2, 6)$.

**Al reflejar en un eje, cada coordenada se queda en su lugar: una se
conserva y la otra cambia de signo.**

Respecto del eje $x$: $(6, -2) \to (6, 2)$.

Intercambiar las coordenadas es reflejar respecto de la recta
diagonal $y = x$, no respecto de un eje. Si lo haces con un eje, el
punto termina en un lugar que no está a la misma distancia del eje.

Un control rápido: dibuja el punto y el eje. El reflejo tiene que
quedar en la línea perpendicular al eje que pasa por el punto.$c$),
  ($c$REM-TRA-REFEJE-TRASLADA$c$, $c$TRA-REFEJE-TRASLADA$c$, $c$El reflejo se da vuelta como en un espejo$c$, $c$Pasaste la figura al otro lado del eje sin darla vuelta, como si la
hubieras trasladado.

**En una reflexión cada punto queda a la misma distancia del eje, al
otro lado. Por eso la figura se invierte: lo que estaba cerca del eje
sigue cerca, y lo que estaba lejos sigue lejos.**

Si un triángulo tiene su ángulo recto pegado al eje $y$ y su punta
hacia la izquierda, su reflejo tiene el ángulo recto pegado al eje y
la punta hacia la derecha.

Una figura que aparece al otro lado mirando hacia el mismo lado fue
trasladada, no reflejada.

Un control rápido: refleja vértice por vértice, midiendo la distancia
de cada uno al eje, en vez de mover la figura entera.$c$),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$TRA-REFEJE-PROYECTA$c$, $c$El reflejo cruza el eje, no se queda en él$c$, $c$Llevaste el punto hasta el eje y te detuviste. Por ejemplo, reflejaste
$(6, -2)$ respecto del eje $x$ y escribiste $(6, 0)$.

**El reflejo queda al otro lado del eje, a la misma distancia que el
punto original.**

$(6, -2)$ está $2$ unidades bajo el eje $x$. Llegar al eje es recorrer
esas $2$ unidades; el reflejo está $2$ unidades más allá:

$$(6, -2) \to (6, 2)$$

Solo los puntos que ya están sobre el eje quedan en el eje.

Un control rápido: el eje tiene que quedar justo al medio entre el
punto y su reflejo.$c$),
  ($c$REM-TRA-REFREC-EJE$c$, $c$TRA-REFREC-EJE$c$, $c$Mide la distancia a la recta, no al eje$c$, $c$Reflejaste respecto del eje en vez de la recta que te dieron. Por
ejemplo, reflejaste $(7, 1)$ respecto de $x = 3$ y escribiste
$(-7, 1)$.

**Para reflejar respecto de $x = a$, el punto y su imagen quedan a la
misma distancia de esa recta, uno a cada lado.**

$(7, 1)$ está $4$ unidades a la derecha de $x = 3$. Su reflejo está $4$
unidades a la izquierda: en $x = 3 - 4 = -1$.

$$(7, 1) \to (-1, 1)$$

La fórmula es $x' = 2a - x$: $2 \cdot 3 - 7 = -1$. Cambiar solo el signo
sirve cuando la recta es el eje, $x = 0$.

Un control rápido: el promedio de $x$ y $x'$ tiene que dar $a$. Con
$-7$ quedaría $0$, que es el eje, no la recta.$c$),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$TRA-REFREC-RECTAX$c$, $c$La recta x = a es vertical$c$, $c$Trataste la recta como si fuera horizontal. Por ejemplo, reflejaste
$(7, 1)$ respecto de $x = 3$ y cambiaste la $y$.

**La recta $x = a$ reúne todos los puntos con abscisa $a$: es
vertical. La recta $y = b$ es horizontal.**

Como $x = 3$ es vertical, el reflejo se mueve en horizontal: cambia la
$x$ y la $y$ se queda igual.

$$(7, 1) \to (-1, 1)$$

Un control rápido: fíjate en qué letra aparece en la ecuación de la
recta. Esa es la coordenada que cambia al reflejar.$c$),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$TRA-REFREC-RESTA$c$, $c$El reflejo está a la misma distancia al otro lado$c$, $c$Calculaste la imagen restando la coordenada al valor de la recta. Por
ejemplo, para $(7, 1)$ respecto de $x = 3$ hiciste $3 - 7 = -4$.

**La imagen está al otro lado de la recta, a la misma distancia que el
punto: $x' = 2a - x$.**

$(7, 1)$ está a $7 - 3 = 4$ unidades de la recta. La imagen está $4$
unidades al otro lado: $3 - 4 = -1$.

$$x' = 2 \cdot 3 - 7 = -1$$

Con $-4$, la imagen quedaría a $7$ unidades de la recta, no a $4$.

Un control rápido: calcula la distancia de cada punto a la recta.
Tienen que dar lo mismo.$c$),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$TRA-REFREC-DIAG$c$, $c$En y = x solo se intercambia$c$, $c$Confundiste las rectas $y = x$ e $y = -x$. Por ejemplo, reflejaste
$(6, -1)$ respecto de $y = x$ y escribiste $(1, -6)$.

**Respecto de $y = x$ las coordenadas se intercambian y no cambian de
signo: $(x, y) \to (y, x)$. Respecto de $y = -x$ se intercambian y
cambian de signo: $(x, y) \to (-y, -x)$.**

$$(6, -1) \to (-1, 6) \quad \text{respecto de } y = x$$

Una forma de recordarlo: los puntos de $y = x$ son como $(2, 2)$ o
$(-3, -3)$, y al intercambiar no cambian. Así tiene que ser, porque
están sobre la recta.

Un control rápido: prueba tu regla con un punto de la recta. Si lo
mueve, es la regla equivocada.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$REM-TRA-REFEJE-AMBOS$c$, $c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$REM-TRA-REFEJE-TRASLADA$c$, $c$REM-TRA-REFEJE-PROYECTA$c$, $c$REM-TRA-REFREC-EJE$c$, $c$REM-TRA-REFREC-RECTAX$c$, $c$REM-TRA-REFREC-RESTA$c$, $c$REM-TRA-REFREC-DIAG$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-100$c$, 1::smallint),
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-101$c$, 2::smallint),
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-108$c$, 3::smallint),
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-109$c$, 4::smallint),
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-116$c$, 5::smallint),
  ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$M1-TRA-117$c$, 6::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-101$c$, 1::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-102$c$, 2::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-110$c$, 3::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-111$c$, 4::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-117$c$, 5::smallint),
  ($c$REM-TRA-REFEJE-AMBOS$c$, $c$M1-TRA-120$c$, 6::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-098$c$, 1::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-099$c$, 2::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-110$c$, 3::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-111$c$, 4::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-117$c$, 5::smallint),
  ($c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$M1-TRA-118$c$, 6::smallint),
  ($c$REM-TRA-REFEJE-TRASLADA$c$, $c$M1-TRA-100$c$, 1::smallint),
  ($c$REM-TRA-REFEJE-TRASLADA$c$, $c$M1-TRA-105$c$, 2::smallint),
  ($c$REM-TRA-REFEJE-TRASLADA$c$, $c$M1-TRA-115$c$, 3::smallint),
  ($c$REM-TRA-REFEJE-TRASLADA$c$, $c$M1-TRA-118$c$, 4::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-101$c$, 1::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-102$c$, 2::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-108$c$, 3::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-109$c$, 4::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-116$c$, 5::smallint),
  ($c$REM-TRA-REFEJE-PROYECTA$c$, $c$M1-TRA-119$c$, 6::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-124$c$, 1::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-125$c$, 2::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-132$c$, 3::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-133$c$, 4::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-140$c$, 5::smallint),
  ($c$REM-TRA-REFREC-EJE$c$, $c$M1-TRA-141$c$, 6::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-124$c$, 1::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-125$c$, 2::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-132$c$, 3::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-133$c$, 4::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-139$c$, 5::smallint),
  ($c$REM-TRA-REFREC-RECTAX$c$, $c$M1-TRA-140$c$, 6::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-124$c$, 1::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-125$c$, 2::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-133$c$, 3::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-134$c$, 4::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-140$c$, 5::smallint),
  ($c$REM-TRA-REFREC-RESTA$c$, $c$M1-TRA-142$c$, 6::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-127$c$, 1::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-128$c$, 2::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-132$c$, 3::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-135$c$, 4::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-141$c$, 5::smallint),
  ($c$REM-TRA-REFREC-DIAG$c$, $c$M1-TRA-144$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-GEO-TRA-03$c$, $c$GEO-TRA$c$, $c$Reflexiones$c$, $c$Una reflexión es lo que hace un espejo: cada punto aparece al otro lado
de una recta, a la misma distancia. Es la segunda isometría y la base de
la simetría de las figuras.

## Reflexión respecto de los ejes

### Qué hace una reflexión

Al reflejar un punto respecto de una recta (el **eje de simetría**), su
imagen queda al otro lado de la recta, **a la misma distancia**, sobre
la perpendicular que pasa por el punto.

![](fig:FIG-REF-EJE-04)

$P(1, 4)$ está $4$ unidades arriba del eje $x$. Su reflejo está $4$
unidades abajo, en la misma vertical: $P'(1, -4)$.

### Qué coordenada cambia

**Respecto del eje $x$, la abscisa se conserva y cambia el signo de la
ordenada: $(x, y) \to (x, -y)$.**

**Respecto del eje $y$, la ordenada se conserva y cambia el signo de la
abscisa: $(x, y) \to (-x, y)$.**

El error más común es cambiar la otra. Piénsalo así: al reflejar en el
eje $x$, el punto se mueve hacia arriba o hacia abajo, en vertical. Lo
que cambia es la coordenada vertical, la $y$. Por ejemplo, el reflejo de
$(5, -7)$ respecto del eje $y$ es $(-5, -7)$: se mueve en horizontal.

Cambiar los dos signos no es reflejar en un eje: eso es otra
transformación (la simetría respecto del origen, que verás en la clase
siguiente). Y cambiar el orden de las coordenadas tampoco: eso es
reflejar en la recta $y = x$.

Si el punto está sobre el eje, no se mueve: es su propio reflejo.

### La figura se da vuelta

Al reflejar una figura se refleja cada vértice. La imagen tiene la misma
forma y el mismo tamaño, pero **la orientación se invierte**, como en un
espejo: lo que miraba a la derecha queda mirando a la izquierda.

![](fig:FIG-REF-EJE-05)

Lo que estaba cerca del eje queda cerca del eje. Si la figura aparece al
otro lado pero apuntando igual, no es un reflejo: es una traslación.

## Reflexión respecto de una recta

### Rectas verticales y horizontales

La recta $x = a$ es **vertical**: todos sus puntos tienen abscisa $a$.
La recta $y = b$ es **horizontal**.

Para reflejar respecto de $x = a$, mide cuánto está el punto a un lado
de la recta y pon la imagen a la misma distancia al otro lado. La
ordenada no cambia.

![](fig:FIG-REF-REC-04)

$P(0, 4)$ está $2$ unidades a la derecha de $x = -2$. Su reflejo está
$2$ unidades a la izquierda: $P'(-4, 4)$.

**Respecto de $x = a$: $(x, y) \to (2a - x,\ y)$. Respecto de $y = b$:
$(x, y) \to (x,\ 2b - y)$.**

No uses la regla del eje: el eje $y$ es la recta $x = 0$, y solo ahí
basta cambiar el signo. Un control rápido: el punto y su imagen tienen
que quedar a la misma distancia de la recta, uno a cada lado.

### Las rectas y = x e y = −x

**Respecto de $y = x$, las coordenadas se intercambian:
$(x, y) \to (y, x)$.**

![](fig:FIG-REF-REC-05)

**Respecto de $y = -x$, se intercambian y cambian de signo:
$(x, y) \to (-y, -x)$.**

### Encontrar la recta de simetría

Si conoces un punto y su imagen, la recta de simetría pasa justo por el
medio. Si $A(-4, 1)$ y $A'(2, 1)$ tienen la misma ordenada, la recta es
vertical y pasa por el punto medio de sus abscisas: $x = -1$.$c$, 3::smallint)
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
  ($c$LES-GEO-TRA-03$c$, $c$GEO-TRA-REF-EJE$c$, 1::smallint, $c$reflexion-respecto-de-los-ejes$c$),
  ($c$LES-GEO-TRA-03$c$, $c$GEO-TRA-REF-REC$c$, 2::smallint, $c$reflexion-respecto-de-una-recta$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-TRA-097$c$, $c$M1-TRA-098$c$, $c$M1-TRA-099$c$, $c$M1-TRA-100$c$, $c$M1-TRA-101$c$, $c$M1-TRA-102$c$, $c$M1-TRA-103$c$, $c$M1-TRA-104$c$, $c$M1-TRA-105$c$, $c$M1-TRA-106$c$, $c$M1-TRA-107$c$, $c$M1-TRA-108$c$, $c$M1-TRA-109$c$, $c$M1-TRA-110$c$, $c$M1-TRA-111$c$, $c$M1-TRA-112$c$, $c$M1-TRA-113$c$, $c$M1-TRA-114$c$, $c$M1-TRA-115$c$, $c$M1-TRA-116$c$, $c$M1-TRA-117$c$, $c$M1-TRA-118$c$, $c$M1-TRA-119$c$, $c$M1-TRA-120$c$, $c$M1-TRA-121$c$, $c$M1-TRA-122$c$, $c$M1-TRA-123$c$, $c$M1-TRA-124$c$, $c$M1-TRA-125$c$, $c$M1-TRA-126$c$, $c$M1-TRA-127$c$, $c$M1-TRA-128$c$, $c$M1-TRA-129$c$, $c$M1-TRA-130$c$, $c$M1-TRA-131$c$, $c$M1-TRA-132$c$, $c$M1-TRA-133$c$, $c$M1-TRA-134$c$, $c$M1-TRA-135$c$, $c$M1-TRA-136$c$, $c$M1-TRA-137$c$, $c$M1-TRA-138$c$, $c$M1-TRA-139$c$, $c$M1-TRA-140$c$, $c$M1-TRA-141$c$, $c$M1-TRA-142$c$, $c$M1-TRA-143$c$, $c$M1-TRA-144$c$);
  if c <> 48 then
    raise exception 'items: se esperaban 48, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-097$c$, $c$M1-TRA-098$c$, $c$M1-TRA-099$c$, $c$M1-TRA-100$c$, $c$M1-TRA-101$c$, $c$M1-TRA-102$c$, $c$M1-TRA-103$c$, $c$M1-TRA-104$c$, $c$M1-TRA-105$c$, $c$M1-TRA-106$c$, $c$M1-TRA-107$c$, $c$M1-TRA-108$c$, $c$M1-TRA-109$c$, $c$M1-TRA-110$c$, $c$M1-TRA-111$c$, $c$M1-TRA-112$c$, $c$M1-TRA-113$c$, $c$M1-TRA-114$c$, $c$M1-TRA-115$c$, $c$M1-TRA-116$c$, $c$M1-TRA-117$c$, $c$M1-TRA-118$c$, $c$M1-TRA-119$c$, $c$M1-TRA-120$c$, $c$M1-TRA-121$c$, $c$M1-TRA-122$c$, $c$M1-TRA-123$c$, $c$M1-TRA-124$c$, $c$M1-TRA-125$c$, $c$M1-TRA-126$c$, $c$M1-TRA-127$c$, $c$M1-TRA-128$c$, $c$M1-TRA-129$c$, $c$M1-TRA-130$c$, $c$M1-TRA-131$c$, $c$M1-TRA-132$c$, $c$M1-TRA-133$c$, $c$M1-TRA-134$c$, $c$M1-TRA-135$c$, $c$M1-TRA-136$c$, $c$M1-TRA-137$c$, $c$M1-TRA-138$c$, $c$M1-TRA-139$c$, $c$M1-TRA-140$c$, $c$M1-TRA-141$c$, $c$M1-TRA-142$c$, $c$M1-TRA-143$c$, $c$M1-TRA-144$c$);
  if c <> 192 then
    raise exception 'item_options: se esperaban 192, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-097$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-098$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-099$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-100$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-101$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-102$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-103$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-104$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-105$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-106$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-107$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-108$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-109$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-110$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-111$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-112$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-113$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-114$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-115$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-116$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-117$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-118$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-119$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-120$c$, $c$GEO-TRA-REF-EJE$c$),
      ($c$M1-TRA-121$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-122$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-123$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-124$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-125$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-126$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-127$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-128$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-129$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-130$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-131$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-132$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-133$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-134$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-135$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-136$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-137$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-138$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-139$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-140$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-141$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-142$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-143$c$, $c$GEO-TRA-REF-REC$c$),
      ($c$M1-TRA-144$c$, $c$GEO-TRA-REF-REC$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 48 then
    raise exception 'node_items: 48 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-097$c$, $c$M1-TRA-098$c$, $c$M1-TRA-099$c$, $c$M1-TRA-100$c$, $c$M1-TRA-101$c$, $c$M1-TRA-102$c$, $c$M1-TRA-103$c$, $c$M1-TRA-104$c$, $c$M1-TRA-105$c$, $c$M1-TRA-106$c$, $c$M1-TRA-107$c$, $c$M1-TRA-108$c$, $c$M1-TRA-109$c$, $c$M1-TRA-110$c$, $c$M1-TRA-111$c$, $c$M1-TRA-112$c$, $c$M1-TRA-113$c$, $c$M1-TRA-114$c$, $c$M1-TRA-115$c$, $c$M1-TRA-116$c$, $c$M1-TRA-117$c$, $c$M1-TRA-118$c$, $c$M1-TRA-119$c$, $c$M1-TRA-120$c$, $c$M1-TRA-121$c$, $c$M1-TRA-122$c$, $c$M1-TRA-123$c$, $c$M1-TRA-124$c$, $c$M1-TRA-125$c$, $c$M1-TRA-126$c$, $c$M1-TRA-127$c$, $c$M1-TRA-128$c$, $c$M1-TRA-129$c$, $c$M1-TRA-130$c$, $c$M1-TRA-131$c$, $c$M1-TRA-132$c$, $c$M1-TRA-133$c$, $c$M1-TRA-134$c$, $c$M1-TRA-135$c$, $c$M1-TRA-136$c$, $c$M1-TRA-137$c$, $c$M1-TRA-138$c$, $c$M1-TRA-139$c$, $c$M1-TRA-140$c$, $c$M1-TRA-141$c$, $c$M1-TRA-142$c$, $c$M1-TRA-143$c$, $c$M1-TRA-144$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$PLA-COORD-CONTEO$c$, $c$PLA-COORD-ORDEN$c$, $c$TRA-REFEJE-AMBOS$c$, $c$TRA-REFEJE-CAMBIAEJE$c$, $c$TRA-REFEJE-INTERCAMBIA$c$, $c$TRA-REFEJE-PROYECTA$c$, $c$TRA-REFEJE-TRASLADA$c$, $c$TRA-REFREC-DIAG$c$, $c$TRA-REFREC-EJE$c$, $c$TRA-REFREC-RECTAX$c$, $c$TRA-REFREC-RESTA$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-100$c$, $c$FIG-REF-EJE-01$c$),
      ($c$M1-TRA-103$c$, $c$FIG-REF-EJE-02$c$),
      ($c$M1-TRA-110$c$, $c$FIG-REF-EJE-03$c$),
      ($c$M1-TRA-124$c$, $c$FIG-REF-REC-01$c$),
      ($c$M1-TRA-129$c$, $c$FIG-REF-REC-02$c$),
      ($c$M1-TRA-142$c$, $c$FIG-REF-REC-03$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 6 then
    raise exception 'figure_id: 6 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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

-- 48 ítems (48 curated), 192 alternativas, 11 misconceptions referenciadas,
-- 9 remediaciones, 10 figuras, 1 clase sobre 2 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 48 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-TRA-097$c$, $c$M1-TRA-098$c$, $c$M1-TRA-099$c$, $c$M1-TRA-100$c$, $c$M1-TRA-101$c$, $c$M1-TRA-102$c$, $c$M1-TRA-103$c$, $c$M1-TRA-104$c$, $c$M1-TRA-105$c$, $c$M1-TRA-106$c$, $c$M1-TRA-107$c$, $c$M1-TRA-108$c$, $c$M1-TRA-109$c$, $c$M1-TRA-110$c$, $c$M1-TRA-111$c$, $c$M1-TRA-112$c$, $c$M1-TRA-113$c$, $c$M1-TRA-114$c$, $c$M1-TRA-115$c$, $c$M1-TRA-116$c$, $c$M1-TRA-117$c$, $c$M1-TRA-118$c$, $c$M1-TRA-119$c$, $c$M1-TRA-120$c$, $c$M1-TRA-121$c$, $c$M1-TRA-122$c$, $c$M1-TRA-123$c$, $c$M1-TRA-124$c$, $c$M1-TRA-125$c$, $c$M1-TRA-126$c$, $c$M1-TRA-127$c$, $c$M1-TRA-128$c$, $c$M1-TRA-129$c$, $c$M1-TRA-130$c$, $c$M1-TRA-131$c$, $c$M1-TRA-132$c$, $c$M1-TRA-133$c$, $c$M1-TRA-134$c$, $c$M1-TRA-135$c$, $c$M1-TRA-136$c$, $c$M1-TRA-137$c$, $c$M1-TRA-138$c$, $c$M1-TRA-139$c$, $c$M1-TRA-140$c$, $c$M1-TRA-141$c$, $c$M1-TRA-142$c$, $c$M1-TRA-143$c$, $c$M1-TRA-144$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-TRA-REFEJE-CAMBIAEJE$c$, $c$REM-TRA-REFEJE-AMBOS$c$, $c$REM-TRA-REFEJE-INTERCAMBIA$c$, $c$REM-TRA-REFEJE-TRASLADA$c$, $c$REM-TRA-REFEJE-PROYECTA$c$, $c$REM-TRA-REFREC-EJE$c$, $c$REM-TRA-REFREC-RECTAX$c$, $c$REM-TRA-REFREC-RESTA$c$, $c$REM-TRA-REFREC-DIAG$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-GEO-TRA-03$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-TRA-097$c$, $c$M1-TRA-098$c$, $c$M1-TRA-099$c$, $c$M1-TRA-100$c$, $c$M1-TRA-101$c$, $c$M1-TRA-102$c$, $c$M1-TRA-103$c$, $c$M1-TRA-104$c$, $c$M1-TRA-105$c$, $c$M1-TRA-106$c$, $c$M1-TRA-107$c$, $c$M1-TRA-108$c$, $c$M1-TRA-109$c$, $c$M1-TRA-110$c$, $c$M1-TRA-111$c$, $c$M1-TRA-112$c$, $c$M1-TRA-113$c$, $c$M1-TRA-114$c$, $c$M1-TRA-115$c$, $c$M1-TRA-116$c$, $c$M1-TRA-117$c$, $c$M1-TRA-118$c$, $c$M1-TRA-119$c$, $c$M1-TRA-120$c$, $c$M1-TRA-121$c$, $c$M1-TRA-122$c$, $c$M1-TRA-123$c$, $c$M1-TRA-124$c$, $c$M1-TRA-125$c$, $c$M1-TRA-126$c$, $c$M1-TRA-127$c$, $c$M1-TRA-128$c$, $c$M1-TRA-129$c$, $c$M1-TRA-130$c$, $c$M1-TRA-131$c$, $c$M1-TRA-132$c$, $c$M1-TRA-133$c$, $c$M1-TRA-134$c$, $c$M1-TRA-135$c$, $c$M1-TRA-136$c$, $c$M1-TRA-137$c$, $c$M1-TRA-138$c$, $c$M1-TRA-139$c$, $c$M1-TRA-140$c$, $c$M1-TRA-141$c$, $c$M1-TRA-142$c$, $c$M1-TRA-143$c$, $c$M1-TRA-144$c$) group by 1;
