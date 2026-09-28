-- =====================================================================
-- Catálogo de misconceptions — unidad EST-DAT
-- Generado por cargar_misconceptions.py desde EST-DAT.yaml
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
  ($c$DAT-VAR-NUMERO$c$, $c$Cree que toda variable con valores numéricos es cuantitativa$c$, $c$Clasifica por la forma de la respuesta y no por lo que mide: el número de camiseta, el RUT, el código postal o una categoría codificada con 1, 2, 3 le parecen cuantitativos porque "son números". Es la misconception central del nodo. La prueba es si tiene sentido sumarlos o promediarlos.$c$, $c$número de camiseta: cuantitativa$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-ORDINAL$c$, $c$Cree que una variable con categorías ordenadas es cuantitativa$c$, $c$Confunde "se puede ordenar" con "es una cantidad": la talla (S, M, L), el nivel de inglés o el nivel de satisfacción le parecen cuantitativos. Se separa de NUMERO con categorías ordenadas escritas con palabras.$c$, $c$nivel de inglés (básico, intermedio, avanzado): cuantitativa$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-ENTERO$c$, $c$Decide discreta o continua según si se anotó con decimales$c$, $c$Mira cómo se registró el dato y no qué se mide: la estatura anotada en centímetros enteros le parece discreta, porque "no tiene decimales". Continua quiere decir que la magnitud puede tomar cualquier valor de un intervalo, aunque se redondee al anotarla.$c$, $c$estatura en cm enteros: discreta$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-CANTIDAD$c$, $c$Cree que toda "cantidad de" es discreta$c$, $c$Se guía por la palabra: "cantidad de lluvia", "cantidad de agua" o "cantidad de harina" le parecen discretas porque "se cuentan". Confunde cantidad (medir) con cantidad de objetos (contar). Se separa de ENTERO con una medición anotada con decimales.$c$, $c$cantidad de lluvia caída (mm): discreta$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-DISCATEG$c$, $c$Aplica discreta o continua a variables cualitativas$c$, $c$Cree que discreta significa "con categorías separadas" y la usa para variables cualitativas: el color de ojos o la comuna son "discretas". Discreta y continua son tipos de variable cuantitativa.$c$, $c$color de ojos: variable discreta$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-POBLACION$c$, $c$Confunde la variable con los individuos que se estudian$c$, $c$Responde "los 30 estudiantes" o "los 50 árboles" cuando se pregunta cuál es la variable. La variable es la característica que se registra de cada individuo, no los individuos ni cuántos son.$c$, $c$encuesta a 30 estudiantes: la variable son los 30 estudiantes$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-VALOR$c$, $c$Confunde la variable con uno de sus valores$c$, $c$Nombra como variable una respuesta concreta ("el fútbol", "2 autos", "165 cm"), casi siempre la más repetida. Se separa de POBLACION porque sí mira la característica, pero se queda en un valor.$c$, $c$la variable es «fútbol»$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$DAT-VAR-FRECUENCIA$c$, $c$Confunde la variable con cuántos individuos tienen cada valor$c$, $c$Cree que lo que se estudia es el conteo: "la variable es cuántos estudiantes prefieren cada deporte". Mezcla la variable con su frecuencia. Es el paso previo a TAB-ABS-COLUMNA.$c$, $c$la variable es cuántos estudiantes eligen cada deporte$c$, $c$EST$c$, $c$EST-DAT-VAR$c$, $c$hipotesis$c$),
  ($c$TAB-ABS-COLUMNA$c$, $c$Lee el valor de la variable como si fuera la frecuencia$c$, $c$Confunde las dos columnas: a "¿cuántos estudiantes tienen 2 hermanos?" responde 2, y a "¿cuál es el valor más frecuente?" responde la mayor frecuencia. Es la misconception central del nodo.$c$, $c$¿cuántos tienen 2 hermanos? → 2$c$, $c$EST$c$, $c$EST-TAB-ABS$c$, $c$hipotesis$c$),
  ($c$TAB-ABS-FILAS$c$, $c$Cuenta las filas para saber cuántos datos hay$c$, $c$Da como total de datos el número de valores distintos (filas de la tabla) en vez de sumar las frecuencias: una tabla de 5 filas "tiene 5 datos".$c$, $c$tabla con valores 0 a 4: n = 5$c$, $c$EST$c$, $c$EST-TAB-ABS$c$, $c$hipotesis$c$),
  ($c$TAB-ABS-SUMAX$c$, $c$Suma los valores de la variable sin sus frecuencias$c$, $c$Suma la columna de la variable (0 + 1 + 2 + 3 + 4) para obtener el total de datos o el total de la variable, sin mirar cuántas veces se repite cada valor.$c$, $c$hermanos 0, 1, 2, 3, 4: total 10$c$, $c$EST$c$, $c$EST-TAB-ABS$c$, $c$hipotesis$c$),
  ($c$TAB-ABS-SUMAF$c$, $c$Confunde cuántos datos hay con cuánto suman$c$, $c$Cuando piden el total de la variable (total de goles) da la cantidad de datos (partidos), y al revés: cuando piden cuántos datos hay, calcula la suma de valor por frecuencia. También lee "frecuencia 6 del valor 2" como "12 en total".$c$, $c$¿cuántos goles en total? → cantidad de partidos$c$, $c$EST$c$, $c$EST-TAB-ABS$c$, $c$hipotesis$c$),
  ($c$TAB-ABS-LIMITE$c$, $c$Ubica un dato en el borde de un intervalo en el intervalo equivocado$c$, $c$Con datos agrupados en intervalos [a, b), pone un dato igual a b dentro de [a, b) o deja fuera un dato igual a a. No lee si el extremo es cerrado o abierto.$c$, $c$20 minutos en [10, 20)$c$, $c$EST$c$, $c$EST-TAB-ABS$c$, $c$hipotesis$c$),
  ($c$TAB-ACUM-BORDE$c$, $c$Confunde "menos de" con "a lo sumo" y "más de" con "al menos"$c$, $c$No distingue si el valor del borde entra: "menos de 3" lo cuenta con el 3, "al menos 2" lo deja fuera. Es la misconception central del nodo.$c$, $c$menos de 3 libros → F(3)$c$, $c$EST$c$, $c$EST-TAB-ACUM$c$, $c$hipotesis$c$),
  ($c$TAB-ACUM-SOLOF$c$, $c$Responde con la frecuencia absoluta cuando se pide la acumulada$c$, $c$A "¿cuántos leyeron a lo sumo 2 libros?" responde f(2), solo los que leyeron exactamente 2. No acumula.$c$, $c$a lo sumo 2 → f(2)$c$, $c$EST$c$, $c$EST-TAB-ACUM$c$, $c$hipotesis$c$),
  ($c$TAB-ACUM-COMPLEMENTO$c$, $c$Usa la acumulada directamente para "más de" o "al menos"$c$, $c$Para "más de k" responde F(k), que cuenta los de abajo, en vez de n − F(k). Sabe leer la acumulada pero no que acumula hacia abajo.$c$, $c$más de 2 libros → F(2)$c$, $c$EST$c$, $c$EST-TAB-ACUM$c$, $c$hipotesis$c$),
  ($c$TAB-ACUM-FCOMOF$c$, $c$Lee la frecuencia acumulada como si fuera la absoluta$c$, $c$Con una tabla de F, a "¿cuántos tienen exactamente 17 años?" responde F(17) en vez de F(17) − F(16). También suma la columna F para obtener el total.$c$, $c$exactamente 17 años → F(17)$c$, $c$EST$c$, $c$EST-TAB-ACUM$c$, $c$hipotesis$c$),
  ($c$TAB-ACUM-PAR$c$, $c$Acumula solo la fila anterior$c$, $c$Construye F sumando la frecuencia de la fila con la de la fila anterior (f_i + f_{i−1}) en vez de sumar todas las anteriores. Acierta en las dos primeras filas, por eso los ítems preguntan de la tercera en adelante.$c$, $c$F(3) = f(3) + f(2)$c$, $c$EST$c$, $c$EST-TAB-ACUM$c$, $c$hipotesis$c$)
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
  select count(*) into c from misconceptions where code in ($c$DAT-VAR-NUMERO$c$, $c$DAT-VAR-ORDINAL$c$, $c$DAT-VAR-ENTERO$c$, $c$DAT-VAR-CANTIDAD$c$, $c$DAT-VAR-DISCATEG$c$, $c$DAT-VAR-POBLACION$c$, $c$DAT-VAR-VALOR$c$, $c$DAT-VAR-FRECUENCIA$c$, $c$TAB-ABS-COLUMNA$c$, $c$TAB-ABS-FILAS$c$, $c$TAB-ABS-SUMAX$c$, $c$TAB-ABS-SUMAF$c$, $c$TAB-ABS-LIMITE$c$, $c$TAB-ACUM-BORDE$c$, $c$TAB-ACUM-SOLOF$c$, $c$TAB-ACUM-COMPLEMENTO$c$, $c$TAB-ACUM-FCOMOF$c$, $c$TAB-ACUM-PAR$c$);
  if c <> 18 then
    raise exception 'catalogo EST-DAT: se esperaban 18, hay %', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$DAT-VAR-NUMERO$c$, $c$DAT-VAR-ORDINAL$c$, $c$DAT-VAR-ENTERO$c$, $c$DAT-VAR-CANTIDAD$c$, $c$DAT-VAR-DISCATEG$c$, $c$DAT-VAR-POBLACION$c$, $c$DAT-VAR-VALOR$c$, $c$DAT-VAR-FRECUENCIA$c$, $c$TAB-ABS-COLUMNA$c$, $c$TAB-ABS-FILAS$c$, $c$TAB-ABS-SUMAX$c$, $c$TAB-ABS-SUMAF$c$, $c$TAB-ABS-LIMITE$c$, $c$TAB-ACUM-BORDE$c$, $c$TAB-ACUM-SOLOF$c$, $c$TAB-ACUM-COMPLEMENTO$c$, $c$TAB-ACUM-FCOMOF$c$, $c$TAB-ACUM-PAR$c$) and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$DAT-VAR-NUMERO$c$, $c$DAT-VAR-ORDINAL$c$, $c$DAT-VAR-ENTERO$c$, $c$DAT-VAR-CANTIDAD$c$, $c$DAT-VAR-DISCATEG$c$, $c$DAT-VAR-POBLACION$c$, $c$DAT-VAR-VALOR$c$, $c$DAT-VAR-FRECUENCIA$c$, $c$TAB-ABS-COLUMNA$c$, $c$TAB-ABS-FILAS$c$, $c$TAB-ABS-SUMAX$c$, $c$TAB-ABS-SUMAF$c$, $c$TAB-ABS-LIMITE$c$, $c$TAB-ACUM-BORDE$c$, $c$TAB-ACUM-SOLOF$c$, $c$TAB-ACUM-COMPLEMENTO$c$, $c$TAB-ACUM-FCOMOF$c$, $c$TAB-ACUM-PAR$c$) and (example is null or example = '');
  if c <> 0 then
    raise exception '% errores sin example', c; end if;
end
$verif$;

-- 18 misconceptions en EST-DAT (18 hipotesis).
