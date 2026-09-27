-- =====================================================================
-- Catálogo de misconceptions — unidad NUM-ENT
-- Generado por cargar_misconceptions.py desde NUM-ENT.yaml
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
  ($c$ENT-REC-MAGN$c$, $c$Compara negativos por su magnitud$c$, $c$Entre dos negativos elige como mayor el de mayor número "visible". Traslada el orden de los naturales a los negativos sin invertirlo: como 7 > 3, concluye que -7 > -3. Es el error central del nodo y debe aparecer como distractor en la mayoría de los ítems de comparación.$c$, $c$-7 > -3$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-SINSIGNO$c$, $c$Ignora el signo al comparar negativo con positivo$c$, $c$Compara un negativo con un positivo mirando solo los dígitos. Se registra separado de ENT-REC-MAGN a propósito: MAGN ocurre entre dos negativos y este cruza el cero. Un estudiante puede ordenar bien -7 < -3 y aun así decir que -8 > 5.$c$, $c$-8 > 5$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-CERO$c$, $c$Cree que 0 es el menor de los enteros$c$, $c$Arrastra la idea de los naturales de que el 0 es el piso: "no hay nada menos que cero". Ubica los negativos por encima del 0 o los trata como mayores que él.$c$, $c$0 < -2$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-SUCESOR$c$, $c$Invierte antecesor y sucesor con negativos$c$, $c$Para el sucesor de un negativo se aleja del 0 en vez de moverse a la derecha. Usa "sucesor = el número que sigue al leer" (4, 5, 6...) y lo aplica a la magnitud. Con positivos no se nota, solo aparece con negativos.$c$, $c$sucesor de -4 = -5$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-ESCALA$c$, $c$Lee cada marca de la recta como una unidad$c$, $c$En una recta cuya escala no es 1 (de 2 en 2, de 5 en 5), cuenta marcas en vez de leer su valor: asigna 1, 2, 3... a las marcas sucesivas aunque cada una valga más. Sin observación en aula; se mantiene porque la PAES usa rectas con escala.$c$, $c$escala de 2 en 2 desde 0: lee la 3ª marca como 3 (vale 6)$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$hipotesis$c$),
  ($c$ENT-REC-CONTEO$c$, $c$Cuenta el punto de partida al medir en la recta$c$, $c$Al contar cuántas unidades hay entre dos enteros cuenta los números (incluyendo el de partida) en vez de los saltos. Da siempre una unidad de más. Es más frecuente cuando el recorrido cruza el cero.$c$, $c$de -2 a 3 cuenta 6 unidades (son 5)$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-CTXSIGNO$c$, $c$Asigna mal el signo en un contexto$c$, $c$Traduce mal una situación a entero: "bajo el nivel del mar", "bajo cero", "deuda" o "retroceso" quedan como positivos. Después compara bien, pero sobre números con el signo equivocado.$c$, $c$5 m bajo el nivel del mar = +5$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-REC-DIRECCION$c$, $c$Invierte izquierda y derecha al moverse en la recta$c$, $c$Al desplazarse en la recta se mueve hacia el lado contrario: trata "a la izquierda" como aumentar. A diferencia de ENT-REC-SUCESOR, ocurre también con puros positivos ("3 a la izquierda de 5" = 8), y a diferencia de ENT-REC-SINSIGNO no tiene que ver con comparar sino con moverse. Con negativos y sucesor/antecesor da la misma respuesta que SUCESOR; los ítems que buscan distinguirlos usan desplazamientos, no sucesores.$c$, $c$3 unidades a la izquierda de 1 = 4$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$),
  ($c$ENT-ADI-REGLAMUL$c$, $c$Aplica la regla de signos de la multiplicación a la suma$c$, $c$Lleva "menos con menos da más" a la suma y la resta: dos negativos que se suman o un negativo al que se le resta un positivo le dan resultado positivo. Es el único error del nodo que produce un positivo a partir de dos cantidades negativas, y se vuelve más frecuente después de ver ENT-MUL.$c$, $c$-3 - 5 = 8$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ADI-MAGNOP$c$, $c$Decide sumar o restar por el símbolo de la operación$c$, $c$Mira el símbolo de la operación y no los signos de los números: si ve "+" suma los tamaños, si ve "-" los resta, y deja el signo del negativo que aparece. Se separa de ENT-ADI-INVIERTE con -7 + 3 (MAGNOP da -10, INVIERTE da 4) y de ENT-ADI-DOBLENEG con 5 - (-3) (MAGNOP da -2, DOBLENEG da 2). En 3 - 7, sin negativos a la vista, coincide con INVIERTE: ahí se etiqueta INVIERTE. En una cadena a - b + c con a < b coincide con ENT-ADI-RESTAGRUPA: esos ítems no usan las dos.$c$, $c$-7 + 3 = -10$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ADI-INVIERTE$c$, $c$Resta el mayor menos el menor y deja el resultado positivo$c$, $c$Arrastra de los naturales que "no se puede quitar 7 a 3": da vuelta la resta como si fuera conmutativa y el resultado queda positivo. También aparece en sumas con signos distintos, donde resta bien los tamaños pero no pone el signo del que tiene mayor tamaño.$c$, $c$3 - 7 = 4$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ADI-DOBLENEG$c$, $c$Ignora que está restando un negativo$c$, $c$Lee a - (-b) como a - b: el signo del número que se resta desaparece y no se transforma en suma. Un estudiante con solo este error resuelve bien -7 + 3; falla únicamente cuando se resta un negativo, incluidas las diferencias en contexto que cruzan el cero (máxima 4, mínima -6: da 2).$c$, $c$5 - (-3) = 2$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ADI-RESTAGRUPA$c$, $c$Aplica el signo menos a todo lo que viene después$c$, $c$En una cadena de sumas y restas trata el primer "-" como si encerrara el resto entre paréntesis: 10 - 3 + 2 lo calcula como 10 - (3 + 2). Solo aparece con tres o más términos. Borde con ENT-PRIOR: se queda en ADI porque la cadena es solo de sumas y restas.$c$, $c$10 - 3 + 2 = 5$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ADI-VARORDEN$c$, $c$Calcula la variación como inicial menos final$c$, $c$Invierte el orden de la resta al calcular una variación o un cambio: hace inicial - final en vez de final - inicial. Acierta el tamaño y falla el signo, así que una subida queda como bajada. Solo aparece en ítems de variación.$c$, $c$de -3 °C a 5 °C: variación -8$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$),
  ($c$ENT-ABS-CAMBIA$c$, $c$Cree que el valor absoluto cambia el signo$c$, $c$Generaliza el ejemplo |-3| = 3 como "el valor absoluto le cambia el signo al número" y lo aplica también a los positivos: |5| = -5. Con negativos acierta, así que solo se ve con positivos. En |x| = a se queda con x = -a. Se separa de ENT-ABS-PARENT con |5| (CAMBIA da -5, PARENT da 5).$c$, $c$|5| = -5$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-PARENT$c$, $c$Lee las barras como si fueran paréntesis$c$, $c$Las barras no le hacen nada al número: |-5| = -5. Al comparar valores absolutos compara los números mismos (|-8| < |5| porque -8 < 5), y en |x| <= a acepta todos los enteros menores o iguales que a. Con positivos acierta, así que solo se ve con negativos.$c$, $c$|-5| = -5$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-SIGNOFUERA$c$, $c$Cree que las barras también borran el signo de afuera$c$, $c$Aprende que "el valor absoluto siempre es positivo" y lo extiende al signo menos que está fuera de las barras: -|-6| = 6 y -|4| = 4. Se separa de ENT-ABS-CAMBIA y ENT-ABS-PARENT con -|4|: las dos dan -4 y SIGNOFUERA da 4.$c$, $c$-|-6| = 6$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-UNASOL$c$, $c$Considera solo el lado positivo del 0$c$, $c$Lee |x| como "el número sin signo" y al devolverse se queda solo con los no negativos: |x| = 5 tiene solo la solución 5, y los enteros con |x| <= 3 son 0, 1, 2 y 3. Olvida que a la misma distancia del 0 hay un número a cada lado. Coincide con ENT-ABS-PARENT en |x| = a con a > 0; se separa en |x| <= a (PARENT acepta infinitos).$c$, $c$|x| = 5  =>  x = 5$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-NEGSOL$c$, $c$Busca números cuyo valor absoluto sea negativo$c$, $c$Busca los números que cumplen |x| = -4 igual que si fuera |x| = 4 y responde 4 y -4, sin notar que una distancia no puede ser negativa. Solo se ve cuando el valor absoluto se iguala o se compara con un negativo; con a > 0 no falla.$c$, $c$|x| = -4  =>  x = 4 o x = -4$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-DISTTAM$c$, $c$Calcula la distancia restando las distancias al 0$c$, $c$Para la distancia entre dos enteros resta sus valores absolutos, sin mirar si están al mismo lado del 0. Acierta cuando están al mismo lado (-3 y -8: 5) y falla cuando el 0 queda entre ellos (-3 y 5: da 2, son 8). En el cálculo 5 - (-3) coincide con ENT-ADI-DOBLENEG: los ítems de este nodo no escriben esa resta.$c$, $c$distancia entre -3 y 5 = 2$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-SALTOS$c$, $c$Cuenta la distancia en vez de los enteros$c$, $c$Para contar los enteros con |x| <= a mide cuánto hay del menor al mayor (2a) en vez de contar los números (2a + 1): pierde uno, que suele ser el 0. Es el error inverso de ENT-REC-CONTEO, que cuenta números cuando debería contar saltos. Solo aparece en ítems de conteo.$c$, $c$enteros con |x| <= 3: cuenta 6 (son 7)$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-DISTRIB$c$, $c$Saca el valor absoluto de cada término por separado$c$, $c$Trata las barras como un factor que se reparte: |a - b| lo calcula como |a| - |b| y |a + b| como |a| + |b|, conservando la operación de adentro. Puede dar un resultado negativo (|3 - 8| = -5) o uno demasiado grande (|-9 + 2| = 11). Se separa de ENT-ABS-PARENT con |-2 - 6| (DISTRIB da -4, PARENT da -8) y de ENT-ABS-QUITASIGNO con |3 - 8| (DISTRIB da -5, QUITASIGNO da 11).$c$, $c$|3 - 8| = |3| - |8| = -5$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$),
  ($c$ENT-ABS-QUITASIGNO$c$, $c$Borra todos los signos de adentro y suma$c$, $c$Lee "el valor absoluto deja todo positivo" como "borra todos los signos menos que hay adentro", incluido el de la operación: |3 - 8| queda 3 + 8 = 11 y |b - a| queda b + a. Acierta cuando los dos términos ya se alejaban del 0 hacia el mismo lado (|-2 - 6| = 8), así que solo se ve cuando adentro hay una resta que acerca al 0.$c$, $c$|3 - 8| = 3 + 8 = 11$c$, $c$NUM$c$, $c$NUM-ENT-ABS$c$, $c$docente$c$)
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
  select count(*) into c from misconceptions where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$, $c$ENT-ABS-CAMBIA$c$, $c$ENT-ABS-PARENT$c$, $c$ENT-ABS-SIGNOFUERA$c$, $c$ENT-ABS-UNASOL$c$, $c$ENT-ABS-NEGSOL$c$, $c$ENT-ABS-DISTTAM$c$, $c$ENT-ABS-SALTOS$c$, $c$ENT-ABS-DISTRIB$c$, $c$ENT-ABS-QUITASIGNO$c$);
  if c <> 23 then
    raise exception 'catalogo NUM-ENT: se esperaban 23, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$, $c$ENT-ABS-CAMBIA$c$, $c$ENT-ABS-PARENT$c$, $c$ENT-ABS-SIGNOFUERA$c$, $c$ENT-ABS-UNASOL$c$, $c$ENT-ABS-NEGSOL$c$, $c$ENT-ABS-DISTTAM$c$, $c$ENT-ABS-SALTOS$c$, $c$ENT-ABS-DISTRIB$c$, $c$ENT-ABS-QUITASIGNO$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$, $c$ENT-ABS-CAMBIA$c$, $c$ENT-ABS-PARENT$c$, $c$ENT-ABS-SIGNOFUERA$c$, $c$ENT-ABS-UNASOL$c$, $c$ENT-ABS-NEGSOL$c$, $c$ENT-ABS-DISTTAM$c$, $c$ENT-ABS-SALTOS$c$, $c$ENT-ABS-DISTRIB$c$, $c$ENT-ABS-QUITASIGNO$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 23 misconceptions en NUM-ENT (22 docente, 1 hipotesis).
