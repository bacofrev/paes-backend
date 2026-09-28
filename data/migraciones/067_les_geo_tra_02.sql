-- =====================================================================
-- LES-GEO-TRA-02 — Vectores y traslación
-- Generado por cargar_contenido.py desde LES-GEO-TRA-02.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-PLA-VEC-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 244" width="300" height="244" role="img" aria-label="Plano cartesiano con cuadrícula y un vector u dibujado como flecha." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="156" x2="272" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="104" y1="212" x2="104" y2="14" stroke-width="1.3"/>
  <polygon points="278,156 269,151.5 269,160.5" fill="currentColor" stroke="none"/>
  <polygon points="104,8 99.5,17 108.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="234" y1="152.5" x2="234" y2="159.5" stroke-width="1.3"/>
  <line x1="260" y1="152.5" x2="260" y2="159.5" stroke-width="1.3"/>
  <line x1="100.5" y1="208" x2="107.5" y2="208" stroke-width="1.3"/>
  <line x1="100.5" y1="182" x2="107.5" y2="182" stroke-width="1.3"/>
  <line x1="100.5" y1="130" x2="107.5" y2="130" stroke-width="1.3"/>
  <line x1="100.5" y1="104" x2="107.5" y2="104" stroke-width="1.3"/>
  <line x1="100.5" y1="78" x2="107.5" y2="78" stroke-width="1.3"/>
  <line x1="100.5" y1="52" x2="107.5" y2="52" stroke-width="1.3"/>
  <line x1="100.5" y1="26" x2="107.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-1,3" data-hasta="4,1" x1="78" y1="78" x2="199.64" y2="126.66" stroke-width="1.6"/>
  <polygon points="208,130 200.39,122.11 197.04,130.46" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="97" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="97" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="97" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="97" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="96" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="143" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 378 322" width="378" height="322" role="img" aria-label="Plano cartesiano con cuadrícula y cuatro vectores: a, b, c y d." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="312" y1="26" x2="312" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="338" y1="26" x2="338" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
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
  <line class="eje-x" x1="22" y1="156" x2="350" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="182" y1="290" x2="182" y2="14" stroke-width="1.3"/>
  <polygon points="356,156 347,151.5 347,160.5" fill="currentColor" stroke="none"/>
  <polygon points="182,8 177.5,17 186.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="234" y1="152.5" x2="234" y2="159.5" stroke-width="1.3"/>
  <line x1="260" y1="152.5" x2="260" y2="159.5" stroke-width="1.3"/>
  <line x1="286" y1="152.5" x2="286" y2="159.5" stroke-width="1.3"/>
  <line x1="312" y1="152.5" x2="312" y2="159.5" stroke-width="1.3"/>
  <line x1="338" y1="152.5" x2="338" y2="159.5" stroke-width="1.3"/>
  <line x1="178.5" y1="286" x2="185.5" y2="286" stroke-width="1.3"/>
  <line x1="178.5" y1="260" x2="185.5" y2="260" stroke-width="1.3"/>
  <line x1="178.5" y1="234" x2="185.5" y2="234" stroke-width="1.3"/>
  <line x1="178.5" y1="208" x2="185.5" y2="208" stroke-width="1.3"/>
  <line x1="178.5" y1="182" x2="185.5" y2="182" stroke-width="1.3"/>
  <line x1="178.5" y1="130" x2="185.5" y2="130" stroke-width="1.3"/>
  <line x1="178.5" y1="104" x2="185.5" y2="104" stroke-width="1.3"/>
  <line x1="178.5" y1="78" x2="185.5" y2="78" stroke-width="1.3"/>
  <line x1="178.5" y1="52" x2="185.5" y2="52" stroke-width="1.3"/>
  <line x1="178.5" y1="26" x2="185.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="5,-3" data-hasta="2,-1" x1="312" y1="234" x2="241.49" y2="186.99" stroke-width="1.6"/>
  <polygon points="234,182 239.82,191.29 244.82,183.8" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="-5,3" data-hasta="-2,1" x1="52" y1="78" x2="122.51" y2="125.01" stroke-width="1.6"/>
  <polygon points="130,130 124.18,120.71 119.18,128.2" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="2,4" data-hasta="4,1" x1="234" y1="52" x2="281.01" y2="122.51" stroke-width="1.6"/>
  <polygon points="286,130 284.2,119.18 276.71,124.18" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="-5,-4" data-hasta="-2,-2" x1="52" y1="260" x2="122.51" y2="212.99" stroke-width="1.6"/>
  <polygon points="130,208 119.18,209.8 124.18,217.29" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−6</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="286" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="312" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="338" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="175" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−5</text>
  <text x="175" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="175" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="175" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="175" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="175" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="175" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="175" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="175" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="175" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="174" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="354" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="273" y="222" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">a</text>
  <text x="91" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">b</text>
  <text x="273" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">c</text>
  <text x="91" y="221" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">d</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 222 166" width="222" height="166" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Hay un vector w dibujado como flecha." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="vector" data-desde="-4,2" data-hasta="4,-2" x1="52" y1="52" x2="147.95" y2="99.98" stroke-width="1.6"/>
  <polygon points="156,104 149.07,95.5 145.04,103.55" fill="currentColor" stroke="none"/>
  <text x="130" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="156" y="91" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="96" y="90" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="198" y="66" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="114" y="68" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">w</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 378 322" width="378" height="322" role="img" aria-label="Plano cartesiano con cuadrícula y cuatro vectores: a, b, c y d." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="312" y1="26" x2="312" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="338" y1="26" x2="338" y2="286" stroke-width="0.6" stroke-opacity="0.3"/>
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
  <line class="eje-x" x1="22" y1="182" x2="350" y2="182" stroke-width="1.3"/>
  <line class="eje-y" x1="208" y1="290" x2="208" y2="14" stroke-width="1.3"/>
  <polygon points="356,182 347,177.5 347,186.5" fill="currentColor" stroke="none"/>
  <polygon points="208,8 203.5,17 212.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="178.5" x2="26" y2="185.5" stroke-width="1.3"/>
  <line x1="52" y1="178.5" x2="52" y2="185.5" stroke-width="1.3"/>
  <line x1="78" y1="178.5" x2="78" y2="185.5" stroke-width="1.3"/>
  <line x1="104" y1="178.5" x2="104" y2="185.5" stroke-width="1.3"/>
  <line x1="130" y1="178.5" x2="130" y2="185.5" stroke-width="1.3"/>
  <line x1="156" y1="178.5" x2="156" y2="185.5" stroke-width="1.3"/>
  <line x1="182" y1="178.5" x2="182" y2="185.5" stroke-width="1.3"/>
  <line x1="234" y1="178.5" x2="234" y2="185.5" stroke-width="1.3"/>
  <line x1="260" y1="178.5" x2="260" y2="185.5" stroke-width="1.3"/>
  <line x1="286" y1="178.5" x2="286" y2="185.5" stroke-width="1.3"/>
  <line x1="312" y1="178.5" x2="312" y2="185.5" stroke-width="1.3"/>
  <line x1="338" y1="178.5" x2="338" y2="185.5" stroke-width="1.3"/>
  <line x1="204.5" y1="286" x2="211.5" y2="286" stroke-width="1.3"/>
  <line x1="204.5" y1="260" x2="211.5" y2="260" stroke-width="1.3"/>
  <line x1="204.5" y1="234" x2="211.5" y2="234" stroke-width="1.3"/>
  <line x1="204.5" y1="208" x2="211.5" y2="208" stroke-width="1.3"/>
  <line x1="204.5" y1="156" x2="211.5" y2="156" stroke-width="1.3"/>
  <line x1="204.5" y1="130" x2="211.5" y2="130" stroke-width="1.3"/>
  <line x1="204.5" y1="104" x2="211.5" y2="104" stroke-width="1.3"/>
  <line x1="204.5" y1="78" x2="211.5" y2="78" stroke-width="1.3"/>
  <line x1="204.5" y1="52" x2="211.5" y2="52" stroke-width="1.3"/>
  <line x1="204.5" y1="26" x2="211.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-5,2" data-hasta="-2,4" x1="78" y1="130" x2="148.51" y2="82.99" stroke-width="1.6"/>
  <polygon points="156,78 145.18,79.8 150.18,87.29" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="4,4" data-hasta="1,2" x1="312" y1="78" x2="241.49" y2="125.01" stroke-width="1.6"/>
  <polygon points="234,130 244.82,128.2 239.82,120.71" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="1,-3" data-hasta="4,-1" x1="234" y1="260" x2="304.51" y2="212.99" stroke-width="1.6"/>
  <polygon points="312,208 301.18,209.8 306.18,217.29" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="-6,5" data-hasta="-2,4" x1="52" y1="52" x2="147.27" y2="75.82" stroke-width="1.6"/>
  <polygon points="156,78 147.39,71.21 145.21,79.94" fill="currentColor" stroke="none"/>
  <text x="26" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−7</text>
  <text x="52" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−6</text>
  <text x="78" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="104" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="130" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="156" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="182" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="234" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="260" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="286" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="312" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="338" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="201" y="286" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="201" y="260" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="201" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="201" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="201" y="156" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="201" y="130" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="201" y="104" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="201" y="78" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="201" y="52" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="201" y="26" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="200" y="194" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="354" y="170" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="220" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="117" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">a</text>
  <text x="273" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">b</text>
  <text x="273" y="221" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">c</text>
  <text x="104" y="52" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">d</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 192" width="274" height="192" role="img" aria-label="Plano cartesiano con cuadrícula y un vector v horizontal." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="234" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="234" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="234" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="234" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="234" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="246" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="160" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="252,130 243,125.5 243,134.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="130" y1="126.5" x2="130" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="234" y1="126.5" x2="234" y2="133.5" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-4,2" data-hasta="1,2" x1="52" y1="78" x2="173" y2="78" stroke-width="1.6"/>
  <polygon points="182,78 172,73.5 172,82.5" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="117" y="65" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 244" width="300" height="244" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados en lugares distintos." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="156" x2="272" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="212" x2="130" y2="14" stroke-width="1.3"/>
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
  <line x1="126.5" y1="208" x2="133.5" y2="208" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-3,-1" data-hasta="0,1" x1="52" y1="182" x2="122.51" y2="134.99" stroke-width="1.6"/>
  <polygon points="130,130 119.18,131.8 124.18,139.29" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="1,2" data-hasta="4,4" x1="156" y1="104" x2="226.51" y2="56.99" stroke-width="1.6"/>
  <polygon points="234,52 223.18,53.8 228.18,61.29" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="260" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
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
  <text x="81" y="146" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="185" y="68" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 192" width="248" height="192" role="img" aria-label="El vector v va del punto A al punto B. Punteado, el camino horizontal de 5 unidades a la derecha y el vertical de 3 hacia arriba: v = (5, 3)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="vector" data-desde="-2,-1" data-hasta="3,2" x1="52" y1="130" x2="174.28" y2="56.63" stroke-width="1.6"/>
  <polygon points="182,52 171.11,53.29 175.74,61" fill="currentColor" stroke="none"/>
  <line class="segmento" x1="52" y1="130" x2="182" y2="130" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="182" y1="130" x2="182" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <circle class="punto" data-nombre="A" data-x="-2" data-y="-1" cx="52" cy="130" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="3" data-y="2" cx="182" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="52" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="78" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="208" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="97" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="97" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="97" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="97" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="97" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="96" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="116" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="107" y="81" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
  <text x="42" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="192" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="117" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">5 a la derecha</text>
  <text x="208" y="91" font-size="12" text-anchor="middle" dominant-baseline="central">3</text>
