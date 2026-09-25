-- =====================================================================
-- LES-NUM-ENT-02 — Adición y sustracción de enteros
-- Generado por cargar_contenido.py desde LES-NUM-ENT-02.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-ENT-ADI-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 620 76" width="620" height="76" role="img" aria-label="Recta numérica con 15 marcas equiespaciadas. rótulos: 0; 1. puntos marcados: P; Q" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <line class="eje" x1="14" y1="36" x2="606" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="614,36 604,31 604,41"/>
  <line class="marca" data-valor="-8" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-7" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-6" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-5" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-3" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-1" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="510" y1="29" x2="510" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="550" y1="29" x2="550" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="590" y1="29" x2="590" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="0" x="350" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="1" x="390" y="64" text-anchor="middle">1</text>
  <circle class="punto" data-valor="-6" cx="110" cy="36" r="4.5"/>
  <text class="nombre" x="110" y="18" text-anchor="middle" font-weight="600">P</text>
  <circle class="punto" data-valor="4" cx="510" cy="36" r="4.5"/>
  <text class="nombre" x="510" y="18" text-anchor="middle" font-weight="600">Q</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 540 118" width="540" height="118" role="img" aria-label="Recta numérica de −4 a 8. Desde el 2 sale un salto de +5 hacia la derecha que llega al 7, y un salto de −5 hacia la izquierda que llega al −3" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="526" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="534,36 524,31 524,41"/>
  <line class="marca" data-valor="-4" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-3" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-1" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="7" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="8" x1="510" y1="29" x2="510" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="-4" x="30" y="64" text-anchor="middle">−4</text>
  <text class="rotulo" data-valor="-3" x="70" y="64" text-anchor="middle">−3</text>
  <text class="rotulo" data-valor="-2" x="110" y="64" text-anchor="middle">−2</text>
  <text class="rotulo" data-valor="-1" x="150" y="64" text-anchor="middle">−1</text>
  <text class="rotulo" data-valor="0" x="190" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="1" x="230" y="64" text-anchor="middle">1</text>
  <text class="rotulo" data-valor="2" x="270" y="64" text-anchor="middle">2</text>
  <text class="rotulo" data-valor="3" x="310" y="64" text-anchor="middle">3</text>
  <text class="rotulo" data-valor="4" x="350" y="64" text-anchor="middle">4</text>
  <text class="rotulo" data-valor="5" x="390" y="64" text-anchor="middle">5</text>
  <text class="rotulo" data-valor="6" x="430" y="64" text-anchor="middle">6</text>
  <text class="rotulo" data-valor="7" x="470" y="64" text-anchor="middle">7</text>
  <text class="rotulo" data-valor="8" x="510" y="64" text-anchor="middle">8</text>
  <circle class="punto" data-valor="2" cx="270" cy="36" r="4.5"/>
  </g>
  <path class="salto" data-desde="2" data-hasta="7" fill="none" stroke="currentColor" stroke-width="1.3" d="M270,68 Q370,8 470,68"/>
  <polygon class="punta" points="470,68 462.02,67.70 465.98,61.10"/>
  <text class="cambio" data-valor="5" x="370" y="33" text-anchor="middle" font-weight="600">+5</text>
  <path class="salto" data-desde="2" data-hasta="-3" fill="none" stroke="currentColor" stroke-width="1.3" d="M270,68 Q170,8 70,68"/>
  <polygon class="punta" points="70,68 74.02,61.10 77.98,67.70"/>
  <text class="cambio" data-valor="-5" x="170" y="33" text-anchor="middle" font-weight="600">−5</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 460 118" width="460" height="118" role="img" aria-label="Recta numérica de −36 a 4 con marcas cada 4. Desde el −12 sale un salto de −20 hacia la izquierda que llega al −32" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="446" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="454,36 444,31 444,41"/>
  <line class="marca" data-valor="-36" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-32" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-28" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-24" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-20" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-16" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-12" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-8" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="-36" x="30" y="64" text-anchor="middle">−36</text>
  <text class="rotulo" data-valor="-32" x="70" y="64" text-anchor="middle">−32</text>
  <text class="rotulo" data-valor="-28" x="110" y="64" text-anchor="middle">−28</text>
  <text class="rotulo" data-valor="-24" x="150" y="64" text-anchor="middle">−24</text>
  <text class="rotulo" data-valor="-20" x="190" y="64" text-anchor="middle">−20</text>
  <text class="rotulo" data-valor="-16" x="230" y="64" text-anchor="middle">−16</text>
  <text class="rotulo" data-valor="-12" x="270" y="64" text-anchor="middle">−12</text>
  <text class="rotulo" data-valor="-8" x="310" y="64" text-anchor="middle">−8</text>
  <text class="rotulo" data-valor="-4" x="350" y="64" text-anchor="middle">−4</text>
  <text class="rotulo" data-valor="0" x="390" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="4" x="430" y="64" text-anchor="middle">4</text>
  <circle class="punto" data-valor="-12" cx="270" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-32" cx="70" cy="36" r="4.5"/>
  </g>
  <path class="salto" data-desde="-12" data-hasta="-32" fill="none" stroke="currentColor" stroke-width="1.3" d="M270,68 Q170,8 70,68"/>
  <polygon class="punta" points="70,68 74.02,61.10 77.98,67.70"/>
  <text class="cambio" data-valor="-20" x="170" y="33" text-anchor="middle" font-weight="600">−20</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 340 118" width="340" height="118" role="img" aria-label="Recta numérica de −24 a 18 con marcas cada 6. Desde el −18 sale un salto de +12 hacia la derecha que llega al −6, que queda entre −18 y 12" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="326" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="334,36 324,31 324,41"/>
  <line class="marca" data-valor="-24" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-18" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-12" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-6" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="12" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="18" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="-24" x="30" y="64" text-anchor="middle">−24</text>
  <text class="rotulo" data-valor="-18" x="70" y="64" text-anchor="middle">−18</text>
  <text class="rotulo" data-valor="-12" x="110" y="64" text-anchor="middle">−12</text>
  <text class="rotulo" data-valor="-6" x="150" y="64" text-anchor="middle">−6</text>
  <text class="rotulo" data-valor="0" x="190" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="6" x="230" y="64" text-anchor="middle">6</text>
  <text class="rotulo" data-valor="12" x="270" y="64" text-anchor="middle">12</text>
  <text class="rotulo" data-valor="18" x="310" y="64" text-anchor="middle">18</text>
  <circle class="punto" data-valor="-18" cx="70" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-6" cx="150" cy="36" r="4.5"/>
  </g>
  <path class="salto" data-desde="-18" data-hasta="-6" fill="none" stroke="currentColor" stroke-width="1.3" d="M70,68 Q110,8 150,68"/>
  <polygon class="punta" points="150,68 142.91,64.31 149.32,60.04"/>
  <text class="cambio" data-valor="12" x="110" y="33" text-anchor="middle" font-weight="600">+12</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 580 118" width="580" height="118" role="img" aria-label="Recta numérica de 0 a 13. Desde el 7 sale un salto de −5 hacia la izquierda que llega al 2, y un salto de +5 hacia la derecha que llega al 12" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,42)">
  <line class="eje" x1="14" y1="36" x2="566" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="574,36 564,31 564,41"/>
  <line class="marca" data-valor="0" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="7" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="8" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="9" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="10" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="11" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="12" x1="510" y1="29" x2="510" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="13" x1="550" y1="29" x2="550" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="0" x="30" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="1" x="70" y="64" text-anchor="middle">1</text>
  <text class="rotulo" data-valor="2" x="110" y="64" text-anchor="middle">2</text>
  <text class="rotulo" data-valor="3" x="150" y="64" text-anchor="middle">3</text>
  <text class="rotulo" data-valor="4" x="190" y="64" text-anchor="middle">4</text>
  <text class="rotulo" data-valor="5" x="230" y="64" text-anchor="middle">5</text>
  <text class="rotulo" data-valor="6" x="270" y="64" text-anchor="middle">6</text>
  <text class="rotulo" data-valor="7" x="310" y="64" text-anchor="middle">7</text>
  <text class="rotulo" data-valor="8" x="350" y="64" text-anchor="middle">8</text>
  <text class="rotulo" data-valor="9" x="390" y="64" text-anchor="middle">9</text>
  <text class="rotulo" data-valor="10" x="430" y="64" text-anchor="middle">10</text>
  <text class="rotulo" data-valor="11" x="470" y="64" text-anchor="middle">11</text>
  <text class="rotulo" data-valor="12" x="510" y="64" text-anchor="middle">12</text>
  <text class="rotulo" data-valor="13" x="550" y="64" text-anchor="middle">13</text>
  <circle class="punto" data-valor="7" cx="310" cy="36" r="4.5"/>
  </g>
  <path class="salto" data-desde="7" data-hasta="2" fill="none" stroke="currentColor" stroke-width="1.3" d="M310,68 Q210,8 110,68"/>
  <polygon class="punta" points="110,68 114.02,61.10 117.98,67.70"/>
  <text class="cambio" data-valor="-5" x="210" y="33" text-anchor="middle" font-weight="600">−5</text>
  <path class="salto" data-desde="7" data-hasta="12" fill="none" stroke="currentColor" stroke-width="1.3" d="M310,68 Q410,8 510,68"/>
  <polygon class="punta" points="510,68 502.02,67.70 505.98,61.10"/>
  <text class="cambio" data-valor="5" x="410" y="33" text-anchor="middle" font-weight="600">+5</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 148" width="300" height="148" role="img" aria-label="Recta numérica de −15 a 15 con marcas cada 5. Primer salto de +20 desde el −10 hasta el 10; segundo salto de −15 desde el 10 hasta el −5" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,72)">
  <line class="eje" x1="14" y1="36" x2="286" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="294,36 284,31 284,41"/>
  <line class="marca" data-valor="-15" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-10" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-5" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="10" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="15" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="-15" x="30" y="64" text-anchor="middle">−15</text>
  <text class="rotulo" data-valor="-10" x="70" y="64" text-anchor="middle">−10</text>
  <text class="rotulo" data-valor="-5" x="110" y="64" text-anchor="middle">−5</text>
  <text class="rotulo" data-valor="0" x="150" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="5" x="190" y="64" text-anchor="middle">5</text>
  <text class="rotulo" data-valor="10" x="230" y="64" text-anchor="middle">10</text>
  <text class="rotulo" data-valor="15" x="270" y="64" text-anchor="middle">15</text>
  <circle class="punto" data-valor="-10" cx="70" cy="36" r="4.5"/>
  <circle class="punto" data-valor="10" cx="230" cy="36" r="4.5"/>
  <circle class="punto" data-valor="-5" cx="110" cy="36" r="4.5"/>
  </g>
  <path class="salto" data-desde="-10" data-hasta="10" fill="none" stroke="currentColor" stroke-width="1.3" d="M70,98 Q150,38 230,98"/>
  <polygon class="punta" points="230,98 222.09,96.88 226.71,90.72"/>
  <text class="cambio" data-valor="20" x="150" y="83" text-anchor="middle" font-weight="600">+20</text>
  <path class="salto" data-desde="10" data-hasta="-5" fill="none" stroke="currentColor" stroke-width="1.3" d="M230,98 Q170,-22 110,98"/>
  <polygon class="punta" points="110,98 109.69,90.02 116.57,93.46"/>
  <text class="cambio" data-valor="-15" x="170" y="33" text-anchor="middle" font-weight="600">−15</text>
