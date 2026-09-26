-- =====================================================================
-- Catálogo de misconceptions — unidad ALG-EXP
-- Generado por cargar_misconceptions.py desde ALG-EXP.yaml
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
  ($c$EXP-LENG-LINEAL$c$, $c$Traduce palabra por palabra y omite el paréntesis$c$, $c$Escribe los símbolos en el orden en que lee las palabras y cada operación toma solo el término que tiene al lado. "El doble de la suma de a y b" queda 2a + b: el "doble" alcanzó solo a la a. Es la misconception central del nodo. Se separa de SOBREAGRUPA con "la suma del doble de a y b": LINEAL acierta (2a + b) y SOBREAGRUPA escribe 2(a + b).$c$, $c$el doble de la suma de a y b → 2a + b$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-SOBREAGRUPA$c$, $c$Aplica la primera operación a todo lo que sigue$c$, $c$El error contrario a LINEAL: la primera operación que nombra la frase abarca todo el resto, aunque la frase no diga "la suma de" ni "la diferencia de". "El triple de x, disminuido en 4" queda 3(x − 4). Los ítems marcan el agrupamiento con "la suma de" / "la diferencia entre" para que la frase no sea ambigua.$c$, $c$el triple de x, disminuido en 4 → 3(x − 4)$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-ORDENRESTA$c$, $c$Escribe la resta en el orden en que aparecen los términos$c$, $c$Cree que en una resta va primero lo que se nombra primero. Acierta con "x disminuido en 7", pero con "7 menos que x" o "restar 5 de x" escribe 7 − x y 5 − x. En contexto aparece como una resta al revés (lo gastado menos lo que se tenía). Se separa de TIEMPO con "dentro de 5 años": ORDENRESTA acierta.$c$, $c$7 menos que x → 7 − x$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-ADITIVO$c$, $c$Confunde "veces" con "más"$c$, $c$Lee una relación multiplicativa como suma o al revés: "el triple de x" → x + 3, "n cuadernos a p pesos" → n + p, "3 años más" → 3a. No distingue cuántas veces se toma una cantidad de cuánto se le agrega. Se separa de PARTEMUL con "la tercera parte de x": ADITIVO escribe x − 3 y PARTEMUL escribe 3x.$c$, $c$el triple de x → x + 3$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-PARTEMUL$c$, $c$Confunde "parte" con "veces"$c$, $c$Ve el número de la palabra (tercera, mitad, cuádruplo) y no decide si multiplica o divide: "la tercera parte de x" → 3x, "el triple de x" → x/3, "la semisuma" → 2(a + b). Distinto de ADITIVO: acá la operación es multiplicativa pero va en el sentido equivocado.$c$, $c$la tercera parte de x → 3x$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-POTMUL$c$, $c$Confunde doble con cuadrado y triple con cubo$c$, $c$Asocia el número de la palabra con la operación equivocada: "el cuadrado de x" → 2x, "el triple de a" → a³, y leyendo, x² como "el doble de x". La guía MA 10 de Ben empareja a propósito doble y cuadrado, triple y cubo para atacar este error. Se separa de ADITIVO con "el triple de x": POTMUL elige x³ y ADITIVO x + 3.$c$, $c$el cuadrado de x → 2x$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-EXCESO$c$, $c$No reconoce "exceso de a sobre b" como a − b$c$, $c$No sabe qué operación nombra "exceso": lo lee como "más" y escribe a + b, o invierte la resta y escribe b − a. Es vocabulario formal que la PAES usa y que el estudiante no ocupa en su lenguaje cotidiano. Cuando el ítem es de enunciado, su distractor es la suma o la resta invertida, nunca las dos en el mismo ítem.$c$, $c$el exceso de a sobre b → a + b$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-OPUINV$c$, $c$Confunde opuesto con inverso$c$, $c$Las dos palabras "dan vuelta" el número y no distingue cuál es cuál: "el opuesto de x" → 1/x, "el inverso de a" → −a. No tiene el criterio: el opuesto es el que sumado da 0, el inverso es el que multiplicado da 1. Única misconception de los ítems de opuesto e inverso; el signo menos se usa solo como notación, sin operar con negativos (ENT-REC no es ancestro).$c$, $c$el opuesto de x → 1/x$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-JUXTA$c$, $c$Lee 3x como 3 + x$c$, $c$Cree que dos símbolos pegados se suman, como en un número mixto o al leer "3x" como "3 y x". Al pasar de expresión a palabras, "5x + 2" le suena a "x aumentado en 5, más 2". Choca con ADITIVO en la dirección palabras → símbolo, así que se usa solo en ítems de expresión → enunciado o de afirmaciones sobre notación.$c$, $c$5x = x aumentado en 5$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-INVREL$c$, $c$Invierte la relación entre dos cantidades$c$, $c$Pone el multiplicador (o el "más") en la cantidad equivocada: "Pedro tiene el triple que Juan, y Pedro tiene p" → Juan = 3p. Es el error clásico de "hay seis estudiantes por cada profesor" → 6E = P: copia el orden de la frase en vez de preguntarse quién tiene más. Se separa de PARTEMUL porque no aparece la palabra "parte".$c$, $c$Pedro (p) tiene el triple que Juan → Juan = 3p$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-NUEVAVAR$c$, $c$Pone una letra nueva a una cantidad que depende de otra$c$, $c$Le da a cada cantidad su propia incógnita en vez de escribirla en función de la primera: "Ana tiene a años y su hermano 3 más; la suma" → a + b. También en consecutivos (n + m + p). Ninguna otra misconception produce una letra que el enunciado no nombra.$c$, $c$Ana tiene a y Luis 4 más; entre los dos → a + b$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-TIEMPO$c$, $c$Invierte "hace" y "dentro de"$c$, $c$Asocia "hace n años" con sumar (o "dentro de" con restar): la edad hace 5 años queda x + 5. Se separa de ORDENRESTA con "dentro de 5 años", donde ORDENRESTA acierta y TIEMPO resta. En ahorro o cantidades que crecen en el tiempo, aparece como sumar lo que ya pasó en vez de descontarlo.$c$, $c$edad hace 5 años → x + 5$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-TASA$c$, $c$No ajusta la cantidad al número de períodos$c$, $c$Opera las cantidades tal como vienen, sin llevarlas a la misma unidad de tiempo ni multiplicarlas por las veces que ocurren: "gana s por semana y gasta g por día" → s − g. También con cobros por unidad ("t pesos por kilómetro" → t). Solo en ítems con tasas o períodos.$c$, $c$gana s por semana, gasta g por día → ahorra s − g$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-CONSEC$c$, $c$Escribe consecutivos como múltiplos$c$, $c$Lee "primero, segundo, tercero" como factores: tres consecutivos son n, 2n, 3n, y el que sigue a 2n es 3n. No ve que consecutivo es un paso de suma, no de multiplicación. Se separa de PARCONSEC en los pares: CONSEC da 2n, 3n y PARCONSEC 2n, 2n + 1.$c$, $c$tres consecutivos → n, 2n, 3n$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-PARCONSEC$c$, $c$Usa el paso equivocado entre pares o impares consecutivos$c$, $c$Aplica un paso fijo sin mirar qué tipo de número es: avanza de 1 en 1 entre pares o impares (2n, 2n + 1) o de 2 en 2 entre consecutivos cualesquiera (n, n + 2, n + 4). El paso depende de si se cuentan todos los naturales o solo los pares o impares, y el estudiante no lo ajusta.$c$, $c$dos pares consecutivos → 2n, 2n + 1$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-DIGITOS$c$, $c$Escribe un número de dos cifras como la suma de sus cifras$c$, $c$No usa el valor posicional: con d decenas y u unidades escribe d + u, como si cada cifra valiera lo que dice. El 10 que vale cada decena desaparece. Se separa de JUXTA por la dirección: DIGITOS va de palabras a símbolo y JUXTA de símbolo a palabras.$c$, $c$d decenas y u unidades → d + u$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$),
  ($c$EXP-LENG-PATRDIF$c$, $c$Escribe el patrón solo con lo que cambia$c$, $c$Describe cuánto cambia de un paso al siguiente y no cuánto vale en el paso n: "parte con 4 y agrega 3 cada vez" → n + 3. Confunde el aumento con el valor. Solo en ítems de patrón o de cantidades que cambian por paso, y solo en nivel 3 salvo casos directos (decisión del control 1: patrones construidos desde el enunciado, sin comprobar valores, que sería ALG-EXP-VAL).$c$, $c$4, 7, 10, … → n + 3$c$, $c$ALG$c$, $c$ALG-EXP-LENG$c$, $c$docente$c$)
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
  select count(*) into c from misconceptions where code in ($c$EXP-LENG-LINEAL$c$, $c$EXP-LENG-SOBREAGRUPA$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-ADITIVO$c$, $c$EXP-LENG-PARTEMUL$c$, $c$EXP-LENG-POTMUL$c$, $c$EXP-LENG-EXCESO$c$, $c$EXP-LENG-OPUINV$c$, $c$EXP-LENG-JUXTA$c$, $c$EXP-LENG-INVREL$c$, $c$EXP-LENG-NUEVAVAR$c$, $c$EXP-LENG-TIEMPO$c$, $c$EXP-LENG-TASA$c$, $c$EXP-LENG-CONSEC$c$, $c$EXP-LENG-PARCONSEC$c$, $c$EXP-LENG-DIGITOS$c$, $c$EXP-LENG-PATRDIF$c$);
  if c <> 17 then
    raise exception 'catalogo ALG-EXP: se esperaban 17, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$EXP-LENG-LINEAL$c$, $c$EXP-LENG-SOBREAGRUPA$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-ADITIVO$c$, $c$EXP-LENG-PARTEMUL$c$, $c$EXP-LENG-POTMUL$c$, $c$EXP-LENG-EXCESO$c$, $c$EXP-LENG-OPUINV$c$, $c$EXP-LENG-JUXTA$c$, $c$EXP-LENG-INVREL$c$, $c$EXP-LENG-NUEVAVAR$c$, $c$EXP-LENG-TIEMPO$c$, $c$EXP-LENG-TASA$c$, $c$EXP-LENG-CONSEC$c$, $c$EXP-LENG-PARCONSEC$c$, $c$EXP-LENG-DIGITOS$c$, $c$EXP-LENG-PATRDIF$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$EXP-LENG-LINEAL$c$, $c$EXP-LENG-SOBREAGRUPA$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-ADITIVO$c$, $c$EXP-LENG-PARTEMUL$c$, $c$EXP-LENG-POTMUL$c$, $c$EXP-LENG-EXCESO$c$, $c$EXP-LENG-OPUINV$c$, $c$EXP-LENG-JUXTA$c$, $c$EXP-LENG-INVREL$c$, $c$EXP-LENG-NUEVAVAR$c$, $c$EXP-LENG-TIEMPO$c$, $c$EXP-LENG-TASA$c$, $c$EXP-LENG-CONSEC$c$, $c$EXP-LENG-PARCONSEC$c$, $c$EXP-LENG-DIGITOS$c$, $c$EXP-LENG-PATRDIF$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 17 misconceptions en ALG-EXP (17 docente).