</svg>
$c$),
  ($c$FIG-PLA-VEC-08$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 244" width="326" height="244" role="img" aria-label="Tres flechas p, q y r que parten de puntos distintos, todas 3 unidades a la derecha y 1 hacia abajo: representan el mismo vector (3, −1)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="298" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="212" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-4,-2" data-hasta="-1,-3" x1="52" y1="182" x2="121.46" y2="205.15" stroke-width="1.6"/>
  <polygon points="130,208 121.94,200.57 119.09,209.11" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="0,1" data-hasta="3,0" x1="156" y1="104" x2="225.46" y2="127.15" stroke-width="1.6"/>
  <polygon points="234,130 225.94,122.57 223.09,131.11" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="1,-2" data-hasta="4,-3" x1="182" y1="182" x2="251.46" y2="205.15" stroke-width="1.6"/>
  <polygon points="260,208 251.94,200.57 249.09,209.11" fill="currentColor" stroke="none"/>
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
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="91" y="182" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">p</text>
  <text x="195" y="104" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">q</text>
  <text x="221" y="182" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">r</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 244" width="326" height="244" role="img" aria-label="Plano cartesiano con el triángulo ABC y su imagen A'B'C' por una traslación." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="298" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="212" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-4,1;B=-2,1;C=-4,3" points="52,104 104,104 52,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-4" data-y="1" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="-2" data-y="1" cx="104" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="-4" data-y="3" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <polygon class="figura" data-vertices="A'=1,-1;B'=3,-1;C'=1,1" points="182,156 234,156 182,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A'" data-x="1" data-y="-1" cx="182" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B'" data-x="3" data-y="-1" cx="234" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C'" data-x="1" data-y="1" cx="182" cy="104" r="3.2" fill="currentColor" stroke="none"/>
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
  <text x="149" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="114" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="42" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="172" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">A'</text>
  <text x="244" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">B'</text>
  <text x="172" y="94" font-size="14" text-anchor="middle" dominant-baseline="central">C'</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 456 296" width="456" height="296" role="img" aria-label="Plano cartesiano con la figura F y cuatro figuras numeradas del 1 al 4." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="338" y1="26" x2="338" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="364" y1="26" x2="364" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="390" y1="26" x2="390" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="416" y1="26" x2="416" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="260" x2="416" y2="260" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="234" x2="416" y2="234" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="208" x2="416" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="416" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="416" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="416" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="416" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="416" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="416" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="416" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="234" x2="428" y2="234" stroke-width="1.3"/>
  <line class="eje-y" x1="234" y1="264" x2="234" y2="14" stroke-width="1.3"/>
  <polygon points="434,234 425,229.5 425,238.5" fill="currentColor" stroke="none"/>
  <polygon points="234,8 229.5,17 238.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="230.5" x2="26" y2="237.5" stroke-width="1.3"/>
  <line x1="52" y1="230.5" x2="52" y2="237.5" stroke-width="1.3"/>
  <line x1="78" y1="230.5" x2="78" y2="237.5" stroke-width="1.3"/>
  <line x1="104" y1="230.5" x2="104" y2="237.5" stroke-width="1.3"/>
  <line x1="130" y1="230.5" x2="130" y2="237.5" stroke-width="1.3"/>
  <line x1="156" y1="230.5" x2="156" y2="237.5" stroke-width="1.3"/>
  <line x1="182" y1="230.5" x2="182" y2="237.5" stroke-width="1.3"/>
  <line x1="208" y1="230.5" x2="208" y2="237.5" stroke-width="1.3"/>
  <line x1="260" y1="230.5" x2="260" y2="237.5" stroke-width="1.3"/>
  <line x1="286" y1="230.5" x2="286" y2="237.5" stroke-width="1.3"/>
  <line x1="312" y1="230.5" x2="312" y2="237.5" stroke-width="1.3"/>
  <line x1="338" y1="230.5" x2="338" y2="237.5" stroke-width="1.3"/>
  <line x1="364" y1="230.5" x2="364" y2="237.5" stroke-width="1.3"/>
  <line x1="390" y1="230.5" x2="390" y2="237.5" stroke-width="1.3"/>
  <line x1="416" y1="230.5" x2="416" y2="237.5" stroke-width="1.3"/>
  <line x1="230.5" y1="260" x2="237.5" y2="260" stroke-width="1.3"/>
  <line x1="230.5" y1="208" x2="237.5" y2="208" stroke-width="1.3"/>
  <line x1="230.5" y1="182" x2="237.5" y2="182" stroke-width="1.3"/>
  <line x1="230.5" y1="156" x2="237.5" y2="156" stroke-width="1.3"/>
  <line x1="230.5" y1="130" x2="237.5" y2="130" stroke-width="1.3"/>
  <line x1="230.5" y1="104" x2="237.5" y2="104" stroke-width="1.3"/>
  <line x1="230.5" y1="78" x2="237.5" y2="78" stroke-width="1.3"/>
  <line x1="230.5" y1="52" x2="237.5" y2="52" stroke-width="1.3"/>
  <line x1="230.5" y1="26" x2="237.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="=-3,3;=-1,3;=-3,5" points="156,156 208,156 156,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=1,1;=3,1;=1,3" points="260,208 312,208 260,156" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=6,3;=4,3;=6,1" points="390,156 338,156 390,208" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-7,5;=-5,5;=-7,7" points="52,104 104,104 52,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=1,5;=3,5;=1,7" points="260,104 312,104 260,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="226" y="246" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="432" y="222" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="246" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="164.67" y="147.33" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="268.67" y="199.33" font-size="13" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="364" y="182" font-size="13" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="60.67" y="95.33" font-size="13" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="268.67" y="95.33" font-size="13" text-anchor="middle" dominant-baseline="central">4</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 296" width="352" height="296" role="img" aria-label="Plano cartesiano con el cuadrilátero F y el cuadrilátero F', que es su imagen por una traslación." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <polygon class="figura" data-vertices="=2,-4;=4,-4;=5,-2;=3,-2" points="208,234 260,234 286,182 234,182" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon class="figura" data-vertices="=-4,1;=-2,1;=-1,3;=-3,3" points="52,104 104,104 130,52 78,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
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
  <text x="247" y="208" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F</text>
  <text x="91" y="78" font-size="13" text-anchor="middle" dominant-baseline="central" font-style="italic">F'</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 218" width="300" height="218" role="img" aria-label="Plano cartesiano con cuadrícula. En cada eje están rotulados solo el 2 y el 4. Están el triángulo ABC y su imagen A'B'C' por una traslación." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="272" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="278,130 269,125.5 269,134.5" fill="currentColor" stroke="none"/>
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
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-8,2;B=-4,2;C=-8,6" points="52,104 104,104 52,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-8" data-y="2" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="-4" data-y="2" cx="104" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="-8" data-y="6" cx="52" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <polygon class="figura" data-vertices="A'=2,-2;B'=6,-2;C'=2,2" points="182,156 234,156 182,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A'" data-x="2" data-y="-2" cx="182" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B'" data-x="6" data-y="-2" cx="234" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C'" data-x="2" data-y="2" cx="182" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="114" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="42" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="172" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">A'</text>
  <text x="244" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">B'</text>
  <text x="172" y="94" font-size="14" text-anchor="middle" dominant-baseline="central">C'</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 218" width="248" height="218" role="img" aria-label="Plano cartesiano con cuadrícula y el punto P' marcado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-y" x1="130" y1="186" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="226,156 217,151.5 217,160.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="156" y1="152.5" x2="156" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="126.5" y1="182" x2="133.5" y2="182" stroke-width="1.3"/>
  <line x1="126.5" y1="130" x2="133.5" y2="130" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <circle class="punto" data-nombre="P'" data-x="-1" data-y="4" cx="104" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="123" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="122" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="94" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 218" width="300" height="218" role="img" aria-label="El triángulo ABC se traslada según el vector (5, 2). Cada vértice se mueve 5 a la derecha y 2 hacia arriba: los segmentos punteados que unen cada vértice con su imagen son iguales y paralelos." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="272" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="278,130 269,125.5 269,134.5" fill="currentColor" stroke="none"/>
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
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <polygon class="figura" data-vertices="A=-4,-1;B=-2,-1;C=-2,1" points="52,156 104,156 104,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A" data-x="-4" data-y="-1" cx="52" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B" data-x="-2" data-y="-1" cx="104" cy="156" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C" data-x="-2" data-y="1" cx="104" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <polygon class="figura" data-vertices="A'=1,1;B'=3,1;C'=3,3" points="182,104 234,104 234,52" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <circle class="punto" data-nombre="A'" data-x="1" data-y="1" cx="182" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="B'" data-x="3" data-y="1" cx="234" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="C'" data-x="3" data-y="3" cx="234" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <line class="segmento" x1="52" y1="156" x2="182" y2="104" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="104" y1="156" x2="234" y2="104" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="104" y1="104" x2="234" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="148" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="42" y="167" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="104" y="170" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="94" y="94" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="182" y="118" font-size="14" text-anchor="middle" dominant-baseline="central">A'</text>
  <text x="244" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">B'</text>
  <text x="234" y="39" font-size="14" text-anchor="middle" dominant-baseline="central">C'</text>
</svg>
$c$),
  ($c$FIG-TRA-TRAS-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 192" width="248" height="192" role="img" aria-label="El punto P se traslada según v = (4, 2) y llega a P'. Para volver de P' a P se usa el vector opuesto, (−4, −2)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="130" x2="220" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="130" y1="160" x2="130" y2="14" stroke-width="1.3"/>
  <polygon points="226,130 217,125.5 217,134.5" fill="currentColor" stroke="none"/>
  <polygon points="130,8 125.5,17 134.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="126.5" x2="26" y2="133.5" stroke-width="1.3"/>
  <line x1="52" y1="126.5" x2="52" y2="133.5" stroke-width="1.3"/>
  <line x1="78" y1="126.5" x2="78" y2="133.5" stroke-width="1.3"/>
  <line x1="104" y1="126.5" x2="104" y2="133.5" stroke-width="1.3"/>
  <line x1="156" y1="126.5" x2="156" y2="133.5" stroke-width="1.3"/>
  <line x1="182" y1="126.5" x2="182" y2="133.5" stroke-width="1.3"/>
  <line x1="208" y1="126.5" x2="208" y2="133.5" stroke-width="1.3"/>
  <line x1="126.5" y1="156" x2="133.5" y2="156" stroke-width="1.3"/>
  <line x1="126.5" y1="104" x2="133.5" y2="104" stroke-width="1.3"/>
  <line x1="126.5" y1="78" x2="133.5" y2="78" stroke-width="1.3"/>
  <line x1="126.5" y1="52" x2="133.5" y2="52" stroke-width="1.3"/>
  <line x1="126.5" y1="26" x2="133.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-3,1" data-hasta="1,3" x1="52" y1="104" x2="147.95" y2="56.02" stroke-width="1.6"/>
  <polygon points="156,52 145.04,52.45 149.07,60.5" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P" data-x="-3" data-y="1" cx="52" cy="104" r="3.2" fill="currentColor" stroke="none"/>
  <circle class="punto" data-nombre="P'" data-x="1" data-y="3" cx="156" cy="52" r="3.2" fill="currentColor" stroke="none"/>
  <text x="26" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="52" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="78" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="104" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="156" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="182" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="208" y="143" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="123" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="123" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="123" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="123" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="123" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="122" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="142" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="94" y="68" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
  <text x="42" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">P</text>
  <text x="166" y="42" font-size="14" text-anchor="middle" dominant-baseline="central">P'</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 244" width="352" height="244" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por separado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line x1="26" y1="208" x2="312" y2="208" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="182" x2="312" y2="182" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="312" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="312" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="312" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="312" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="312" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="312" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="130" x2="324" y2="130" stroke-width="1.3"/>
  <line class="eje-y" x1="182" y1="212" x2="182" y2="14" stroke-width="1.3"/>
  <polygon points="330,130 321,125.5 321,134.5" fill="currentColor" stroke="none"/>
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
  <line x1="178.5" y1="208" x2="185.5" y2="208" stroke-width="1.3"/>
  <line x1="178.5" y1="182" x2="185.5" y2="182" stroke-width="1.3"/>
  <line x1="178.5" y1="156" x2="185.5" y2="156" stroke-width="1.3"/>
  <line x1="178.5" y1="104" x2="185.5" y2="104" stroke-width="1.3"/>
  <line x1="178.5" y1="78" x2="185.5" y2="78" stroke-width="1.3"/>
  <line x1="178.5" y1="52" x2="185.5" y2="52" stroke-width="1.3"/>
  <line x1="178.5" y1="26" x2="185.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-5,-2" data-hasta="-3,1" x1="52" y1="182" x2="99.01" y2="111.49" stroke-width="1.6"/>
  <polygon points="104,104 94.71,109.82 102.2,114.82" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="0,2" data-hasta="4,1" x1="182" y1="78" x2="277.27" y2="101.82" stroke-width="1.6"/>
  <polygon points="286,104 277.39,97.21 275.21,105.94" fill="currentColor" stroke="none"/>
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
  <text x="175" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="175" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="175" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="175" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="175" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="175" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="175" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="174" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="328" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="65" y="143" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="234" y="78" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 248 218" width="248" height="218" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, que parten del mismo punto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="104" x2="220" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="52" y1="186" x2="52" y2="14" stroke-width="1.3"/>
  <polygon points="226,104 217,99.5 217,108.5" fill="currentColor" stroke="none"/>
  <polygon points="52,8 47.5,17 56.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="78" y1="100.5" x2="78" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="208" y1="100.5" x2="208" y2="107.5" stroke-width="1.3"/>
  <line x1="48.5" y1="182" x2="55.5" y2="182" stroke-width="1.3"/>
  <line x1="48.5" y1="156" x2="55.5" y2="156" stroke-width="1.3"/>
  <line x1="48.5" y1="130" x2="55.5" y2="130" stroke-width="1.3"/>
  <line x1="48.5" y1="78" x2="55.5" y2="78" stroke-width="1.3"/>
  <line x1="48.5" y1="52" x2="55.5" y2="52" stroke-width="1.3"/>
  <line x1="48.5" y1="26" x2="55.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="2,-1" data-hasta="5,-2" x1="104" y1="130" x2="173.46" y2="153.15" stroke-width="1.6"/>
  <polygon points="182,156 173.94,148.57 171.09,157.11" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="2,-1" data-hasta="1,2" x1="104" y1="130" x2="80.85" y2="60.54" stroke-width="1.6"/>
  <polygon points="78,52 76.89,62.91 85.43,60.06" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="78" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="208" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="45" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="45" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="45" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="45" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="45" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="45" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="44" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="224" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="64" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="143" y="157" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="78" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 270" width="326" height="270" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por separado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="156" x2="298" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="238" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="234" x2="159.5" y2="234" stroke-width="1.3"/>
  <line x1="152.5" y1="208" x2="159.5" y2="208" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-4,1" data-hasta="-3,4" x1="52" y1="130" x2="75.15" y2="60.54" stroke-width="1.6"/>
  <polygon points="78,52 70.57,60.06 79.11,62.91" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="0,-2" data-hasta="4,-1" x1="156" y1="208" x2="251.27" y2="184.18" stroke-width="1.6"/>
  <polygon points="260,182 249.21,180.06 251.39,188.79" fill="currentColor" stroke="none"/>
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
  <text x="52" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="208" y="209" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 192" width="300" height="192" role="img" aria-label="Plano cartesiano con cuadrícula. El vector u va del punto A al punto B, y el vector v va de B al punto C." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="26" y1="26" x2="26" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="52" y1="26" x2="52" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="78" y1="26" x2="78" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="104" y1="26" x2="104" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="130" y1="26" x2="130" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="156" y1="26" x2="156" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="182" y1="26" x2="182" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="208" y1="26" x2="208" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="234" y1="26" x2="234" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="260" y1="26" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="156" x2="260" y2="156" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="130" x2="260" y2="130" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="104" x2="260" y2="104" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="78" x2="260" y2="78" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="52" x2="260" y2="52" stroke-width="0.6" stroke-opacity="0.3"/>
  <line x1="26" y1="26" x2="260" y2="26" stroke-width="0.6" stroke-opacity="0.3"/>
  <line class="eje-x" x1="22" y1="104" x2="272" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="160" x2="156" y2="14" stroke-width="1.3"/>
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
  <line x1="152.5" y1="156" x2="159.5" y2="156" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-4,-1" data-hasta="-1,2" x1="52" y1="130" x2="123.64" y2="58.36" stroke-width="1.6"/>
  <polygon points="130,52 119.75,55.89 126.11,62.25" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="-1,2" data-hasta="3,0" x1="130" y1="52" x2="225.95" y2="99.98" stroke-width="1.6"/>
  <polygon points="234,104 227.07,95.5 223.04,103.55" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="260" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="149" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="148" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="276" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="81" y="81" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="182" y="65" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
  <text x="42" y="141" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="130" y="39" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="244" y="115" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 222 218" width="222" height="218" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, que parten del mismo punto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="104" x2="194" y2="104" stroke-width="1.3"/>
  <line class="eje-y" x1="78" y1="186" x2="78" y2="14" stroke-width="1.3"/>
  <polygon points="200,104 191,99.5 191,108.5" fill="currentColor" stroke="none"/>
  <polygon points="78,8 73.5,17 82.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="100.5" x2="26" y2="107.5" stroke-width="1.3"/>
  <line x1="52" y1="100.5" x2="52" y2="107.5" stroke-width="1.3"/>
  <line x1="104" y1="100.5" x2="104" y2="107.5" stroke-width="1.3"/>
  <line x1="130" y1="100.5" x2="130" y2="107.5" stroke-width="1.3"/>
  <line x1="156" y1="100.5" x2="156" y2="107.5" stroke-width="1.3"/>
  <line x1="182" y1="100.5" x2="182" y2="107.5" stroke-width="1.3"/>
  <line x1="74.5" y1="182" x2="81.5" y2="182" stroke-width="1.3"/>
  <line x1="74.5" y1="156" x2="81.5" y2="156" stroke-width="1.3"/>
  <line x1="74.5" y1="130" x2="81.5" y2="130" stroke-width="1.3"/>
  <line x1="74.5" y1="78" x2="81.5" y2="78" stroke-width="1.3"/>
  <line x1="74.5" y1="52" x2="81.5" y2="52" stroke-width="1.3"/>
  <line x1="74.5" y1="26" x2="81.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="1,-1" data-hasta="3,-2" x1="104" y1="130" x2="147.95" y2="151.98" stroke-width="1.6"/>
  <polygon points="156,156 149.07,147.5 145.04,155.55" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="1,-1" data-hasta="0,2" x1="104" y1="130" x2="80.85" y2="60.54" stroke-width="1.6"/>
  <polygon points="78,52 76.89,62.91 85.43,60.06" fill="currentColor" stroke="none"/>
  <text x="26" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="52" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="104" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="130" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="156" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="182" y="117" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="71" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="71" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="71" y="130" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="71" y="78" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="71" y="52" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="71" y="26" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="70" y="116" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="198" y="92" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="90" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="130" y="157" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="78" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 270" width="326" height="270" role="img" aria-label="Plano cartesiano con cuadrícula y dos vectores, u y v, dibujados por separado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-y" x1="182" y1="238" x2="182" y2="14" stroke-width="1.3"/>
  <polygon points="304,130 295,125.5 295,134.5" fill="currentColor" stroke="none"/>
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
  <line x1="178.5" y1="234" x2="185.5" y2="234" stroke-width="1.3"/>
  <line x1="178.5" y1="208" x2="185.5" y2="208" stroke-width="1.3"/>
  <line x1="178.5" y1="182" x2="185.5" y2="182" stroke-width="1.3"/>
  <line x1="178.5" y1="156" x2="185.5" y2="156" stroke-width="1.3"/>
  <line x1="178.5" y1="104" x2="185.5" y2="104" stroke-width="1.3"/>
  <line x1="178.5" y1="78" x2="185.5" y2="78" stroke-width="1.3"/>
  <line x1="178.5" y1="52" x2="185.5" y2="52" stroke-width="1.3"/>
  <line x1="178.5" y1="26" x2="185.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-5,2" data-hasta="-1,3" x1="52" y1="78" x2="147.27" y2="54.18" stroke-width="1.6"/>
  <polygon points="156,52 145.21,50.06 147.39,58.79" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="1,-3" data-hasta="2,0" x1="208" y1="208" x2="231.15" y2="138.54" stroke-width="1.6"/>
  <polygon points="234,130 226.57,138.06 235.11,140.91" fill="currentColor" stroke="none"/>
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
  <text x="175" y="234" font-size="11" text-anchor="end" dominant-baseline="central">−4</text>
  <text x="175" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−3</text>
  <text x="175" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−2</text>
  <text x="175" y="156" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="175" y="104" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="175" y="78" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="175" y="52" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="175" y="26" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="174" y="142" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="118" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="194" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="104" y="52" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="234" y="169" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 274 218" width="274" height="218" role="img" aria-label="El vector v se dibuja a continuación de u. El vector u + v va desde el inicio de u hasta el final de v: u = (1, 3), v = (4, −1), u + v = (5, 2)." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-x" x1="22" y1="156" x2="246" y2="156" stroke-width="1.3"/>
  <line class="eje-y" x1="156" y1="186" x2="156" y2="14" stroke-width="1.3"/>
  <polygon points="252,156 243,151.5 243,160.5" fill="currentColor" stroke="none"/>
  <polygon points="156,8 151.5,17 160.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="152.5" x2="26" y2="159.5" stroke-width="1.3"/>
  <line x1="52" y1="152.5" x2="52" y2="159.5" stroke-width="1.3"/>
  <line x1="78" y1="152.5" x2="78" y2="159.5" stroke-width="1.3"/>
  <line x1="104" y1="152.5" x2="104" y2="159.5" stroke-width="1.3"/>
  <line x1="130" y1="152.5" x2="130" y2="159.5" stroke-width="1.3"/>
  <line x1="182" y1="152.5" x2="182" y2="159.5" stroke-width="1.3"/>
  <line x1="208" y1="152.5" x2="208" y2="159.5" stroke-width="1.3"/>
  <line x1="234" y1="152.5" x2="234" y2="159.5" stroke-width="1.3"/>
  <line x1="152.5" y1="182" x2="159.5" y2="182" stroke-width="1.3"/>
  <line x1="152.5" y1="130" x2="159.5" y2="130" stroke-width="1.3"/>
  <line x1="152.5" y1="104" x2="159.5" y2="104" stroke-width="1.3"/>
  <line x1="152.5" y1="78" x2="159.5" y2="78" stroke-width="1.3"/>
  <line x1="152.5" y1="52" x2="159.5" y2="52" stroke-width="1.3"/>
  <line x1="152.5" y1="26" x2="159.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="-4,1" data-hasta="-3,4" x1="52" y1="130" x2="75.15" y2="60.54" stroke-width="1.6"/>
  <polygon points="78,52 70.57,60.06 79.11,62.91" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="-3,4" data-hasta="1,3" x1="78" y1="52" x2="173.27" y2="75.82" stroke-width="1.6"/>
  <polygon points="182,78 173.39,71.21 171.21,79.94" fill="currentColor" stroke="none"/>
  <line class="suma" data-desde="-4,1" data-hasta="1,3" x1="52" y1="130" x2="173.64" y2="81.34" stroke-width="1.6"/>
  <polygon points="182,78 171.04,77.54 174.39,85.89" fill="currentColor" stroke="none"/>
  <text x="26" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−5</text>
  <text x="52" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−4</text>
  <text x="78" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−3</text>
  <text x="104" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−2</text>
  <text x="130" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="182" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="208" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="234" y="169" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="149" y="182" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="149" y="130" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="149" y="104" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="149" y="78" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="149" y="52" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="149" y="26" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="148" y="168" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="250" y="144" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="168" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="52" y="91" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="130" y="52" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
  <text x="117" y="118" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u + v</text>
</svg>
$c$),
  ($c$FIG-VEC-OP-08$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 326 244" width="326" height="244" role="img" aria-label="Los vectores u y v parten del mismo punto. Con copias punteadas se completa un paralelogramo; su diagonal desde el punto común es u + v." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
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
  <line class="eje-y" x1="52" y1="212" x2="52" y2="14" stroke-width="1.3"/>
  <polygon points="304,182 295,177.5 295,186.5" fill="currentColor" stroke="none"/>
  <polygon points="52,8 47.5,17 56.5,17" fill="currentColor" stroke="none"/>
  <line x1="26" y1="178.5" x2="26" y2="185.5" stroke-width="1.3"/>
  <line x1="78" y1="178.5" x2="78" y2="185.5" stroke-width="1.3"/>
  <line x1="104" y1="178.5" x2="104" y2="185.5" stroke-width="1.3"/>
  <line x1="130" y1="178.5" x2="130" y2="185.5" stroke-width="1.3"/>
  <line x1="156" y1="178.5" x2="156" y2="185.5" stroke-width="1.3"/>
  <line x1="182" y1="178.5" x2="182" y2="185.5" stroke-width="1.3"/>
  <line x1="208" y1="178.5" x2="208" y2="185.5" stroke-width="1.3"/>
  <line x1="234" y1="178.5" x2="234" y2="185.5" stroke-width="1.3"/>
  <line x1="260" y1="178.5" x2="260" y2="185.5" stroke-width="1.3"/>
  <line x1="286" y1="178.5" x2="286" y2="185.5" stroke-width="1.3"/>
  <line x1="48.5" y1="208" x2="55.5" y2="208" stroke-width="1.3"/>
  <line x1="48.5" y1="156" x2="55.5" y2="156" stroke-width="1.3"/>
  <line x1="48.5" y1="130" x2="55.5" y2="130" stroke-width="1.3"/>
  <line x1="48.5" y1="104" x2="55.5" y2="104" stroke-width="1.3"/>
  <line x1="48.5" y1="78" x2="55.5" y2="78" stroke-width="1.3"/>
  <line x1="48.5" y1="52" x2="55.5" y2="52" stroke-width="1.3"/>
  <line x1="48.5" y1="26" x2="55.5" y2="26" stroke-width="1.3"/>
  <line class="vector" data-desde="2,1" data-hasta="7,2" x1="104" y1="156" x2="225.17" y2="131.77" stroke-width="1.6"/>
  <polygon points="234,130 223.31,127.55 225.08,136.37" fill="currentColor" stroke="none"/>
  <line class="vector" data-desde="2,1" data-hasta="3,4" x1="104" y1="156" x2="127.15" y2="86.54" stroke-width="1.6"/>
  <polygon points="130,78 122.57,86.06 131.11,88.91" fill="currentColor" stroke="none"/>
  <line class="segmento" x1="234" y1="130" x2="260" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="segmento" x1="130" y1="78" x2="260" y2="52" stroke-width="1.2" stroke-dasharray="4 3"/>
  <line class="suma" data-desde="2,1" data-hasta="8,5" x1="104" y1="156" x2="252.51" y2="56.99" stroke-width="1.6"/>
  <polygon points="260,52 249.18,53.8 254.18,61.29" fill="currentColor" stroke="none"/>
  <text x="26" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">−1</text>
  <text x="78" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">1</text>
  <text x="104" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">2</text>
  <text x="130" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">3</text>
  <text x="156" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">4</text>
  <text x="182" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">5</text>
  <text x="208" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">6</text>
  <text x="234" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">7</text>
  <text x="260" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">8</text>
  <text x="286" y="195" font-size="11" text-anchor="middle" dominant-baseline="central">9</text>
  <text x="45" y="208" font-size="11" text-anchor="end" dominant-baseline="central">−1</text>
  <text x="45" y="156" font-size="11" text-anchor="end" dominant-baseline="central">1</text>
  <text x="45" y="130" font-size="11" text-anchor="end" dominant-baseline="central">2</text>
  <text x="45" y="104" font-size="11" text-anchor="end" dominant-baseline="central">3</text>
  <text x="45" y="78" font-size="11" text-anchor="end" dominant-baseline="central">4</text>
  <text x="45" y="52" font-size="11" text-anchor="end" dominant-baseline="central">5</text>
  <text x="45" y="26" font-size="11" text-anchor="end" dominant-baseline="central">6</text>
  <text x="44" y="194" font-size="11" text-anchor="middle" dominant-baseline="central">0</text>
  <text x="302" y="170" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">x</text>
  <text x="64" y="14" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">y</text>
  <text x="169" y="157" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u</text>
  <text x="104" y="117" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">v</text>
  <text x="192" y="115" font-size="15" text-anchor="middle" dominant-baseline="central" font-style="italic">u + v</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-TRA-025$c$, $c$¿Cuáles son las componentes del vector $u$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-VEC-01$c$::text),
  ($c$M1-TRA-026$c$, $c$¿Cuáles son las componentes del vector que va de $A(2, -1)$ a $B(5, 3)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-027$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-028$c$, $c$¿Cuál de los vectores de la figura tiene componentes $(-3, 2)$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-VEC-02$c$::text),
  ($c$M1-TRA-029$c$, $c$El vector $v = (4, -1)$ se dibuja partiendo del punto $(-2, 3)$. ¿En qué punto termina?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-030$c$, $c$¿Cuáles son las componentes del vector que va de $A(0, 4)$ a $B(3, 0)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-031$c$, $c$¿Cuál de los siguientes vectores es igual al vector que va de $(1, 1)$ a $(4, 3)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-032$c$, $c$¿Cuáles son las componentes del vector $v$?$c$, 1, $c$propio$c$::text, $c$FIG-PLA-VEC-05$c$::text),
  ($c$M1-TRA-033$c$, $c$¿Cuáles son las componentes del vector $w$?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-VEC-03$c$::text),
  ($c$M1-TRA-034$c$, $c$El vector que va de $A$ a $B$ es $(-2, 5)$. Si $A = (3, -1)$, ¿cuáles son las coordenadas de $B$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-035$c$, $c$El vector que va de $A$ a $B$ es $(4, -3)$. Si $B = (1, 2)$, ¿cuáles son las coordenadas de $A$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-036$c$, $c$¿Cuáles de los vectores de la figura son iguales?$c$, 2, $c$propio$c$::text, $c$FIG-PLA-VEC-04$c$::text),
  ($c$M1-TRA-037$c$, $c$Considera las siguientes afirmaciones:

I. El vector que va de $(1, 2)$ a $(4, 0)$ es $(3, -2)$.

II. El vector que va de $(2, 3)$ a $(6, 4)$ es $(6, 4)$.

III. Los vectores que van de $(0, 0)$ a $(2, 1)$ y de $(3, 3)$ a $(5, 4)$ son distintos.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-038$c$, $c$Un robot se mueve en línea recta desde la estación $(-3, 2)$ hasta la bodega $(4, -1)$. ¿Qué vector describe su desplazamiento?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-039$c$, $c$¿Cuál es el vector que va de $P(-2, -3)$ a $Q(-5, 1)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-040$c$, $c$El vector $v = (a, b)$ va de $(1, 2)$ a $(4, 2)$. ¿Qué se puede afirmar?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-041$c$, $c$Considera las siguientes afirmaciones:

I. El vector que va de $A$ a $B$ es el opuesto del que va de $B$ a $A$.

II. Las componentes de un vector no dependen del punto donde se dibuja.

III. Las componentes del vector que va de $A$ a $B$ son las coordenadas de $B$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-042$c$, $c$Los puntos $A(-1, 2)$, $B(3, 5)$ y $C(0, -2)$ son vértices de un paralelogramo $ABDC$, de modo que el vector de $A$ a $B$ es igual al vector de $C$ a $D$. ¿Cuáles son las coordenadas de $D$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-043$c$, $c$Un vector tiene componentes $(-6, 2)$ y su extremo está en el punto $(-1, -4)$. ¿Dónde está su origen?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-044$c$, $c$En un patio cuadriculado en metros, una grúa mueve un contenedor desde el punto $(2, 7)$ hasta el punto $(-4, 7)$. ¿Qué vector representa el movimiento y cuántos metros se desplazó el contenedor?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-045$c$, $c$¿Cuál afirmación sobre los vectores $u$ y $v$ de la figura es correcta?$c$, 3, $c$propio$c$::text, $c$FIG-PLA-VEC-06$c$::text),
  ($c$M1-TRA-046$c$, $c$Un dron está en el punto $(-2, -5)$ y debe llegar al punto $(3, 1)$. ¿Cuál es el vector de su desplazamiento y hacia dónde se mueve?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-047$c$, $c$Considera las siguientes afirmaciones:

I. $(3, -2)$ y $(-3, 2)$ son vectores opuestos.

II. El vector que va de $(5, 5)$ a $(2, 1)$ es $(3, 4)$.

III. El vector que va de $(1, 1)$ a $(3, 4)$ es $(4, 5)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-048$c$, $c$Una lancha parte del muelle $A(-5, 2)$. Su desplazamiento es el doble del vector $(3, -2)$, es decir, $(3, -2) + (3, -2)$. ¿En qué punto termina?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-049$c$, $c$¿Cuál de las siguientes igualdades es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-050$c$, $c$¿Cuáles son las componentes de $u + v$?$c$, 1, $c$propio$c$::text, $c$FIG-VEC-OP-01$c$::text),
  ($c$M1-TRA-051$c$, $c$Un bote avanza $5$ km hacia el este y luego $8$ km hacia el oeste. Si el este es la dirección positiva del eje $x$, ¿qué vector representa su desplazamiento total?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-052$c$, $c$Si $u = (4, 1)$ y $v = (-2, 3)$, ¿cuál es $u - v$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-053$c$, $c$¿Cuál es el resultado de $(-3, -4) + (-1, 2)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-054$c$, $c$El vector $w$ cumple $(2, -5) + w = (-1, 3)$. ¿Cuál es $w$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-055$c$, $c$Una ardilla sube $3$ metros por un árbol, baja $7$ metros y vuelve a subir $2$ metros. Si hacia arriba es la dirección positiva del eje $y$, ¿qué vector representa su desplazamiento total?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-056$c$, $c$¿Cuáles son las componentes de $u + v$?$c$, 1, $c$propio$c$::text, $c$FIG-VEC-OP-02$c$::text),
  ($c$M1-TRA-057$c$, $c$Si $u = (-2, 5)$, $v = (3, -1)$ y $w = (1, 1)$, ¿cuál es el resultado de $u + v - w$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-058$c$, $c$Un repartidor sale del local, avanza $4$ cuadras al este y $2$ al norte, y luego $6$ cuadras al oeste y $5$ al sur. Con el este y el norte como direcciones positivas, ¿dónde queda respecto del local?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-059$c$, $c$¿Cuáles son las componentes de $u - v$?$c$, 2, $c$propio$c$::text, $c$FIG-VEC-OP-03$c$::text),
  ($c$M1-TRA-060$c$, $c$Si $u + v = (1, -2)$ y $u = (4, 3)$, ¿cuál es $v$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-061$c$, $c$Considera las siguientes afirmaciones:

I. Si $u = (2, -3)$ y $v = (-2, 3)$, entonces $u + v = (0, 0)$.

II. Para cualquier par de vectores, $u - v = v - u$.

III. $(3, 0) + (-3, 0) = (6, 0)$

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-062$c$, $c$¿Cuáles son las componentes del vector $u + v$?$c$, 2, $c$propio$c$::text, $c$FIG-VEC-OP-04$c$::text),
  ($c$M1-TRA-063$c$, $c$Dos remolcadores tiran de un bote. Uno ejerce una fuerza representada por el vector $(5, 2)$ y el otro por el vector $(-3, 4)$. ¿Qué vector representa la fuerza total?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-064$c$, $c$¿Cuáles son las componentes de $v - u$?$c$, 2, $c$propio$c$::text, $c$FIG-VEC-OP-05$c$::text),
  ($c$M1-TRA-065$c$, $c$Considera las siguientes afirmaciones:

I. Si $u$ y $v$ parten del mismo punto, la diagonal del paralelogramo que sale de ese punto representa $u + v$.

II. Si $u = (-2, 1)$, entonces $u + u = (-4, 2)$.

III. Moverse $6$ unidades al norte y luego $6$ al sur equivale al vector $(0, 12)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-066$c$, $c$Un robot parte del punto $(-2, 0)$ y recibe tres órdenes de movimiento seguidas: $(3, -1)$, $(-5, 2)$ y $(1, 4)$. ¿En qué punto termina?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-067$c$, $c$Si $u - v = (5, -1)$ y $v = (-2, 3)$, ¿cuál es $u$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-068$c$, $c$Si $u = (3, 1)$, $v = (-1, 3)$ y $w = (-2, -3)$, ¿cuál es $u + v + w$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-069$c$, $c$Sean $u = (a, b)$ y $v = (-a, -b)$, con $a$ y $b$ distintos de cero. ¿Cuál de las siguientes afirmaciones es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-070$c$, $c$Un avión vuela con una velocidad representada por el vector $(400, 0)$, en km/h, y el viento sopla con una velocidad representada por $(-30, 40)$. ¿Qué vector representa la velocidad del avión respecto del suelo?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-071$c$, $c$Considera las siguientes igualdades:

I. $(1, 4) - (3, -2) = (-2, 6)$

II. $(6, 0) - (2, 5) = (-4, 5)$

III. $(-3, 2) + (-4, 1) = (7, 3)$

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-072$c$, $c$¿Qué vector $w$ cumple $u + w = v$?$c$, 3, $c$propio$c$::text, $c$FIG-VEC-OP-06$c$::text),
  ($c$M1-TRA-073$c$, $c$El punto $P(2, -3)$ se traslada según el vector $(-4, 5)$. ¿Cuáles son las coordenadas de su imagen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-074$c$, $c$El triángulo $A'B'C'$ es la imagen del triángulo $ABC$ por una traslación. ¿Cuál es el vector de la traslación?$c$, 1, $c$propio$c$::text, $c$FIG-TRA-TRAS-01$c$::text),
  ($c$M1-TRA-075$c$, $c$¿Cuál de las siguientes afirmaciones sobre las traslaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-076$c$, $c$El punto $Q' = (1, 4)$ es la imagen de $Q$ por la traslación según el vector $(3, -2)$. ¿Cuáles son las coordenadas de $Q$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-077$c$, $c$¿Cuál de las figuras numeradas es la imagen de $F$ por la traslación según el vector $(4, -2)$?$c$, 1, $c$propio$c$::text, $c$FIG-TRA-TRAS-02$c$::text),
  ($c$M1-TRA-078$c$, $c$En un juego de tablero cuadriculado, una ficha está en la casilla $(-1, 3)$ y se mueve según el vector $(4, -6)$. ¿En qué casilla queda?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-079$c$, $c$¿Qué vector traslada el punto $A(-2, 5)$ al punto $A'(3, 1)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-080$c$, $c$El triángulo de vértices $A(0, 0)$, $B(3, 0)$ y $C(0, 2)$ se traslada según el vector $(-1, 4)$. ¿Cuáles son los vértices de la imagen?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-TRA-081$c$, $c$Una figura se traslada según el vector $(2, -3)$ y después según el vector $(-5, 1)$. ¿Qué única traslación produce el mismo resultado?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-082$c$, $c$Una traslación lleva el punto $Q(-3, -2)$ al punto $Q'(1, -5)$. ¿Dónde queda el punto $R(4, 0)$ con la misma traslación?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-083$c$, $c$$F'$ es la imagen de $F$ por una traslación. ¿Cuál es el vector de la traslación?$c$, 2, $c$propio$c$::text, $c$FIG-TRA-TRAS-03$c$::text),
  ($c$M1-TRA-084$c$, $c$Considera las siguientes afirmaciones:

I. Una traslación conserva la longitud de los lados de una figura.

II. Si $P'$ es la imagen de $P$ según el vector $v$, entonces $P$ es la imagen de $P'$ según el vector opuesto de $v$.

III. Trasladar según $(0, -3)$ mueve la figura $3$ unidades hacia la izquierda.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-085$c$, $c$Una grúa traslada un contenedor cuyo centro está en $(6, -2)$ hasta el punto $(-1, 3)$. Si otro contenedor, con centro en $(2, 2)$, se traslada con el mismo vector, ¿dónde queda su centro?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-086$c$, $c$El punto $(a, b)$ se traslada según el vector $(3, -4)$ y su imagen es $(-1, 2)$. ¿Cuál es el valor de $a + b$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-TRA-087$c$, $c$El triángulo $A'B'C'$ es la imagen de $ABC$ por una traslación. ¿Cuál es el vector de la traslación?$c$, 2, $c$propio$c$::text, $c$FIG-TRA-TRAS-04$c$::text),
  ($c$M1-TRA-088$c$, $c$El punto $P'$ de la figura es la imagen de un punto $P$ por la traslación según el vector $(-3, 2)$. ¿Cuáles son las coordenadas de $P$?$c$, 2, $c$propio$c$::text, $c$FIG-TRA-TRAS-05$c$::text),
  ($c$M1-TRA-089$c$, $c$Una figura se traslada según el vector $(1, -4)$ y después según el vector $(-3, 2)$. Al final, uno de sus vértices queda en $(0, 5)$. ¿Dónde estaba ese vértice al comienzo?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-090$c$, $c$Considera las siguientes afirmaciones:

I. Trasladar según $(-2, 3)$ y después según $(-1, -5)$ equivale a trasladar según $(-3, -2)$.

II. Trasladar según $(3, 0)$ y después según $(-3, 0)$ equivale a trasladar según $(6, 0)$.

III. Si $P$ se traslada según $(1, 5)$, para volver a $P$ hay que trasladar de nuevo según $(1, 5)$.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-091$c$, $c$En una bodega cuadriculada, un robot debe llevar una caja desde $(-4, 1)$ hasta $(3, -5)$, pero solo puede moverse con órdenes del tipo $(a, 0)$ o $(0, b)$. Si primero da una orden $(a, 0)$ y después una $(0, b)$, ¿cuáles son esas órdenes?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-092$c$, $c$El punto $P(x, y)$ se traslada según el vector $(a, b)$ y su imagen es $P'(x', y')$. ¿Cuál de las siguientes afirmaciones es **siempre** correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-093$c$, $c$Un cuadrado tiene vértices $(1, 1)$, $(3, 1)$, $(3, 3)$ y $(1, 3)$. Después de una traslación, el vértice $(1, 1)$ queda en $(-2, 4)$. ¿Dónde queda el vértice $(3, 3)$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-094$c$, $c$Considera las siguientes afirmaciones:

I. La imagen de un triángulo rectángulo por una traslación es un triángulo rectángulo.

II. Trasladar según $(-3, 2)$ mueve cada punto $3$ unidades a la izquierda y $2$ hacia arriba.

III. Una traslación según $(4, -1)$ aleja cada punto $5$ unidades de su posición.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-095$c$, $c$Un parque se diseñó sobre un plano cuadriculado. La fuente está en $(2, -1)$ y se decide trasladar todo el diseño para que la fuente quede en el origen. ¿Dónde queda un árbol que estaba en $(-3, 4)$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-TRA-096$c$, $c$Una traslación lleva el vértice $(-1, 2)$ del triángulo $T_1$ al vértice $(4, -1)$ del triángulo $T_2$. ¿Qué vector lleva $T_1$ a $T_2$ y cuál lleva $T_2$ de vuelta a $T_1$?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-TRA-025$c$, $c$A$c$, $c$$(5, 2)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-025$c$, $c$B$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-025$c$, $c$C$c$, $c$$(4, 1)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-025$c$, $c$D$c$, $c$$(-5, 2)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-026$c$, $c$A$c$, $c$$(5, 3)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-026$c$, $c$B$c$, $c$$(-3, -4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-026$c$, $c$C$c$, $c$$(3, 4)$$c$, true, null),
  ($c$M1-TRA-026$c$, $c$D$c$, $c$$(7, 2)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-027$c$, $c$A$c$, $c$Dos vectores son iguales solo si parten del mismo punto.$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-027$c$, $c$B$c$, $c$Las componentes de un vector son las coordenadas de su extremo.$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-027$c$, $c$C$c$, $c$Las componentes del vector de $A$ a $B$ se calculan como $A - B$.$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-027$c$, $c$D$c$, $c$Dos vectores con las mismas componentes son iguales, aunque partan de puntos distintos.$c$, true, null),
  ($c$M1-TRA-028$c$, $c$A$c$, $c$El vector $a$$c$, true, null),
  ($c$M1-TRA-028$c$, $c$B$c$, $c1$El vector $c$$c1$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-028$c$, $c$C$c$, $c$El vector $b$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-028$c$, $c$D$c$, $c$El vector $d$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-029$c$, $c$A$c$, $c$$(-6, 4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-029$c$, $c$B$c$, $c$$(4, -1)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-029$c$, $c$C$c$, $c$$(-3, 7)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-029$c$, $c$D$c$, $c$$(2, 2)$$c$, true, null),
  ($c$M1-TRA-030$c$, $c$A$c$, $c$$(3, 4)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-030$c$, $c$B$c$, $c$$(-3, 4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-030$c$, $c$C$c$, $c$$(3, -4)$$c$, true, null),
  ($c$M1-TRA-030$c$, $c$D$c$, $c$$(3, 0)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-031$c$, $c$A$c$, $c$El que va de $(-2, 0)$ a $(1, 2)$.$c$, true, null),
  ($c$M1-TRA-031$c$, $c$B$c$, $c$El que va de $(4, 3)$ a $(1, 1)$.$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-031$c$, $c$C$c$, $c$Ninguno: solo es igual el que parte de $(1, 1)$.$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-031$c$, $c$D$c$, $c$El que va de $(0, 0)$ a $(4, 3)$.$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-032$c$, $c$A$c$, $c$$(-5, 0)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-032$c$, $c$B$c$, $c$$(5, 0)$$c$, true, null),
  ($c$M1-TRA-032$c$, $c$C$c$, $c$$(1, 2)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-032$c$, $c$D$c$, $c$$(0, 5)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-033$c$, $c$A$c$, $c$$(8, -4)$$c$, true, null),
  ($c$M1-TRA-033$c$, $c$B$c$, $c$$(4, -2)$$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-033$c$, $c$C$c$, $c$$(-8, 4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-033$c$, $c$D$c$, $c$$(8, 4)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-034$c$, $c$A$c$, $c$$(5, -6)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-034$c$, $c$B$c$, $c$$(1, 4)$$c$, true, null),
  ($c$M1-TRA-034$c$, $c$C$c$, $c$$(8, -3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-034$c$, $c$D$c$, $c$$(-2, 5)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-035$c$, $c$A$c$, $c$$(5, -1)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-035$c$, $c$B$c$, $c$$(4, -3)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-035$c$, $c$C$c$, $c$$(-3, -1)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-035$c$, $c$D$c$, $c$$(-3, 5)$$c$, true, null),
  ($c$M1-TRA-036$c$, $c$A$c$, $c$$a$ y $b$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-036$c$, $c$B$c$, $c$$a$ y $d$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-036$c$, $c$C$c$, $c1$$a$ y $c$$c1$, true, null),
  ($c$M1-TRA-036$c$, $c$D$c$, $c$Ninguno, porque parten de puntos distintos.$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-037$c$, $c$A$c$, $c$Solo I y II$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-037$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-037$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-037$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-038$c$, $c$A$c$, $c$$(-7, 3)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-038$c$, $c$B$c$, $c$$(1, 1)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-038$c$, $c$C$c$, $c$$(7, -3)$$c$, true, null),
  ($c$M1-TRA-038$c$, $c$D$c$, $c$$(7, 3)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-039$c$, $c$A$c$, $c$$(-3, 4)$$c$, true, null),
  ($c$M1-TRA-039$c$, $c$B$c$, $c$$(-7, -2)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-039$c$, $c$C$c$, $c$$(3, -4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-039$c$, $c$D$c$, $c$$(4, -3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-040$c$, $c$A$c$, $c$$a = -3$ y $b = 0$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-040$c$, $c$B$c$, $c$$a = 0$ y $b = 3$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-040$c$, $c$C$c$, $c$$a = 4$ y $b = 2$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-040$c$, $c$D$c$, $c$$a = 3$ y $b = 0$$c$, true, null),
  ($c$M1-TRA-041$c$, $c$A$c$, $c$Solo II$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-041$c$, $c$B$c$, $c$Solo I$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-041$c$, $c$C$c$, $c$I, II y III$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-041$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-042$c$, $c$A$c$, $c$$(3, 5)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-042$c$, $c$B$c$, $c$$(4, 1)$$c$, true, null),
  ($c$M1-TRA-042$c$, $c$C$c$, $c$No existe, porque dos vectores que parten de puntos distintos no pueden ser iguales.$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-042$c$, $c$D$c$, $c$$(3, 2)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-043$c$, $c$A$c$, $c$$(-7, -6)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-043$c$, $c$B$c$, $c$$(-6, 2)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-043$c$, $c$C$c$, $c$$(5, -6)$$c$, true, null),
  ($c$M1-TRA-043$c$, $c$D$c$, $c$$(-7, -2)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-044$c$, $c$A$c$, $c$$(-6, 0)$; se desplazó $6$ metros.$c$, true, null),
  ($c$M1-TRA-044$c$, $c$B$c$, $c$$(-6, 0)$; se desplazó $7$ metros.$c$, false, $c$PLA-COORD-CONTEO$c$),
  ($c$M1-TRA-044$c$, $c$C$c$, $c$$(0, -6)$; se desplazó $6$ metros.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-044$c$, $c$D$c$, $c$$(6, 0)$; se desplazó $6$ metros.$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-045$c$, $c$A$c$, $c$$u = v = (3, 2)$$c$, true, null),
  ($c$M1-TRA-045$c$, $c$B$c$, $c$$u$ y $v$ son distintos, porque parten de puntos distintos.$c$, false, $c$PLA-VEC-POSICION$c$),
  ($c$M1-TRA-045$c$, $c$C$c$, $c$$u = (0, 1)$ y $v = (4, 4)$, así que son distintos.$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-045$c$, $c$D$c$, $c$$u = v = (-3, -2)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-046$c$, $c$A$c$, $c$$(-5, -6)$; hacia la izquierda y hacia abajo.$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-046$c$, $c$B$c$, $c$$(1, -4)$; hacia la derecha y hacia abajo.$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-046$c$, $c$C$c$, $c$$(3, 1)$; hacia la derecha y hacia arriba.$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-046$c$, $c$D$c$, $c$$(5, 6)$; hacia la derecha y hacia arriba.$c$, true, null),
  ($c$M1-TRA-047$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-047$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-047$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-047$c$, $c$D$c$, $c$Solo II$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-048$c$, $c$A$c$, $c$$(-11, 6)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-048$c$, $c$B$c$, $c$$(6, -4)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-048$c$, $c$C$c$, $c$$(1, -2)$$c$, true, null),
  ($c$M1-TRA-048$c$, $c$D$c$, $c$$(1, 6)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-049$c$, $c$A$c$, $c$$(-1, 6) + (4, -2) = (-5, -8)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-049$c$, $c$B$c$, $c$$(3, -2) + (-5, 4) = (-2, 2)$$c$, true, null),
  ($c$M1-TRA-049$c$, $c$C$c$, $c$$(5, 1) - (2, 3) = (-3, 2)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-049$c$, $c$D$c$, $c$$(-2, -3) + (-4, 1) = (6, -2)$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-050$c$, $c$A$c$, $c$$(6, 2)$$c$, true, null),
  ($c$M1-TRA-050$c$, $c$B$c$, $c$$(6, 4)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-050$c$, $c$C$c$, $c$$(-6, -2)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-050$c$, $c$D$c$, $c$$(2, -4)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-051$c$, $c$A$c$, $c$$(13, 0)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-051$c$, $c$B$c$, $c$$(-13, 0)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-051$c$, $c$C$c$, $c$$(-3, 0)$$c$, true, null),
  ($c$M1-TRA-051$c$, $c$D$c$, $c$$(0, -3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-052$c$, $c$A$c$, $c$$(2, -2)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-052$c$, $c$B$c$, $c$$(-6, 2)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-052$c$, $c$C$c$, $c$$(-2, 6)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-052$c$, $c$D$c$, $c$$(6, -2)$$c$, true, null),
  ($c$M1-TRA-053$c$, $c$A$c$, $c$$(4, -2)$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-053$c$, $c$B$c$, $c$$(-4, -2)$$c$, true, null),
  ($c$M1-TRA-053$c$, $c$C$c$, $c$$(4, 6)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-053$c$, $c$D$c$, $c$$(-4, -6)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-054$c$, $c$A$c$, $c$$(-3, 8)$$c$, true, null),
  ($c$M1-TRA-054$c$, $c$B$c$, $c$$(3, -8)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-054$c$, $c$C$c$, $c$$(-3, -2)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-054$c$, $c$D$c$, $c$$(-1, 8)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-055$c$, $c$A$c$, $c$$(0, 12)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-055$c$, $c$B$c$, $c$$(-2, 0)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-055$c$, $c$C$c$, $c$$(0, -12)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-055$c$, $c$D$c$, $c$$(0, -2)$$c$, true, null),
  ($c$M1-TRA-056$c$, $c$A$c$, $c$$(-4, -4)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-056$c$, $c$B$c$, $c$$(-4, 4)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-056$c$, $c$C$c$, $c$$(2, 2)$$c$, true, null),
  ($c$M1-TRA-056$c$, $c$D$c$, $c$$(4, 4)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-057$c$, $c$A$c$, $c$$(0, 3)$$c$, true, null),
  ($c$M1-TRA-057$c$, $c$B$c$, $c$$(3, 0)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-057$c$, $c$C$c$, $c$$(0, -3)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-057$c$, $c$D$c$, $c$$(6, 7)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-058$c$, $c$A$c$, $c$$(-3, -2)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-058$c$, $c$B$c$, $c$$(-2, -3)$$c$, true, null),
  ($c$M1-TRA-058$c$, $c$C$c$, $c$$(-10, -7)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-058$c$, $c$D$c$, $c$$(10, 7)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-059$c$, $c$A$c$, $c$$(3, -2)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-059$c$, $c$B$c$, $c$$(5, 4)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-059$c$, $c$C$c$, $c$$(-3, 2)$$c$, true, null),
  ($c$M1-TRA-059$c$, $c$D$c$, $c$$(3, 2)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-060$c$, $c$A$c$, $c$$(-3, 5)$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-060$c$, $c$B$c$, $c$$(-5, -3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-060$c$, $c$C$c$, $c$$(3, 5)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-060$c$, $c$D$c$, $c$$(-3, -5)$$c$, true, null),
  ($c$M1-TRA-061$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-061$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-061$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-061$c$, $c$D$c$, $c$Solo III$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-062$c$, $c$A$c$, $c$$(7, -5)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-062$c$, $c$B$c$, $c$$(-7, -1)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-062$c$, $c$C$c$, $c$$(7, 5)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-062$c$, $c$D$c$, $c$$(7, 1)$$c$, true, null),
  ($c$M1-TRA-063$c$, $c$A$c$, $c$$(-8, 6)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-063$c$, $c$B$c$, $c$$(2, 6)$$c$, true, null),
  ($c$M1-TRA-063$c$, $c$C$c$, $c$$(8, 6)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-063$c$, $c$D$c$, $c$$(-8, 2)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-064$c$, $c$A$c$, $c$$(3, -4)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-064$c$, $c$B$c$, $c$$(1, 2)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-064$c$, $c$C$c$, $c$$(-3, 4)$$c$, true, null),
  ($c$M1-TRA-064$c$, $c$D$c$, $c$$(-3, 2)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-065$c$, $c$A$c$, $c$Solo I$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-065$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-065$c$, $c$C$c$, $c$Solo II$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-065$c$, $c$D$c$, $c$I, II y III$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-066$c$, $c$A$c$, $c$$(-3, 5)$$c$, true, null),
  ($c$M1-TRA-066$c$, $c$B$c$, $c$$(-11, -7)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-066$c$, $c$C$c$, $c$$(5, -3)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-066$c$, $c$D$c$, $c$$(7, 7)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-067$c$, $c$A$c$, $c$$(7, 4)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-067$c$, $c$B$c$, $c$$(-7, 4)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-067$c$, $c$C$c$, $c$$(-7, -4)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-067$c$, $c$D$c$, $c$$(3, 2)$$c$, true, null),
  ($c$M1-TRA-068$c$, $c$A$c$, $c$$(6, 7)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-068$c$, $c$B$c$, $c$$(1, 0)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-068$c$, $c$C$c$, $c$$(0, 1)$$c$, true, null),
  ($c$M1-TRA-068$c$, $c$D$c$, $c$$(-6, -7)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-069$c$, $c$A$c$, $c$$u + v = (0, 0)$$c$, true, null),
  ($c$M1-TRA-069$c$, $c$B$c$, $c$$u - v = (-2a, -2b)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-069$c$, $c$C$c$, $c$$u + v = (2a, 2b)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-069$c$, $c$D$c$, $c$$u - v = (0, 0)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-070$c$, $c$A$c$, $c$$(430, -40)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-070$c$, $c$B$c$, $c$$(-430, 40)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-070$c$, $c$C$c$, $c$$(430, 40)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-070$c$, $c$D$c$, $c$$(370, 40)$$c$, true, null),
  ($c$M1-TRA-071$c$, $c$A$c$, $c$Solo I y II$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-071$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-071$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-071$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-072$c$, $c$A$c$, $c$$(5, 4)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-072$c$, $c$B$c$, $c$$(-3, 2)$$c$, true, null),
  ($c$M1-TRA-072$c$, $c$C$c$, $c$$(3, -2)$$c$, false, $c$PLA-VECOP-RESTAORDEN$c$),
  ($c$M1-TRA-072$c$, $c$D$c$, $c$$(3, 2)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-073$c$, $c$A$c$, $c$$(-2, 2)$$c$, true, null),
  ($c$M1-TRA-073$c$, $c$B$c$, $c$$(7, -7)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-073$c$, $c$C$c$, $c$$(6, -8)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-073$c$, $c$D$c$, $c$$(-6, -8)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-074$c$, $c$A$c$, $c$$(-5, 2)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-074$c$, $c$B$c$, $c$$(1, -1)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-074$c$, $c$C$c$, $c$$(5, 2)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-074$c$, $c$D$c$, $c$$(5, -2)$$c$, true, null),
  ($c$M1-TRA-075$c$, $c$A$c$, $c$Trasladar según $(3, -2)$ es mover $3$ unidades a la izquierda y $2$ hacia arriba.$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-075$c$, $c$B$c$, $c$Al trasladar una figura, puede quedar girada.$c$, false, $c$TRA-TRAS-FORMA$c$),
  ($c$M1-TRA-075$c$, $c$C$c$, $c$Al trasladar una figura, conserva su forma, su tamaño y su orientación.$c$, true, null),
  ($c$M1-TRA-075$c$, $c$D$c$, $c$Trasladar según $(3, -2)$ es mover $3$ unidades hacia abajo y $2$ a la derecha.$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-076$c$, $c$A$c$, $c$$(-2, 2)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-076$c$, $c$B$c$, $c$$(-2, 6)$$c$, true, null),
  ($c$M1-TRA-076$c$, $c$C$c$, $c$$(3, 1)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-076$c$, $c$D$c$, $c$$(4, 2)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-077$c$, $c$A$c$, $c$La figura 3$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-077$c$, $c$B$c$, $c$La figura 4$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-077$c$, $c$C$c$, $c$La figura 2$c$, false, $c$TRA-TRAS-FORMA$c$),
  ($c$M1-TRA-077$c$, $c$D$c$, $c$La figura 1$c$, true, null),
  ($c$M1-TRA-078$c$, $c$A$c$, $c$$(4, -6)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-078$c$, $c$B$c$, $c$$(3, -3)$$c$, true, null),
  ($c$M1-TRA-078$c$, $c$C$c$, $c$$(-5, -9)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-078$c$, $c$D$c$, $c$$(-5, 9)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-079$c$, $c$A$c$, $c$$(3, 1)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-079$c$, $c$B$c$, $c$$(1, 6)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-079$c$, $c$C$c$, $c$$(5, -4)$$c$, true, null),
  ($c$M1-TRA-079$c$, $c$D$c$, $c$$(-5, 4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-080$c$, $c$A$c$, $c$$A'(-1, 4)$, $B'(2, 4)$ y $C'(-1, 6)$$c$, true, null),
  ($c$M1-TRA-080$c$, $c$B$c$, $c$$A'(4, -1)$, $B'(7, -1)$ y $C'(4, 1)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-080$c$, $c$C$c$, $c$$A'(-1, 4)$, $B'(-1, 7)$ y $C'(1, 4)$$c$, false, $c$TRA-TRAS-FORMA$c$),
  ($c$M1-TRA-080$c$, $c$D$c$, $c$$A'(1, -4)$, $B'(4, -4)$ y $C'(1, -2)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-081$c$, $c$A$c$, $c$La traslación según $(-7, 4)$$c$, false, $c$PLA-VECOP-PUNTAS$c$),
  ($c$M1-TRA-081$c$, $c$B$c$, $c$La traslación según $(-7, -4)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-081$c$, $c$C$c$, $c$La traslación según $(7, 4)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-081$c$, $c$D$c$, $c$La traslación según $(-3, -2)$$c$, true, null),
  ($c$M1-TRA-082$c$, $c$A$c$, $c$$(8, -3)$$c$, true, null),
  ($c$M1-TRA-082$c$, $c$B$c$, $c$$(2, -7)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-082$c$, $c$C$c$, $c$$(5, -5)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-082$c$, $c$D$c$, $c$$(0, 3)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-083$c$, $c$A$c$, $c$$(5, -6)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-083$c$, $c$B$c$, $c$$(6, 5)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-083$c$, $c$C$c$, $c$$(-6, 5)$$c$, true, null),
  ($c$M1-TRA-083$c$, $c$D$c$, $c$$(6, -5)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-084$c$, $c$A$c$, $c$Solo II$c$, false, $c$TRA-TRAS-FORMA$c$),
  ($c$M1-TRA-084$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-084$c$, $c$C$c$, $c$Solo I$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-084$c$, $c$D$c$, $c$I, II y III$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-085$c$, $c$A$c$, $c$$(-5, 3)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-085$c$, $c$B$c$, $c$$(1, 5)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-085$c$, $c$C$c$, $c$$(-5, 7)$$c$, true, null),
  ($c$M1-TRA-085$c$, $c$D$c$, $c$$(9, -3)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-086$c$, $c$A$c$, $c$$-6$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-086$c$, $c$B$c$, $c$$4$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-086$c$, $c$C$c$, $c$$0$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-086$c$, $c$D$c$, $c$$2$$c$, true, null),
  ($c$M1-TRA-087$c$, $c$A$c$, $c$$(10, 4)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-087$c$, $c$B$c$, $c$$(10, -4)$$c$, true, null),
  ($c$M1-TRA-087$c$, $c$C$c$, $c$$(-10, 4)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-087$c$, $c$D$c$, $c$$(5, -2)$$c$, false, $c$PLA-COORD-ESCALA$c$),
  ($c$M1-TRA-088$c$, $c$A$c$, $c$$(2, 2)$$c$, true, null),
  ($c$M1-TRA-088$c$, $c$B$c$, $c$$(-4, 6)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-088$c$, $c$C$c$, $c$$(-3, 7)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-088$c$, $c$D$c$, $c$$(-4, 2)$$c$, false, $c$PLA-VEC-SINSIGNO$c$),
  ($c$M1-TRA-089$c$, $c$A$c$, $c$$(2, 7)$$c$, true, null),
  ($c$M1-TRA-089$c$, $c$B$c$, $c$$(-4, -1)$$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-089$c$, $c$C$c$, $c$$(-2, 3)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-089$c$, $c$D$c$, $c$$(4, 11)$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-TRA-090$c$, $c$A$c$, $c$Solo I y II$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-090$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-TRA-090$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-TRA-090$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-091$c$, $c$A$c$, $c$$(3, 0)$ y después $(0, -5)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-091$c$, $c$B$c$, $c$$(7, 0)$ y después $(0, -6)$$c$, true, null),
  ($c$M1-TRA-091$c$, $c$C$c$, $c$$(-7, 0)$ y después $(0, 6)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-091$c$, $c$D$c$, $c$$(-6, 0)$ y después $(0, 7)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-092$c$, $c$A$c$, $c$$x - x' = a$ y $y - y' = b$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-092$c$, $c$B$c$, $c$La distancia entre $P$ y $P'$ es $a + b$.$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-092$c$, $c$C$c$, $c$$x' - x = b$ y $y' - y = a$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-092$c$, $c$D$c$, $c$$x' - x = a$ y $y' - y = b$$c$, true, null),
  ($c$M1-TRA-093$c$, $c$A$c$, $c$$(0, 6)$$c$, true, null),
  ($c$M1-TRA-093$c$, $c$B$c$, $c$$(6, 0)$$c$, false, $c$PLA-VEC-ORIGEN$c$),
  ($c$M1-TRA-093$c$, $c$C$c$, $c$$(2, 8)$$c$, false, $c$PLA-VEC-SUMA$c$),
  ($c$M1-TRA-093$c$, $c$D$c$, $c$$(1, 7)$$c$, false, $c$PLA-VEC-PUNTO$c$),
  ($c$M1-TRA-094$c$, $c$A$c$, $c$Solo II$c$, false, $c$TRA-TRAS-FORMA$c$),
  ($c$M1-TRA-094$c$, $c$B$c$, $c$Solo I$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-094$c$, $c$C$c$, $c$I, II y III$c$, false, $c$PLA-VECOP-SINSENTIDO$c$),
  ($c$M1-TRA-094$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-TRA-095$c$, $c$A$c$, $c$$(-2, 2)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-095$c$, $c$B$c$, $c$$(-1, 3)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-095$c$, $c$C$c$, $c$$(-5, 5)$$c$, true, null),
  ($c$M1-TRA-095$c$, $c$D$c$, $c$$(-5, 3)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-TRA-096$c$, $c$A$c$, $c$$(5, -3)$ y $(5, -3)$$c$, false, $c$TRA-TRAS-SENTIDO$c$),
  ($c$M1-TRA-096$c$, $c$B$c$, $c$$(5, -3)$ y $(-5, 3)$$c$, true, null),
  ($c$M1-TRA-096$c$, $c$C$c$, $c$$(-3, 5)$ y $(3, -5)$$c$, false, $c$PLA-COORD-ORDEN$c$),
  ($c$M1-TRA-096$c$, $c$D$c$, $c$$(-5, 3)$ y $(5, -3)$$c$, false, $c$PLA-VEC-ORIGEN$c$)
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
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-025$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-026$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-027$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-028$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-029$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-030$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-031$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-032$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-033$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-034$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-035$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-036$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-037$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-038$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-039$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-040$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-041$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-042$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-043$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-044$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-045$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-046$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-047$c$),
  ($c$GEO-PLA-VEC$c$, $c$M1-TRA-048$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-049$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-050$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-051$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-052$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-053$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-054$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-055$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-056$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-057$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-058$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-059$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-060$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-061$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-062$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-063$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-064$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-065$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-066$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-067$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-068$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-069$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-070$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-071$c$),
  ($c$GEO-PLA-VEC-OP$c$, $c$M1-TRA-072$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-073$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-074$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-075$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-076$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-077$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-078$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-079$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-080$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-081$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-082$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-083$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-084$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-085$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-086$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-087$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-088$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-089$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-090$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-091$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-092$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-093$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-094$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-095$c$),
  ($c$GEO-TRA-TRAS$c$, $c$M1-TRA-096$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$PLA-VEC-ORIGEN$c$, $c$El vector va de donde partes a donde llegas$c$, $c$Restaste al revés: calculaste inicio menos final. Por ejemplo, para
el vector de $A(6, 1)$ a $B(2, 4)$ escribiste $(4, -3)$.

**El vector de $A$ a $B$ es $B - A$: coordenadas del final menos
coordenadas del inicio.**

$$\vec{AB} = (2 - 6,\ 4 - 1) = (-4,\ 3)$$

Tiene sentido: de $A$ a $B$ te mueves $4$ a la izquierda (negativo) y
$3$ hacia arriba (positivo). Con $A - B$ obtienes el movimiento de
vuelta, de $B$ a $A$.

Un control rápido: antes de restar, decide solo mirando si te mueves a
la derecha o a la izquierda, arriba o abajo. Los signos de tu
resultado tienen que calzar.$c$),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$PLA-VEC-PUNTO$c$, $c$Las componentes no son el punto de llegada$c$, $c$Diste como componentes las coordenadas del punto donde termina el
vector. Por ejemplo, para el vector de $(3, 5)$ a $(7, 6)$
respondiste $(7, 6)$.

**Las componentes dicen cuánto te moviste, no dónde llegaste. Se
calculan como final menos inicio.**

$$(7 - 3,\ 6 - 5) = (4,\ 1)$$

Solo cuando el vector parte del origen $(0, 0)$ las dos cosas
coinciden, porque ahí restar el inicio no cambia nada.

Un control rápido: si el vector es corto y tu respuesta tiene números
grandes, estás dando una posición y no un desplazamiento.$c$),
  ($c$REM-PLA-VEC-SUMA$c$, $c$PLA-VEC-SUMA$c$, $c$Para el vector se restan los puntos$c$, $c$Sumaste las coordenadas de los dos puntos. Por ejemplo, para el vector
de $(3, 5)$ a $(7, 6)$ escribiste $(10, 11)$.

**El vector de un punto a otro es la diferencia: final menos inicio.**

Pregúntate cuánto hay que avanzar para ir de $3$ a $7$: $4$. Y de $5$ a
$6$: $1$. El vector es $(4, 1)$.

Sumar los puntos no describe ningún movimiento entre ellos.

Un control rápido: el vector que une dos puntos cercanos tiene
componentes pequeñas. Si tu respuesta es más grande que las dos
coordenadas, sumaste.$c$),
  ($c$REM-PLA-VEC-POSICION$c$, $c$PLA-VEC-POSICION$c$, $c$Un vector es el movimiento, no el lugar$c$, $c$Pensaste que dos flechas son vectores distintos porque están dibujadas
en lugares distintos. Por ejemplo, dijiste que la flecha de $(0, 0)$ a
$(4, 2)$ y la de $(-3, 1)$ a $(1, 3)$ son distintas.

**Un vector queda definido por sus componentes. Dos flechas con las
mismas componentes son el mismo vector, estén donde estén.**

$$(4 - 0,\ 2 - 0) = (4, 2) \qquad (1 - (-3),\ 3 - 1) = (4, 2)$$

Las dos describen el mismo movimiento: $4$ a la derecha y $2$ hacia
arriba. Es como la instrucción «avanza dos cuadras al norte»: sirve
igual desde cualquier esquina.

Un control rápido: para comparar vectores, calcula las componentes de
cada uno y compara los números, no la posición de las flechas.$c$),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$PLA-VEC-SINSIGNO$c$, $c$Hacia la izquierda y hacia abajo es negativo$c$, $c$Contaste cuántos cuadrados avanza la flecha, pero no hacia dónde. Por
ejemplo, a una flecha que va $3$ a la izquierda y $4$ hacia arriba le
diste $(3, 4)$.

**Cada componente lleva signo: positiva hacia la derecha o hacia
arriba, negativa hacia la izquierda o hacia abajo.**

Esa flecha es $(-3, 4)$. El vector $(3, 4)$ iría hacia la derecha: es
otro vector.

Por la misma razón, un vector y su opuesto no son iguales: $(2, -5)$ y
$(-2, 5)$ miden lo mismo pero apuntan en sentidos contrarios.

Un control rápido: mira la punta de la flecha. Si apunta a la
izquierda, la primera componente es negativa; si apunta hacia abajo, la
segunda.$c$),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$PLA-VECOP-RESTAORDEN$c$, $c$u − v y v − u son opuestos$c$, $c$Restaste los vectores en el orden contrario. Por ejemplo, para
$u - v$ con $u = (6, 2)$ y $v = (1, 5)$ calculaste $(-5, 3)$.

**$u - v$ es cada componente de $u$ menos la de $v$, en ese orden.**

$$u - v = (6 - 1,\ 2 - 5) = (5, -3)$$

El resultado que obtuviste es $v - u$, el opuesto. Las restas no
conmutan: cambiar el orden cambia el signo de las dos componentes.

Para despejar un vector que falta, lo mismo: si $u + w = v$, entonces
$w = v - u$.

Un control rápido: comprueba sumando. Si $u - v = r$, entonces
$v + r$ tiene que dar $u$.$c$),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$PLA-VECOP-SINSENTIDO$c$, $c$Movimientos contrarios se descuentan$c$, $c$Sumaste lo que mide cada movimiento sin mirar hacia dónde iba. Por
ejemplo, $6$ pasos al este y $9$ al oeste te dieron $15$ al este.

**Al sumar desplazamientos, los que van en sentidos contrarios se
restan. Por eso cada uno se escribe con su signo antes de sumar.**

Con el este positivo:

$$(6, 0) + (-9, 0) = (-3, 0)$$

Terminaste $3$ pasos al oeste del punto de partida. Caminaste $15$
pasos, pero el desplazamiento es $(-3, 0)$.

Un control rápido: si hay movimientos hacia lados opuestos, el
resultado tiene que ser **menor** que el movimiento más grande, no
mayor.$c$),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$PLA-VECOP-PUNTAS$c$, $c$La suma sale del punto común$c$, $c$Tomaste la diagonal equivocada. Por ejemplo, con $u = (4, 0)$ y
$v = (1, 3)$ dibujados desde un mismo punto, diste como suma el
segmento que une sus puntas.

**Con dos vectores desde un mismo punto, la suma es la diagonal del
paralelogramo que parte de ese punto. La que une las puntas es la
diferencia.**

$$u + v = (5, 3) \qquad v - u = (-3, 3)$$

Otra forma de verlo: dibuja $v$ a continuación de $u$. La suma va del
inicio de $u$ al final de $v$, y ese es justamente el lado largo del
paralelogramo que sale del punto común.

Un control rápido: calcula las componentes de la diagonal que elegiste
y compáralas con la suma de las componentes.$c$),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$TRA-TRAS-SENTIDO$c$, $c$Trasladar según v es sumar v$c$, $c$Moviste el punto en el sentido contrario al vector. Por ejemplo,
trasladaste $(2, 6)$ según $(3, -5)$ y obtuviste $(-1, 11)$.

**La imagen de $P$ por la traslación según $v$ es $P + v$.**

$$(2, 6) + (3, -5) = (5, 1)$$

$3$ a la derecha y $5$ hacia abajo, como dice el vector.

Al revés, si conoces la imagen y quieres el punto original, **ahí** se
resta el vector: $P = P' - v$. Sumar para ir, restar para volver.

Un control rápido: el vector $(3, -5)$ apunta a la derecha y hacia
abajo. Tu imagen tiene que quedar a la derecha y más abajo que el
punto original.$c$),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$TRA-TRAS-FORMA$c$, $c$La traslación solo desplaza$c$, $c$Aceptaste como traslación una figura girada o dada vuelta, o pensaste
que al trasladar cambian los lados. Por ejemplo, elegiste como imagen
un triángulo que apuntaba hacia el otro lado.

**Al trasladar, todos los puntos de la figura se mueven con el mismo
vector. Por eso la imagen tiene la misma forma, el mismo tamaño y la
misma orientación.**

Si el vértice de arriba estaba a la izquierda, en la imagen sigue
arriba a la izquierda. Cada lado queda paralelo a su lado original.

Girar o reflejar son otras transformaciones: la traslación nunca las
hace.

Un control rápido: une cada vértice con su imagen. En una traslación
todos esos segmentos son iguales y paralelos.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-PLA-VEC-ORIGEN$c$, $c$REM-PLA-VEC-PUNTO$c$, $c$REM-PLA-VEC-SUMA$c$, $c$REM-PLA-VEC-POSICION$c$, $c$REM-PLA-VEC-SINSIGNO$c$, $c$REM-PLA-VECOP-RESTAORDEN$c$, $c$REM-PLA-VECOP-SINSENTIDO$c$, $c$REM-PLA-VECOP-PUNTAS$c$, $c$REM-TRA-TRAS-SENTIDO$c$, $c$REM-TRA-TRAS-FORMA$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-030$c$, 1::smallint),
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-031$c$, 2::smallint),
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-039$c$, 3::smallint),
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-040$c$, 4::smallint),
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-047$c$, 5::smallint),
  ($c$REM-PLA-VEC-ORIGEN$c$, $c$M1-TRA-048$c$, 6::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-030$c$, 1::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-031$c$, 2::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-037$c$, 3::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-040$c$, 4::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-045$c$, 5::smallint),
  ($c$REM-PLA-VEC-PUNTO$c$, $c$M1-TRA-046$c$, 6::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-026$c$, 1::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-039$c$, 2::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-047$c$, 3::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-079$c$, 4::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-082$c$, 5::smallint),
  ($c$REM-PLA-VEC-SUMA$c$, $c$M1-TRA-093$c$, 6::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-027$c$, 1::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-031$c$, 2::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-036$c$, 3::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-037$c$, 4::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-042$c$, 5::smallint),
  ($c$REM-PLA-VEC-POSICION$c$, $c$M1-TRA-045$c$, 6::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-030$c$, 1::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-038$c$, 2::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-043$c$, 3::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-047$c$, 4::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-074$c$, 5::smallint),
  ($c$REM-PLA-VEC-SINSIGNO$c$, $c$M1-TRA-083$c$, 6::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-052$c$, 1::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-054$c$, 2::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-060$c$, 3::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-061$c$, 4::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-069$c$, 5::smallint),
  ($c$REM-PLA-VECOP-RESTAORDEN$c$, $c$M1-TRA-071$c$, 6::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-053$c$, 1::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-055$c$, 2::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-061$c$, 3::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-062$c$, 4::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-070$c$, 5::smallint),
  ($c$REM-PLA-VECOP-SINSENTIDO$c$, $c$M1-TRA-072$c$, 6::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-050$c$, 1::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-056$c$, 2::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-063$c$, 3::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-064$c$, 4::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-070$c$, 5::smallint),
  ($c$REM-PLA-VECOP-PUNTAS$c$, $c$M1-TRA-072$c$, 6::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-076$c$, 1::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-077$c$, 2::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-086$c$, 3::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-088$c$, 4::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-092$c$, 5::smallint),
  ($c$REM-TRA-TRAS-SENTIDO$c$, $c$M1-TRA-094$c$, 6::smallint),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$M1-TRA-075$c$, 1::smallint),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$M1-TRA-077$c$, 2::smallint),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$M1-TRA-080$c$, 3::smallint),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$M1-TRA-084$c$, 4::smallint),
  ($c$REM-TRA-TRAS-FORMA$c$, $c$M1-TRA-094$c$, 5::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-GEO-TRA-02$c$, $c$GEO-TRA$c$, $c$Vectores y traslación$c$, $c$Un vector dice cuánto y hacia dónde moverse. Con él se describen los
desplazamientos, se suman movimientos y se trasladan figuras sin
deformarlas, que es la primera de las transformaciones que vas a ver.

## Vectores y sus componentes

### Un vector es un desplazamiento

Un **vector** se dibuja como una flecha: parte en un punto (su
**origen**) y termina en otro (su **extremo**). Lo que importa es el
movimiento que describe, y ese movimiento se resume en dos números, sus
**componentes**: cuánto avanza en horizontal y cuánto en vertical.

![](fig:FIG-PLA-VEC-07)

El vector $v$ de la figura avanza $5$ a la derecha y $3$ hacia arriba:
$v = (5, 3)$. Igual que en las coordenadas, izquierda y abajo llevan
signo menos.

### Componentes a partir de dos puntos

**El vector que va de $A$ a $B$ se calcula como final menos inicio:
$B - A$.**

Si $A = (6, -2)$ y $B = (1, 3)$:

$$\vec{AB} = (1 - 6,\ 3 - (-2)) = (-5,\ 5)$$

El error más común es restar al revés ($A - B$), que da el vector
contrario. Un control rápido: mira la figura o imagina el movimiento. De
$A$ a $B$ te mueves a la izquierda, así que la primera componente tiene
que ser negativa.

Tampoco son las coordenadas de $B$: esas solo coinciden con las
componentes cuando el vector parte del origen.

### Vectores iguales

**Dos vectores son iguales si tienen las mismas componentes, aunque
estén dibujados en lugares distintos.**

![](fig:FIG-PLA-VEC-08)

Las tres flechas son el mismo vector, $(3, -1)$. Un vector con las
componentes cambiadas de signo, $(-3, 1)$, es su **opuesto**: mismo largo
y misma dirección, pero sentido contrario. No es igual.

## Suma y resta de vectores

### Sumar por componentes

**Para sumar vectores, se suman las primeras componentes entre sí y las
segundas entre sí.** Para restar, se restan.

$$(6, -1) + (-2, 5) = (4, 4) \qquad (6, -1) - (-2, 5) = (8, -6)$$

Cuidado con los signos: son sumas y restas de enteros. Restar $-2$ es
sumar $2$.

El orden de la resta importa: $u - v$ es el opuesto de $v - u$.

### Sumar dibujando

Hay dos maneras equivalentes:

- **Uno a continuación del otro**: dibuja $v$ partiendo donde termina
  $u$. La suma va desde el inicio de $u$ hasta el final de $v$.

![](fig:FIG-VEC-OP-07)

- **Paralelogramo**: si $u$ y $v$ parten del mismo punto, completa el
  paralelogramo. La suma es la diagonal que **sale del punto común**. La
  otra diagonal, la que une las puntas, es la diferencia.

![](fig:FIG-VEC-OP-08)

### Desplazamientos en contexto

Movimientos en sentidos contrarios se compensan. Si un bote avanza $7$
km al norte y luego $10$ km al sur, su desplazamiento total es
$(0, 7) + (0, -10) = (0, -3)$: quedó $3$ km al sur de donde partió. No
recorrió $3$ km (recorrió $17$), pero su desplazamiento es $(0, -3)$.

## Traslación

### Trasladar es sumar el vector

**Trasladar un punto $P$ según el vector $v$ es sumarle $v$: la imagen es
$P' = P + v$.** Para trasladar una figura, se traslada cada vértice con
el mismo vector.

![](fig:FIG-TRA-TRAS-06)

Si $P = (-5, 0)$ se traslada según $(3, -4)$, su imagen es
$P' = (-2, -4)$: $3$ a la derecha y $4$ hacia abajo.

### El vector de una traslación

Si conoces un punto y su imagen, el vector es **imagen menos punto**,
igual que $B - A$. Con ese vector puedes trasladar cualquier otro punto
de la figura.

### Volver atrás

Si conoces la imagen $P'$ y el vector $v$, el punto original se obtiene
**restando** el vector, que es trasladar según el opuesto:
$P = P' - v$.

![](fig:FIG-TRA-TRAS-07)

Un control rápido: después de calcular $P$, trasládalo según $v$. Tienes
que llegar a $P'$.

### Dos traslaciones seguidas

Trasladar según $u$ y después según $v$ es lo mismo que trasladar una
sola vez según $u + v$.

### Qué conserva una traslación

La figura trasladada tiene la misma forma, el mismo tamaño y la **misma
orientación**: no gira ni se da vuelta. Cada lado queda paralelo a su
lado original. Si una figura aparece girada o reflejada, no es una
traslación.$c$, 2::smallint)
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
  ($c$LES-GEO-TRA-02$c$, $c$GEO-PLA-VEC$c$, 1::smallint, $c$vectores-y-sus-componentes$c$),
  ($c$LES-GEO-TRA-02$c$, $c$GEO-PLA-VEC-OP$c$, 2::smallint, $c$suma-y-resta-de-vectores$c$),
  ($c$LES-GEO-TRA-02$c$, $c$GEO-TRA-TRAS$c$, 3::smallint, $c$traslacion$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-TRA-025$c$, $c$M1-TRA-026$c$, $c$M1-TRA-027$c$, $c$M1-TRA-028$c$, $c$M1-TRA-029$c$, $c$M1-TRA-030$c$, $c$M1-TRA-031$c$, $c$M1-TRA-032$c$, $c$M1-TRA-033$c$, $c$M1-TRA-034$c$, $c$M1-TRA-035$c$, $c$M1-TRA-036$c$, $c$M1-TRA-037$c$, $c$M1-TRA-038$c$, $c$M1-TRA-039$c$, $c$M1-TRA-040$c$, $c$M1-TRA-041$c$, $c$M1-TRA-042$c$, $c$M1-TRA-043$c$, $c$M1-TRA-044$c$, $c$M1-TRA-045$c$, $c$M1-TRA-046$c$, $c$M1-TRA-047$c$, $c$M1-TRA-048$c$, $c$M1-TRA-049$c$, $c$M1-TRA-050$c$, $c$M1-TRA-051$c$, $c$M1-TRA-052$c$, $c$M1-TRA-053$c$, $c$M1-TRA-054$c$, $c$M1-TRA-055$c$, $c$M1-TRA-056$c$, $c$M1-TRA-057$c$, $c$M1-TRA-058$c$, $c$M1-TRA-059$c$, $c$M1-TRA-060$c$, $c$M1-TRA-061$c$, $c$M1-TRA-062$c$, $c$M1-TRA-063$c$, $c$M1-TRA-064$c$, $c$M1-TRA-065$c$, $c$M1-TRA-066$c$, $c$M1-TRA-067$c$, $c$M1-TRA-068$c$, $c$M1-TRA-069$c$, $c$M1-TRA-070$c$, $c$M1-TRA-071$c$, $c$M1-TRA-072$c$, $c$M1-TRA-073$c$, $c$M1-TRA-074$c$, $c$M1-TRA-075$c$, $c$M1-TRA-076$c$, $c$M1-TRA-077$c$, $c$M1-TRA-078$c$, $c$M1-TRA-079$c$, $c$M1-TRA-080$c$, $c$M1-TRA-081$c$, $c$M1-TRA-082$c$, $c$M1-TRA-083$c$, $c$M1-TRA-084$c$, $c$M1-TRA-085$c$, $c$M1-TRA-086$c$, $c$M1-TRA-087$c$, $c$M1-TRA-088$c$, $c$M1-TRA-089$c$, $c$M1-TRA-090$c$, $c$M1-TRA-091$c$, $c$M1-TRA-092$c$, $c$M1-TRA-093$c$, $c$M1-TRA-094$c$, $c$M1-TRA-095$c$, $c$M1-TRA-096$c$);
  if c <> 72 then
    raise exception 'items: se esperaban 72, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-025$c$, $c$M1-TRA-026$c$, $c$M1-TRA-027$c$, $c$M1-TRA-028$c$, $c$M1-TRA-029$c$, $c$M1-TRA-030$c$, $c$M1-TRA-031$c$, $c$M1-TRA-032$c$, $c$M1-TRA-033$c$, $c$M1-TRA-034$c$, $c$M1-TRA-035$c$, $c$M1-TRA-036$c$, $c$M1-TRA-037$c$, $c$M1-TRA-038$c$, $c$M1-TRA-039$c$, $c$M1-TRA-040$c$, $c$M1-TRA-041$c$, $c$M1-TRA-042$c$, $c$M1-TRA-043$c$, $c$M1-TRA-044$c$, $c$M1-TRA-045$c$, $c$M1-TRA-046$c$, $c$M1-TRA-047$c$, $c$M1-TRA-048$c$, $c$M1-TRA-049$c$, $c$M1-TRA-050$c$, $c$M1-TRA-051$c$, $c$M1-TRA-052$c$, $c$M1-TRA-053$c$, $c$M1-TRA-054$c$, $c$M1-TRA-055$c$, $c$M1-TRA-056$c$, $c$M1-TRA-057$c$, $c$M1-TRA-058$c$, $c$M1-TRA-059$c$, $c$M1-TRA-060$c$, $c$M1-TRA-061$c$, $c$M1-TRA-062$c$, $c$M1-TRA-063$c$, $c$M1-TRA-064$c$, $c$M1-TRA-065$c$, $c$M1-TRA-066$c$, $c$M1-TRA-067$c$, $c$M1-TRA-068$c$, $c$M1-TRA-069$c$, $c$M1-TRA-070$c$, $c$M1-TRA-071$c$, $c$M1-TRA-072$c$, $c$M1-TRA-073$c$, $c$M1-TRA-074$c$, $c$M1-TRA-075$c$, $c$M1-TRA-076$c$, $c$M1-TRA-077$c$, $c$M1-TRA-078$c$, $c$M1-TRA-079$c$, $c$M1-TRA-080$c$, $c$M1-TRA-081$c$, $c$M1-TRA-082$c$, $c$M1-TRA-083$c$, $c$M1-TRA-084$c$, $c$M1-TRA-085$c$, $c$M1-TRA-086$c$, $c$M1-TRA-087$c$, $c$M1-TRA-088$c$, $c$M1-TRA-089$c$, $c$M1-TRA-090$c$, $c$M1-TRA-091$c$, $c$M1-TRA-092$c$, $c$M1-TRA-093$c$, $c$M1-TRA-094$c$, $c$M1-TRA-095$c$, $c$M1-TRA-096$c$);
  if c <> 288 then
    raise exception 'item_options: se esperaban 288, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-025$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-026$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-027$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-028$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-029$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-030$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-031$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-032$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-033$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-034$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-035$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-036$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-037$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-038$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-039$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-040$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-041$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-042$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-043$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-044$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-045$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-046$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-047$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-048$c$, $c$GEO-PLA-VEC$c$),
      ($c$M1-TRA-049$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-050$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-051$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-052$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-053$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-054$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-055$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-056$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-057$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-058$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-059$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-060$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-061$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-062$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-063$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-064$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-065$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-066$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-067$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-068$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-069$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-070$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-071$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-072$c$, $c$GEO-PLA-VEC-OP$c$),
      ($c$M1-TRA-073$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-074$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-075$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-076$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-077$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-078$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-079$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-080$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-081$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-082$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-083$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-084$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-085$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-086$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-087$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-088$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-089$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-090$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-091$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-092$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-093$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-094$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-095$c$, $c$GEO-TRA-TRAS$c$),
      ($c$M1-TRA-096$c$, $c$GEO-TRA-TRAS$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 72 then
    raise exception 'node_items: 72 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-TRA-025$c$, $c$M1-TRA-026$c$, $c$M1-TRA-027$c$, $c$M1-TRA-028$c$, $c$M1-TRA-029$c$, $c$M1-TRA-030$c$, $c$M1-TRA-031$c$, $c$M1-TRA-032$c$, $c$M1-TRA-033$c$, $c$M1-TRA-034$c$, $c$M1-TRA-035$c$, $c$M1-TRA-036$c$, $c$M1-TRA-037$c$, $c$M1-TRA-038$c$, $c$M1-TRA-039$c$, $c$M1-TRA-040$c$, $c$M1-TRA-041$c$, $c$M1-TRA-042$c$, $c$M1-TRA-043$c$, $c$M1-TRA-044$c$, $c$M1-TRA-045$c$, $c$M1-TRA-046$c$, $c$M1-TRA-047$c$, $c$M1-TRA-048$c$, $c$M1-TRA-049$c$, $c$M1-TRA-050$c$, $c$M1-TRA-051$c$, $c$M1-TRA-052$c$, $c$M1-TRA-053$c$, $c$M1-TRA-054$c$, $c$M1-TRA-055$c$, $c$M1-TRA-056$c$, $c$M1-TRA-057$c$, $c$M1-TRA-058$c$, $c$M1-TRA-059$c$, $c$M1-TRA-060$c$, $c$M1-TRA-061$c$, $c$M1-TRA-062$c$, $c$M1-TRA-063$c$, $c$M1-TRA-064$c$, $c$M1-TRA-065$c$, $c$M1-TRA-066$c$, $c$M1-TRA-067$c$, $c$M1-TRA-068$c$, $c$M1-TRA-069$c$, $c$M1-TRA-070$c$, $c$M1-TRA-071$c$, $c$M1-TRA-072$c$, $c$M1-TRA-073$c$, $c$M1-TRA-074$c$, $c$M1-TRA-075$c$, $c$M1-TRA-076$c$, $c$M1-TRA-077$c$, $c$M1-TRA-078$c$, $c$M1-TRA-079$c$, $c$M1-TRA-080$c$, $c$M1-TRA-081$c$, $c$M1-TRA-082$c$, $c$M1-TRA-083$c$, $c$M1-TRA-084$c$, $c$M1-TRA-085$c$, $c$M1-TRA-086$c$, $c$M1-TRA-087$c$, $c$M1-TRA-088$c$, $c$M1-TRA-089$c$, $c$M1-TRA-090$c$, $c$M1-TRA-091$c$, $c$M1-TRA-092$c$, $c$M1-TRA-093$c$, $c$M1-TRA-094$c$, $c$M1-TRA-095$c$, $c$M1-TRA-096$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-REGLAMUL$c$, $c$PLA-COORD-CONTEO$c$, $c$PLA-COORD-ESCALA$c$, $c$PLA-COORD-ORDEN$c$, $c$PLA-VEC-ORIGEN$c$, $c$PLA-VEC-POSICION$c$, $c$PLA-VEC-PUNTO$c$, $c$PLA-VEC-SINSIGNO$c$, $c$PLA-VEC-SUMA$c$, $c$PLA-VECOP-PUNTAS$c$, $c$PLA-VECOP-RESTAORDEN$c$, $c$PLA-VECOP-SINSENTIDO$c$, $c$TRA-TRAS-FORMA$c$, $c$TRA-TRAS-SENTIDO$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-TRA-025$c$, $c$FIG-PLA-VEC-01$c$),
      ($c$M1-TRA-028$c$, $c$FIG-PLA-VEC-02$c$),
      ($c$M1-TRA-032$c$, $c$FIG-PLA-VEC-05$c$),
      ($c$M1-TRA-033$c$, $c$FIG-PLA-VEC-03$c$),
      ($c$M1-TRA-036$c$, $c$FIG-PLA-VEC-04$c$),
      ($c$M1-TRA-045$c$, $c$FIG-PLA-VEC-06$c$),
      ($c$M1-TRA-050$c$, $c$FIG-VEC-OP-01$c$),
      ($c$M1-TRA-056$c$, $c$FIG-VEC-OP-02$c$),
      ($c$M1-TRA-059$c$, $c$FIG-VEC-OP-03$c$),
      ($c$M1-TRA-062$c$, $c$FIG-VEC-OP-04$c$),
      ($c$M1-TRA-064$c$, $c$FIG-VEC-OP-05$c$),
      ($c$M1-TRA-072$c$, $c$FIG-VEC-OP-06$c$),
      ($c$M1-TRA-074$c$, $c$FIG-TRA-TRAS-01$c$),
      ($c$M1-TRA-077$c$, $c$FIG-TRA-TRAS-02$c$),
      ($c$M1-TRA-083$c$, $c$FIG-TRA-TRAS-03$c$),
      ($c$M1-TRA-087$c$, $c$FIG-TRA-TRAS-04$c$),
      ($c$M1-TRA-088$c$, $c$FIG-TRA-TRAS-05$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 17 then
    raise exception 'figure_id: 17 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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

-- 72 ítems (72 curated), 288 alternativas, 16 misconceptions referenciadas,
-- 10 remediaciones, 23 figuras, 1 clase sobre 3 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 72 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-TRA-025$c$, $c$M1-TRA-026$c$, $c$M1-TRA-027$c$, $c$M1-TRA-028$c$, $c$M1-TRA-029$c$, $c$M1-TRA-030$c$, $c$M1-TRA-031$c$, $c$M1-TRA-032$c$, $c$M1-TRA-033$c$, $c$M1-TRA-034$c$, $c$M1-TRA-035$c$, $c$M1-TRA-036$c$, $c$M1-TRA-037$c$, $c$M1-TRA-038$c$, $c$M1-TRA-039$c$, $c$M1-TRA-040$c$, $c$M1-TRA-041$c$, $c$M1-TRA-042$c$, $c$M1-TRA-043$c$, $c$M1-TRA-044$c$, $c$M1-TRA-045$c$, $c$M1-TRA-046$c$, $c$M1-TRA-047$c$, $c$M1-TRA-048$c$, $c$M1-TRA-049$c$, $c$M1-TRA-050$c$, $c$M1-TRA-051$c$, $c$M1-TRA-052$c$, $c$M1-TRA-053$c$, $c$M1-TRA-054$c$, $c$M1-TRA-055$c$, $c$M1-TRA-056$c$, $c$M1-TRA-057$c$, $c$M1-TRA-058$c$, $c$M1-TRA-059$c$, $c$M1-TRA-060$c$, $c$M1-TRA-061$c$, $c$M1-TRA-062$c$, $c$M1-TRA-063$c$, $c$M1-TRA-064$c$, $c$M1-TRA-065$c$, $c$M1-TRA-066$c$, $c$M1-TRA-067$c$, $c$M1-TRA-068$c$, $c$M1-TRA-069$c$, $c$M1-TRA-070$c$, $c$M1-TRA-071$c$, $c$M1-TRA-072$c$, $c$M1-TRA-073$c$, $c$M1-TRA-074$c$, $c$M1-TRA-075$c$, $c$M1-TRA-076$c$, $c$M1-TRA-077$c$, $c$M1-TRA-078$c$, $c$M1-TRA-079$c$, $c$M1-TRA-080$c$, $c$M1-TRA-081$c$, $c$M1-TRA-082$c$, $c$M1-TRA-083$c$, $c$M1-TRA-084$c$, $c$M1-TRA-085$c$, $c$M1-TRA-086$c$, $c$M1-TRA-087$c$, $c$M1-TRA-088$c$, $c$M1-TRA-089$c$, $c$M1-TRA-090$c$, $c$M1-TRA-091$c$, $c$M1-TRA-092$c$, $c$M1-TRA-093$c$, $c$M1-TRA-094$c$, $c$M1-TRA-095$c$, $c$M1-TRA-096$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-PLA-VEC-ORIGEN$c$, $c$REM-PLA-VEC-PUNTO$c$, $c$REM-PLA-VEC-SUMA$c$, $c$REM-PLA-VEC-POSICION$c$, $c$REM-PLA-VEC-SINSIGNO$c$, $c$REM-PLA-VECOP-RESTAORDEN$c$, $c$REM-PLA-VECOP-SINSENTIDO$c$, $c$REM-PLA-VECOP-PUNTAS$c$, $c$REM-TRA-TRAS-SENTIDO$c$, $c$REM-TRA-TRAS-FORMA$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-GEO-TRA-02$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-TRA-025$c$, $c$M1-TRA-026$c$, $c$M1-TRA-027$c$, $c$M1-TRA-028$c$, $c$M1-TRA-029$c$, $c$M1-TRA-030$c$, $c$M1-TRA-031$c$, $c$M1-TRA-032$c$, $c$M1-TRA-033$c$, $c$M1-TRA-034$c$, $c$M1-TRA-035$c$, $c$M1-TRA-036$c$, $c$M1-TRA-037$c$, $c$M1-TRA-038$c$, $c$M1-TRA-039$c$, $c$M1-TRA-040$c$, $c$M1-TRA-041$c$, $c$M1-TRA-042$c$, $c$M1-TRA-043$c$, $c$M1-TRA-044$c$, $c$M1-TRA-045$c$, $c$M1-TRA-046$c$, $c$M1-TRA-047$c$, $c$M1-TRA-048$c$, $c$M1-TRA-049$c$, $c$M1-TRA-050$c$, $c$M1-TRA-051$c$, $c$M1-TRA-052$c$, $c$M1-TRA-053$c$, $c$M1-TRA-054$c$, $c$M1-TRA-055$c$, $c$M1-TRA-056$c$, $c$M1-TRA-057$c$, $c$M1-TRA-058$c$, $c$M1-TRA-059$c$, $c$M1-TRA-060$c$, $c$M1-TRA-061$c$, $c$M1-TRA-062$c$, $c$M1-TRA-063$c$, $c$M1-TRA-064$c$, $c$M1-TRA-065$c$, $c$M1-TRA-066$c$, $c$M1-TRA-067$c$, $c$M1-TRA-068$c$, $c$M1-TRA-069$c$, $c$M1-TRA-070$c$, $c$M1-TRA-071$c$, $c$M1-TRA-072$c$, $c$M1-TRA-073$c$, $c$M1-TRA-074$c$, $c$M1-TRA-075$c$, $c$M1-TRA-076$c$, $c$M1-TRA-077$c$, $c$M1-TRA-078$c$, $c$M1-TRA-079$c$, $c$M1-TRA-080$c$, $c$M1-TRA-081$c$, $c$M1-TRA-082$c$, $c$M1-TRA-083$c$, $c$M1-TRA-084$c$, $c$M1-TRA-085$c$, $c$M1-TRA-086$c$, $c$M1-TRA-087$c$, $c$M1-TRA-088$c$, $c$M1-TRA-089$c$, $c$M1-TRA-090$c$, $c$M1-TRA-091$c$, $c$M1-TRA-092$c$, $c$M1-TRA-093$c$, $c$M1-TRA-094$c$, $c$M1-TRA-095$c$, $c$M1-TRA-096$c$) group by 1;