</svg>
$c$),
  ($c$FIG-ENT-ADI-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 580 124" width="580" height="124" role="img" aria-label="Recta numérica con 14 marcas equiespaciadas. rótulos: 0; 1. puntos marcados: A; B" fill="currentColor" font-family="Manrope, Verdana, sans-serif" font-size="15" stroke-linecap="round">
  <g transform="translate(0,48)">
  <line class="eje" x1="14" y1="36" x2="566" y2="36" stroke="currentColor" stroke-width="1.3"/>
  <polygon points="6,36 16,31 16,41"/>
  <polygon points="574,36 564,31 564,41"/>
  <line class="marca" data-valor="-6" x1="30" y1="29" x2="30" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-5" x1="70" y1="29" x2="70" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-4" x1="110" y1="29" x2="110" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-3" x1="150" y1="29" x2="150" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-2" x1="190" y1="29" x2="190" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="-1" x1="230" y1="29" x2="230" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="0" x1="270" y1="29" x2="270" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="1" x1="310" y1="29" x2="310" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="2" x1="350" y1="29" x2="350" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="3" x1="390" y1="29" x2="390" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="4" x1="430" y1="29" x2="430" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="5" x1="470" y1="29" x2="470" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="6" x1="510" y1="29" x2="510" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <line class="marca" data-valor="7" x1="550" y1="29" x2="550" y2="43" stroke="currentColor" stroke-width="1.3"/>
  <text class="rotulo" data-valor="0" x="270" y="64" text-anchor="middle">0</text>
  <text class="rotulo" data-valor="1" x="310" y="64" text-anchor="middle">1</text>
  <circle class="punto" data-valor="-4" cx="110" cy="36" r="4.5"/>
  <text class="nombre" x="110" y="18" text-anchor="middle" font-weight="600">A</text>
  <circle class="punto" data-valor="5" cx="470" cy="36" r="4.5"/>
  <text class="nombre" x="470" y="18" text-anchor="middle" font-weight="600">B</text>
  </g>
  <path class="salto" data-desde="-4" data-hasta="5" fill="none" stroke="currentColor" stroke-width="1.3" d="M110,52 Q290,-8 470,52"/>
  <polygon class="punta" points="470,52 462.14,53.44 464.58,46.13"/>
  <text class="cambio" data-valor="9" x="290" y="17" text-anchor="middle" font-weight="600">+9</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-ENT-025$c$, $c$¿Cuál es el resultado de $-6 - 9$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-026$c$, $c$A las 7:00 la temperatura en Coyhaique era de 8 °C bajo cero. Hasta el mediodía subió 5 °C. ¿Qué temperatura había al mediodía?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-027$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-028$c$, $c$Una ficha está en el $3$ de la recta numérica y se mueve 7 unidades hacia la izquierda. ¿Cuál opción representa el movimiento y el lugar donde queda la ficha?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-029$c$, $c$¿Cuál es el resultado de $-2 - (-7)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-030$c$, $c$En un edificio la calle es el piso $0$. Un ascensor está en el tercer subterráneo y baja 4 pisos. ¿En qué piso queda?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-031$c$, $c$En Chillán la temperatura pasó de $2$ °C a $-5$ °C durante la noche. ¿Cuál fue la variación de la temperatura?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-032$c$, $c$¿En cuál de las siguientes operaciones el resultado es $4$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-033$c$, $c$¿Cuál es el resultado de $-4 - 6 + 9$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-034$c$, $c$¿Cuál es el resultado de $-6 - (-2) + 5$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-035$c$, $c$En Puerto Natales la temperatura a las 6:00 era de $-5$ °C y a las 14:00 era de $3$ °C. ¿Cuál fue la variación de la temperatura entre esas horas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-036$c$, $c$Considerando el nivel del mar como $0$, una buzo está a $-15$ m y sube hasta $-6$ m. ¿Cuál fue la variación de su posición?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-037$c$, $c$¿En cuál de las siguientes operaciones el resultado es $-4$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-038$c$, $c$En la recta numérica de la figura, ¿qué número hay que sumarle a $P$ para obtener $Q$?$c$, 2, $c$propio$c$::text, $c$FIG-ENT-ADI-01$c$::text),
  ($c$M1-ENT-039$c$, $c$¿Cuál es el resultado de $-3 + 8 - 10 + 1$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-040$c$, $c$¿Cuál es el resultado de $6 - 9 - 4$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-041$c$, $c$Considera las siguientes igualdades:

I) $-8 + 3 = -5$

