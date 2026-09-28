-- =====================================================================
-- Catálogo de misconceptions — unidad GEO-FIG
-- Generado por cargar_misconceptions.py desde GEO-FIG.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- La transaccion la pone quien ejecuta:
--   psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql "$DATABASE_URL"
-- Este archivo NO trae begin/commit a proposito: anidarlos rompe
-- la atomicidad del -1.
-- =====================================================================

insert into misconceptions (code, name, description, example, area_id, node_id, origin)
select v.code, v.name, v.description, v.example, a.id, n.id,
       v.origin::misconception_origin
from (values
  ($c$FIG-CLAS-EXCLUYE$c$, $c$Cree que las clases de figuras no se incluyen unas en otras$c$, $c$Clasifica como si cada figura tuviera un solo nombre: un cuadrado "no es" rectángulo ni rombo, un equilátero "no es" isósceles, un rectángulo "no es" paralelogramo. Es la misconception central del nodo. Se separa de CRITERIOS porque ocurre dentro de un mismo criterio (lados con lados).$c$, $c$un cuadrado no es un rectángulo$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-CLAS-ORIENTA$c$, $c$Clasifica según cómo está dibujada la figura$c$, $c$Cree que la posición cambia la figura: un cuadrado apoyado en un vértice "es un rombo", un triángulo es rectángulo solo si el ángulo recto está abajo, un trapecio necesita sus bases horizontales. Solo aparece con figuras o descripciones de la posición.$c$, $c$un cuadrado girado 45° es un rombo, no un cuadrado$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-CLAS-REGULAR$c$, $c$Cree que basta una condición para que un polígono sea regular$c$, $c$Considera regular un polígono con todos sus lados iguales (el rombo) o con todos sus ángulos iguales (el rectángulo). Regular exige las dos cosas a la vez.$c$, $c$el rombo es un polígono regular$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-CLAS-CRITERIOS$c$, $c$Cree que la clasificación por lados y por ángulos se excluyen$c$, $c$Piensa que un triángulo que ya tiene nombre por sus ángulos no puede tenerlo por sus lados: "si es rectángulo, no puede ser isósceles". Mezcla dos criterios independientes. Se separa de EXCLUYE con el triángulo rectángulo isósceles.$c$, $c$un triángulo rectángulo no puede ser isósceles$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-CLAS-PARALELOS$c$, $c$Confunde cuántos pares de lados paralelos tiene cada cuadrilátero$c$, $c$Mezcla trapecio (un par de lados paralelos), paralelogramo (dos pares) y trapezoide (ninguno): llama trapecio a un paralelogramo, o cree que el rombo tiene un solo par.$c$, $c$un trapecio tiene dos pares de lados paralelos$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-CLAS-NOMBRE$c$, $c$Confunde los nombres de la clasificación$c$, $c$Conoce las categorías pero cambia los nombres: escaleno por isósceles, isósceles por equilátero, trapecio por trapezoide o romboide, hexágono por pentágono u octágono. Error de vocabulario, no de concepto; se mantiene porque la PAES nombra las figuras sin dibujarlas.$c$, $c$un triángulo isósceles tiene sus tres lados iguales$c$, $c$GEO$c$, $c$GEO-FIG-CLAS$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-ALTLADO$c$, $c$Confunde la altura con un lado$c$, $c$Toma como altura un lado del triángulo (el que "sube"), o al revés, no reconoce que en un triángulo rectángulo un cateto es la altura sobre el otro cateto.$c$, $c$la altura desde C es el lado CB$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-ALTVERTICAL$c$, $c$Cree que la altura siempre es vertical$c$, $c$Traza la altura "hacia abajo", en vertical respecto de la hoja, sin mirar el lado: si el lado está inclinado, elige el segmento vertical y no el perpendicular; si el lado es vertical, cree que no hay altura. Es la misconception central del nodo.$c$, $c$la altura desde C es el segmento vertical CV$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-ALTDENTRO$c$, $c$Cree que la altura siempre queda dentro del triángulo$c$, $c$En un triángulo obtusángulo busca la altura adentro y elige un segmento interior; no acepta que el pie caiga en la prolongación del lado.$c$, $c$en un obtusángulo, las tres alturas están adentro$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-ALTMEDIANA$c$, $c$Confunde la altura con la mediana$c$, $c$Cree que la altura llega al punto medio del lado opuesto. Solo es cierto sobre la base de un isósceles, y por eso se refuerza.$c$, $c$la altura desde C llega al punto medio de AB$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-APORADIO$c$, $c$Confunde la apotema con el radio$c$, $c$Llama apotema al segmento del centro a un vértice (el radio), en vez del segmento del centro al punto medio de un lado.$c$, $c$la apotema del hexágono va del centro a un vértice$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-DIAGLADOS$c$, $c$Cuenta los lados como diagonales$c$, $c$Cree que una diagonal une dos vértices cualesquiera, también los consecutivos: un pentágono tendría 10 diagonales y un triángulo 3. Cuenta n(n − 1)/2.$c$, $c$el hexágono tiene 15 diagonales$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-DIAGDOBLE$c$, $c$Cuenta cada diagonal dos veces$c$, $c$Multiplica las diagonales que salen de cada vértice por el número de vértices, n(n − 3), sin notar que cada diagonal se contó desde sus dos extremos.$c$, $c$el hexágono tiene 18 diagonales$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$FIG-ELEM-DIAGUNO$c$, $c$Confunde las diagonales de un vértice con el total$c$, $c$Da como total las diagonales que salen de un solo vértice (n − 3), o al revés, da el total cuando se preguntan las de un vértice.$c$, $c$el hexágono tiene 3 diagonales$c$, $c$GEO$c$, $c$GEO-FIG-ELEM$c$, $c$hipotesis$c$),
  ($c$PER-POL-AREA$c$, $c$Confunde perímetro con área$c$, $c$Multiplica medidas cuando se pide el perímetro (largo por ancho, lado por lado, base por altura). Es la misconception central del nodo.$c$, $c$perímetro de un rectángulo de 8 por 5: 40$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-SOLODATOS$c$, $c$Suma solo las medidas que están escritas$c$, $c$Suma los números de la figura y no los lados: si un hexágono regular tiene un lado rotulado, su perímetro "es 7"; si faltan medidas en una figura en L, las omite.$c$, $c$hexágono regular con un lado de 7 cm: perímetro 7 cm$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-INTERIOR$c$, $c$Suma segmentos interiores al unir figuras$c$, $c$Al unir dos figuras suma sus perímetros completos, incluido el lado que quedó adentro; o al cortar una figura, reparte el perímetro sin agregar el nuevo borde.$c$, $c$dos rectángulos unidos: perímetro = suma de los dos perímetros$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-DOSLADOS$c$, $c$Calcula el perímetro del rectángulo como largo más ancho$c$, $c$Suma cada medida distinta una sola vez: el perímetro de un rectángulo de 8 por 5 le da 13, la mitad del real. En despejes, divide o resta como si el perímetro fueran dos lados.$c$, $c$rectángulo de 8 por 5: perímetro 13$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-ALTURA$c$, $c$Suma al perímetro segmentos que no son lados$c$, $c$Incluye la altura, una diagonal o un segmento interior dibujado en la figura como si fuera parte del borde.$c$, $c$triángulo 13, 14, 15 con altura 12: perímetro 54$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-RESTA$c$, $c$Calcula mal un lado que no está rotulado$c$, $c$Para encontrar un lado desconocido opera mal: suma dos medidas donde hay que restarlas (en una figura en L o en U), o resta el lado conocido del perímetro sin repartir el resto entre los lados que faltan.$c$, $c$perímetro 30, un lado de 12 y dos iguales: cada uno 18$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$),
  ($c$PER-POL-FALTAN$c$, $c$Cree que no se puede calcular si falta alguna medida escrita$c$, $c$Si no están rotulados todos los lados, concluye que el perímetro no se puede calcular, aunque los que faltan se deduzcan (lados iguales marcados, escaleras, figuras en L).$c$, $c$figura en escalera sin medidas en los escalones: no se puede$c$, $c$GEO$c$, $c$GEO-PER-POL$c$, $c$hipotesis$c$)
) as v(code, name, description, example, area_code, node_code, origin)
left join areas a on a.code = v.area_code
join nodes n      on n.code = v.node_code
on conflict (code) do update
  set name        = excluded.name,
      description = excluded.description,
      example     = excluded.example,
      node_id     = excluded.node_id,
      origin      = excluded.origin;

