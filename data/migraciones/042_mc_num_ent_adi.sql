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
  ($c$ENT-ADI-VARORDEN$c$, $c$Calcula la variación como inicial menos final$c$, $c$Invierte el orden de la resta al calcular una variación o un cambio: hace inicial - final en vez de final - inicial. Acierta el tamaño y falla el signo, así que una subida queda como bajada. Solo aparece en ítems de variación.$c$, $c$de -3 °C a 5 °C: variación -8$c$, $c$NUM$c$, $c$NUM-ENT-ADI$c$, $c$docente$c$)
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
  select count(*) into c from misconceptions where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$);
  if c <> 14 then
    raise exception 'catalogo NUM-ENT: se esperaban 14, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-RESTAGRUPA$c$, $c$ENT-ADI-VARORDEN$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 14 misconceptions en NUM-ENT (13 docente, 1 hipotesis).