II) $4 - (-6) = -2$

III) $-2 - 7 = -9$

¿Cuál(es) es(son) verdadera(s)?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-042$c$, $c$En Putre, a las 5:00 el termómetro marcaba $-4$ °C. Hasta las 7:00 la temperatura bajó 3 °C, y desde las 7:00 hasta el mediodía subió 9 °C. ¿Qué temperatura marcaba el termómetro al mediodía?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-043$c$, $c$Considerando el nivel del mar como $0$, Ana bajó desde $-12$ m hasta $-30$ m, y Tomás subió desde $-25$ m hasta $-9$ m. ¿Cuáles fueron las variaciones de posición de Ana y de Tomás, respectivamente?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-044$c$, $c$Sofía tiene una deuda de 3 mil pesos con su hermano. Durante la semana recibe 10 mil pesos, gasta 4 mil pesos en transporte y después 5 mil pesos en almuerzos. Si representa su dinero con un entero (en miles de pesos), ¿con qué número termina la semana?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-045$c$, $c$Sean $a$ un número entero negativo y $b$ un número entero positivo. ¿Cuál de las siguientes afirmaciones es siempre verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-046$c$, $c$Un día de julio, en Visviri la temperatura mínima fue $-9$ °C y la máxima $14$ °C. Ese mismo día, en Punta Arenas la mínima fue $-3$ °C y la máxima $6$ °C. ¿En cuál de las dos ciudades fue mayor la diferencia entre la máxima y la mínima, y cuánto fue?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-047$c$, $c$Considera las siguientes igualdades:

