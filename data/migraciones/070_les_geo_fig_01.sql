-- =====================================================================
-- LES-GEO-FIG-01 — Figuras, sus elementos y su perímetro
-- Generado por cargar_contenido.py desde LES-GEO-FIG-01.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 0. figures ---------------------------------------------------------
-- El código no cambia nunca; si cambió el SVG, se actualiza.
insert into figures (code, svg)
values
  ($c$FIG-FIG-CLAS-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 224 224" width="224" height="224" role="img" aria-label="Un cuadrilátero apoyado sobre uno de sus vértices, con sus cuatro lados marcados como iguales y un ángulo recto marcado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="112,48 48,112 112,176 176,112" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="84.53" y1="84.53" x2="75.47" y2="75.47" stroke-width="1.2"/>
  <line x1="84.53" y1="139.47" x2="75.47" y2="148.53" stroke-width="1.2"/>
  <line x1="139.47" y1="139.47" x2="148.53" y2="148.53" stroke-width="1.2"/>
  <line x1="139.47" y1="84.53" x2="148.53" y2="75.47" stroke-width="1.2"/>
  <polyline points="104.08,55.92 112,63.84 119.92,55.92" fill="none" stroke-width="1.1"/>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 296 216" width="296" height="216" role="img" aria-label="Un cuadrilátero con sus cuatro ángulos rectos marcados; sus lados opuestos están marcados como iguales." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="48,168 248,168 248,48 48,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polyline points="59.2,168 59.2,156.8 48,156.8" fill="none" stroke-width="1.1"/>
  <polyline points="248,156.8 236.8,156.8 236.8,168" fill="none" stroke-width="1.1"/>
  <polyline points="236.8,48 236.8,59.2 248,59.2" fill="none" stroke-width="1.1"/>
  <polyline points="48,59.2 59.2,59.2 59.2,48" fill="none" stroke-width="1.1"/>
  <line x1="148" y1="161.6" x2="148" y2="174.4" stroke-width="1.2"/>
  <line x1="148" y1="41.6" x2="148" y2="54.4" stroke-width="1.2"/>
  <line x1="241.6" y1="109.8" x2="254.4" y2="109.8" stroke-width="1.2"/>
  <line x1="241.6" y1="106.2" x2="254.4" y2="106.2" stroke-width="1.2"/>
  <line x1="41.6" y1="109.8" x2="54.4" y2="109.8" stroke-width="1.2"/>
  <line x1="41.6" y1="106.2" x2="54.4" y2="106.2" stroke-width="1.2"/>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 184" width="256" height="184" role="img" aria-label="Un triángulo con un ángulo recto marcado en su vértice superior y los dos lados que forman ese ángulo marcados como iguales." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="107.29,58.73 50.73,156.71 205.27,115.29" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polyline points="101.69,68.43 111.39,74.03 116.99,64.33" fill="none" stroke-width="1.1"/>
  <line x1="84.55" y1="110.92" x2="73.47" y2="104.52" stroke-width="1.2"/>
  <line x1="159.48" y1="81.47" x2="153.08" y2="92.55" stroke-width="1.2"/>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 571.6 177.2" width="571.6" height="177.2" role="img" aria-label="Cuatro cuadriláteros rotulados A, B, C y D." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="37.6,122.6 126,122.6 153.2,68.2 64.8,68.2" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon points="187.2,122.6 275.6,122.6 262,58 200.8,81.8" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon points="340.2,132.8 418.18,78.2 371.39,52.86 332.39,80.16" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon points="452.4,115.8 534,126 520.4,58 472.8,78.4" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="95.4" y="144.7" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="231.4" y="144.7" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="365.54" y="144.7" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="494.9" y="144.7" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 290.26 239.22" width="290.26" height="239.22" role="img" aria-label="Un triángulo con dos lados marcados como iguales y el ángulo entre ellos marcado de 120°, dibujado inclinado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="110.71,70.46 60,179.22 230.26,60" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="94.06" y1="128.89" x2="76.66" y2="120.78" stroke-width="1.2"/>
  <line x1="169.65" y1="55.67" x2="171.32" y2="74.79" stroke-width="1.2"/>
  <path d="M101.84,89.49 A21,21 0 0 0 131.63,68.63" fill="none" stroke-width="1.1"/>
  <text x="135.49" y="105.85" font-size="12" text-anchor="middle" dominant-baseline="central">120°</text>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 508.8 181.2" width="508.8" height="181.2" role="img" aria-label="Cuatro polígonos rotulados A, B, C y D; las marcas indican los lados iguales." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="119.73,66.82 89.18,36.27 47.45,47.45 36.27,89.18 66.82,119.73 108.55,108.55" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="101.4" y1="54.6" x2="107.51" y2="48.49" stroke-width="1.2"/>
  <line x1="69.44" y1="46.04" x2="67.2" y2="37.69" stroke-width="1.2"/>
  <line x1="46.04" y1="69.44" x2="37.69" y2="67.2" stroke-width="1.2"/>
  <line x1="54.6" y1="101.4" x2="48.49" y2="107.51" stroke-width="1.2"/>
  <line x1="86.56" y1="109.96" x2="88.8" y2="118.31" stroke-width="1.2"/>
  <line x1="109.96" y1="86.56" x2="118.31" y2="88.8" stroke-width="1.2"/>
  <polygon points="146.4,110.4 211.2,110.4 250.08,58.56 185.28,58.56" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="178.8" y1="104.64" x2="178.8" y2="116.16" stroke-width="1.2"/>
  <line x1="226.03" y1="81.02" x2="235.25" y2="87.94" stroke-width="1.2"/>
  <line x1="217.68" y1="64.32" x2="217.68" y2="52.8" stroke-width="1.2"/>
  <line x1="170.45" y1="87.94" x2="161.23" y2="81.02" stroke-width="1.2"/>
  <polygon points="290.4,117.6 355.2,117.6 322.8,34.8" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="301.24" y1="74.1" x2="311.96" y2="78.3" stroke-width="1.2"/>
  <line x1="333.64" y1="78.3" x2="344.36" y2="74.1" stroke-width="1.2"/>
  <polygon points="384,78 405.6,117.6 452.4,114 470.4,74.4 445.2,34.8 402,38.4" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="78" y="146.4" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="198.24" y="146.4" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="322.8" y="146.4" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="426.6" y="146.4" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
</svg>
$c$),
  ($c$FIG-FIG-CLAS-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 528 296" width="528" height="296" role="img" aria-label="Esquema: los cuadriláteros se dividen en trapezoides (ningún par de lados paralelos), trapecios (un par) y paralelogramos (dos pares). Los paralelogramos incluyen romboides, rectángulos y rombos. El cuadrado es a la vez rectángulo y rombo." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <line x1="264" y1="58" x2="88" y2="106" stroke-width="1.1"/>
  <line x1="264" y1="58" x2="208" y2="106" stroke-width="1.1"/>
  <line x1="264" y1="58" x2="380" y2="106" stroke-width="1.1"/>
  <line x1="380" y1="126" x2="272" y2="174" stroke-width="1.1"/>
  <line x1="380" y1="126" x2="380" y2="174" stroke-width="1.1"/>
  <line x1="380" y1="126" x2="472" y2="174" stroke-width="1.1"/>
  <line x1="380" y1="194" x2="424" y2="242" stroke-width="1.1"/>
  <line x1="472" y1="194" x2="424" y2="242" stroke-width="1.1"/>
  <text x="264" y="48" font-size="12" text-anchor="middle" dominant-baseline="central">Cuadriláteros</text>
  <text x="88" y="116" font-size="12" text-anchor="middle" dominant-baseline="central">Trapezoides</text>
  <text x="208" y="116" font-size="12" text-anchor="middle" dominant-baseline="central">Trapecios</text>
  <text x="380" y="116" font-size="12" text-anchor="middle" dominant-baseline="central">Paralelogramos</text>
  <text x="272" y="184" font-size="12" text-anchor="middle" dominant-baseline="central">Romboides</text>
  <text x="380" y="184" font-size="12" text-anchor="middle" dominant-baseline="central">Rectángulos</text>
  <text x="472" y="184" font-size="12" text-anchor="middle" dominant-baseline="central">Rombos</text>
  <text x="424" y="252" font-size="12" text-anchor="middle" dominant-baseline="central">Cuadrados</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 336 296" width="336" height="296" role="img" aria-label="Triángulo ABC con el lado AB inclinado. Desde C salen tres segmentos hasta el lado AB: CD, CV y CM. En D hay un ángulo recto marcado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="48,248 288,168 228,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="228" y1="48" x2="270" y2="174" stroke-width="1.2"/>
  <line x1="228" y1="48" x2="228" y2="188" stroke-width="1.2"/>
  <line x1="228" y1="48" x2="168" y2="208" stroke-width="1.2"/>
  <polyline points="267.22,165.65 275.57,162.87 278.35,171.22" fill="none" stroke-width="1.1"/>
  <text x="36.68" y="255.54" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="301.48" y="169.8" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="232.78" y="35.27" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="274.8" y="188" font-size="13" text-anchor="middle" dominant-baseline="central">D</text>
  <text x="228" y="204" font-size="13" text-anchor="middle" dominant-baseline="central">V</text>
  <text x="174" y="223.2" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 334 317.5" width="334" height="317.5" role="img" aria-label="Pentágono regular de centro O. Están dibujados el segmento OA, hasta un vértice, y el segmento OM, hasta el punto M del lado AB, con un ángulo recto en M." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="167,57 62.38,133.01 102.34,255.99 231.66,255.99 271.62,133.01" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="167" y1="167" x2="167" y2="57" stroke-width="1.2"/>
  <line x1="167" y1="167" x2="114.69" y2="95" stroke-width="1.2"/>
  <polyline points="120.51,103.01 112.5,108.83 106.68,100.82" fill="none" stroke-width="1.1"/>
  <circle cx="167" cy="167" r="2.8" fill="currentColor" stroke="none"/>
  <text x="167" y="39.4" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="45.65" y="127.57" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="104.99" y="81.66" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
  <text x="180.75" y="178" font-size="13" text-anchor="middle" dominant-baseline="central">O</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 289.26 328.47" width="289.26" height="328.47" role="img" aria-label="Triángulo ABC con un ángulo recto marcado en C, dibujado inclinado. Desde A salen los segmentos AV y AM hasta el lado BC." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="117.39,54 235.26,274.47 54,189.95" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="117.39" y1="54" x2="117.39" y2="219.51" stroke-width="1.2"/>
  <line x1="117.39" y1="54" x2="144.63" y2="232.21" stroke-width="1.2"/>
  <polyline points="59.28,178.62 70.61,183.9 65.33,195.23" fill="none" stroke-width="1.1"/>
  <text x="114.82" y="37.2" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="247.17" y="286.61" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="37.36" y="193.44" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="117.39" y="235.51" font-size="13" text-anchor="middle" dominant-baseline="central">V</text>
  <text x="147.05" y="248.02" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 342.92 294.17" width="342.92" height="294.17" role="img" aria-label="Trapecio ABCD, dibujado inclinado, con los lados AB y DC paralelos. Desde D salen los segmentos DH, DV y DM hasta el lado AB; en H hay un ángulo recto marcado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="54,235.17 288.92,149.66 200.9,54 78.74,98.46" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="78.74" y1="98.46" x2="119.78" y2="211.23" stroke-width="1.2"/>
  <line x1="78.74" y1="98.46" x2="78.74" y2="226.16" stroke-width="1.2"/>
  <line x1="78.74" y1="98.46" x2="171.46" y2="192.41" stroke-width="1.2"/>
  <polyline points="116.36,201.83 125.76,198.41 129.18,207.81" fill="none" stroke-width="1.1"/>
  <text x="41.93" y="247.14" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="305.81" y="151.61" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="209.24" y="39.19" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="63.33" y="91.28" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
  <text x="125.59" y="227.2" font-size="13" text-anchor="middle" dominant-baseline="central">H</text>
  <text x="78.74" y="243.16" font-size="13" text-anchor="middle" dominant-baseline="central">V</text>
  <text x="183.4" y="204.51" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 380 224" width="380" height="224" role="img" aria-label="Triángulo ABC con el ángulo en B mayor que un ángulo recto. El lado BC se prolonga con una línea punteada hasta H. Desde A salen los segmentos AH, AK y AM; en H hay un ángulo recto marcado." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="52,48 132,168 332,168" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="52" y1="168" x2="132" y2="168" stroke-width="1.1" stroke-dasharray="5 4"/>
  <line x1="52" y1="48" x2="52" y2="168" stroke-width="1.2"/>
  <line x1="52" y1="48" x2="232" y2="168" stroke-width="1.2"/>
  <line x1="52" y1="48" x2="188" y2="168" stroke-width="1.2"/>
  <polyline points="52,159.2 60.8,159.2 60.8,168" fill="none" stroke-width="1.1"/>
  <text x="40.68" y="40.46" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="122.38" y="177.62" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="345.19" y="171.3" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="40" y="180" font-size="13" text-anchor="middle" dominant-baseline="central">H</text>
  <text x="188" y="184" font-size="13" text-anchor="middle" dominant-baseline="central">K</text>
  <text x="232" y="184" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264 296" width="264" height="296" role="img" aria-label="Triángulo ABC con el lado BC vertical. Desde A salen el segmento AH, horizontal, con un ángulo recto marcado en H, y el segmento AM." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="48,168 208,248 208,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="48" y1="168" x2="208" y2="168" stroke-width="1.2"/>
  <line x1="48" y1="168" x2="208" y2="148" stroke-width="1.2"/>
  <polyline points="199.2,168 199.2,159.2 208,159.2" fill="none" stroke-width="1.1"/>
  <text x="34.51" y="169.69" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="214.75" y="259.81" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="214.08" y="35.84" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="222" y="168" font-size="13" text-anchor="middle" dominant-baseline="central">H</text>
  <text x="222" y="146" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 298 303" width="298" height="303" role="img" aria-label="Hexágono regular de centro O, con el segmento OA dibujado hasta el vértice A." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="149,54 62.4,104 62.4,204 149,254 235.6,204 235.6,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="149" y1="154" x2="149" y2="54" stroke-width="1.2"/>
  <circle cx="149" cy="154" r="2.8" fill="currentColor" stroke="none"/>
  <text x="149" y="38" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="164" y="166.5" font-size="13" text-anchor="middle" dominant-baseline="central">O</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-08$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 288 288" width="288" height="288" role="img" aria-label="Cuadrado dibujado inclinado, de centro O. Están dibujados OA, hasta el vértice A, y OM, hasta el punto M del lado AB, con un ángulo recto en M." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="116.55,246.45 246.45,171.45 171.45,41.55 41.55,116.55" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="144" y1="144" x2="181.5" y2="208.95" stroke-width="1.2"/>
  <line x1="144" y1="144" x2="116.55" y2="246.45" stroke-width="1.2"/>
  <polyline points="177,201.16 184.79,196.66 189.29,204.45" fill="none" stroke-width="1.1"/>
  <circle cx="144" cy="144" r="2.8" fill="currentColor" stroke="none"/>
  <text x="112.15" y="262.87" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="262.87" y="175.85" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="189" y="221.94" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
  <text x="149" y="128" font-size="13" text-anchor="middle" dominant-baseline="central">O</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-09$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 372 187.5" width="372" height="187.5" role="img" aria-label="Un triángulo con uno de sus ángulos, marcado, mayor que un ángulo recto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="51,136.5 321,136.5 109.5,55.5" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <path d="M100.28,68.27 A15.75,15.75 0 0 0 124.21,61.13" fill="none" stroke-width="1.1"/>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-10$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 458 363" width="458" height="363" role="img" aria-label="Paralelogramo ABCD con el lado AB inclinado. El lado AB se prolonga con una línea punteada hasta H. Desde D salen los segmentos DH, con un ángulo recto en H, y DM." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="204,244 404,164 254,54 54,134" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="204" y1="244" x2="112.62" y2="280.55" stroke-width="1.1" stroke-dasharray="5 4"/>
  <line x1="54" y1="134" x2="112.62" y2="280.55" stroke-width="1.2"/>
  <line x1="54" y1="134" x2="304" y2="204" stroke-width="1.2"/>
  <polyline points="108.91,271.27 118.19,267.55 121.91,276.84" fill="none" stroke-width="1.1"/>
  <text x="199.67" y="260.44" font-size="14" text-anchor="middle" dominant-baseline="central">A</text>
  <text x="420.94" y="165.45" font-size="14" text-anchor="middle" dominant-baseline="central">B</text>
  <text x="258.33" y="37.56" font-size="14" text-anchor="middle" dominant-baseline="central">C</text>
  <text x="37.06" y="132.55" font-size="14" text-anchor="middle" dominant-baseline="central">D</text>
  <text x="118.93" y="296.34" font-size="13" text-anchor="middle" dominant-baseline="central">H</text>
  <text x="320.37" y="208.58" font-size="13" text-anchor="middle" dominant-baseline="central">M</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-11$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 514.2 207.6" width="514.2" height="207.6" role="img" aria-label="Dos triángulos con su altura h trazada sobre el lado de abajo. En el primero, h cae dentro del lado. En el segundo, que tiene un ángulo obtuso, h cae fuera y el lado se prolonga con una línea punteada." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="45,154.2 213,154.2 103.8,45" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polygon points="339,154.2 473.4,154.2 263.4,53.4" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="103.8" y1="45" x2="103.8" y2="154.2" stroke-width="1.2"/>
  <polyline points="103.8,145.8 112.2,145.8 112.2,154.2" fill="none" stroke-width="1.1"/>
  <line x1="263.4" y1="154.2" x2="339" y2="154.2" stroke-width="1.1" stroke-dasharray="5 4"/>
  <line x1="263.4" y1="53.4" x2="263.4" y2="154.2" stroke-width="1.2"/>
  <polyline points="263.4,145.8 271.8,145.8 271.8,154.2" fill="none" stroke-width="1.1"/>
  <text x="126.9" y="112.2" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">h</text>
  <text x="248.7" y="112.2" font-size="14" text-anchor="middle" dominant-baseline="central" font-style="italic">h</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-12$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 328 288" width="328" height="288" role="img" aria-label="Hexágono regular. El radio va del centro a un vértice. La apotema va del centro al punto medio de un lado y es perpendicular a él; es más corta que el radio." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="274,144 219,48.74 109,48.74 54,144 109,239.26 219,239.26" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="164" y1="144" x2="274" y2="144" stroke-width="1.3"/>
  <line x1="164" y1="144" x2="246.5" y2="96.37" stroke-width="1.3"/>
  <polyline points="238.71,100.87 234.21,93.07 242,88.57" fill="none" stroke-width="1.1"/>
  <circle cx="164" cy="144" r="2.8" fill="currentColor" stroke="none"/>
  <text x="219" y="158" font-size="12" text-anchor="middle" dominant-baseline="central" font-style="italic">radio</text>
  <text x="174.25" y="114.18" font-size="12" text-anchor="middle" dominant-baseline="central" font-style="italic">apotema</text>
</svg>
$c$),
  ($c$FIG-FIG-ELEM-13$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 288 298" width="288" height="298" role="img" aria-label="Hexágono con las tres diagonales que salen de uno de sus vértices: van a todos los vértices salvo a él mismo y a sus dos vecinos." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="144,54 57.4,104 57.4,204 144,254 230.6,204 230.6,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="144" y1="54" x2="57.4" y2="204" stroke-width="1.2" stroke-dasharray="5 4"/>
  <line x1="144" y1="54" x2="144" y2="254" stroke-width="1.2" stroke-dasharray="5 4"/>
  <line x1="144" y1="54" x2="230.6" y2="204" stroke-width="1.2" stroke-dasharray="5 4"/>
  <circle cx="144" cy="54" r="2.8" fill="currentColor" stroke="none"/>
</svg>
$c$),
  ($c$FIG-PER-POL-01$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 308 298" width="308" height="298" role="img" aria-label="Hexágono con sus seis lados marcados como iguales; uno de ellos mide 7 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="154,54 67.4,104 67.4,204 154,254 240.6,204 240.6,104" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="114.7" y1="85.93" x2="106.7" y2="72.07" stroke-width="1.2"/>
  <line x1="75.4" y1="154" x2="59.4" y2="154" stroke-width="1.2"/>
  <line x1="114.7" y1="222.07" x2="106.7" y2="235.93" stroke-width="1.2"/>
  <line x1="193.3" y1="222.07" x2="201.3" y2="235.93" stroke-width="1.2"/>
  <line x1="232.6" y1="154" x2="248.6" y2="154" stroke-width="1.2"/>
  <line x1="193.3" y1="85.93" x2="201.3" y2="72.07" stroke-width="1.2"/>
  <text x="206.8" y="245.45" font-size="13" text-anchor="middle" dominant-baseline="central">7 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-02$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 380.8 294.4" width="380.8" height="294.4" role="img" aria-label="Rectángulo de lados 8 cm y 6 cm, con una diagonal de 10 cm dibujada." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="56,238.4 312,238.4 312,46.4 56,46.4" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="56" y1="238.4" x2="312" y2="46.4" stroke-width="1.2"/>
  <polyline points="67.2,238.4 67.2,227.2 56,227.2" fill="none" stroke-width="1.1"/>
  <polyline points="312,227.2 300.8,227.2 300.8,238.4" fill="none" stroke-width="1.1"/>
  <polyline points="300.8,46.4 300.8,57.6 312,57.6" fill="none" stroke-width="1.1"/>
  <polyline points="56,57.6 67.2,57.6 67.2,46.4" fill="none" stroke-width="1.1"/>
  <text x="184" y="254.4" font-size="13" text-anchor="middle" dominant-baseline="central">8 cm</text>
  <text x="336" y="142.4" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="175.36" y="130.88" font-size="13" text-anchor="middle" dominant-baseline="central">10 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-03$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 414 312" width="414" height="312" role="img" aria-label="Figura en forma de L, con todos sus ángulos rectos. Medidas rotuladas: abajo 10 cm, a la izquierda 7 cm, arriba 6 cm y el lado derecho de abajo 4 cm. Dos lados no tienen medida." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="60,258 360,258 360,138 240,138 240,48 60,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <polyline points="70.5,258 70.5,247.5 60,247.5" fill="none" stroke-width="1.1"/>
  <polyline points="360,247.5 349.5,247.5 349.5,258" fill="none" stroke-width="1.1"/>
  <polyline points="349.5,138 349.5,148.5 360,148.5" fill="none" stroke-width="1.1"/>
  <polyline points="229.5,48 229.5,58.5 240,58.5" fill="none" stroke-width="1.1"/>
  <polyline points="60,58.5 70.5,58.5 70.5,48" fill="none" stroke-width="1.1"/>
  <text x="210" y="274.5" font-size="13" text-anchor="middle" dominant-baseline="central">10 cm</text>
  <text x="36" y="153" font-size="13" text-anchor="middle" dominant-baseline="central">7 cm</text>
  <text x="150" y="31.5" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="384" y="198" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-04$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 415.2 245.2" width="415.2" height="245.2" role="img" aria-label="Dos rectángulos unidos por un lado, formando un rectángulo más grande. El de la izquierda mide 6 cm de ancho y el de la derecha 3 cm; los dos miden 4 cm de alto." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="64.8,183.8 370.8,183.8 370.8,47.8 64.8,47.8" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="268.8" y1="183.8" x2="268.8" y2="47.8" stroke-width="1.5"/>
  <text x="166.8" y="200.8" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="319.8" y="200.8" font-size="13" text-anchor="middle" dominant-baseline="central">3 cm</text>
  <text x="39.3" y="115.8" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-05$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 306 353.56" width="306" height="353.56" role="img" aria-label="Triángulo con base de 6 cm y dos lados marcados como iguales; uno de ellos mide 9 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="63,299.56 243,299.56 153,45" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="103.47" y1="170.68" x2="112.53" y2="173.88" stroke-width="1.2"/>
  <line x1="193.47" y1="173.88" x2="202.53" y2="170.68" stroke-width="1.2"/>
  <text x="153" y="316.06" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="129.21" y="179.78" font-size="13" text-anchor="middle" dominant-baseline="central">9 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-06$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 393.6 291.2" width="393.6" height="291.2" role="img" aria-label="Figura en forma de escalera, con todos sus ángulos rectos: mide 9 cm de ancho abajo y 6 cm de alto a la izquierda. Los escalones no tienen medidas." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="62.4,235.2 350.4,235.2 350.4,171.2 254.4,171.2 254.4,107.2 158.4,107.2 158.4,43.2 62.4,43.2" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="206.4" y="252.8" font-size="13" text-anchor="middle" dominant-baseline="central">9 cm</text>
  <text x="36.8" y="139.2" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-07$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 394.8 306.4" width="394.8" height="306.4" role="img" aria-label="Rombo con sus cuatro lados marcados como iguales; un lado mide 5 cm. Sus diagonales, punteadas, miden 8 cm y 6 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="58,153.2 194,255.2 330,153.2 194,51.2" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="58" y1="153.2" x2="330" y2="153.2" stroke-width="1.1" stroke-dasharray="5 4"/>
  <line x1="194" y1="255.2" x2="194" y2="51.2" stroke-width="1.1" stroke-dasharray="5 4"/>
  <line x1="129.26" y1="199.85" x2="122.74" y2="208.55" stroke-width="1.2"/>
  <line x1="258.74" y1="199.85" x2="265.26" y2="208.55" stroke-width="1.2"/>
  <line x1="258.74" y1="106.55" x2="265.26" y2="97.85" stroke-width="1.2"/>
  <line x1="129.26" y1="106.55" x2="122.74" y2="97.85" stroke-width="1.2"/>
  <text x="250.78" y="117.16" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
  <text x="126" y="141.3" font-size="13" text-anchor="middle" dominant-baseline="central">8 cm</text>
  <text x="219.5" y="204.2" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-08$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 337 291.1" width="337" height="291.1" role="img" aria-label="Triángulo de lados 13 cm, 14 cm y 15 cm, con la altura sobre el lado de 14 cm dibujada punteada; la altura mide 12 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="134.5,41 49.5,245 287.5,245" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="134.5" y1="41" x2="134.5" y2="245" stroke-width="1.2" stroke-dasharray="5 4"/>
  <polyline points="134.5,231.4 148.1,231.4 148.1,245" fill="none" stroke-width="1.1"/>
  <text x="168.5" y="260.3" font-size="13" text-anchor="middle" dominant-baseline="central">14 cm</text>
  <text x="110.83" y="150.85" font-size="13" text-anchor="middle" dominant-baseline="central">13 cm</text>
  <text x="194.68" y="155.24" font-size="13" text-anchor="middle" dominant-baseline="central">15 cm</text>
  <text x="112.4" y="190.6" font-size="13" text-anchor="middle" dominant-baseline="central">12 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-09$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 388 275.8" width="388" height="275.8" role="img" aria-label="Dos cuadrados unidos por un lado: uno de lado 5 cm y otro de lado 3 cm, apoyados en la misma línea." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="64.8,217.8 336.8,217.8 336.8,115.8 234.8,115.8 234.8,47.8 64.8,47.8" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="234.8" y1="217.8" x2="234.8" y2="115.8" stroke-width="1.5"/>
  <line x1="149.8" y1="212.36" x2="149.8" y2="223.24" stroke-width="1.2"/>
  <line x1="149.8" y1="42.36" x2="149.8" y2="53.24" stroke-width="1.2"/>
  <line x1="59.36" y1="132.8" x2="70.24" y2="132.8" stroke-width="1.2"/>
  <line x1="284.27" y1="212.36" x2="284.27" y2="223.24" stroke-width="1.2"/>
  <line x1="287.33" y1="212.36" x2="287.33" y2="223.24" stroke-width="1.2"/>
  <line x1="331.36" y1="168.33" x2="342.24" y2="168.33" stroke-width="1.2"/>
  <line x1="331.36" y1="165.27" x2="342.24" y2="165.27" stroke-width="1.2"/>
  <line x1="284.27" y1="110.36" x2="284.27" y2="121.24" stroke-width="1.2"/>
  <line x1="287.33" y1="110.36" x2="287.33" y2="121.24" stroke-width="1.2"/>
  <text x="39.3" y="132.8" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
  <text x="362.3" y="166.8" font-size="13" text-anchor="middle" dominant-baseline="central">3 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-10$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 477 240" width="477" height="240" role="img" aria-label="Trapecio con bases de 12 cm y 6 cm y sus dos lados no paralelos marcados como iguales; uno mide 5 cm. Su altura, punteada, mide 4 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="63,180 423,180 333,60 153,60" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="153" y1="60" x2="153" y2="180" stroke-width="1.2" stroke-dasharray="5 4"/>
  <polyline points="153,168 165,168 165,180" fill="none" stroke-width="1.1"/>
  <line x1="374.16" y1="122.88" x2="381.84" y2="117.12" stroke-width="1.2"/>
  <line x1="111.84" y1="122.88" x2="104.16" y2="117.12" stroke-width="1.2"/>
  <text x="243" y="198" font-size="13" text-anchor="middle" dominant-baseline="central">12 cm</text>
  <text x="243" y="43.5" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="91.2" y="107.4" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
  <text x="177" y="123" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-11$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 279.8 264.6" width="279.8" height="264.6" role="img" aria-label="Cuadrilátero con sus cuatro lados marcados como iguales y un ángulo recto; un lado mide 9 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="73.4,198.8 225.4,198.8 225.4,46.8 73.4,46.8" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="149.4" y1="192.72" x2="149.4" y2="204.88" stroke-width="1.2"/>
  <line x1="219.32" y1="122.8" x2="231.48" y2="122.8" stroke-width="1.2"/>
  <line x1="149.4" y1="52.88" x2="149.4" y2="40.72" stroke-width="1.2"/>
  <line x1="79.48" y1="122.8" x2="67.32" y2="122.8" stroke-width="1.2"/>
  <polyline points="84.8,198.8 84.8,187.4 73.4,187.4" fill="none" stroke-width="1.1"/>
  <text x="149.4" y="217.8" font-size="13" text-anchor="middle" dominant-baseline="central">9 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-12$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 422.4 308" width="422.4" height="308" role="img" aria-label="Figura en forma de U, con todos sus ángulos rectos. Medidas rotuladas: abajo 12 cm, a la izquierda 8 cm, los dos tramos de arriba 4 cm cada uno y la profundidad de la muesca 5 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="60.4,255.4 372.4,255.4 372.4,47.4 268.4,47.4 268.4,177.4 164.4,177.4 164.4,47.4 60.4,47.4" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="216.4" y="273.6" font-size="13" text-anchor="middle" dominant-baseline="central">12 cm</text>
  <text x="35.7" y="151.4" font-size="13" text-anchor="middle" dominant-baseline="central">8 cm</text>
  <text x="112.4" y="31.8" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
  <text x="320.4" y="31.8" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
  <text x="143.6" y="112.4" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-13$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 271.6 354.8" width="271.6" height="354.8" role="img" aria-label="Figura con forma de casa: un cuadrado de lado 6 cm con un techo triangular encima, de lados iguales de 5 cm. El borde entre el cuadrado y el techo está dibujado, y la altura del techo, punteada, mide 4 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="60.4,302.2 216.4,302.2 216.4,146.2 138.4,42.2 60.4,146.2" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <line x1="60.4" y1="146.2" x2="216.4" y2="146.2" stroke-width="1.5"/>
  <line x1="138.4" y1="42.2" x2="138.4" y2="146.2" stroke-width="1.2" stroke-dasharray="5 4"/>
  <line x1="138.4" y1="298.04" x2="138.4" y2="306.36" stroke-width="1.2"/>
  <line x1="212.24" y1="224.2" x2="220.56" y2="224.2" stroke-width="1.2"/>
  <line x1="64.56" y1="224.2" x2="56.24" y2="224.2" stroke-width="1.2"/>
  <line x1="174.77" y1="97.63" x2="181.43" y2="92.64" stroke-width="1.2"/>
  <line x1="173.37" y1="95.76" x2="180.03" y2="90.77" stroke-width="1.2"/>
  <line x1="103.43" y1="95.76" x2="96.77" y2="90.77" stroke-width="1.2"/>
  <line x1="102.03" y1="97.63" x2="95.37" y2="92.64" stroke-width="1.2"/>
  <text x="138.4" y="317.8" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="84.84" y="83.28" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
  <text x="161.8" y="99.4" font-size="13" text-anchor="middle" dominant-baseline="central">4 cm</text>
</svg>
$c$),
  ($c$FIG-PER-POL-14$c$, $c$<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 432 282" width="432" height="282" role="img" aria-label="Figura en L de 8 cm de ancho y 6 cm de alto, con una muesca. Los dos lados sin medida se deducen: el tramo horizontal de arriba a la derecha mide 8 − 5 = 3 cm y el vertical, 6 − 3 = 3 cm. Perímetro: 28 cm." fill="currentColor" font-family="Manrope, Verdana, sans-serif" stroke="currentColor" stroke-linecap="round">
  <polygon points="63,228 303,228 303,138 213,138 213,48 63,48" fill="none" stroke-width="1.5" stroke-linejoin="round"/>
  <text x="183" y="243" font-size="13" text-anchor="middle" dominant-baseline="central">8 cm</text>
  <text x="40.5" y="138" font-size="13" text-anchor="middle" dominant-baseline="central">6 cm</text>
  <text x="138" y="33" font-size="13" text-anchor="middle" dominant-baseline="central">5 cm</text>
  <text x="325.5" y="183" font-size="13" text-anchor="middle" dominant-baseline="central">3 cm</text>
  <text x="276" y="121.5" font-size="12" text-anchor="middle" dominant-baseline="central" font-style="italic">8 − 5 = 3</text>
  <text x="276" y="90" font-size="12" text-anchor="middle" dominant-baseline="central" font-style="italic">6 − 3 = 3</text>
</svg>
$c$)
on conflict (code) do update
  set svg = excluded.svg, updated_at = now()
  where figures.svg is distinct from excluded.svg;

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-FIG-001$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-002$c$, $c$¿Cuál de las siguientes afirmaciones sobre la figura es correcta?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-CLAS-01$c$::text),
  ($c$M1-FIG-003$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-004$c$, $c$¿Qué nombres le corresponden a la figura?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-CLAS-02$c$::text),
  ($c$M1-FIG-005$c$, $c$¿Cuál de las siguientes figuras es un polígono regular?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-006$c$, $c$Un cuadrilátero tiene exactamente un par de lados paralelos. ¿Cómo se llama?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-007$c$, $c$¿Cómo se clasifica el triángulo de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-CLAS-03$c$::text),
  ($c$M1-FIG-008$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-009$c$, $c$Considera las siguientes afirmaciones:

I. Todo rectángulo es un paralelogramo.

II. Un triángulo rectángulo puede ser isósceles.

III. Un trapecio tiene dos pares de lados paralelos.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-010$c$, $c$¿Cuál de los cuadriláteros de la figura es un trapecio?$c$, 2, $c$propio$c$::text, $c$FIG-FIG-CLAS-04$c$::text),
  ($c$M1-FIG-011$c$, $c$Un paralelogramo tiene sus cuatro lados iguales y uno de sus ángulos mide $60°$. ¿Cuál es su nombre más preciso?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-012$c$, $c$Una baldosa tiene cuatro lados de $20$ cm y cuatro ángulos rectos, pero está colocada «en diagonal», apoyada sobre una esquina. ¿Qué figura es?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-013$c$, $c$¿Cómo se clasifica el triángulo de la figura?$c$, 2, $c$propio$c$::text, $c$FIG-FIG-CLAS-05$c$::text),
  ($c$M1-FIG-014$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-015$c$, $c$¿Qué tienen en común un rombo y un rectángulo?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-016$c$, $c$Considera las siguientes afirmaciones:

I. Un cuadrado girado sigue siendo un cuadrado.

II. Todo paralelogramo es un trapecio.

III. Un triángulo equilátero es acutángulo.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-017$c$, $c$Considera las siguientes afirmaciones:

I. Si un cuadrilátero tiene sus cuatro lados iguales, es un polígono regular.

II. Un trapecio puede tener un ángulo recto.

III. El cuadrado es a la vez rombo y rectángulo.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-018$c$, $c$¿Cuál de los polígonos de la figura es regular?$c$, 3, $c$propio$c$::text, $c$FIG-FIG-CLAS-06$c$::text),
  ($c$M1-FIG-019$c$, $c$Un carpintero corta una tabla con forma de cuadrilátero: sus lados opuestos son paralelos, sus cuatro ángulos son rectos, dos lados miden $80$ cm y los otros dos $50$ cm. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-020$c$, $c$¿Cuál de las siguientes figuras **no** es un paralelogramo?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-021$c$, $c$Considera las siguientes afirmaciones:

I. Un rombo puede ser un rectángulo.

II. Un polígono con todos sus lados iguales siempre es regular.

III. Un paralelogramo tiene un solo par de lados paralelos.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-022$c$, $c$Un cuadrilátero tiene sus cuatro ángulos rectos. ¿Qué se puede asegurar?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-023$c$, $c$Una plaza tiene forma de cuadrilátero con dos lados paralelos de $40$ m y $60$ m, y los otros dos lados de $25$ m cada uno. ¿Qué figura es?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-024$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-025$c$, $c$¿Cuál de los segmentos es la altura del triángulo trazada desde $C$ sobre el lado $AB$?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-ELEM-01$c$::text),
  ($c$M1-FIG-026$c$, $c$¿Cuál de las siguientes afirmaciones sobre la altura de un triángulo es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-027$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-028$c$, $c$¿Cuántas diagonales tiene un hexágono?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-029$c$, $c$En el pentágono regular de centro $O$, ¿cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-ELEM-02$c$::text),
  ($c$M1-FIG-030$c$, $c$¿Cuántas diagonales tiene un rectángulo y qué une cada una?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-031$c$, $c$En el triángulo de la figura, ¿cuál segmento es la altura trazada desde $A$ sobre el lado $BC$?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-ELEM-03$c$::text),
  ($c$M1-FIG-032$c$, $c$En el trapecio $ABCD$, ¿cuál segmento es una altura?$c$, 1, $c$propio$c$::text, $c$FIG-FIG-ELEM-04$c$::text),
  ($c$M1-FIG-033$c$, $c$¿Cuál de los segmentos es la altura del triángulo $ABC$ trazada desde $A$?$c$, 2, $c$propio$c$::text, $c$FIG-FIG-ELEM-05$c$::text),
  ($c$M1-FIG-034$c$, $c$Considera las siguientes afirmaciones:

I. En un triángulo rectángulo, cada cateto es la altura correspondiente al otro cateto.

II. La altura de un triángulo siempre corta al lado opuesto en su punto medio.

III. Una diagonal de un polígono puede unir dos vértices consecutivos.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-035$c$, $c$¿Cuántas diagonales tiene un decágono?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-036$c$, $c$Un parque tiene forma de heptágono y en cada vértice hay un farol. Se quiere trazar un sendero recto entre cada par de faroles que no estén en vértices consecutivos. ¿Cuántos senderos se trazan?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-037$c$, $c$¿Cuántas diagonales se pueden trazar desde un vértice de un octágono?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-038$c$, $c$En el triángulo de la figura, ¿cuál es la altura trazada desde $A$ sobre el lado $BC$?$c$, 2, $c$propio$c$::text, $c$FIG-FIG-ELEM-06$c$::text),
  ($c$M1-FIG-039$c$, $c$Considera las siguientes afirmaciones:

I. Un triángulo no tiene diagonales.

II. La apotema de un polígono regular es más corta que su radio.

III. Un cuadrilátero tiene $4$ diagonales.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-040$c$, $c$Considerando el hexágono regular de centro $O$ de la figura, ¿cuál de las siguientes afirmaciones es correcta?$c$, 2, $c$propio$c$::text, $c$FIG-FIG-ELEM-07$c$::text),
  ($c$M1-FIG-041$c$, $c$¿Cuántas diagonales tiene en total un polígono de $n$ lados?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-042$c$, $c$¿Cuántas de las tres alturas del triángulo de la figura quedan fuera del triángulo?$c$, 3, $c$propio$c$::text, $c$FIG-FIG-ELEM-09$c$::text),
  ($c$M1-FIG-043$c$, $c$Considera las siguientes afirmaciones sobre las alturas de un triángulo:

I. En un triángulo obtusángulo, dos de sus alturas quedan fuera del triángulo.

II. La altura sobre un lado es perpendicular a ese lado o a su prolongación.

III. En un triángulo isósceles, la altura sobre cualquiera de sus lados pasa por el punto medio de ese lado.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-044$c$, $c$En el cuadrado de centro $O$ de la figura, ¿cuál de las siguientes afirmaciones es correcta?$c$, 3, $c$propio$c$::text, $c$FIG-FIG-ELEM-08$c$::text),
  ($c$M1-FIG-045$c$, $c$Una arquitecta dibuja un terreno triangular $ABC$ con el lado $AB$ inclinado en el papel. Para calcular después su superficie necesita la altura desde $C$ sobre $AB$. ¿Qué debe trazar?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-046$c$, $c$¿Cuántas diagonales más tiene un octágono que un hexágono?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-047$c$, $c$¿Cuál de las siguientes afirmaciones sobre las alturas de un triángulo rectángulo es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-048$c$, $c$En el paralelogramo $ABCD$ de la figura, ¿cuál segmento es una altura correspondiente al lado $AB$?$c$, 3, $c$propio$c$::text, $c$FIG-FIG-ELEM-10$c$::text),
  ($c$M1-FIG-049$c$, $c$¿Cuál es el perímetro del hexágono de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-01$c$::text),
  ($c$M1-FIG-050$c$, $c$¿Cuál es el perímetro del rectángulo de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-02$c$::text),
  ($c$M1-FIG-051$c$, $c$El perímetro de un rectángulo es $30$ cm y su largo mide $9$ cm. ¿Cuánto mide su ancho?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-052$c$, $c$¿Cuál es el perímetro de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-03$c$::text),
  ($c$M1-FIG-053$c$, $c$¿Cuál es el perímetro de la figura formada por los dos rectángulos?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-04$c$::text),
  ($c$M1-FIG-054$c$, $c$Se quiere cercar una plaza cuadrada de $25$ m de lado. ¿Cuántos metros de reja se necesitan?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-FIG-055$c$, $c$¿Cuál es el perímetro del triángulo de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-05$c$::text),
  ($c$M1-FIG-056$c$, $c$¿Cuál es el perímetro de la figura?$c$, 1, $c$propio$c$::text, $c$FIG-PER-POL-06$c$::text),
  ($c$M1-FIG-057$c$, $c$¿Cuál es el perímetro del rombo de la figura?$c$, 2, $c$propio$c$::text, $c$FIG-PER-POL-07$c$::text),
  ($c$M1-FIG-058$c$, $c$¿Cuál es el perímetro del triángulo de la figura?$c$, 2, $c$propio$c$::text, $c$FIG-PER-POL-08$c$::text),
  ($c$M1-FIG-059$c$, $c$Una mesa tiene forma de pentágono regular y cada uno de sus lados mide $12$ cm. Se quiere poner una cinta en todo su borde. ¿Cuánta cinta se necesita?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-060$c$, $c$¿Cuál es el perímetro de la figura formada por los dos cuadrados?$c$, 2, $c$propio$c$::text, $c$FIG-PER-POL-09$c$::text),
  ($c$M1-FIG-061$c$, $c$Considera las siguientes afirmaciones:

I. El perímetro de un cuadrado de lado $5$ cm es $20$ cm.

II. El perímetro de un rectángulo de $6$ cm por $4$ cm es $10$ cm.

III. Al unir dos figuras por un lado, el perímetro de la figura nueva es la suma de sus dos perímetros.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-062$c$, $c$¿Cuál es el perímetro del trapecio de la figura?$c$, 2, $c$propio$c$::text, $c$FIG-PER-POL-10$c$::text),
  ($c$M1-FIG-063$c$, $c$Un triángulo equilátero tiene $24$ cm de perímetro. ¿Cuánto mide cada uno de sus lados?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-FIG-064$c$, $c$¿Cuál es el perímetro de la figura?$c$, 2, $c$propio$c$::text, $c$FIG-PER-POL-11$c$::text),
  ($c$M1-FIG-065$c$, $c$¿Cuál es el perímetro de la figura?$c$, 3, $c$propio$c$::text, $c$FIG-PER-POL-12$c$::text),
  ($c$M1-FIG-066$c$, $c$Considera las siguientes afirmaciones:

I. Dos rectángulos con el mismo perímetro pueden tener distinta área.

II. El perímetro de un triángulo incluye su altura.

III. El perímetro de un rectángulo es la suma de su largo y su ancho.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-067$c$, $c$El perímetro del triángulo $ABC$ es $30$ cm. El lado $AB$ mide $12$ cm y los otros dos lados son iguales. ¿Cuánto mide cada uno de esos lados?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-068$c$, $c$¿Cuál es el perímetro de la figura con forma de casa?$c$, 3, $c$propio$c$::text, $c$FIG-PER-POL-13$c$::text),
  ($c$M1-FIG-069$c$, $c$Se ponen en fila $4$ cuadrados de $3$ cm de lado, pegados por sus lados. ¿Cuál es el perímetro de la figura que se forma?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-070$c$, $c$Considera las siguientes afirmaciones:

I. Una figura en forma de escalera, con escalones que siempre suben, tiene el mismo perímetro que el rectángulo que la contiene.

II. El perímetro de un rombo de lado $4$ cm es $16$ cm.

III. Si un rectángulo tiene un área de $24$ cm², su perímetro es $24$ cm.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-071$c$, $c$Una piscina rectangular de $25$ m por $10$ m está rodeada por un borde de baldosas de $1$ m de ancho. ¿Cuál es el perímetro exterior del borde?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-FIG-072$c$, $c$Un cuadrado de papel de $12$ cm de lado se corta por la mitad y se obtienen dos rectángulos iguales. ¿Cuál es el perímetro de cada rectángulo?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-FIG-001$c$, $c$A$c$, $c$Todo cuadrado es un rectángulo.$c$, true, null),
  ($c$M1-FIG-001$c$, $c$B$c$, $c$Un cuadrado no puede ser un rectángulo, porque sus lados son iguales.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-001$c$, $c$C$c$, $c$Todo rombo es un polígono regular.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-001$c$, $c$D$c$, $c$Un trapecio tiene dos pares de lados paralelos.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-002$c$, $c$A$c$, $c$Es un trapecio, porque tiene un par de lados paralelos.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-002$c$, $c$B$c$, $c$Es un rombo, pero no un cuadrado, porque está girado.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-002$c$, $c$C$c$, $c$Es un cuadrado, así que no puede ser un rombo.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-002$c$, $c$D$c$, $c$Es un cuadrado y también un rombo.$c$, true, null),
  ($c$M1-FIG-003$c$, $c$A$c$, $c$Un triángulo isósceles no puede tener sus tres lados iguales.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-003$c$, $c$B$c$, $c$Un triángulo equilátero también es isósceles.$c$, true, null),
  ($c$M1-FIG-003$c$, $c$C$c$, $c$Un triángulo escaleno tiene dos lados iguales.$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-003$c$, $c$D$c$, $c$Un triángulo rectángulo no puede ser isósceles.$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-004$c$, $c$A$c$, $c$Rectángulo, pero no paralelogramo.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-004$c$, $c$B$c$, $c$Rectángulo y polígono regular.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-004$c$, $c$C$c$, $c$Rectángulo y paralelogramo.$c$, true, null),
  ($c$M1-FIG-004$c$, $c$D$c$, $c$Rectángulo y trapecio.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-005$c$, $c$A$c$, $c$Un rombo que no es cuadrado.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-005$c$, $c$B$c$, $c$Un triángulo isósceles que no es equilátero.$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-005$c$, $c$C$c$, $c$Un cuadrado, pero solo si está apoyado sobre un lado.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-005$c$, $c$D$c$, $c$Un triángulo equilátero.$c$, true, null),
  ($c$M1-FIG-006$c$, $c$A$c$, $c$Romboide$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-006$c$, $c$B$c$, $c$Trapezoide$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-006$c$, $c$C$c$, $c$Trapecio$c$, true, null),
  ($c$M1-FIG-006$c$, $c$D$c$, $c$Depende de si los lados paralelos están horizontales.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-007$c$, $c$A$c$, $c$Es rectángulo e isósceles.$c$, true, null),
  ($c$M1-FIG-007$c$, $c$B$c$, $c$Es solo rectángulo: no puede ser isósceles también.$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-007$c$, $c$C$c$, $c$Es rectángulo y escaleno.$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-007$c$, $c$D$c$, $c$Es isósceles, pero no rectángulo, porque el ángulo recto no está abajo.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-008$c$, $c$A$c$, $c$Todo rombo tiene sus cuatro ángulos iguales, porque sus lados son iguales.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-008$c$, $c$B$c$, $c$Todo cuadrado es un rombo.$c$, true, null),
  ($c$M1-FIG-008$c$, $c$C$c$, $c$Un rombo y un cuadrado nunca son la misma figura.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-008$c$, $c$D$c$, $c$Un rombo tiene un solo par de lados paralelos.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-009$c$, $c$A$c$, $c$Solo II$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-009$c$, $c$B$c$, $c$Solo I$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-009$c$, $c$C$c$, $c$I, II y III$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-009$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-FIG-010$c$, $c$A$c$, $c$El cuadrilátero C$c$, true, null),
  ($c$M1-FIG-010$c$, $c$B$c$, $c$El cuadrilátero D$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-010$c$, $c$C$c$, $c$El cuadrilátero A$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-010$c$, $c$D$c$, $c$El cuadrilátero B$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-011$c$, $c$A$c$, $c$Cuadrado, porque sus lados son iguales$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-011$c$, $c$B$c$, $c$Paralelogramo, y por eso no puede ser rombo$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-011$c$, $c$C$c$, $c$Rombo$c$, true, null),
  ($c$M1-FIG-011$c$, $c$D$c$, $c$Romboide$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-012$c$, $c$A$c$, $c$Un romboide$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-012$c$, $c$B$c$, $c$Un cuadrado$c$, true, null),
  ($c$M1-FIG-012$c$, $c$C$c$, $c$Un cuadrado, pero no un rectángulo$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-012$c$, $c$D$c$, $c$Un rombo que no es cuadrado$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-013$c$, $c$A$c$, $c$Es escaleno, porque no está apoyado sobre su lado desigual.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-013$c$, $c$B$c$, $c$Es isósceles y obtusángulo.$c$, true, null),
  ($c$M1-FIG-013$c$, $c$C$c$, $c$Es isósceles y acutángulo.$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-013$c$, $c$D$c$, $c$Es obtusángulo, y por eso no puede ser isósceles.$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-014$c$, $c$A$c$, $c$Un rectángulo es un trapecio, porque tiene lados paralelos.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-014$c$, $c$B$c$, $c$Un rectángulo nunca puede ser un cuadrado.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-014$c$, $c$C$c$, $c$Un rectángulo que tiene sus cuatro lados iguales es un cuadrado.$c$, true, null),
  ($c$M1-FIG-014$c$, $c$D$c$, $c$Todo rectángulo es un polígono regular, porque sus ángulos son iguales.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-015$c$, $c$A$c$, $c$Los dos son paralelogramos.$c$, true, null),
  ($c$M1-FIG-015$c$, $c$B$c$, $c$Los dos son polígonos regulares.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-015$c$, $c$C$c$, $c$Nada: como tienen nombre propio, ninguno es paralelogramo.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-015$c$, $c$D$c$, $c$Los dos tienen un solo par de lados paralelos.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-016$c$, $c$A$c$, $c$Solo III$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-016$c$, $c$B$c$, $c$Solo I$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-016$c$, $c$C$c$, $c$I, II y III$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-016$c$, $c$D$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-FIG-017$c$, $c$A$c$, $c$I, II y III$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-017$c$, $c$B$c$, $c$Solo III$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-017$c$, $c$C$c$, $c$Solo II$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-017$c$, $c$D$c$, $c$Solo II y III$c$, true, null),
  ($c$M1-FIG-018$c$, $c$A$c$, $c$El polígono C$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-018$c$, $c$B$c$, $c$El polígono A$c$, true, null),
  ($c$M1-FIG-018$c$, $c$C$c$, $c$El polígono D$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-018$c$, $c$D$c$, $c$El polígono B$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-019$c$, $c$A$c$, $c$Es un rectángulo y no es un polígono regular.$c$, true, null),
  ($c$M1-FIG-019$c$, $c$B$c$, $c$Es un trapecio y no es un polígono regular.$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-019$c$, $c$C$c$, $c$Es un rectángulo, así que no es un paralelogramo.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-019$c$, $c$D$c$, $c$Es un rectángulo y es un polígono regular, porque sus ángulos son iguales.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-020$c$, $c$A$c$, $c$Un rombo apoyado sobre un vértice$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-020$c$, $c$B$c$, $c$Un cuadrado$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-020$c$, $c$C$c$, $c$Un trapecio$c$, true, null),
  ($c$M1-FIG-020$c$, $c$D$c$, $c$Un romboide$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-021$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-021$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-FIG-021$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-021$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-022$c$, $c$A$c$, $c$Es un rectángulo, y podría ser un cuadrado.$c$, true, null),
  ($c$M1-FIG-022$c$, $c$B$c$, $c$Es un rectángulo solo si está apoyado sobre uno de sus lados.$c$, false, $c$FIG-CLAS-ORIENTA$c$),
  ($c$M1-FIG-022$c$, $c$C$c$, $c$Es un polígono regular.$c$, false, $c$FIG-CLAS-REGULAR$c$),
  ($c$M1-FIG-022$c$, $c$D$c$, $c$Es un rectángulo, así que no puede ser un cuadrado.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-023$c$, $c$A$c$, $c$Un trapecio, pero no isósceles: isósceles es solo para triángulos$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-023$c$, $c$B$c$, $c$Un paralelogramo$c$, false, $c$FIG-CLAS-PARALELOS$c$),
  ($c$M1-FIG-023$c$, $c$C$c$, $c$Un trapezoide isósceles$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-023$c$, $c$D$c$, $c$Un trapecio isósceles$c$, true, null),
  ($c$M1-FIG-024$c$, $c$A$c$, $c$Todo triángulo isósceles es regular.$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-024$c$, $c$B$c$, $c$Un triángulo equilátero no es isósceles.$c$, false, $c$FIG-CLAS-EXCLUYE$c$),
  ($c$M1-FIG-024$c$, $c$C$c$, $c$Un triángulo equilátero es regular, y un triángulo isósceles no siempre lo es.$c$, true, null),
  ($c$M1-FIG-024$c$, $c$D$c$, $c$Un triángulo equilátero no puede ser acutángulo.$c$, false, $c$FIG-CLAS-CRITERIOS$c$),
  ($c$M1-FIG-025$c$, $c$A$c$, $c$$CV$$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-025$c$, $c$B$c$, $c$$CB$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-025$c$, $c$C$c$, $c$$CD$$c$, true, null),
  ($c$M1-FIG-025$c$, $c$D$c$, $c$$CM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-026$c$, $c$A$c$, $c$Es perpendicular al lado sobre el que se traza, o a su prolongación.$c$, true, null),
  ($c$M1-FIG-026$c$, $c$B$c$, $c$Siempre es un segmento vertical.$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-026$c$, $c$C$c$, $c$Siempre queda dentro del triángulo.$c$, false, $c$FIG-ELEM-ALTDENTRO$c$),
  ($c$M1-FIG-026$c$, $c$D$c$, $c$Siempre llega al punto medio del lado opuesto.$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-027$c$, $c$A$c$, $c$La altura de un triángulo va de un vértice al punto medio del lado opuesto.$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-027$c$, $c$B$c$, $c$Una diagonal une dos vértices cualesquiera, aunque sean consecutivos.$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-027$c$, $c$C$c$, $c$La apotema de un polígono regular va del centro a un vértice.$c$, false, $c$FIG-ELEM-APORADIO$c$),
  ($c$M1-FIG-027$c$, $c$D$c$, $c$La apotema de un polígono regular va del centro al punto medio de un lado.$c$, true, null),
  ($c$M1-FIG-028$c$, $c$A$c$, $c$$18$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-028$c$, $c$B$c$, $c$$9$$c$, true, null),
  ($c$M1-FIG-028$c$, $c$C$c$, $c$$15$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-028$c$, $c$D$c$, $c$$3$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-029$c$, $c$A$c$, $c$$AB$ es una diagonal.$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-029$c$, $c$B$c$, $c$$OA$ es una apotema.$c$, false, $c$FIG-ELEM-APORADIO$c$),
  ($c$M1-FIG-029$c$, $c$C$c$, $c$El pentágono tiene $2$ diagonales en total.$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-029$c$, $c$D$c$, $c$$OM$ es una apotema y $OA$ es un radio.$c$, true, null),
  ($c$M1-FIG-030$c$, $c$A$c$, $c$$1$; une dos vértices opuestos.$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-030$c$, $c$B$c$, $c$$2$; cada una une dos vértices opuestos.$c$, true, null),
  ($c$M1-FIG-030$c$, $c$C$c$, $c$$6$; cada una une dos vértices cualesquiera.$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-030$c$, $c$D$c$, $c$$4$; cada una une dos vértices opuestos.$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-031$c$, $c$A$c$, $c$$AC$$c$, true, null),
  ($c$M1-FIG-031$c$, $c$B$c$, $c$$AV$$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-031$c$, $c$C$c$, $c$$AM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-031$c$, $c$D$c$, $c$Ninguno de los segmentos dibujados, porque $AC$ es un lado.$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-032$c$, $c$A$c$, $c$$DV$$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-032$c$, $c$B$c$, $c$$DM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-032$c$, $c$C$c$, $c$$DH$$c$, true, null),
  ($c$M1-FIG-032$c$, $c$D$c$, $c$$DA$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-033$c$, $c$A$c$, $c$$AM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-033$c$, $c$B$c$, $c$$AK$$c$, false, $c$FIG-ELEM-ALTDENTRO$c$),
  ($c$M1-FIG-033$c$, $c$C$c$, $c$$AB$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-033$c$, $c$D$c$, $c$$AH$$c$, true, null),
  ($c$M1-FIG-034$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-034$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-FIG-034$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-034$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-035$c$, $c$A$c$, $c$$45$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-035$c$, $c$B$c$, $c$$7$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-035$c$, $c$C$c$, $c$$35$$c$, true, null),
  ($c$M1-FIG-035$c$, $c$D$c$, $c$$70$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-036$c$, $c$A$c$, $c$$14$$c$, true, null),
  ($c$M1-FIG-036$c$, $c$B$c$, $c$$28$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-036$c$, $c$C$c$, $c$$21$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-036$c$, $c$D$c$, $c$$4$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-037$c$, $c$A$c$, $c$$40$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-037$c$, $c$B$c$, $c$$20$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-037$c$, $c$C$c$, $c$$7$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-037$c$, $c$D$c$, $c$$5$$c$, true, null),
  ($c$M1-FIG-038$c$, $c$A$c$, $c$$AH$$c$, true, null),
  ($c$M1-FIG-038$c$, $c$B$c$, $c$$AB$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-038$c$, $c$C$c$, $c$No se puede trazar, porque $BC$ es vertical.$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-038$c$, $c$D$c$, $c$$AM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-039$c$, $c$A$c$, $c$I, II y III$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-039$c$, $c$B$c$, $c$Solo I$c$, false, $c$FIG-ELEM-APORADIO$c$),
  ($c$M1-FIG-039$c$, $c$C$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-FIG-039$c$, $c$D$c$, $c$Solo II$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-040$c$, $c$A$c$, $c$El hexágono tiene $15$ diagonales.$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-040$c$, $c$B$c$, $c$El hexágono tiene $9$ diagonales.$c$, true, null),
  ($c$M1-FIG-040$c$, $c$C$c$, $c$Desde $A$ salen $3$ diagonales, que son todas las del hexágono.$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-040$c$, $c$D$c$, $c$$OA$ es una apotema.$c$, false, $c$FIG-ELEM-APORADIO$c$),
  ($c$M1-FIG-041$c$, $c$A$c$, $c$$n(n - 3)$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-041$c$, $c$B$c$, $c$$\dfrac{n(n - 3)}{2}$$c$, true, null),
  ($c$M1-FIG-041$c$, $c$C$c$, $c$$n - 3$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-041$c$, $c$D$c$, $c$$\dfrac{n(n - 1)}{2}$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-042$c$, $c$A$c$, $c$$3$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-042$c$, $c$B$c$, $c$$0$$c$, false, $c$FIG-ELEM-ALTDENTRO$c$),
  ($c$M1-FIG-042$c$, $c$C$c$, $c$$2$$c$, true, null),
  ($c$M1-FIG-042$c$, $c$D$c$, $c$$1$$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-043$c$, $c$A$c$, $c$Solo II$c$, false, $c$FIG-ELEM-ALTDENTRO$c$),
  ($c$M1-FIG-043$c$, $c$B$c$, $c$I, II y III$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-043$c$, $c$C$c$, $c$Solo I$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-043$c$, $c$D$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-FIG-044$c$, $c$A$c$, $c$$OM$ es la apotema del cuadrado.$c$, true, null),
  ($c$M1-FIG-044$c$, $c$B$c$, $c$El cuadrado no tiene altura, porque ninguno de sus lados es horizontal.$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-044$c$, $c$C$c$, $c$$AB$ es una diagonal del cuadrado.$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-044$c$, $c$D$c$, $c$$OA$ es la apotema del cuadrado.$c$, false, $c$FIG-ELEM-APORADIO$c$),
  ($c$M1-FIG-045$c$, $c$A$c$, $c$Un segmento desde $C$ hasta el punto medio de $AB$.$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-045$c$, $c$B$c$, $c$El lado más corto que sale de $C$.$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-045$c$, $c$C$c$, $c$Un segmento vertical desde $C$ hasta $AB$.$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-045$c$, $c$D$c$, $c$Un segmento desde $C$ perpendicular a la recta $AB$.$c$, true, null),
  ($c$M1-FIG-046$c$, $c$A$c$, $c$$11$$c$, true, null),
  ($c$M1-FIG-046$c$, $c$B$c$, $c$$22$$c$, false, $c$FIG-ELEM-DIAGDOBLE$c$),
  ($c$M1-FIG-046$c$, $c$C$c$, $c$$2$$c$, false, $c$FIG-ELEM-DIAGUNO$c$),
  ($c$M1-FIG-046$c$, $c$D$c$, $c$$13$$c$, false, $c$FIG-ELEM-DIAGLADOS$c$),
  ($c$M1-FIG-047$c$, $c$A$c$, $c$La altura sobre la hipotenusa llega siempre a su punto medio.$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-047$c$, $c$B$c$, $c$Dos de sus alturas son sus catetos.$c$, true, null),
  ($c$M1-FIG-047$c$, $c$C$c$, $c$Ninguna de sus alturas coincide con un lado.$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-047$c$, $c$D$c$, $c$Tiene una sola altura: la que es vertical.$c$, false, $c$FIG-ELEM-ALTVERTICAL$c$),
  ($c$M1-FIG-048$c$, $c$A$c$, $c$$DA$$c$, false, $c$FIG-ELEM-ALTLADO$c$),
  ($c$M1-FIG-048$c$, $c$B$c$, $c$$DM$$c$, false, $c$FIG-ELEM-ALTMEDIANA$c$),
  ($c$M1-FIG-048$c$, $c$C$c$, $c$$DH$$c$, true, null),
  ($c$M1-FIG-048$c$, $c$D$c$, $c$Ninguno, porque ningún segmento perpendicular llega al lado $AB$.$c$, false, $c$FIG-ELEM-ALTDENTRO$c$),
  ($c$M1-FIG-049$c$, $c$A$c$, $c$$35$ cm$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-049$c$, $c$B$c$, $c$$7$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-049$c$, $c$C$c$, $c$$49$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-049$c$, $c$D$c$, $c$$42$ cm$c$, true, null),
  ($c$M1-FIG-050$c$, $c$A$c$, $c$$14$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-050$c$, $c$B$c$, $c$$28$ cm$c$, true, null),
  ($c$M1-FIG-050$c$, $c$C$c$, $c$$38$ cm$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-050$c$, $c$D$c$, $c$$48$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-051$c$, $c$A$c$, $c$$12$ cm$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-051$c$, $c$B$c$, $c$No se puede saber sin conocer otra medida.$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-051$c$, $c$C$c$, $c$$6$ cm$c$, true, null),
  ($c$M1-FIG-051$c$, $c$D$c$, $c$$21$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-052$c$, $c$A$c$, $c$$34$ cm$c$, true, null),
  ($c$M1-FIG-052$c$, $c$B$c$, $c$$54$ cm$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-052$c$, $c$C$c$, $c$$27$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-052$c$, $c$D$c$, $c$No se puede calcular: faltan dos medidas.$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-053$c$, $c$A$c$, $c$$26$ cm$c$, true, null),
  ($c$M1-FIG-053$c$, $c$B$c$, $c$$13$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-053$c$, $c$C$c$, $c$$34$ cm$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-053$c$, $c$D$c$, $c$$36$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-054$c$, $c$A$c$, $c$$625$ m$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-054$c$, $c$B$c$, $c$$50$ m$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-054$c$, $c$C$c$, $c$$25$ m$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-054$c$, $c$D$c$, $c$$100$ m$c$, true, null),
  ($c$M1-FIG-055$c$, $c$A$c$, $c$No se puede calcular: falta la medida de un lado.$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-055$c$, $c$B$c$, $c$$54$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-055$c$, $c$C$c$, $c$$24$ cm$c$, true, null),
  ($c$M1-FIG-055$c$, $c$D$c$, $c$$15$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-056$c$, $c$A$c$, $c$$15$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-056$c$, $c$B$c$, $c$$30$ cm$c$, true, null),
  ($c$M1-FIG-056$c$, $c$C$c$, $c$$54$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-056$c$, $c$D$c$, $c$No se puede calcular: los escalones no tienen medidas.$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-057$c$, $c$A$c$, $c$$19$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-057$c$, $c$B$c$, $c$$48$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-057$c$, $c$C$c$, $c$$20$ cm$c$, true, null),
  ($c$M1-FIG-057$c$, $c$D$c$, $c$$34$ cm$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-058$c$, $c$A$c$, $c$$42$ cm$c$, true, null),
  ($c$M1-FIG-058$c$, $c$B$c$, $c$$168$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-058$c$, $c$C$c$, $c$$28$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-058$c$, $c$D$c$, $c$$54$ cm$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-059$c$, $c$A$c$, $c$$12$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-059$c$, $c$B$c$, $c$$60$ cm$c$, true, null),
  ($c$M1-FIG-059$c$, $c$C$c$, $c$$144$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-059$c$, $c$D$c$, $c$$72$ cm$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-060$c$, $c$A$c$, $c$$34$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-060$c$, $c$B$c$, $c$$32$ cm$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-060$c$, $c$C$c$, $c$$8$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-060$c$, $c$D$c$, $c$$26$ cm$c$, true, null),
  ($c$M1-FIG-061$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-061$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-061$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-061$c$, $c$D$c$, $c$Solo I$c$, true, null),
  ($c$M1-FIG-062$c$, $c$A$c$, $c$$48$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-062$c$, $c$B$c$, $c$$32$ cm$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-062$c$, $c$C$c$, $c$$28$ cm$c$, true, null),
  ($c$M1-FIG-062$c$, $c$D$c$, $c$$23$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-063$c$, $c$A$c$, $c$$8$ cm$c$, true, null),
  ($c$M1-FIG-063$c$, $c$B$c$, $c$$21$ cm$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-063$c$, $c$C$c$, $c$$12$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-063$c$, $c$D$c$, $c$$6$ cm$c$, false, $c$FIG-CLAS-NOMBRE$c$),
  ($c$M1-FIG-064$c$, $c$A$c$, $c$$9$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-064$c$, $c$B$c$, $c$$36$ cm$c$, true, null),
  ($c$M1-FIG-064$c$, $c$C$c$, $c$$18$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-064$c$, $c$D$c$, $c$$81$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-065$c$, $c$A$c$, $c$$50$ cm$c$, true, null),
  ($c$M1-FIG-065$c$, $c$B$c$, $c$$54$ cm$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-065$c$, $c$C$c$, $c$$33$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-065$c$, $c$D$c$, $c$$76$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-066$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-066$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-FIG-066$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-066$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-067$c$, $c$A$c$, $c$No se puede saber: falta la medida de otro lado.$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-067$c$, $c$B$c$, $c$$15$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-067$c$, $c$C$c$, $c$$9$ cm$c$, true, null),
  ($c$M1-FIG-067$c$, $c$D$c$, $c$$18$ cm$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-068$c$, $c$A$c$, $c$$11$ cm$c$, false, $c$PER-POL-SOLODATOS$c$),
  ($c$M1-FIG-068$c$, $c$B$c$, $c$$34$ cm$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-068$c$, $c$C$c$, $c$$32$ cm$c$, false, $c$PER-POL-ALTURA$c$),
  ($c$M1-FIG-068$c$, $c$D$c$, $c$$28$ cm$c$, true, null),
  ($c$M1-FIG-069$c$, $c$A$c$, $c$$30$ cm$c$, true, null),
  ($c$M1-FIG-069$c$, $c$B$c$, $c$$48$ cm$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-069$c$, $c$C$c$, $c$$15$ cm$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-069$c$, $c$D$c$, $c$$36$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-070$c$, $c$A$c$, $c$Solo I$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-070$c$, $c$B$c$, $c$Solo I y II$c$, true, null),
  ($c$M1-FIG-070$c$, $c$C$c$, $c$Solo II$c$, false, $c$PER-POL-FALTAN$c$),
  ($c$M1-FIG-070$c$, $c$D$c$, $c$I, II y III$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-071$c$, $c$A$c$, $c$$324$ m$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-071$c$, $c$B$c$, $c$$39$ m$c$, false, $c$PER-POL-DOSLADOS$c$),
  ($c$M1-FIG-071$c$, $c$C$c$, $c$$74$ m$c$, false, $c$PER-POL-RESTA$c$),
  ($c$M1-FIG-071$c$, $c$D$c$, $c$$78$ m$c$, true, null),
  ($c$M1-FIG-072$c$, $c$A$c$, $c$$72$ cm$c$, false, $c$PER-POL-AREA$c$),
  ($c$M1-FIG-072$c$, $c$B$c$, $c$$24$ cm$c$, false, $c$PER-POL-INTERIOR$c$),
  ($c$M1-FIG-072$c$, $c$C$c$, $c$$36$ cm$c$, true, null),
  ($c$M1-FIG-072$c$, $c$D$c$, $c$$18$ cm$c$, false, $c$PER-POL-DOSLADOS$c$)
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
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-001$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-002$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-003$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-004$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-005$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-006$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-007$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-008$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-009$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-010$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-011$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-012$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-013$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-014$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-015$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-016$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-017$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-018$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-019$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-020$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-021$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-022$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-023$c$),
  ($c$GEO-FIG-CLAS$c$, $c$M1-FIG-024$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-025$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-026$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-027$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-028$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-029$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-030$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-031$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-032$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-033$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-034$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-035$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-036$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-037$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-038$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-039$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-040$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-041$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-042$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-043$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-044$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-045$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-046$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-047$c$),
  ($c$GEO-FIG-ELEM$c$, $c$M1-FIG-048$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-049$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-050$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-051$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-052$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-053$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-054$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-055$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-056$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-057$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-058$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-059$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-060$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-061$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-062$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-063$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-064$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-065$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-066$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-067$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-068$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-069$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-070$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-071$c$),
  ($c$GEO-PER-POL$c$, $c$M1-FIG-072$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$FIG-CLAS-EXCLUYE$c$, $c$Una figura puede tener varios nombres$c$, $c$Trataste las clases de figuras como si no se pudieran mezclar. Por
ejemplo, dijiste que un cuadrado no es un rombo.

**Los nombres de las figuras se incluyen unos en otros. Una figura que
cumple la definición de una clase pertenece a ella, aunque también
tenga un nombre más preciso.**

Un rombo es un cuadrilátero con sus cuatro lados iguales. El cuadrado
tiene sus cuatro lados iguales, así que es un rombo. Además tiene
cuatro ángulos rectos, así que también es un rectángulo.

Lo mismo con los triángulos: isósceles es «al menos dos lados
iguales», y el equilátero tiene tres, así que es isósceles.

Un control rápido: lee la definición de la clase y revisa si la figura
la cumple, sin importar qué otro nombre tenga.$c$),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$FIG-CLAS-ORIENTA$c$, $c$Girar una figura no le cambia el nombre$c$, $c$Clasificaste la figura según cómo estaba dibujada. Por ejemplo,
dijiste que un cuadrado apoyado sobre un vértice es un rombo y no un
cuadrado.

