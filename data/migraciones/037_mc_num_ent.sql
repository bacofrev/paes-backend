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
  ($c$ENT-REC-DIRECCION$c$, $c$Invierte izquierda y derecha al moverse en la recta$c$, $c$Al desplazarse en la recta se mueve hacia el lado contrario: trata "a la izquierda" como aumentar. A diferencia de ENT-REC-SUCESOR, ocurre también con puros positivos ("3 a la izquierda de 5" = 8), y a diferencia de ENT-REC-SINSIGNO no tiene que ver con comparar sino con moverse. Con negativos y sucesor/antecesor da la misma respuesta que SUCESOR; los ítems que buscan distinguirlos usan desplazamientos, no sucesores.$c$, $c$3 unidades a la izquierda de 1 = 4$c$, $c$NUM$c$, $c$NUM-ENT-REC$c$, $c$docente$c$)
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
  select count(*) into c from misconceptions where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$);
  if c <> 8 then
    raise exception 'catalogo NUM-ENT: se esperaban 8, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-CERO$c$, $c$ENT-REC-SUCESOR$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 8 misconceptions en NUM-ENT (7 docente, 1 hipotesis).