I) $-5 - 5 = 0$

II) $10 - 4 + 3 = 9$

III) $-2 - (-8) = 6$

¿Cuál(es) es(son) verdadera(s)?
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-048$c$, $c$Sean $M = -3 - 9$ y $N = -15 + 4$. ¿Cuál de las siguientes afirmaciones es verdadera?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-ENT-025$c$, $c$A$c$, $c$$-3$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-025$c$, $c$B$c$, $c$$15$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-025$c$, $c$C$c$, $c$$-15$$c$, true, null),
  ($c$M1-ENT-025$c$, $c$D$c$, $c$$3$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-026$c$, $c$A$c$, $c$$-3$ °C$c$, true, null),
  ($c$M1-ENT-026$c$, $c$B$c$, $c$$-13$ °C$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-026$c$, $c$C$c$, $c$$3$ °C$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-026$c$, $c$D$c$, $c$$13$ °C$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-027$c$, $c$A$c$, $c$$4 - 11 = 7$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-027$c$, $c$B$c$, $c$$-5 - 3 = 8$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-027$c$, $c$C$c$, $c$$-9 + 4 = -13$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-027$c$, $c$D$c$, $c$$6 - (-2) = 8$$c$, true, null),
  ($c$M1-ENT-028$c$, $c$A$c$, $c$$3 + 7 = 10$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-028$c$, $c$B$c$, $c$$3 + (-7) = -4$$c$, true, null),
  ($c$M1-ENT-028$c$, $c$C$c$, $c$$3 + (-7) = 4$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-028$c$, $c$D$c$, $c$$3 + (-7) = -10$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-029$c$, $c$A$c$, $c$$5$$c$, true, null),
  ($c$M1-ENT-029$c$, $c$B$c$, $c$$-9$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-029$c$, $c$C$c$, $c$$-5$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-029$c$, $c$D$c$, $c$$9$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-030$c$, $c$A$c$, $c$En el piso $7$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-030$c$, $c$B$c$, $c$En el piso $-1$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-030$c$, $c$C$c$, $c$En el piso $1$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-030$c$, $c$D$c$, $c$En el piso $-7$$c$, true, null),
  ($c$M1-ENT-031$c$, $c$A$c$, $c$$7$ °C$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-031$c$, $c$B$c$, $c$$-7$ °C$c$, true, null),
  ($c$M1-ENT-031$c$, $c$C$c$, $c$$-3$ °C$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-031$c$, $c$D$c$, $c$$3$ °C$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-032$c$, $c$A$c$, $c$$3 - 7$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-032$c$, $c$B$c$, $c$$-1 - 3$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-032$c$, $c$C$c$, $c$$-3 + 7$$c$, true, null),
  ($c$M1-ENT-032$c$, $c$D$c$, $c$$9 - (-5)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-033$c$, $c$A$c$, $c$$-19$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-033$c$, $c$B$c$, $c$$19$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-033$c$, $c$C$c$, $c$$1$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-033$c$, $c$D$c$, $c$$-1$$c$, true, null),
  ($c$M1-ENT-034$c$, $c$A$c$, $c$$1$$c$, true, null),
  ($c$M1-ENT-034$c$, $c$B$c$, $c$$-3$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-034$c$, $c$C$c$, $c$$-9$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-034$c$, $c$D$c$, $c$$13$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-035$c$, $c$A$c$, $c$$-8$ °C$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-035$c$, $c$B$c$, $c$$-2$ °C$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-035$c$, $c$C$c$, $c$$8$ °C$c$, true, null),
  ($c$M1-ENT-035$c$, $c$D$c$, $c$$9$ °C$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-036$c$, $c$A$c$, $c$$-9$ m$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-036$c$, $c$B$c$, $c$$9$ m$c$, true, null),
  ($c$M1-ENT-036$c$, $c$C$c$, $c$$-21$ m$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-036$c$, $c$D$c$, $c$$10$ m$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-037$c$, $c$A$c$, $c$$-7 + 5 - 2$$c$, true, null),
  ($c$M1-ENT-037$c$, $c$B$c$, $c$$-1 - 5$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-037$c$, $c$C$c$, $c$$-1 - (-3)$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-037$c$, $c$D$c$, $c$$2 - 5 + 1$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-038$c$, $c$A$c$, $c$$-10$$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-038$c$, $c$B$c$, $c$$-2$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-038$c$, $c$C$c$, $c$$11$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-038$c$, $c$D$c$, $c$$10$$c$, true, null),
  ($c$M1-ENT-039$c$, $c$A$c$, $c$$-6$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-039$c$, $c$B$c$, $c$$4$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-039$c$, $c$C$c$, $c$$-4$$c$, true, null),
  ($c$M1-ENT-039$c$, $c$D$c$, $c$$-22$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-040$c$, $c$A$c$, $c$$1$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-040$c$, $c$B$c$, $c$$-7$$c$, true, null),
  ($c$M1-ENT-040$c$, $c$C$c$, $c$$-1$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-040$c$, $c$D$c$, $c$$7$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-041$c$, $c$A$c$, $c$I, II y III$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-041$c$, $c$B$c$, $c$Solo I$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-041$c$, $c$C$c$, $c$Solo II$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-041$c$, $c$D$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-042$c$, $c$A$c$, $c$$2$ °C$c$, true, null),
  ($c$M1-ENT-042$c$, $c$B$c$, $c$$-16$ °C$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-042$c$, $c$C$c$, $c$$-10$ °C$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-042$c$, $c$D$c$, $c$$8$ °C$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-043$c$, $c$A$c$, $c$$18$ m y $-16$ m$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-043$c$, $c$B$c$, $c$$-42$ m y $-34$ m$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-043$c$, $c$C$c$, $c$$-18$ m y $16$ m$c$, true, null),
  ($c$M1-ENT-043$c$, $c$D$c$, $c$$42$ m y $34$ m$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-044$c$, $c$A$c$, $c$$8$$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-044$c$, $c$B$c$, $c$$-2$$c$, true, null),
  ($c$M1-ENT-044$c$, $c$C$c$, $c$$2$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-044$c$, $c$D$c$, $c$$4$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-045$c$, $c$A$c$, $c$$a - b$ es negativo$c$, true, null),
  ($c$M1-ENT-045$c$, $c$B$c$, $c$$a + b$ es negativo$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-045$c$, $c$C$c$, $c$$a - b$ es positivo$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-045$c$, $c$D$c$, $c$$b - a$ es menor que $b$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-046$c$, $c$A$c$, $c$En Visviri, con $5$ °C$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-046$c$, $c$B$c$, $c$En Punta Arenas, con $-9$ °C$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-046$c$, $c$C$c$, $c$En Visviri, con $24$ °C$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-046$c$, $c$D$c$, $c$En Visviri, con $23$ °C$c$, true, null),
  ($c$M1-ENT-047$c$, $c$A$c$, $c$Solo II$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-047$c$, $c$B$c$, $c$Solo II y III$c$, true, null),
  ($c$M1-ENT-047$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-047$c$, $c$D$c$, $c$Solo III$c$, false, $c$ENT-ADI-RESTAGRUPA$c$),
  ($c$M1-ENT-048$c$, $c$A$c$, $c$$M = -12$ y $N = -11$, por lo tanto $M > N$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-048$c$, $c$B$c$, $c$$M = 12$ y $N = -11$, por lo tanto $M > N$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-048$c$, $c$C$c$, $c$$M = -12$ y $N = -11$, por lo tanto $M < N$$c$, true, null),
  ($c$M1-ENT-048$c$, $c$D$c$, $c$$M = 6$ y $N = 11$, por lo tanto $M < N$$c$, false, $c$ENT-ADI-INVIERTE$c$)
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
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-025$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-026$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-027$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-028$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-029$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-030$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-031$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-032$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-033$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-034$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-035$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-036$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-037$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-038$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-039$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-040$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-041$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-042$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-043$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-044$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-045$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-046$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-047$c$),
  ($c$NUM-ENT-ADI$c$, $c$M1-ENT-048$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-REGLAMUL$c$, $c$"Menos con menos da más" es solo para multiplicar$c$, $c$Juntaste dos cantidades negativas y te dio un resultado positivo,
como si $-20 - 30$ fuera $50$. Usaste la regla de los signos de la
multiplicación, pero aquí no hay ninguna multiplicación.

En una suma o resta, los números se mueven en la recta. Restar $30$
es moverse $30$ hacia la izquierda:

**Si partes en un negativo y te mueves hacia la izquierda, quedas
más a la izquierda todavía.**

Piénsalo con plata: debes 20 mil pesos y gastas 30 mil más. No
puedes terminar con plata a favor. Terminas debiendo 50 mil:

$$-20 - 30 = -50$$

Lo mismo pasa con $-20 + (-30)$: sumar un negativo también es ir
hacia la izquierda, y da $-50$.

Un control rápido: si todas las cantidades que juntas son
negativas, el resultado **tiene que ser negativo**.$c$),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$ENT-ADI-MAGNOP$c$, $c$Los signos de los números deciden si sumas o restas$c$, $c$Te guiaste por el símbolo de la operación: como veías un "$+$",
sumaste los números sin signo. Así, $-20 + 50$ te habría dado
$-70$.