**El nombre de una figura depende de sus lados, sus ángulos y su
paralelismo, no de su posición en la hoja.**

Si giras un cuadrado, sus lados siguen siendo iguales y sus ángulos
siguen siendo rectos: sigue siendo un cuadrado. Lo mismo con un
triángulo rectángulo con el ángulo recto arriba, o con un trapecio
cuyos lados paralelos están inclinados.

Un control rápido: imagina que giras la hoja hasta que la figura quede
«derecha». Si con eso cambiaría su nombre, estás clasificando por la
posición.$c$),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$FIG-CLAS-REGULAR$c$, $c$Regular es lados iguales y ángulos iguales$c$, $c$Consideraste regular un polígono que cumple solo una condición. Por
ejemplo, dijiste que un rombo es regular porque sus lados son iguales.

**Un polígono es regular si tiene todos sus lados iguales y, además,
todos sus ángulos iguales.**

- Rombo: lados iguales, pero dos ángulos agudos y dos obtusos. No es
  regular.
- Rectángulo: cuatro ángulos rectos, pero lados de dos medidas. No es
  regular.
- Cuadrado: las dos cosas. Es regular.

Un control rápido: revisa las dos condiciones por separado. Si falla
una, no es regular.$c$),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$FIG-CLAS-CRITERIOS$c$, $c$Por lados y por ángulos son dos clasificaciones distintas$c$, $c$Pensaste que un triángulo no puede tener a la vez un nombre por sus
lados y otro por sus ángulos. Por ejemplo, dijiste que un triángulo
rectángulo no puede ser isósceles.