-- Verificación. Si algo no cuadra, revienta y no commitea. ----------
do $verif$
declare c integer;
begin
  select count(*) into c from misconceptions where code in ($c$FIG-CLAS-EXCLUYE$c$, $c$FIG-CLAS-ORIENTA$c$, $c$FIG-CLAS-REGULAR$c$, $c$FIG-CLAS-CRITERIOS$c$, $c$FIG-CLAS-PARALELOS$c$, $c$FIG-CLAS-NOMBRE$c$, $c$FIG-ELEM-ALTLADO$c$, $c$FIG-ELEM-ALTVERTICAL$c$, $c$FIG-ELEM-ALTDENTRO$c$, $c$FIG-ELEM-ALTMEDIANA$c$, $c$FIG-ELEM-APORADIO$c$, $c$FIG-ELEM-DIAGLADOS$c$, $c$FIG-ELEM-DIAGDOBLE$c$, $c$FIG-ELEM-DIAGUNO$c$, $c$PER-POL-AREA$c$, $c$PER-POL-SOLODATOS$c$, $c$PER-POL-INTERIOR$c$, $c$PER-POL-DOSLADOS$c$, $c$PER-POL-ALTURA$c$, $c$PER-POL-RESTA$c$, $c$PER-POL-FALTAN$c$);
  if c <> 21 then
    raise exception 'catalogo GEO-FIG: se esperaban 21, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$FIG-CLAS-EXCLUYE$c$, $c$FIG-CLAS-ORIENTA$c$, $c$FIG-CLAS-REGULAR$c$, $c$FIG-CLAS-CRITERIOS$c$, $c$FIG-CLAS-PARALELOS$c$, $c$FIG-CLAS-NOMBRE$c$, $c$FIG-ELEM-ALTLADO$c$, $c$FIG-ELEM-ALTVERTICAL$c$, $c$FIG-ELEM-ALTDENTRO$c$, $c$FIG-ELEM-ALTMEDIANA$c$, $c$FIG-ELEM-APORADIO$c$, $c$FIG-ELEM-DIAGLADOS$c$, $c$FIG-ELEM-DIAGDOBLE$c$, $c$FIG-ELEM-DIAGUNO$c$, $c$PER-POL-AREA$c$, $c$PER-POL-SOLODATOS$c$, $c$PER-POL-INTERIOR$c$, $c$PER-POL-DOSLADOS$c$, $c$PER-POL-ALTURA$c$, $c$PER-POL-RESTA$c$, $c$PER-POL-FALTAN$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$FIG-CLAS-EXCLUYE$c$, $c$FIG-CLAS-ORIENTA$c$, $c$FIG-CLAS-REGULAR$c$, $c$FIG-CLAS-CRITERIOS$c$, $c$FIG-CLAS-PARALELOS$c$, $c$FIG-CLAS-NOMBRE$c$, $c$FIG-ELEM-ALTLADO$c$, $c$FIG-ELEM-ALTVERTICAL$c$, $c$FIG-ELEM-ALTDENTRO$c$, $c$FIG-ELEM-ALTMEDIANA$c$, $c$FIG-ELEM-APORADIO$c$, $c$FIG-ELEM-DIAGLADOS$c$, $c$FIG-ELEM-DIAGDOBLE$c$, $c$FIG-ELEM-DIAGUNO$c$, $c$PER-POL-AREA$c$, $c$PER-POL-SOLODATOS$c$, $c$PER-POL-INTERIOR$c$, $c$PER-POL-DOSLADOS$c$, $c$PER-POL-ALTURA$c$, $c$PER-POL-RESTA$c$, $c$PER-POL-FALTAN$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 21 misconceptions en GEO-FIG (21 hipotesis).