Pero en $-20 + 50$ importan los signos de los números. Uno te lleva
a la izquierda y el otro a la derecha, así que se descuentan:

**Si los signos son distintos, restas los tamaños y pones el signo
del que tiene mayor tamaño.**

El tamaño es la distancia al $0$, sin mirar el signo:

- Tamaños: $20$ y $50$. Los restas: $50 - 20 = 30$.
- El de mayor tamaño es $50$, que es positivo.
- Resultado: $-20 + 50 = 30$.

Si los dos números tienen el **mismo** signo, ahí sí sumas los
tamaños y conservas ese signo.

Un control rápido: el resultado de una suma con signos distintos
queda **entre los dos números**. $30$ está entre $-20$ y $50$;
$-70$ no.$c$),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$ENT-ADI-INVIERTE$c$, $c$Si restas más de lo que tienes, pasas bajo el cero$c$, $c$Restaste al revés: como "no se puede" quitar un número grande a
uno chico, diste vuelta la resta. Así, $20 - 50$ te habría dado
$30$.

Con los naturales eso no se podía hacer. Con los enteros sí se
puede, y el resultado es negativo. En la recta, partes en $20$ y te
mueves $50$ hacia la izquierda: los primeros $20$ pasos te llevan
al $0$ y los otros $30$ te dejan en $-30$.