**Todo triángulo tiene un nombre por sus lados (equilátero, isósceles o
escaleno) y otro por sus ángulos (acutángulo, rectángulo u
obtusángulo). Son independientes.**

Un triángulo con un ángulo recto y los dos lados que lo forman iguales
es rectángulo **e** isósceles. Una escuadra de dibujo tiene esa forma.

Un control rápido: clasifica primero por los lados y después, aparte,
por los ángulos. El nombre completo usa las dos respuestas.$c$),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$FIG-CLAS-PARALELOS$c$, $c$Trapecio, un par; paralelogramo, dos pares$c$, $c$Confundiste cuántos pares de lados paralelos tiene cada cuadrilátero.
Por ejemplo, dijiste que un trapecio tiene dos pares.

**Trapezoide: ningún par de lados paralelos. Trapecio: exactamente un
par. Paralelogramo: dos pares.**

Los rombos, rectángulos y cuadrados son paralelogramos: tienen dos
pares. Un trapecio tiene solo sus dos bases paralelas; los otros dos
lados se abren o se cierran.

Un control rápido: toma cada par de lados opuestos y pregúntate si
podrían ser rieles de un tren (nunca se juntan). Cuenta cuántos pares
pasan la prueba.$c$),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$FIG-CLAS-NOMBRE$c$, $c$Cada nombre tiene su definición$c$, $c$Usaste un nombre que corresponde a otra figura. Por ejemplo, llamaste
isósceles a un triángulo con sus tres lados distintos.