**$a - b$ y $b - a$ no son lo mismo: tienen el mismo tamaño y signos
contrarios.**

$$20 - 50 = -30 \qquad 50 - 20 = 30$$

Con temperaturas se ve solo: si hace $20$ °C y baja $50$ °C, no
puede quedar en $30$ °C, más caluroso que al principio.

Un control rápido: si a un número le restas otro **mayor**, el
resultado es **negativo**.$c$),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-DOBLENEG$c$, $c$Restar un negativo es sumar$c$, $c$Restaste un número negativo como si fuera positivo: tomaste
$20 - (-30)$ como $20 - 30$.

Restar es sumar el opuesto. Eso vale siempre, también cuando el
número que restas es negativo:

**$a - (-b) = a + b$**

Piensa en qué es "quitar una deuda". Si alguien te perdona una
deuda de 30 mil pesos, no quedas más pobre: quedas 30 mil más
rico. Por eso:

$$20 - (-30) = 20 + 30 = 50$$

Esto aparece mucho cuando calculas una diferencia que cruza el
cero. Entre $-30$ °C y $20$ °C hay $20 - (-30) = 50$ grados, no
$-10$.

Un control rápido: si restas un negativo, el resultado tiene que
ser **mayor** que el número con que partiste.$c$),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$Cada signo afecta solo al número que tiene al lado$c$, $c$Trataste el primer signo menos como si afectara a todo lo que
venía después. Así, $20 - 30 + 50$ te habría dado
$20 - (30 + 50) = -60$.

Pero en una cadena de sumas y restas **cada signo va pegado al
número que tiene a su derecha**, y nada más. Se resuelve de
izquierda a derecha, de a una operación:

$$20 - 30 + 50 = -10 + 50 = 40$$

Otra forma que sirve para cadenas largas: junta por un lado lo que
suma y por otro lo que resta.

- Lo que suma: $20 + 50 = 70$.
- Lo que resta: $30$.
- Resultado: $70 - 30 = 40$.

Los dos caminos tienen que dar lo mismo. Si no coinciden, en algún
paso le aplicaste un signo a un número que no era el suyo.