**Triángulos por lados: equilátero (tres lados iguales), isósceles (al
menos dos iguales), escaleno (ninguno igual). Por número de lados:
pentágono 5, hexágono 6, heptágono 7, octágono 8.**

Algunas pistas para recordarlos:

- «Equi-látero»: lados iguales.
- «Hexa» es seis, como en hexágono; «octo» es ocho, como en octágono.
- Trapecio tiene un par de lados paralelos; trapezoide, ninguno.

Un control rápido: antes de elegir un nombre, di en voz alta su
definición y compárala con la figura.$c$),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$FIG-ELEM-ALTLADO$c$, $c$La altura es perpendicular, no un lado cualquiera$c$, $c$Tomaste un lado como si fuera la altura, o no reconociste un lado que
sí es altura. Por ejemplo, elegiste el lado inclinado de un triángulo
como su altura.

**La altura sobre un lado es el segmento que va desde el vértice
opuesto y llega perpendicular a ese lado.**

Un lado del triángulo es altura solo si forma ángulo recto con la
base. Pasa en el triángulo rectángulo: cada cateto es la altura sobre
el otro cateto. En los demás casos, la altura hay que trazarla.

Un control rápido: busca el ángulo recto. Si el segmento que elegiste
no forma ángulo recto con la base, no es la altura.$c$),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$FIG-ELEM-ALTVERTICAL$c$, $c$La altura se mide contra el lado, no contra la hoja$c$, $c$Trazaste la altura en vertical, como si la base siempre estuviera
horizontal. Por ejemplo, con la base inclinada elegiste el segmento
que baja derecho.