Un control rápido: el $+50$ del final tiene que hacer **subir** el
resultado, no bajarlo.$c$),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$ENT-ADI-VARORDEN$c$, $c$Variación es final menos inicial$c$, $c$Calculaste la variación al revés, como inicial menos final. El
tamaño te dio bien, pero el signo quedó al revés: una subida te
apareció como bajada, o al contrario.

La variación responde "¿cuánto cambió desde el principio hasta el
final?". Por eso siempre se calcula igual:

**variación = valor final − valor inicial**

Por ejemplo, si un globo meteorológico está a $-20$ °C y después
llega a una zona con $-50$ °C:

$$\text{variación} = -50 - (-20) = -50 + 20 = -30$$

El signo te dice la dirección: **positivo si subió**, **negativo si
bajó**. Aquí la temperatura bajó, y el $-30$ lo muestra.

Un control rápido: antes de calcular, mira si el valor subió o
bajó. El signo de tu resultado tiene que coincidir con eso.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-ADI-REGLAMUL$c$, $c$REM-ENT-ADI-MAGNOP$c$, $c$REM-ENT-ADI-INVIERTE$c$, $c$REM-ENT-ADI-DOBLENEG$c$, $c$REM-ENT-ADI-RESTAGRUPA$c$, $c$REM-ENT-ADI-VARORDEN$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-025$c$, 1::smallint),
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-030$c$, 2::smallint),
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-033$c$, 3::smallint),
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-040$c$, 4::smallint),
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-041$c$, 5::smallint),
  ($c$REM-ENT-ADI-REGLAMUL$c$, $c$M1-ENT-048$c$, 6::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-026$c$, 1::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-029$c$, 2::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-037$c$, 3::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-039$c$, 4::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-042$c$, 5::smallint),
  ($c$REM-ENT-ADI-MAGNOP$c$, $c$M1-ENT-045$c$, 6::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-027$c$, 1::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-031$c$, 2::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-039$c$, 3::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-040$c$, 4::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-044$c$, 5::smallint),
  ($c$REM-ENT-ADI-INVIERTE$c$, $c$M1-ENT-048$c$, 6::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-029$c$, 1::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-032$c$, 2::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-034$c$, 3::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-038$c$, 4::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-041$c$, 5::smallint),
  ($c$REM-ENT-ADI-DOBLENEG$c$, $c$M1-ENT-047$c$, 6::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-033$c$, 1::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-034$c$, 2::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-037$c$, 3::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-040$c$, 4::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-042$c$, 5::smallint),
  ($c$REM-ENT-ADI-RESTAGRUPA$c$, $c$M1-ENT-047$c$, 6::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-031$c$, 1::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-035$c$, 2::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-036$c$, 3::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-038$c$, 4::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-043$c$, 5::smallint),
  ($c$REM-ENT-ADI-VARORDEN$c$, $c$M1-ENT-046$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-02$c$, $c$NUM-ENT$c$, $c$Adición y sustracción de enteros$c$, $c$Ya sabes ubicar los enteros en la recta y compararlos. Ahora vas a
operar con ellos: sumar y restar enteros es la base de todo lo que
viene después, desde las fracciones con signo hasta las ecuaciones.

## Adición y sustracción de enteros

### Sumar es moverse en la recta

Sumar un positivo es moverse hacia la **derecha**. Sumar un negativo
es moverse hacia la **izquierda**.

![](fig:FIG-ENT-ADI-02)

$$2 + 5 = 7 \qquad 2 + (-5) = -3$$

Si partes en $2$ y te mueves $5$ a la izquierda, pasas por el $0$ y
llegas a $-3$. Para no dibujar la recta en cada cuenta, hay dos reglas
que dependen de los signos.

### Números con el mismo signo

Para hablar de los signos conviene separar el **tamaño** de un número:
su distancia al $0$, sin mirar el signo. El tamaño de $-12$ es $12$.

**Si los dos números tienen el mismo signo, sumas los tamaños y
conservas el signo.**

![](fig:FIG-ENT-ADI-03)

$$-12 + (-20) = -32$$

Partes en $-12$ y te mueves $20$ más hacia la izquierda: quedas
todavía más a la izquierda. Juntar dos cantidades negativas siempre
da negativo.

Este es el error más común: "menos con menos da más" es una regla de
la **multiplicación**. En una suma no se usa. Si debes 12 mil pesos y
te endeudas 20 mil más, no quedas con plata a favor.

### Números con distinto signo

Aquí los movimientos se descuentan: uno te lleva a la derecha y el otro
a la izquierda.

**Si los signos son distintos, restas los tamaños y pones el signo del
que tiene mayor tamaño.**

![](fig:FIG-ENT-ADI-04)

$$-18 + 12 = -6$$

Los tamaños son $18$ y $12$, que restados dan $6$. El de mayor tamaño
es $-18$, así que el resultado es negativo. En la recta: desde $-18$
avanzas $12$ hacia la derecha, pero no alcanzas a llegar al $0$.

Ojo con esto: el símbolo "$+$" de la operación no te dice que sumes
los tamaños. Lo deciden los signos de los números.

Un control rápido: con signos distintos, el resultado siempre queda
**entre los dos números**. $-6$ está entre $-18$ y $12$.

### Restar es sumar el opuesto

El **opuesto** de un número está a la misma distancia del $0$, pero
al otro lado: el opuesto de $5$ es $-5$ y el opuesto de $-5$ es $5$.
Toda resta se convierte en una suma:

**Restar un número es sumar su opuesto.**

$$11 - 16 = 11 + (-16) = -5$$

Con los naturales no podías restar un número mayor. Con los enteros
sí se puede, y el resultado es negativo. Además, $11 - 16$ y $16 - 11$
**no** son lo mismo: dan $-5$ y $5$.

El caso que más se equivoca es **restar un negativo**. Compara estas
dos restas en la recta:

![](fig:FIG-ENT-ADI-05)

$$7 - 5 = 2 \qquad 7 - (-5) = 7 + 5 = 12$$

Restar $5$ te lleva a la izquierda. Restar $-5$ es lo contrario: te
lleva a la derecha. Quitar una deuda te deja más rico. Si restas un
negativo, el resultado es mayor que el número con que partiste.

### Cadenas de sumas y restas

Cuando hay varias operaciones seguidas, cada signo va pegado al número
que tiene a su derecha. Se resuelve de **izquierda a derecha**, un
salto a la vez:

![](fig:FIG-ENT-ADI-06)

$$-10 + 20 - 15 = 10 - 15 = -5$$

El signo menos del $15$ afecta solo al $15$, no a lo que venga después.

En cadenas largas sirve juntar lo que suma por un lado y lo que resta
por otro, y al final hacer una sola resta. Si aparece un paréntesis,
primero calculas lo que está adentro.

### Variación y diferencia

Cuando algo cambia de un valor a otro, la **variación** es:

**variación = valor final − valor inicial**

Si es positiva, el valor subió. Si es negativa, bajó. Si la
temperatura pasa de $-11$ °C a $-2$ °C:

$$-2 - (-11) = -2 + 11 = 9$$

Subió $9$ grados. En la recta es el salto que lleva de un punto al
otro: cuánto mide y hacia dónde va.

![](fig:FIG-ENT-ADI-07)

Solo están rotulados el $0$ y el $1$, así que cada salto vale $1$:
$A$ está en $-4$ y $B$ en $5$. Para ir desde $A$ hasta $B$ hay que
avanzar $9$ hacia la derecha: $B - A = 5 - (-4) = 9$. Cuenta los
saltos, no los números.

### Sumas y restas en contexto

Primero traduce cada dato a un entero con su signo. Después opera.

- Sube, deposita, recibe, avanza: **sumas**.
- Baja, gasta, paga, retrocede: **restas**.
- Bajo cero, subterráneo, deuda: **número negativo**.

Un buzo a $11$ m bajo el nivel del mar que baja $7$ m más queda en
$-11 - 7 = -18$, es decir, a $18$ m bajo el nivel del mar.$c$, 2::smallint)
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
  ($c$LES-NUM-ENT-02$c$, $c$NUM-ENT-ADI$c$, 1::smallint, $c$adicion-y-sustraccion-de-enteros$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$);
  if c <> 24 then
    raise exception 'items: se esperaban 24, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$);
  if c <> 96 then
    raise exception 'item_options: se esperaban 96, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-025$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-026$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-027$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-028$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-029$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-030$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-031$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-032$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-033$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-034$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-035$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-036$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-037$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-038$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-039$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-040$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-041$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-042$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-043$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-044$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-045$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-046$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-047$c$, $c$NUM-ENT-ADI$c$),
      ($c$M1-ENT-048$c$, $c$NUM-ENT-ADI$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 24 then
    raise exception 'node_items: 24 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-REC-MAGN$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-038$c$, $c$FIG-ENT-ADI-01$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 1 then
    raise exception 'figure_id: 1 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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
      or not (code = any (array[$c$FIG-ENT-ADI-01$c$, $c$FIG-ENT-ADI-02$c$, $c$FIG-ENT-ADI-03$c$, $c$FIG-ENT-ADI-04$c$, $c$FIG-ENT-ADI-05$c$, $c$FIG-ENT-ADI-06$c$, $c$FIG-ENT-ADI-07$c$, $c$FIG-ENT-REC-01$c$, $c$FIG-ENT-REC-02$c$, $c$FIG-ENT-REC-03$c$, $c$FIG-ENT-REC-04$c$, $c$FIG-ENT-REC-05$c$]::text[]));
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

-- 24 ítems (24 curated), 96 alternativas, 10 misconceptions referenciadas,
-- 6 remediaciones, 7 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 24 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-ADI-REGLAMUL$c$, $c$REM-ENT-ADI-MAGNOP$c$, $c$REM-ENT-ADI-INVIERTE$c$, $c$REM-ENT-ADI-DOBLENEG$c$, $c$REM-ENT-ADI-RESTAGRUPA$c$, $c$REM-ENT-ADI-VARORDEN$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-02$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$) group by 1;