**La altura es perpendicular a la base. Si la base está inclinada, la
altura también lo está.**

Imagina que giras la hoja hasta que la base quede horizontal: recién
ahí la altura se ve vertical. Por eso, si la base es vertical, la
altura es horizontal, y existe igual.

Un control rápido: el ángulo entre la altura y la base tiene que ser
recto. Si el segmento es vertical pero la base está inclinada, ese
ángulo no es recto.$c$),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$FIG-ELEM-ALTDENTRO$c$, $c$La altura puede caer fuera del triángulo$c$, $c$Buscaste la altura dentro del triángulo aunque cae fuera. Por ejemplo,
en un triángulo obtusángulo elegiste un segmento interior.

**La altura va perpendicular a la base o a su prolongación. En un
triángulo obtusángulo, dos de sus alturas caen fuera.**

Si el ángulo obtuso está junto a la base, al bajar la perpendicular
desde el vértice opuesto no alcanzas a tocar la base: hay que
prolongarla con una línea punteada. El pie de la altura queda en esa
prolongación.

Un control rápido: un segmento interior que no forma ángulo recto con
la base no es la altura, aunque esté adentro.$c$),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$FIG-ELEM-ALTMEDIANA$c$, $c$La altura no busca el punto medio$c$, $c$Elegiste el segmento que llega al punto medio del lado. Ese segmento se
llama mediana, no altura.

**La altura llega perpendicular a la base. La mediana llega al punto
medio. En general son segmentos distintos.**

Solo en un triángulo isósceles, la altura sobre la base desigual cae
justo en su punto medio. En cualquier otro caso, el pie de la altura
queda a un lado del punto medio.

Un control rápido: para la altura, busca el ángulo recto; para la
mediana, busca las marcas de mitades iguales. Son pistas distintas.$c$),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$FIG-ELEM-APORADIO$c$, $c$La apotema va al lado; el radio, al vértice$c$, $c$Llamaste apotema al segmento que va del centro a un vértice. Ese
segmento es el radio.

**En un polígono regular, la apotema va del centro al punto medio de un
lado y es perpendicular a él. El radio va del centro a un vértice.**

Como el vértice está más lejos del centro que el punto medio de un
lado, la apotema siempre es más corta que el radio.

Un control rápido: la apotema forma ángulo recto con el lado donde
termina. Si el segmento termina en una esquina, es el radio.$c$),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$FIG-ELEM-DIAGLADOS$c$, $c$Los lados no son diagonales$c$, $c$Contaste como diagonales segmentos que unen vértices vecinos, que son
lados. Por ejemplo, dijiste que un cuadrilátero tiene 6 diagonales.

**Una diagonal une dos vértices que no son consecutivos.**

Desde un vértice de un polígono de $n$ lados no hay diagonal hacia él
mismo ni hacia sus dos vecinos: salen $n - 3$ diagonales. En un
cuadrilátero, $4 - 3 = 1$ desde cada vértice, y en total $2$.

Un triángulo no tiene diagonales: todos sus vértices son vecinos.

Un control rápido: dibuja el polígono y marca con el dedo el segmento.
Si recorre el borde, es un lado.$c$),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$FIG-ELEM-DIAGDOBLE$c$, $c$Cada diagonal tiene dos extremos$c$, $c$Multiplicaste las diagonales de cada vértice por el número de vértices
y no dividiste por 2. Por ejemplo, para un heptágono escribiste
$7 \cdot 4 = 28$.

**Cada diagonal une dos vértices, así que al contar desde todos los
vértices aparece dos veces. El total es $\frac{n(n - 3)}{2}$.**

En el heptágono salen $4$ diagonales de cada vértice. $7 \cdot 4 = 28$
cuenta cada una desde sus dos extremos: en realidad son
$28 \div 2 = 14$.

Un control rápido: prueba con un cuadrado. Tiene $2$ diagonales; si tu
método da $4$, contaste dos veces.$c$),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$FIG-ELEM-DIAGUNO$c$, $c$Las de un vértice no son todas$c$, $c$Confundiste las diagonales que salen de un solo vértice con el total
del polígono. Por ejemplo, dijiste que un heptágono tiene $4$
diagonales.

**Desde un vértice salen $n - 3$ diagonales. El polígono completo tiene
$\frac{n(n - 3)}{2}$.**

En el heptágono: desde cada vértice salen $7 - 3 = 4$. Como son $7$
vértices y cada diagonal se cuenta dos veces,
$\frac{7 \cdot 4}{2} = 14$ en total.

Un control rápido: fíjate si la pregunta dice «desde un vértice» o
habla de todo el polígono.$c$),
  ($c$REM-PER-POL-AREA$c$, $c$PER-POL-AREA$c$, $c$El perímetro se suma, no se multiplica$c$, $c$Multiplicaste medidas cuando se pedía el perímetro. Por ejemplo, para
un rectángulo de $10$ cm por $3$ cm respondiste $30$.

**El perímetro es el largo del borde: la suma de todos los lados. Se
mide en centímetros, no en centímetros cuadrados.**

$$10 + 3 + 10 + 3 = 26 \text{ cm}$$

$10 \cdot 3 = 30$ es el área: cuántos cuadraditos de $1$ cm caben
adentro. Es otra pregunta.

Un control rápido: el perímetro es lo que medirías con una cinta
alrededor de la figura. Una cinta no se multiplica.$c$),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$PER-POL-SOLODATOS$c$, $c$Suma todos los lados, estén escritos o no$c$, $c$Sumaste solo los números que aparecían en la figura. Por ejemplo, en
un octágono regular con un lado rotulado de $4$ cm respondiste $4$.

**El perímetro suma todos los lados. Si hay marcas de lados iguales o
el polígono es regular, cada lado sin número mide lo mismo que su
igual.**

Un octágono regular tiene $8$ lados de $4$ cm: $8 \cdot 4 = 32$ cm.

En figuras con ángulos rectos, los lados sin número se deducen de los
otros: los tramos horizontales de un lado suman lo mismo que los del
otro.

Un control rápido: cuenta los lados de la figura y cuenta cuántas
medidas sumaste. Tienen que coincidir.$c$),
  ($c$REM-PER-POL-INTERIOR$c$, $c$PER-POL-INTERIOR$c$, $c$Lo que queda adentro no es borde$c$, $c$Contaste un segmento que quedó dentro de la figura. Por ejemplo, al
unir dos rectángulos por un lado sumaste sus dos perímetros completos.

**El perímetro es solo el borde exterior. Un lado compartido entre dos
figuras queda adentro y no se cuenta.**

Dos cuadrados de $2$ cm pegados forman un rectángulo de $4$ por $2$:
su perímetro es $12$ cm, no $8 + 8 = 16$. Los $2$ lados que se juntaron
desaparecieron del borde.

Al revés, si cortas una figura en dos, aparece un borde nuevo que
antes no estaba.

Un control rápido: recorre el borde con el dedo sin entrar a la
figura. Solo suma lo que tocas.$c$),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$PER-POL-DOSLADOS$c$, $c$El rectángulo tiene cuatro lados$c$, $c$Sumaste el largo y el ancho una sola vez. Por ejemplo, para un
rectángulo de $12$ cm por $3$ cm respondiste $15$.

**Un rectángulo tiene cuatro lados: dos largos y dos anchos. Su
perímetro es $2 \cdot (\text{largo} + \text{ancho})$.**

$$12 + 3 + 12 + 3 = 30 \text{ cm}$$

Si vas al revés (del perímetro a un lado), recuerda lo mismo: el
perímetro reparte el largo y el ancho dos veces cada uno.

Un control rápido: el perímetro de un rectángulo siempre es mayor que
el doble de su lado más largo.$c$),
  ($c$REM-PER-POL-ALTURA$c$, $c$PER-POL-ALTURA$c$, $c$Alturas y diagonales no son borde$c$, $c$Sumaste un segmento que no es un lado. Por ejemplo, en un triángulo
con su altura dibujada, sumaste también la altura.

**El perímetro suma solo los lados, el borde de la figura. La altura y
las diagonales están adentro.**

Si un triángulo tiene lados de $12$, $16$ y $20$ cm y su altura dibujada
mide $9{,}6$ cm, su perímetro es $12 + 16 + 20 = 48$ cm. La altura sirve
para el área, no para el perímetro.

Un control rápido: si el segmento que sumaste cruza la figura por
dentro, no es parte del borde.$c$),
  ($c$REM-PER-POL-RESTA$c$, $c$PER-POL-RESTA$c$, $c$Deduce el lado que falta con la figura$c$, $c$Calculaste mal un lado sin medida. Por ejemplo, en una figura en L
sumaste dos medidas donde había que restarlas.

**En una figura con ángulos rectos, el lado que falta es la diferencia
entre el tramo completo y el tramo conocido.**

Si el ancho de abajo es $9$ cm y el tramo de arriba mide $5$ cm, el
otro tramo de arriba mide $9 - 5 = 4$ cm, no $9 + 5$.

Y si conoces el perímetro: resta los lados conocidos y reparte lo que
queda entre los lados que faltan. Con perímetro $22$, un lado de $8$ y
dos iguales: $22 - 8 = 14$, y $14 \div 2 = 7$ cada uno.

Un control rápido: un tramo no puede ser más largo que el lado completo
que lo contiene.$c$),
  ($c$REM-PER-POL-FALTAN$c$, $c$PER-POL-FALTAN$c$, $c$Los lados sin número se pueden deducir$c$, $c$Concluiste que el perímetro no se podía calcular porque faltaban
medidas escritas.

**Muchas veces los lados que faltan se deducen: por marcas de lados
iguales, por ser un polígono regular o por los ángulos rectos.**

En una figura en forma de escalera, los escalones horizontales suman
lo mismo que la base, y los verticales suman lo mismo que la altura.
Una escalera de $7$ cm de ancho y $5$ cm de alto tiene perímetro
$2 \cdot (7 + 5) = 24$ cm, aunque los escalones no tengan números.

Un control rápido: antes de decir que faltan datos, busca marcas de
iguales y ángulos rectos. Suelen ser justamente los datos que faltan.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$REM-FIG-CLAS-ORIENTA$c$, $c$REM-FIG-CLAS-REGULAR$c$, $c$REM-FIG-CLAS-CRITERIOS$c$, $c$REM-FIG-CLAS-PARALELOS$c$, $c$REM-FIG-CLAS-NOMBRE$c$, $c$REM-FIG-ELEM-ALTLADO$c$, $c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$REM-FIG-ELEM-ALTDENTRO$c$, $c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$REM-FIG-ELEM-APORADIO$c$, $c$REM-FIG-ELEM-DIAGLADOS$c$, $c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$REM-FIG-ELEM-DIAGUNO$c$, $c$REM-PER-POL-AREA$c$, $c$REM-PER-POL-SOLODATOS$c$, $c$REM-PER-POL-INTERIOR$c$, $c$REM-PER-POL-DOSLADOS$c$, $c$REM-PER-POL-ALTURA$c$, $c$REM-PER-POL-RESTA$c$, $c$REM-PER-POL-FALTAN$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-003$c$, 1::smallint),
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-004$c$, 2::smallint),
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-012$c$, 3::smallint),
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-014$c$, 4::smallint),
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-021$c$, 5::smallint),
  ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$M1-FIG-022$c$, 6::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-005$c$, 1::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-006$c$, 2::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-012$c$, 3::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-013$c$, 4::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-020$c$, 5::smallint),
  ($c$REM-FIG-CLAS-ORIENTA$c$, $c$M1-FIG-022$c$, 6::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-004$c$, 1::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-005$c$, 2::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-014$c$, 3::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-015$c$, 4::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-019$c$, 5::smallint),
  ($c$REM-FIG-CLAS-REGULAR$c$, $c$M1-FIG-021$c$, 6::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-003$c$, 1::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-007$c$, 2::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-013$c$, 3::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-016$c$, 4::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-017$c$, 5::smallint),
  ($c$REM-FIG-CLAS-CRITERIOS$c$, $c$M1-FIG-024$c$, 6::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-004$c$, 1::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-006$c$, 2::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-014$c$, 3::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-015$c$, 4::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-021$c$, 5::smallint),
  ($c$REM-FIG-CLAS-PARALELOS$c$, $c$M1-FIG-023$c$, 6::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-006$c$, 1::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-007$c$, 2::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-012$c$, 3::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-013$c$, 4::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-020$c$, 5::smallint),
  ($c$REM-FIG-CLAS-NOMBRE$c$, $c$M1-FIG-023$c$, 6::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-031$c$, 1::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-032$c$, 2::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-034$c$, 3::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-038$c$, 4::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-045$c$, 5::smallint),
  ($c$REM-FIG-ELEM-ALTLADO$c$, $c$M1-FIG-047$c$, 6::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-026$c$, 1::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-031$c$, 2::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-032$c$, 3::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-038$c$, 4::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-044$c$, 5::smallint),
  ($c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$M1-FIG-045$c$, 6::smallint),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$M1-FIG-026$c$, 1::smallint),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$M1-FIG-033$c$, 2::smallint),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$M1-FIG-042$c$, 3::smallint),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$M1-FIG-043$c$, 4::smallint),
  ($c$REM-FIG-ELEM-ALTDENTRO$c$, $c$M1-FIG-048$c$, 5::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-027$c$, 1::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-031$c$, 2::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-034$c$, 3::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-038$c$, 4::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-045$c$, 5::smallint),
  ($c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$M1-FIG-047$c$, 6::smallint),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$M1-FIG-027$c$, 1::smallint),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$M1-FIG-029$c$, 2::smallint),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$M1-FIG-039$c$, 3::smallint),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$M1-FIG-040$c$, 4::smallint),
  ($c$REM-FIG-ELEM-APORADIO$c$, $c$M1-FIG-044$c$, 5::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-028$c$, 1::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-029$c$, 2::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-036$c$, 3::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-037$c$, 4::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-044$c$, 5::smallint),
  ($c$REM-FIG-ELEM-DIAGLADOS$c$, $c$M1-FIG-046$c$, 6::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-028$c$, 1::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-030$c$, 2::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-036$c$, 3::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-037$c$, 4::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-041$c$, 5::smallint),
  ($c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$M1-FIG-046$c$, 6::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-029$c$, 1::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-030$c$, 2::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-036$c$, 3::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-037$c$, 4::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-041$c$, 5::smallint),
  ($c$REM-FIG-ELEM-DIAGUNO$c$, $c$M1-FIG-046$c$, 6::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-053$c$, 1::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-054$c$, 2::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-060$c$, 3::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-061$c$, 4::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-069$c$, 5::smallint),
  ($c$REM-PER-POL-AREA$c$, $c$M1-FIG-070$c$, 6::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-053$c$, 1::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-054$c$, 2::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-060$c$, 3::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-062$c$, 4::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-065$c$, 5::smallint),
  ($c$REM-PER-POL-SOLODATOS$c$, $c$M1-FIG-068$c$, 6::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-053$c$, 1::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-060$c$, 2::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-061$c$, 3::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-068$c$, 4::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-069$c$, 5::smallint),
  ($c$REM-PER-POL-INTERIOR$c$, $c$M1-FIG-072$c$, 6::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-051$c$, 1::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-054$c$, 2::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-061$c$, 3::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-063$c$, 4::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-069$c$, 5::smallint),
  ($c$REM-PER-POL-DOSLADOS$c$, $c$M1-FIG-070$c$, 6::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-050$c$, 1::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-057$c$, 2::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-058$c$, 3::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-062$c$, 4::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-066$c$, 5::smallint),
  ($c$REM-PER-POL-ALTURA$c$, $c$M1-FIG-068$c$, 6::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-051$c$, 1::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-052$c$, 2::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-063$c$, 3::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-065$c$, 4::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-067$c$, 5::smallint),
  ($c$REM-PER-POL-RESTA$c$, $c$M1-FIG-071$c$, 6::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-051$c$, 1::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-052$c$, 2::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-055$c$, 3::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-056$c$, 4::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-067$c$, 5::smallint),
  ($c$REM-PER-POL-FALTAN$c$, $c$M1-FIG-070$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-GEO-FIG-01$c$, $c$GEO-FIG$c$, $c$Figuras, sus elementos y su perímetro$c$, $c$Antes de calcular áreas o volúmenes hay que saber qué figura tienes al
frente, cuáles son sus partes y cuánto mide su borde. Esta clase ordena
ese vocabulario, que la PAES usa sin explicarlo.

## Clasificación de figuras

### Triángulos

Un triángulo se clasifica de dos maneras **independientes**:

- por sus lados: **equilátero** (tres lados iguales), **isósceles** (al
  menos dos iguales) o **escaleno** (los tres distintos);
- por sus ángulos: **acutángulo** (tres ángulos agudos), **rectángulo**
  (un ángulo recto) u **obtusángulo** (un ángulo obtuso).

Todo triángulo tiene un nombre de cada lista. Un triángulo con un ángulo
recto y dos lados iguales es **rectángulo e isósceles**: un nombre no
excluye al otro.

Y como isósceles es «al menos dos lados iguales», **todo equilátero es
también isósceles**.

### Cuadriláteros

La clave es contar los pares de lados paralelos:

- **trapezoide**: ningún par;
- **trapecio**: exactamente un par;
- **paralelogramo**: dos pares.

Dentro de los paralelogramos están el **rectángulo** (cuatro ángulos
rectos), el **rombo** (cuatro lados iguales) y el **romboide** (ni una ni
otra cosa). El **cuadrado** cumple las dos condiciones: es un rectángulo
y también un rombo.

![](fig:FIG-FIG-CLAS-07)

**Las clases se incluyen unas en otras.** Todo cuadrado es rectángulo,
todo rectángulo es paralelogramo. Por eso la pregunta «¿el cuadrado es un
rombo?» tiene respuesta sí.

### La posición no cambia la figura

Girar una figura no le cambia el nombre. Un cuadrado apoyado sobre un
vértice sigue siendo un cuadrado, y un triángulo con el ángulo recto
arriba sigue siendo rectángulo. Para clasificar, mira lados, ángulos y
paralelismo; no cómo está dibujada.

### Polígonos regulares

Un polígono es **regular** si tiene **todos sus lados iguales y todos sus
ángulos iguales**. Las dos cosas. El rombo tiene los lados iguales pero no
los ángulos; el rectángulo tiene los ángulos iguales pero no los lados:
ninguno es regular. El cuadrado sí.

Nombres según los lados: pentágono ($5$), hexágono ($6$), heptágono
($7$), octágono ($8$), decágono ($10$).

## Altura, base, apotema y diagonal

### Base y altura

Cualquier lado puede ser la **base**. La **altura** correspondiente es el
segmento que va desde el vértice opuesto **perpendicular a la base** (o a
su prolongación).

Tres errores comunes:

- La altura no es vertical: es perpendicular al lado. Si el lado está
  inclinado, la altura también.
- La altura no llega al punto medio del lado (eso es la mediana), salvo
  casos especiales.
- La altura puede quedar **fuera** del triángulo.

![](fig:FIG-FIG-ELEM-11)

En un triángulo obtusángulo, dos de sus alturas caen fuera: hay que
prolongar el lado. En un triángulo rectángulo, cada cateto es la altura
sobre el otro cateto.

### Apotema y radio

En un polígono regular, el **radio** va del centro a un vértice y la
**apotema** va del centro al punto medio de un lado, perpendicular a él.
La apotema siempre es más corta que el radio.

![](fig:FIG-FIG-ELEM-12)

### Diagonales

Una **diagonal** une dos vértices **que no son consecutivos**. Los lados
no son diagonales.

![](fig:FIG-FIG-ELEM-13)

Desde cada vértice de un polígono de $n$ lados salen $n - 3$ diagonales:
no se cuentan él mismo ni sus dos vecinos. Si multiplicas por los $n$
vértices, cada diagonal quedó contada dos veces (una desde cada
extremo), así que el total es

$$\frac{n(n - 3)}{2}$$

En un pentágono: desde cada vértice salen $2$, y en total hay
$\frac{5 \cdot 2}{2} = 5$.

## Perímetro de polígonos

### Sumar todo el borde

**El perímetro es la suma de las longitudes de todos los lados.** Es una
longitud, no una superficie: se suma, no se multiplica.

En un rectángulo de $11$ cm por $4$ cm hay dos lados de cada medida:
$11 + 4 + 11 + 4 = 30$ cm. Si solo sumas $11 + 4$, te falta la mitad del
borde. Y $11 \cdot 4 = 44$ es el área, otra cosa.

Las marcas de lados iguales son datos. En un polígono regular de $n$
lados de medida $\ell$, el perímetro es $n \cdot \ell$, aunque esté
escrito un solo lado.

### Lo que no es borde no se suma

Alturas, diagonales y segmentos interiores no son parte del perímetro. Si
unes dos figuras por un lado, ese lado queda adentro y ya no cuenta.

### Lados que faltan

En figuras con ángulos rectos, los lados que faltan se deducen:

![](fig:FIG-PER-POL-14)

Los tramos horizontales de arriba suman lo mismo que el de abajo, y los
verticales de la derecha suman lo mismo que el de la izquierda. En una
figura en forma de escalera, por eso, el perímetro es igual al del
rectángulo que la contiene.

### El lado a partir del perímetro

Si conoces el perímetro y algunos lados, resta los conocidos y reparte lo
que queda entre los lados que faltan. Un cuadrado de perímetro $44$ cm
tiene lados de $44 \div 4 = 11$ cm.$c$, 1::smallint)
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
  ($c$LES-GEO-FIG-01$c$, $c$GEO-FIG-CLAS$c$, 1::smallint, $c$clasificacion-de-figuras$c$),
  ($c$LES-GEO-FIG-01$c$, $c$GEO-FIG-ELEM$c$, 2::smallint, $c$altura-base-apotema-y-diagonal$c$),
  ($c$LES-GEO-FIG-01$c$, $c$GEO-PER-POL$c$, 3::smallint, $c$perimetro-de-poligonos$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-FIG-001$c$, $c$M1-FIG-002$c$, $c$M1-FIG-003$c$, $c$M1-FIG-004$c$, $c$M1-FIG-005$c$, $c$M1-FIG-006$c$, $c$M1-FIG-007$c$, $c$M1-FIG-008$c$, $c$M1-FIG-009$c$, $c$M1-FIG-010$c$, $c$M1-FIG-011$c$, $c$M1-FIG-012$c$, $c$M1-FIG-013$c$, $c$M1-FIG-014$c$, $c$M1-FIG-015$c$, $c$M1-FIG-016$c$, $c$M1-FIG-017$c$, $c$M1-FIG-018$c$, $c$M1-FIG-019$c$, $c$M1-FIG-020$c$, $c$M1-FIG-021$c$, $c$M1-FIG-022$c$, $c$M1-FIG-023$c$, $c$M1-FIG-024$c$, $c$M1-FIG-025$c$, $c$M1-FIG-026$c$, $c$M1-FIG-027$c$, $c$M1-FIG-028$c$, $c$M1-FIG-029$c$, $c$M1-FIG-030$c$, $c$M1-FIG-031$c$, $c$M1-FIG-032$c$, $c$M1-FIG-033$c$, $c$M1-FIG-034$c$, $c$M1-FIG-035$c$, $c$M1-FIG-036$c$, $c$M1-FIG-037$c$, $c$M1-FIG-038$c$, $c$M1-FIG-039$c$, $c$M1-FIG-040$c$, $c$M1-FIG-041$c$, $c$M1-FIG-042$c$, $c$M1-FIG-043$c$, $c$M1-FIG-044$c$, $c$M1-FIG-045$c$, $c$M1-FIG-046$c$, $c$M1-FIG-047$c$, $c$M1-FIG-048$c$, $c$M1-FIG-049$c$, $c$M1-FIG-050$c$, $c$M1-FIG-051$c$, $c$M1-FIG-052$c$, $c$M1-FIG-053$c$, $c$M1-FIG-054$c$, $c$M1-FIG-055$c$, $c$M1-FIG-056$c$, $c$M1-FIG-057$c$, $c$M1-FIG-058$c$, $c$M1-FIG-059$c$, $c$M1-FIG-060$c$, $c$M1-FIG-061$c$, $c$M1-FIG-062$c$, $c$M1-FIG-063$c$, $c$M1-FIG-064$c$, $c$M1-FIG-065$c$, $c$M1-FIG-066$c$, $c$M1-FIG-067$c$, $c$M1-FIG-068$c$, $c$M1-FIG-069$c$, $c$M1-FIG-070$c$, $c$M1-FIG-071$c$, $c$M1-FIG-072$c$);
  if c <> 72 then
    raise exception 'items: se esperaban 72, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-FIG-001$c$, $c$M1-FIG-002$c$, $c$M1-FIG-003$c$, $c$M1-FIG-004$c$, $c$M1-FIG-005$c$, $c$M1-FIG-006$c$, $c$M1-FIG-007$c$, $c$M1-FIG-008$c$, $c$M1-FIG-009$c$, $c$M1-FIG-010$c$, $c$M1-FIG-011$c$, $c$M1-FIG-012$c$, $c$M1-FIG-013$c$, $c$M1-FIG-014$c$, $c$M1-FIG-015$c$, $c$M1-FIG-016$c$, $c$M1-FIG-017$c$, $c$M1-FIG-018$c$, $c$M1-FIG-019$c$, $c$M1-FIG-020$c$, $c$M1-FIG-021$c$, $c$M1-FIG-022$c$, $c$M1-FIG-023$c$, $c$M1-FIG-024$c$, $c$M1-FIG-025$c$, $c$M1-FIG-026$c$, $c$M1-FIG-027$c$, $c$M1-FIG-028$c$, $c$M1-FIG-029$c$, $c$M1-FIG-030$c$, $c$M1-FIG-031$c$, $c$M1-FIG-032$c$, $c$M1-FIG-033$c$, $c$M1-FIG-034$c$, $c$M1-FIG-035$c$, $c$M1-FIG-036$c$, $c$M1-FIG-037$c$, $c$M1-FIG-038$c$, $c$M1-FIG-039$c$, $c$M1-FIG-040$c$, $c$M1-FIG-041$c$, $c$M1-FIG-042$c$, $c$M1-FIG-043$c$, $c$M1-FIG-044$c$, $c$M1-FIG-045$c$, $c$M1-FIG-046$c$, $c$M1-FIG-047$c$, $c$M1-FIG-048$c$, $c$M1-FIG-049$c$, $c$M1-FIG-050$c$, $c$M1-FIG-051$c$, $c$M1-FIG-052$c$, $c$M1-FIG-053$c$, $c$M1-FIG-054$c$, $c$M1-FIG-055$c$, $c$M1-FIG-056$c$, $c$M1-FIG-057$c$, $c$M1-FIG-058$c$, $c$M1-FIG-059$c$, $c$M1-FIG-060$c$, $c$M1-FIG-061$c$, $c$M1-FIG-062$c$, $c$M1-FIG-063$c$, $c$M1-FIG-064$c$, $c$M1-FIG-065$c$, $c$M1-FIG-066$c$, $c$M1-FIG-067$c$, $c$M1-FIG-068$c$, $c$M1-FIG-069$c$, $c$M1-FIG-070$c$, $c$M1-FIG-071$c$, $c$M1-FIG-072$c$);
  if c <> 288 then
    raise exception 'item_options: se esperaban 288, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-FIG-001$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-002$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-003$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-004$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-005$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-006$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-007$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-008$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-009$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-010$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-011$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-012$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-013$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-014$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-015$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-016$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-017$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-018$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-019$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-020$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-021$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-022$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-023$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-024$c$, $c$GEO-FIG-CLAS$c$),
      ($c$M1-FIG-025$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-026$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-027$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-028$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-029$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-030$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-031$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-032$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-033$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-034$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-035$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-036$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-037$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-038$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-039$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-040$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-041$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-042$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-043$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-044$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-045$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-046$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-047$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-048$c$, $c$GEO-FIG-ELEM$c$),
      ($c$M1-FIG-049$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-050$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-051$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-052$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-053$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-054$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-055$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-056$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-057$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-058$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-059$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-060$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-061$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-062$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-063$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-064$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-065$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-066$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-067$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-068$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-069$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-070$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-071$c$, $c$GEO-PER-POL$c$),
      ($c$M1-FIG-072$c$, $c$GEO-PER-POL$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 72 then
    raise exception 'node_items: 72 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-FIG-001$c$, $c$M1-FIG-002$c$, $c$M1-FIG-003$c$, $c$M1-FIG-004$c$, $c$M1-FIG-005$c$, $c$M1-FIG-006$c$, $c$M1-FIG-007$c$, $c$M1-FIG-008$c$, $c$M1-FIG-009$c$, $c$M1-FIG-010$c$, $c$M1-FIG-011$c$, $c$M1-FIG-012$c$, $c$M1-FIG-013$c$, $c$M1-FIG-014$c$, $c$M1-FIG-015$c$, $c$M1-FIG-016$c$, $c$M1-FIG-017$c$, $c$M1-FIG-018$c$, $c$M1-FIG-019$c$, $c$M1-FIG-020$c$, $c$M1-FIG-021$c$, $c$M1-FIG-022$c$, $c$M1-FIG-023$c$, $c$M1-FIG-024$c$, $c$M1-FIG-025$c$, $c$M1-FIG-026$c$, $c$M1-FIG-027$c$, $c$M1-FIG-028$c$, $c$M1-FIG-029$c$, $c$M1-FIG-030$c$, $c$M1-FIG-031$c$, $c$M1-FIG-032$c$, $c$M1-FIG-033$c$, $c$M1-FIG-034$c$, $c$M1-FIG-035$c$, $c$M1-FIG-036$c$, $c$M1-FIG-037$c$, $c$M1-FIG-038$c$, $c$M1-FIG-039$c$, $c$M1-FIG-040$c$, $c$M1-FIG-041$c$, $c$M1-FIG-042$c$, $c$M1-FIG-043$c$, $c$M1-FIG-044$c$, $c$M1-FIG-045$c$, $c$M1-FIG-046$c$, $c$M1-FIG-047$c$, $c$M1-FIG-048$c$, $c$M1-FIG-049$c$, $c$M1-FIG-050$c$, $c$M1-FIG-051$c$, $c$M1-FIG-052$c$, $c$M1-FIG-053$c$, $c$M1-FIG-054$c$, $c$M1-FIG-055$c$, $c$M1-FIG-056$c$, $c$M1-FIG-057$c$, $c$M1-FIG-058$c$, $c$M1-FIG-059$c$, $c$M1-FIG-060$c$, $c$M1-FIG-061$c$, $c$M1-FIG-062$c$, $c$M1-FIG-063$c$, $c$M1-FIG-064$c$, $c$M1-FIG-065$c$, $c$M1-FIG-066$c$, $c$M1-FIG-067$c$, $c$M1-FIG-068$c$, $c$M1-FIG-069$c$, $c$M1-FIG-070$c$, $c$M1-FIG-071$c$, $c$M1-FIG-072$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$FIG-CLAS-CRITERIOS$c$, $c$FIG-CLAS-EXCLUYE$c$, $c$FIG-CLAS-NOMBRE$c$, $c$FIG-CLAS-ORIENTA$c$, $c$FIG-CLAS-PARALELOS$c$, $c$FIG-CLAS-REGULAR$c$, $c$FIG-ELEM-ALTDENTRO$c$, $c$FIG-ELEM-ALTLADO$c$, $c$FIG-ELEM-ALTMEDIANA$c$, $c$FIG-ELEM-ALTVERTICAL$c$, $c$FIG-ELEM-APORADIO$c$, $c$FIG-ELEM-DIAGDOBLE$c$, $c$FIG-ELEM-DIAGLADOS$c$, $c$FIG-ELEM-DIAGUNO$c$, $c$PER-POL-ALTURA$c$, $c$PER-POL-AREA$c$, $c$PER-POL-DOSLADOS$c$, $c$PER-POL-FALTAN$c$, $c$PER-POL-INTERIOR$c$, $c$PER-POL-RESTA$c$, $c$PER-POL-SOLODATOS$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c
    from (values
      ($c$M1-FIG-002$c$, $c$FIG-FIG-CLAS-01$c$),
      ($c$M1-FIG-004$c$, $c$FIG-FIG-CLAS-02$c$),
      ($c$M1-FIG-007$c$, $c$FIG-FIG-CLAS-03$c$),
      ($c$M1-FIG-010$c$, $c$FIG-FIG-CLAS-04$c$),
      ($c$M1-FIG-013$c$, $c$FIG-FIG-CLAS-05$c$),
      ($c$M1-FIG-018$c$, $c$FIG-FIG-CLAS-06$c$),
      ($c$M1-FIG-025$c$, $c$FIG-FIG-ELEM-01$c$),
      ($c$M1-FIG-029$c$, $c$FIG-FIG-ELEM-02$c$),
      ($c$M1-FIG-031$c$, $c$FIG-FIG-ELEM-03$c$),
      ($c$M1-FIG-032$c$, $c$FIG-FIG-ELEM-04$c$),
      ($c$M1-FIG-033$c$, $c$FIG-FIG-ELEM-05$c$),
      ($c$M1-FIG-038$c$, $c$FIG-FIG-ELEM-06$c$),
      ($c$M1-FIG-040$c$, $c$FIG-FIG-ELEM-07$c$),
      ($c$M1-FIG-042$c$, $c$FIG-FIG-ELEM-09$c$),
      ($c$M1-FIG-044$c$, $c$FIG-FIG-ELEM-08$c$),
      ($c$M1-FIG-048$c$, $c$FIG-FIG-ELEM-10$c$),
      ($c$M1-FIG-049$c$, $c$FIG-PER-POL-01$c$),
      ($c$M1-FIG-050$c$, $c$FIG-PER-POL-02$c$),
      ($c$M1-FIG-052$c$, $c$FIG-PER-POL-03$c$),
      ($c$M1-FIG-053$c$, $c$FIG-PER-POL-04$c$),
      ($c$M1-FIG-055$c$, $c$FIG-PER-POL-05$c$),
      ($c$M1-FIG-056$c$, $c$FIG-PER-POL-06$c$),
      ($c$M1-FIG-057$c$, $c$FIG-PER-POL-07$c$),
      ($c$M1-FIG-058$c$, $c$FIG-PER-POL-08$c$),
      ($c$M1-FIG-060$c$, $c$FIG-PER-POL-09$c$),
      ($c$M1-FIG-062$c$, $c$FIG-PER-POL-10$c$),
      ($c$M1-FIG-064$c$, $c$FIG-PER-POL-11$c$),
      ($c$M1-FIG-065$c$, $c$FIG-PER-POL-12$c$),
      ($c$M1-FIG-068$c$, $c$FIG-PER-POL-13$c$)
    ) as v(item_code, fig_code)
    join items i   on i.code = v.item_code
    join figures f on f.id = i.figure_id and f.code = v.fig_code;
  if c <> 29 then
    raise exception 'figure_id: 29 ítems con figura, solo % apuntan a la que declara el YAML', c; end if;

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

-- 72 ítems (72 curated), 288 alternativas, 21 misconceptions referenciadas,
-- 21 remediaciones, 34 figuras, 1 clase sobre 3 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 72 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-FIG-001$c$, $c$M1-FIG-002$c$, $c$M1-FIG-003$c$, $c$M1-FIG-004$c$, $c$M1-FIG-005$c$, $c$M1-FIG-006$c$, $c$M1-FIG-007$c$, $c$M1-FIG-008$c$, $c$M1-FIG-009$c$, $c$M1-FIG-010$c$, $c$M1-FIG-011$c$, $c$M1-FIG-012$c$, $c$M1-FIG-013$c$, $c$M1-FIG-014$c$, $c$M1-FIG-015$c$, $c$M1-FIG-016$c$, $c$M1-FIG-017$c$, $c$M1-FIG-018$c$, $c$M1-FIG-019$c$, $c$M1-FIG-020$c$, $c$M1-FIG-021$c$, $c$M1-FIG-022$c$, $c$M1-FIG-023$c$, $c$M1-FIG-024$c$, $c$M1-FIG-025$c$, $c$M1-FIG-026$c$, $c$M1-FIG-027$c$, $c$M1-FIG-028$c$, $c$M1-FIG-029$c$, $c$M1-FIG-030$c$, $c$M1-FIG-031$c$, $c$M1-FIG-032$c$, $c$M1-FIG-033$c$, $c$M1-FIG-034$c$, $c$M1-FIG-035$c$, $c$M1-FIG-036$c$, $c$M1-FIG-037$c$, $c$M1-FIG-038$c$, $c$M1-FIG-039$c$, $c$M1-FIG-040$c$, $c$M1-FIG-041$c$, $c$M1-FIG-042$c$, $c$M1-FIG-043$c$, $c$M1-FIG-044$c$, $c$M1-FIG-045$c$, $c$M1-FIG-046$c$, $c$M1-FIG-047$c$, $c$M1-FIG-048$c$, $c$M1-FIG-049$c$, $c$M1-FIG-050$c$, $c$M1-FIG-051$c$, $c$M1-FIG-052$c$, $c$M1-FIG-053$c$, $c$M1-FIG-054$c$, $c$M1-FIG-055$c$, $c$M1-FIG-056$c$, $c$M1-FIG-057$c$, $c$M1-FIG-058$c$, $c$M1-FIG-059$c$, $c$M1-FIG-060$c$, $c$M1-FIG-061$c$, $c$M1-FIG-062$c$, $c$M1-FIG-063$c$, $c$M1-FIG-064$c$, $c$M1-FIG-065$c$, $c$M1-FIG-066$c$, $c$M1-FIG-067$c$, $c$M1-FIG-068$c$, $c$M1-FIG-069$c$, $c$M1-FIG-070$c$, $c$M1-FIG-071$c$, $c$M1-FIG-072$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-FIG-CLAS-EXCLUYE$c$, $c$REM-FIG-CLAS-ORIENTA$c$, $c$REM-FIG-CLAS-REGULAR$c$, $c$REM-FIG-CLAS-CRITERIOS$c$, $c$REM-FIG-CLAS-PARALELOS$c$, $c$REM-FIG-CLAS-NOMBRE$c$, $c$REM-FIG-ELEM-ALTLADO$c$, $c$REM-FIG-ELEM-ALTVERTICAL$c$, $c$REM-FIG-ELEM-ALTDENTRO$c$, $c$REM-FIG-ELEM-ALTMEDIANA$c$, $c$REM-FIG-ELEM-APORADIO$c$, $c$REM-FIG-ELEM-DIAGLADOS$c$, $c$REM-FIG-ELEM-DIAGDOBLE$c$, $c$REM-FIG-ELEM-DIAGUNO$c$, $c$REM-PER-POL-AREA$c$, $c$REM-PER-POL-SOLODATOS$c$, $c$REM-PER-POL-INTERIOR$c$, $c$REM-PER-POL-DOSLADOS$c$, $c$REM-PER-POL-ALTURA$c$, $c$REM-PER-POL-RESTA$c$, $c$REM-PER-POL-FALTAN$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-GEO-FIG-01$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-FIG-001$c$, $c$M1-FIG-002$c$, $c$M1-FIG-003$c$, $c$M1-FIG-004$c$, $c$M1-FIG-005$c$, $c$M1-FIG-006$c$, $c$M1-FIG-007$c$, $c$M1-FIG-008$c$, $c$M1-FIG-009$c$, $c$M1-FIG-010$c$, $c$M1-FIG-011$c$, $c$M1-FIG-012$c$, $c$M1-FIG-013$c$, $c$M1-FIG-014$c$, $c$M1-FIG-015$c$, $c$M1-FIG-016$c$, $c$M1-FIG-017$c$, $c$M1-FIG-018$c$, $c$M1-FIG-019$c$, $c$M1-FIG-020$c$, $c$M1-FIG-021$c$, $c$M1-FIG-022$c$, $c$M1-FIG-023$c$, $c$M1-FIG-024$c$, $c$M1-FIG-025$c$, $c$M1-FIG-026$c$, $c$M1-FIG-027$c$, $c$M1-FIG-028$c$, $c$M1-FIG-029$c$, $c$M1-FIG-030$c$, $c$M1-FIG-031$c$, $c$M1-FIG-032$c$, $c$M1-FIG-033$c$, $c$M1-FIG-034$c$, $c$M1-FIG-035$c$, $c$M1-FIG-036$c$, $c$M1-FIG-037$c$, $c$M1-FIG-038$c$, $c$M1-FIG-039$c$, $c$M1-FIG-040$c$, $c$M1-FIG-041$c$, $c$M1-FIG-042$c$, $c$M1-FIG-043$c$, $c$M1-FIG-044$c$, $c$M1-FIG-045$c$, $c$M1-FIG-046$c$, $c$M1-FIG-047$c$, $c$M1-FIG-048$c$, $c$M1-FIG-049$c$, $c$M1-FIG-050$c$, $c$M1-FIG-051$c$, $c$M1-FIG-052$c$, $c$M1-FIG-053$c$, $c$M1-FIG-054$c$, $c$M1-FIG-055$c$, $c$M1-FIG-056$c$, $c$M1-FIG-057$c$, $c$M1-FIG-058$c$, $c$M1-FIG-059$c$, $c$M1-FIG-060$c$, $c$M1-FIG-061$c$, $c$M1-FIG-062$c$, $c$M1-FIG-063$c$, $c$M1-FIG-064$c$, $c$M1-FIG-065$c$, $c$M1-FIG-066$c$, $c$M1-FIG-067$c$, $c$M1-FIG-068$c$, $c$M1-FIG-069$c$, $c$M1-FIG-070$c$, $c$M1-FIG-071$c$, $c$M1-FIG-072$c$) group by 1;
