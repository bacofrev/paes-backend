-- =====================================================================
-- LES-NUM-ENT-05 — Divisibilidad, mcm y MCD
-- Generado por cargar_contenido.py desde LES-NUM-ENT-05.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-ENT-097$c$, $c$¿Cuáles son todos los divisores de $18$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-098$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-099$c$, $c$¿Cuál de los siguientes números es divisible por $9$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-100$c$, $c$¿Cuál es la descomposición en factores primos de $60$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-101$c$, $c$¿Cuántos divisores tiene el número $20$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-102$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-103$c$, $c$¿Cuál de los siguientes números es compuesto?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-104$c$, $c$¿Cuáles son los múltiplos de $8$ menores que $40$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-105$c$, $c$Una profesora quiere repartir a sus $24$ estudiantes en grupos que tengan todos la misma cantidad de integrantes, sin que sobre nadie. ¿Cuántas cantidades distintas de integrantes por grupo puede elegir?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-106$c$, $c$Considera las siguientes afirmaciones:

I. El $2$ es el único número primo par.

II. El $1$ es un número primo.

III. Todo número divisible por $3$ es divisible por $9$.

¿Cuál o cuáles son verdaderas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-107$c$, $c$Sean $a$ y $b$ números naturales tales que $a$ es divisor de $b$. ¿Cuál de las siguientes afirmaciones es **siempre** verdadera?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-108$c$, $c$La descomposición en factores primos de un número es $2 \cdot 3 \cdot 3 \cdot 5$. ¿Cuál de los siguientes números **no** es divisor de ese número?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-109$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-110$c$, $c$Javiera dividió $126$ así: $126 \div 2 = 63$, $63 \div 9 = 7$ y $7 \div 7 = 1$. ¿Cuál es la descomposición de $126$ en factores primos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-111$c$, $c$¿Cuál de los siguientes números es divisible por $6$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-112$c$, $c$¿Cuántos múltiplos de $7$ hay entre $1$ y $50$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-113$c$, $c$La descomposición en factores primos de un número $n$ es $2 \cdot 2 \cdot 3 \cdot 7$. ¿Cuántos divisores tiene $n$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-114$c$, $c$Considera los números $1$, $83$ y $87$. ¿Cuál de las siguientes afirmaciones es verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-115$c$, $c$Sea $n$ un número natural que tiene exactamente dos divisores. ¿Cuál de las siguientes afirmaciones es verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-116$c$, $c$Sea $p$ un número primo mayor que $2$. ¿Cuál de las siguientes afirmaciones es **siempre** verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-117$c$, $c$Considera las siguientes afirmaciones:

I. $2.025$ es divisible por $9$.

II. $2.013$ es divisible por $9$.

III. La descomposición en factores primos de $2.025$ es $81 \cdot 25$.

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-118$c$, $c$La descomposición en factores primos de un número es $2 \cdot 3 \cdot 5 \cdot 7$. ¿Cuál de las siguientes afirmaciones es verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-119$c$, $c$¿Cuál de los siguientes números es divisible por $18$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-120$c$, $c$Se sabe que $15$ es divisor de un número natural $n$. ¿Cuál de los siguientes números es **con seguridad** divisor de $n$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-121$c$, $c$¿Cuál es el mínimo común múltiplo de $8$ y $12$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-122$c$, $c$¿Cuál es el máximo común divisor de $12$ y $18$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-123$c$, $c$Un bus pasa por un paradero cada $6$ minutos y otro cada $10$ minutos. Si acaban de pasar juntos, ¿en cuántos minutos volverán a pasar juntos por primera vez?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-124$c$, $c$¿Cuál es el mínimo común múltiplo de $9$ y $15$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-125$c$, $c$¿Cuál de los siguientes números es múltiplo común de $4$ y $6$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-126$c$, $c$¿Cuál es el máximo común divisor de $14$ y $35$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-127$c$, $c$Se tienen $12$ lápices rojos y $20$ azules. Se quiere armar la mayor cantidad posible de estuches iguales, con la misma cantidad de lápices rojos y la misma de azules en cada uno, sin que sobre ninguno. ¿Cuántos estuches se arman?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-128$c$, $c$¿Cuál es el mínimo común múltiplo de $5$ y $7$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-129$c$, $c$Si $20 = 2 \cdot 2 \cdot 5$ y $30 = 2 \cdot 3 \cdot 5$, ¿cuál es el mínimo común múltiplo de $20$ y $30$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-130$c$, $c$Si $24 = 2 \cdot 2 \cdot 2 \cdot 3$ y $36 = 2 \cdot 2 \cdot 3 \cdot 3$, ¿cuál es el máximo común divisor de $24$ y $36$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-131$c$, $c$Tres alarmas suenan cada $4$, $6$ y $9$ minutos. Si acaban de sonar juntas, ¿en cuántos minutos volverán a sonar juntas por primera vez?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-132$c$, $c$Una florista tiene $36$ rosas y $48$ claveles. Quiere armar la mayor cantidad posible de ramos iguales, con la misma cantidad de rosas y la misma de claveles en cada ramo, usando todas las flores. ¿Cuántos ramos arma?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-133$c$, $c$¿Cuál es el mínimo común múltiplo de $9$ y $12$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-134$c$, $c$Considera las siguientes afirmaciones:

I. $\text{mcm}(4, 10) = 40$

II. $\text{MCD}(8, 20) = 4$

III. $\text{mcm}(3, 5) = 15$

¿Cuál o cuáles son verdaderas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-135$c$, $c$Dos luces parpadean: una cada $8$ segundos y otra cada $12$ segundos. Si parpadean juntas a las 20:00:00, ¿a qué hora vuelven a parpadear juntas por primera vez?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-136$c$, $c$¿Cuál es el mínimo común múltiplo de $4$, $6$ y $10$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-137$c$, $c$Dos números naturales $a$ y $b$ cumplen $\text{MCD}(a, b) = 6$ y $\text{mcm}(a, b) = 72$. Si $a = 18$, ¿cuál es el valor de $b$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-138$c$, $c$Camila va a la piscina cada $4$ días y Diego cada $10$ días. Se encontraron en la piscina un lunes. ¿Qué día de la semana volverán a encontrarse por primera vez?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-139$c$, $c$Se quiere embaldosar un patio rectangular de $120$ cm por $180$ cm con baldosas cuadradas iguales, lo más grandes posible, sin cortar ninguna. ¿Cuánto mide el lado de cada baldosa?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-140$c$, $c$Considera las siguientes afirmaciones, para números naturales $a$ y
$b$:

I. $\text{mcm}(a, b)$ siempre es mayor o igual que $a$ y que $b$.

II. $\text{mcm}(a, b)$ siempre es igual a $a \cdot b$.

III. Si $a$ es divisor de $b$, entonces $\text{MCD}(a, b) = a$.

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-141$c$, $c$¿Cuál es el máximo común divisor de $30$, $45$ y $75$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-142$c$, $c$Se sabe que $\text{mcm}(n, 10) = 30$. ¿Cuál de los siguientes números puede ser $n$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-143$c$, $c$Un semáforo cambia de color cada $45$ segundos y otro cada $60$ segundos. Cambian juntos a las 8:00. ¿Cuántas veces vuelven a cambiar juntos después de las 8:00 y hasta las 8:30, incluida esa hora?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-144$c$, $c$Si $a = 2 \cdot 2 \cdot 3 \cdot 5$ y $b = 2 \cdot 3 \cdot 3 \cdot 7$, ¿cuál es el mínimo común múltiplo de $a$ y $b$?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-ENT-097$c$, $c$A$c$, $c$$1, 2, 3, 6, 9, 18$$c$, true, null),
  ($c$M1-ENT-097$c$, $c$B$c$, $c$$2, 3, 6, 9$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-097$c$, $c$C$c$, $c$$18, 36, 54, 72$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-097$c$, $c$D$c$, $c$$2, 3$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-098$c$, $c$A$c$, $c$$56$ es divisor de $8$.$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-098$c$, $c$B$c$, $c$$21$ es un número primo.$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-098$c$, $c$C$c$, $c$$8$ es divisor de $56$.$c$, true, null),
  ($c$M1-ENT-098$c$, $c$D$c$, $c$$1$ es un número primo.$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-099$c$, $c$A$c$, $c$$3$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-099$c$, $c$B$c$, $c$$139$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-099$c$, $c$C$c$, $c$$57$$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-099$c$, $c$D$c$, $c$$477$$c$, true, null),
  ($c$M1-ENT-100$c$, $c$A$c$, $c$$1 \cdot 2 \cdot 2 \cdot 3 \cdot 5$$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-100$c$, $c$B$c$, $c$$2 \cdot 2 \cdot 3 \cdot 5$$c$, true, null),
  ($c$M1-ENT-100$c$, $c$C$c$, $c$$2 \cdot 3 \cdot 5$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-100$c$, $c$D$c$, $c$$4 \cdot 15$$c$, false, $c$ENT-DIVIS-COMPUESTO$c$),
  ($c$M1-ENT-101$c$, $c$A$c$, $c$$6$$c$, true, null),
  ($c$M1-ENT-101$c$, $c$B$c$, $c$$4$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-101$c$, $c$C$c$, $c$$2$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-101$c$, $c$D$c$, $c$Infinitos$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-102$c$, $c$A$c$, $c$$9$ es divisible por $135$.$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-102$c$, $c$B$c$, $c$$53$ es divisible por $3$.$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-102$c$, $c$C$c$, $c$$42$ es divisible por $9$.$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-102$c$, $c$D$c$, $c$$135$ es divisible por $9$.$c$, true, null),
  ($c$M1-ENT-103$c$, $c$A$c$, $c$$2$$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-103$c$, $c$B$c$, $c$$51$$c$, true, null),
  ($c$M1-ENT-103$c$, $c$C$c$, $c$$53$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-103$c$, $c$D$c$, $c$$1$$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-104$c$, $c$A$c$, $c$$1, 2, 4, 8$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-104$c$, $c$B$c$, $c$$8, 18, 28, 38$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-104$c$, $c$C$c$, $c$$8, 16, 24, 32$$c$, true, null),
  ($c$M1-ENT-104$c$, $c$D$c$, $c$$16, 24, 32$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-105$c$, $c$A$c$, $c$$8$$c$, true, null),
  ($c$M1-ENT-105$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-105$c$, $c$C$c$, $c$$6$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-105$c$, $c$D$c$, $c$Infinitas$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-106$c$, $c$A$c$, $c$Solo II$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-106$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-ENT-106$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-106$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-107$c$, $c$A$c$, $c$$a$ es distinto de $b$.$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-107$c$, $c$B$c$, $c$$a$ es múltiplo de $b$.$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-107$c$, $c$C$c$, $c$$a$ es un número primo.$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-107$c$, $c$D$c$, $c$$b$ es múltiplo de $a$.$c$, true, null),
  ($c$M1-ENT-108$c$, $c$A$c$, $c$$6$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-108$c$, $c$B$c$, $c$$90$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-108$c$, $c$C$c$, $c$$4$$c$, true, null),
  ($c$M1-ENT-108$c$, $c$D$c$, $c$$9$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-109$c$, $c$A$c$, $c$Todo número par es divisible por $4$.$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-109$c$, $c$B$c$, $c$El $1$ es el menor número primo.$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-109$c$, $c$C$c$, $c$Todo número impar es primo.$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-109$c$, $c$D$c$, $c$Todo número par mayor que $2$ es compuesto.$c$, true, null),
  ($c$M1-ENT-110$c$, $c$A$c$, $c$$2 \cdot 9 \cdot 7$$c$, false, $c$ENT-DIVIS-COMPUESTO$c$),
  ($c$M1-ENT-110$c$, $c$B$c$, $c$$1 \cdot 2 \cdot 3 \cdot 3 \cdot 7$$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-110$c$, $c$C$c$, $c$$2 \cdot 3 \cdot 3 \cdot 7$$c$, true, null),
  ($c$M1-ENT-110$c$, $c$D$c$, $c$$2 \cdot 3 \cdot 7$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-111$c$, $c$A$c$, $c$$3$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-111$c$, $c$B$c$, $c$$114$$c$, true, null),
  ($c$M1-ENT-111$c$, $c$C$c$, $c$$81$$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-111$c$, $c$D$c$, $c$$76$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-112$c$, $c$A$c$, $c$$7$$c$, true, null),
  ($c$M1-ENT-112$c$, $c$B$c$, $c$$6$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-112$c$, $c$C$c$, $c$$2$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-112$c$, $c$D$c$, $c$$5$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-113$c$, $c$A$c$, $c$$3$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-113$c$, $c$B$c$, $c$$10$$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-113$c$, $c$C$c$, $c$Infinitos$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-113$c$, $c$D$c$, $c$$12$$c$, true, null),
  ($c$M1-ENT-114$c$, $c$A$c$, $c$Solo $87$ es primo.$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-114$c$, $c$B$c$, $c$Solo $83$ es primo.$c$, true, null),
  ($c$M1-ENT-114$c$, $c$C$c$, $c$Los tres son primos.$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-114$c$, $c$D$c$, $c$Solo $1$ y $83$ son primos.$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-115$c$, $c$A$c$, $c$$n$ es un número impar.$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-115$c$, $c$B$c$, $c$Los dos divisores de $n$ son números primos.$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-115$c$, $c$C$c$, $c$$n$ es un número primo.$c$, true, null),
  ($c$M1-ENT-115$c$, $c$D$c$, $c$$n$ puede ser $1$.$c$, false, $c$ENT-DIVIS-UNO$c$),
  ($c$M1-ENT-116$c$, $c$A$c$, $c$$p + 1$ es par.$c$, true, null),
  ($c$M1-ENT-116$c$, $c$B$c$, $c$$p + 2$ es primo.$c$, false, $c$ENT-DIVIS-IMPARPRIMO$c$),
  ($c$M1-ENT-116$c$, $c$C$c$, $c$Todos los divisores de $p + 1$ son primos.$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-116$c$, $c$D$c$, $c$$p$ no tiene divisores.$c$, false, $c$ENT-DIVIS-EXTREMOS$c$),
  ($c$M1-ENT-117$c$, $c$A$c$, $c$Solo I y III$c$, false, $c$ENT-DIVIS-COMPUESTO$c$),
  ($c$M1-ENT-117$c$, $c$B$c$, $c$Solo I$c$, true, null),
  ($c$M1-ENT-117$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-117$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-118$c$, $c$A$c$, $c$Sus únicos divisores son $2$, $3$, $5$ y $7$.$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-118$c$, $c$B$c$, $c$Su descomposición en factores primos también puede escribirse como $6 \cdot 35$.$c$, false, $c$ENT-DIVIS-COMPUESTO$c$),
  ($c$M1-ENT-118$c$, $c$C$c$, $c$El número es divisible por $35$.$c$, true, null),
  ($c$M1-ENT-118$c$, $c$D$c$, $c$El número es divisible por $9$.$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-119$c$, $c$A$c$, $c$$72$$c$, true, null),
  ($c$M1-ENT-119$c$, $c$B$c$, $c$$9$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-119$c$, $c$C$c$, $c$$98$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-119$c$, $c$D$c$, $c$$78$$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-120$c$, $c$A$c$, $c$$25$$c$, false, $c$ENT-DIVIS-ULTCIFRA$c$),
  ($c$M1-ENT-120$c$, $c$B$c$, $c$$9$$c$, false, $c$ENT-DIVIS-CRITERIO$c$),
  ($c$M1-ENT-120$c$, $c$C$c$, $c$$30$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-120$c$, $c$D$c$, $c$$5$$c$, true, null),
  ($c$M1-ENT-121$c$, $c$A$c$, $c$$8$$c$, false, $c$ENT-MCM-SOLOCOMUN$c$),
  ($c$M1-ENT-121$c$, $c$B$c$, $c$$96$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-121$c$, $c$C$c$, $c$$4$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-121$c$, $c$D$c$, $c$$24$$c$, true, null),
  ($c$M1-ENT-122$c$, $c$A$c$, $c$$12$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-122$c$, $c$B$c$, $c$$36$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-122$c$, $c$C$c$, $c$$6$$c$, true, null),
  ($c$M1-ENT-122$c$, $c$D$c$, $c$$2$$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-123$c$, $c$A$c$, $c$$2$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-123$c$, $c$B$c$, $c$$30$$c$, true, null),
  ($c$M1-ENT-123$c$, $c$C$c$, $c$$60$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-123$c$, $c$D$c$, $c$$16$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-124$c$, $c$A$c$, $c$$45$$c$, true, null),
  ($c$M1-ENT-124$c$, $c$B$c$, $c$$3$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-124$c$, $c$C$c$, $c$$135$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-124$c$, $c$D$c$, $c$$15$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-125$c$, $c$A$c$, $c$$6$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-125$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-125$c$, $c$C$c$, $c$$10$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-125$c$, $c$D$c$, $c$$36$$c$, true, null),
  ($c$M1-ENT-126$c$, $c$A$c$, $c$$490$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-126$c$, $c$B$c$, $c$$14$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-126$c$, $c$C$c$, $c$$7$$c$, true, null),
  ($c$M1-ENT-126$c$, $c$D$c$, $c$$70$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-127$c$, $c$A$c$, $c$$4$$c$, true, null),
  ($c$M1-ENT-127$c$, $c$B$c$, $c$$32$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-127$c$, $c$C$c$, $c$$60$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-127$c$, $c$D$c$, $c$$2$$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-128$c$, $c$A$c$, $c$$7$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-128$c$, $c$B$c$, $c$$35$$c$, true, null),
  ($c$M1-ENT-128$c$, $c$C$c$, $c$$1$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-128$c$, $c$D$c$, $c$$12$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-129$c$, $c$A$c$, $c$$60$$c$, true, null),
  ($c$M1-ENT-129$c$, $c$B$c$, $c$$600$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-129$c$, $c$C$c$, $c$$10$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-129$c$, $c$D$c$, $c$$20$$c$, false, $c$ENT-MCM-SOLOCOMUN$c$),
  ($c$M1-ENT-130$c$, $c$A$c$, $c$$6$$c$, false, $c$ENT-DIVIS-SOLOPRIMOS$c$),
  ($c$M1-ENT-130$c$, $c$B$c$, $c$$12$$c$, true, null),
  ($c$M1-ENT-130$c$, $c$C$c$, $c$$72$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-130$c$, $c$D$c$, $c$$2$$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-131$c$, $c$A$c$, $c$$216$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-131$c$, $c$B$c$, $c$$19$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-131$c$, $c$C$c$, $c$$36$$c$, true, null),
  ($c$M1-ENT-131$c$, $c$D$c$, $c$$9$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-132$c$, $c$A$c$, $c$$144$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-132$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-132$c$, $c$C$c$, $c$$84$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-132$c$, $c$D$c$, $c$$12$$c$, true, null),
  ($c$M1-ENT-133$c$, $c$A$c$, $c$$12$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-133$c$, $c$B$c$, $c$$9$$c$, false, $c$ENT-MCM-SOLOCOMUN$c$),
  ($c$M1-ENT-133$c$, $c$C$c$, $c$$108$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-133$c$, $c$D$c$, $c$$36$$c$, true, null),
  ($c$M1-ENT-134$c$, $c$A$c$, $c$Solo III$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-134$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-134$c$, $c$C$c$, $c$Solo II y III$c$, true, null),
  ($c$M1-ENT-134$c$, $c$D$c$, $c$I, II y III$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-135$c$, $c$A$c$, $c$20:00:04$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-135$c$, $c$B$c$, $c$20:00:24$c$, true, null),
  ($c$M1-ENT-135$c$, $c$C$c$, $c$20:00:20$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-135$c$, $c$D$c$, $c$20:01:36$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-136$c$, $c$A$c$, $c$$60$$c$, true, null),
  ($c$M1-ENT-136$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-136$c$, $c$C$c$, $c$$20$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-136$c$, $c$D$c$, $c$$240$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-137$c$, $c$A$c$, $c$$4$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-137$c$, $c$B$c$, $c$$72$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-137$c$, $c$C$c$, $c$$54$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-137$c$, $c$D$c$, $c$$24$$c$, true, null),
  ($c$M1-ENT-138$c$, $c$A$c$, $c$Domingo$c$, true, null),
  ($c$M1-ENT-138$c$, $c$B$c$, $c$Sábado$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-138$c$, $c$C$c$, $c$Miércoles$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-138$c$, $c$D$c$, $c$Lunes$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-139$c$, $c$A$c$, $c$$2$ cm$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-139$c$, $c$B$c$, $c$$60$ cm$c$, true, null),
  ($c$M1-ENT-139$c$, $c$C$c$, $c$$360$ cm$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-139$c$, $c$D$c$, $c$$120$ cm$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-140$c$, $c$A$c$, $c$Solo I$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-140$c$, $c$B$c$, $c$Solo III$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-140$c$, $c$C$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-140$c$, $c$D$c$, $c$I, II y III$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-141$c$, $c$A$c$, $c$$30$$c$, false, $c$ENT-MCM-MAYOR$c$),
  ($c$M1-ENT-141$c$, $c$B$c$, $c$$15$$c$, true, null),
  ($c$M1-ENT-141$c$, $c$C$c$, $c$$3$$c$, false, $c$ENT-MCM-PRIMERCOMUN$c$),
  ($c$M1-ENT-141$c$, $c$D$c$, $c$$450$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-142$c$, $c$A$c$, $c$$5$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-142$c$, $c$B$c$, $c$$60$$c$, false, $c$ENT-DIVIS-INVIERTE$c$),
  ($c$M1-ENT-142$c$, $c$C$c$, $c$$20$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-142$c$, $c$D$c$, $c$$15$$c$, true, null),
  ($c$M1-ENT-143$c$, $c$A$c$, $c$$10$$c$, true, null),
  ($c$M1-ENT-143$c$, $c$B$c$, $c$$120$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-143$c$, $c$C$c$, $c$$0$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-143$c$, $c$D$c$, $c$$17$$c$, false, $c$ENT-MCM-SUMA$c$),
  ($c$M1-ENT-144$c$, $c$A$c$, $c$$2 \cdot 2 \cdot 2 \cdot 3 \cdot 3 \cdot 3 \cdot 5 \cdot 7$$c$, false, $c$ENT-MCM-PRODUCTO$c$),
  ($c$M1-ENT-144$c$, $c$B$c$, $c$$2 \cdot 3$$c$, false, $c$ENT-MCM-CAMBIA$c$),
  ($c$M1-ENT-144$c$, $c$C$c$, $c$$2 \cdot 2 \cdot 3 \cdot 3 \cdot 5 \cdot 7$$c$, true, null),
  ($c$M1-ENT-144$c$, $c$D$c$, $c$$2 \cdot 2 \cdot 3 \cdot 3$$c$, false, $c$ENT-MCM-SOLOCOMUN$c$)
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
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-097$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-098$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-099$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-100$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-101$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-102$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-103$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-104$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-105$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-106$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-107$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-108$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-109$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-110$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-111$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-112$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-113$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-114$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-115$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-116$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-117$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-118$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-119$c$),
  ($c$NUM-ENT-DIVIS$c$, $c$M1-ENT-120$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-121$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-122$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-123$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-124$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-125$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-126$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-127$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-128$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-129$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-130$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-131$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-132$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-133$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-134$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-135$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-136$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-137$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-138$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-139$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-140$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-141$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-142$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-143$c$),
  ($c$NUM-ENT-MCM$c$, $c$M1-ENT-144$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$ENT-DIVIS-INVIERTE$c$, $c$El divisor es el chico, el múltiplo es el grande$c$, $c$Cambiaste múltiplo por divisor. Por ejemplo, cuando te pidieron
divisores de $14$ diste $28$, o dijiste que $42$ es divisor de $6$.

**Si $a \cdot k = b$ con números naturales, entonces $a$ es divisor
de $b$ y $b$ es múltiplo de $a$.**

$14 = 2 \cdot 7$. Por eso $2$ y $7$ son divisores de $14$, y $14$ es
múltiplo de $2$ y de $7$. El $28$ es múltiplo de $14$, no divisor:
$14 \div 28$ no da exacto.

Los divisores de un número son, a lo más, el número mismo: nunca
son más grandes. Los múltiplos son, como mínimo, el número mismo, y
siguen para siempre.

Un control rápido: si te piden divisores y tu respuesta es mayor que
el número, estás dando múltiplos.$c$),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$ENT-DIVIS-UNO$c$, $c$El 1 no es primo ni compuesto$c$, $c$Pusiste el $1$ entre los primos, o entre los compuestos. Por ejemplo,
escribiste $1 \cdot 2 \cdot 7$ como descomposición de $14$.

**Un primo tiene exactamente dos divisores distintos: el $1$ y él
mismo. Un compuesto tiene más de dos. El $1$ tiene uno solo.**

- $7$: divisores $1$ y $7$. Dos: primo.
- $21$: divisores $1, 3, 7, 21$. Más de dos: compuesto.
- $1$: divisor $1$. Uno solo: no es ninguna de las dos cosas.

Por eso el $1$ nunca aparece en una descomposición en primos:
$14 = 2 \cdot 7$. Agregar un $1$ no cambia el producto, pero el $1$
no es un factor primo.

Un control rápido: el menor primo es el $2$.$c$),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$ENT-DIVIS-IMPARPRIMO$c$, $c$Primo no es lo mismo que impar$c$, $c$Trataste "primo" como sinónimo de "impar". Por ejemplo, dijiste que
$33$ es primo porque es impar, o que el $2$ no es primo porque es
par.

**Un número es primo si sus únicos divisores son el $1$ y él mismo.
Que sea par o impar no alcanza para decidirlo.**

- $33 = 3 \cdot 11$: impar y compuesto.
- $2$: sus divisores son $1$ y $2$. Es primo, y es el único primo
  par (todos los demás pares son divisibles por $2$).

Para saber si un impar es primo hay que buscar divisores: prueba con
$3$, $5$, $7$, $11$... Si ninguno lo divide antes de llegar a un
primo cuyo cuadrado se pase del número, es primo.

Un control rápido: si un número termina en $5$ y es mayor que $5$,
es compuesto aunque sea impar.$c$),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$ENT-DIVIS-ULTCIFRA$c$, $c$Para el 3 y el 9 se suman las cifras$c$, $c$Decidiste si un número es divisible por $3$ o por $9$ mirando su
última cifra. Por ejemplo, dijiste que $43$ es divisible por $3$
porque termina en $3$.

**Un número es divisible por $3$ si la suma de sus cifras es
múltiplo de $3$, y por $9$ si esa suma es múltiplo de $9$.**

- $43$: $4 + 3 = 7$, no es múltiplo de $3$. $43$ no es divisible por
  $3$.
- $87$: $8 + 7 = 15$, múltiplo de $3$. $87 = 3 \cdot 29$, aunque
  termine en $7$.

Mirar la última cifra sirve para el $2$, el $5$ y el $10$, porque
esos dividen a $10$. El $3$ y el $9$ no, y por eso su criterio es
distinto.

Un control rápido: si el criterio de tu respuesta fue "termina en",
y el divisor es $3$ o $9$, suma las cifras.$c$),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$ENT-DIVIS-CRITERIO$c$, $c$Divisible por 3 no es divisible por 9$c$, $c$Usaste el criterio de un número para decidir sobre otro. Por
ejemplo, dijiste que $48$ es divisible por $9$ porque sus cifras
suman $12$, que es múltiplo de $3$.

**Cada divisor tiene su criterio. Para el $9$ la suma de cifras tiene
que ser múltiplo de $9$; para el $6$, el número tiene que ser par
y además divisible por $3$; para el $4$, sus dos últimas cifras
tienen que formar un múltiplo de $4$.**

- $48$: $4 + 8 = 12$. Divisible por $3$, no por $9$.
- $38$: es par, pero $3 + 8 = 11$. No es divisible por $6$.
- $38$: termina en $38$, que no es múltiplo de $4$. No es divisible
  por $4$, aunque sea par.

Un control rápido: $9$ es más exigente que $3$; $6$ y $4$ son más
exigentes que $2$. Si solo comprobaste el criterio del más fácil, te
falta un paso.$c$),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$ENT-DIVIS-EXTREMOS$c$, $c$El 1 y el propio número también son divisores$c$, $c$Al listar los divisores dejaste fuera el $1$ y el número mismo. Por
ejemplo, para $10$ escribiste solo $2$ y $5$.

**Todo número es divisible por $1$ y por sí mismo. Esos dos siempre
están en la lista.**

Busca los divisores por parejas que multiplicadas den el número. Para
$28$:

$$1 \cdot 28 \qquad 2 \cdot 14 \qquad 4 \cdot 7$$

Los divisores son $1, 2, 4, 7, 14$ y $28$: seis. La primera pareja
siempre es $1$ por el número, así que partir por ahí evita
olvidarlos.

Lo mismo con los múltiplos: el primer múltiplo de $28$ es el propio
$28$.

Un control rápido: cuenta tus parejas. Cada pareja aporta dos
divisores, y la primera es siempre el $1$ con el número.$c$),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$ENT-DIVIS-SOLOPRIMOS$c$, $c$Un divisor no tiene que ser primo$c$, $c$Te quedaste solo con los divisores primos. Por ejemplo, para $28$
dijiste que sus divisores son $2$ y $7$.

**Un divisor es cualquier número que divide exacto, sea primo o no.**

$28 \div 4 = 7$ y $28 \div 14 = 2$: el $4$ y el $14$ también son
divisores de $28$, aunque no sean primos. La lista completa es
$1, 2, 4, 7, 14, 28$.

Los primos $2$ y $7$ son los **factores primos** de $28$: los que
aparecen en su descomposición $2 \cdot 2 \cdot 7$. Todos los demás
divisores salen de multiplicar algunos de esos factores: $2 \cdot 2
= 4$, $2 \cdot 7 = 14$.

Un control rápido: si tu lista de divisores no incluye al propio
número, está incompleta.$c$),
  ($c$REM-ENT-DIVIS-COMPUESTO$c$, $c$ENT-DIVIS-COMPUESTO$c$, $c$En la descomposición, todos los factores son primos$c$, $c$Escribiste el número como un producto, pero algún factor no era
primo. Por ejemplo, para $90$ escribiste $9 \cdot 10$.

**La descomposición en factores primos termina recién cuando todos
los factores son primos.**

$9 \cdot 10$ es correcto como producto, pero $9 = 3 \cdot 3$ y
$10 = 2 \cdot 5$ se pueden seguir descomponiendo:

$$90 = 2 \cdot 3 \cdot 3 \cdot 5$$

Divide siempre por el menor primo posible hasta llegar a $1$:
$90 \div 2 = 45$, $45 \div 3 = 15$, $15 \div 3 = 5$, $5 \div 5 = 1$.
Los divisores que usaste son los factores.

Un control rápido: revisa cada factor de tu respuesta. Si alguno es
$4$, $6$, $8$, $9$, $10$... todavía no terminaste.$c$),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$ENT-MCM-CAMBIA$c$, $c$El mcm es grande, el MCD es chico$c$, $c$Cambiaste el mcm por el MCD. Por ejemplo, para $8$ y $12$ diste
$4$ como mcm, o en un problema de coincidencias usaste el MCD.

**El mcm es múltiplo de los dos números, así que es mayor o igual
que ambos. El MCD divide a los dos, así que es menor o igual que
ambos.**

Para $8$ y $12$:

- múltiplos comunes: $24, 48, \dots$ El menor es $24$: mcm.
- divisores comunes: $1, 2, 4$. El mayor es $4$: MCD.

En los problemas: si algo se repite y preguntan cuándo vuelve a
coincidir, es mcm. Si hay que repartir en grupos iguales lo más
grandes posible, es MCD.

Un control rápido: compara tu respuesta con los datos. Un mcm menor
que uno de los números, o un MCD mayor, está cambiado.$c$),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$ENT-MCM-PRODUCTO$c$, $c$El producto es un múltiplo común, pero no siempre el menor$c$, $c$Multiplicaste los dos números para obtener el mcm. Por ejemplo, para
$6$ y $14$ diste $84$.

**El producto $a \cdot b$ siempre es múltiplo común, pero el mcm es
el menor, y muchas veces hay uno más chico.**

Múltiplos de $14$: $14, 28, 42, \dots$ El $42$ ya es múltiplo de $6$.
Entonces $\text{mcm}(6, 14) = 42$, no $84$.

Por descomposición: $6 = 2 \cdot 3$ y $14 = 2 \cdot 7$. El $2$ que
comparten se cuenta una sola vez: $2 \cdot 3 \cdot 7 = 42$. Al
multiplicar $6 \cdot 14$ se cuenta un $2$ de más.

El producto es el mcm solo cuando los números no tienen factores en
común, como $4$ y $9$.

Un control rápido: divide tu mcm por $2$, $3$ o $5$. Si el resultado
sigue siendo múltiplo de los dos números, no era el menor.$c$),
  ($c$REM-ENT-MCM-SUMA$c$, $c$ENT-MCM-SUMA$c$, $c$Para saber cuándo coinciden, se busca un múltiplo común$c$, $c$Sumaste los períodos. Por ejemplo, si una alarma suena cada $6$
minutos y otra cada $9$, dijiste que vuelven a sonar juntas a los
$15$ minutos.

**Dos cosas que se repiten coinciden en un momento que es múltiplo
de los dos períodos. La primera vez es el mcm.**

La primera alarma suena a los $6, 12, 18, \dots$ minutos. La segunda,
a los $9, 18, \dots$ Coinciden a los $18$ minutos:
$\text{mcm}(6, 9) = 18$.

A los $15$ minutos no suena ninguna de las dos: $15$ no es múltiplo
de $6$ ni de $9$.

Un control rápido: tu respuesta tiene que estar en la lista de las
dos cosas. Divide por cada período y comprueba que da exacto.$c$),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$ENT-MCM-MAYOR$c$, $c$El mayor sirve solo si es múltiplo del otro$c$, $c$Tomaste el mayor de los números como mcm (o el menor como MCD) sin
comprobarlo. Por ejemplo, para $4$ y $14$ diste $14$ como mcm.

**El mcm tiene que ser múltiplo de los dos números.**

$14$ es múltiplo de $14$, pero no de $4$: $14 \div 4$ no da exacto.
Sigue con los múltiplos de $14$: $28$ sí es múltiplo de $4$.
$\text{mcm}(4, 14) = 28$.

Con el MCD pasa lo mismo al revés: el menor de los números es el MCD
solo si divide al otro. $\text{MCD}(4, 14)$ no es $4$, porque $4$ no
divide a $14$; es $2$.

Un control rápido: divide tu mcm por cada número. Si alguna división
no da exacta, no es múltiplo común.$c$),
  ($c$REM-ENT-MCM-SOLOCOMUN$c$, $c$ENT-MCM-SOLOCOMUN$c$, $c$El mcm lleva todos los factores$c$, $c$Para el mcm usaste solo los factores que los números tienen en
común. Por ejemplo, con $8 = 2 \cdot 2 \cdot 2$ y
$20 = 2 \cdot 2 \cdot 5$ te quedaste con $2 \cdot 2 \cdot 2 = 8$.

**El mcm lleva todos los factores primos de los dos números, cada
uno las veces que más se repite. Solo los comunes es la regla del
MCD.**

Para $8$ y $20$: el $2$ aparece tres veces en $8$ y dos en $20$, así
que van tres. El $5$ aparece en $20$, así que también va:

$$\text{mcm}(8, 20) = 2 \cdot 2 \cdot 2 \cdot 5 = 40$$

Si dejas fuera el $5$, tu resultado no es múltiplo de $20$.

Un control rápido: el mcm tiene que ser divisible por los dos
números. Compruébalo antes de responder.$c$),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$ENT-MCM-PRIMERCOMUN$c$, $c$El MCD es el mayor divisor común, no el primero$c$, $c$Diste como MCD el primer divisor común que encontraste. Por ejemplo,
para $18$ y $30$ respondiste $2$.

**El MCD es el mayor de los divisores comunes.**

Divisores comunes de $18$ y $30$: $1, 2, 3, 6$. El $2$ divide a los
dos, pero hay divisores comunes más grandes. El mayor es $6$.

Por descomposición: $18 = 2 \cdot 3 \cdot 3$ y
$30 = 2 \cdot 3 \cdot 5$. En común tienen un $2$ y un $3$:
$2 \cdot 3 = 6$. Todos los factores comunes se multiplican, no se
elige uno.

Un control rápido: divide los dos números por tu MCD. Si los dos
cocientes todavía tienen un divisor común mayor que $1$, tu MCD se
quedó corto.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$REM-ENT-DIVIS-UNO$c$, $c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$REM-ENT-DIVIS-CRITERIO$c$, $c$REM-ENT-DIVIS-EXTREMOS$c$, $c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$REM-ENT-DIVIS-COMPUESTO$c$, $c$REM-ENT-MCM-CAMBIA$c$, $c$REM-ENT-MCM-PRODUCTO$c$, $c$REM-ENT-MCM-SUMA$c$, $c$REM-ENT-MCM-MAYOR$c$, $c$REM-ENT-MCM-SOLOCOMUN$c$, $c$REM-ENT-MCM-PRIMERCOMUN$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-101$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-102$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-107$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-111$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-119$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$M1-ENT-120$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-100$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-103$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-109$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-110$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-114$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-UNO$c$, $c$M1-ENT-115$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-098$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-103$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-106$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-109$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-115$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$M1-ENT-116$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-102$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-103$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-111$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-112$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-117$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$M1-ENT-119$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-099$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-102$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-109$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-111$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-118$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-CRITERIO$c$, $c$M1-ENT-119$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-101$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-104$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-107$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-108$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-113$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-EXTREMOS$c$, $c$M1-ENT-116$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-100$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-101$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-108$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-110$c$, 4::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-115$c$, 5::smallint),
  ($c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$M1-ENT-116$c$, 6::smallint),
  ($c$REM-ENT-DIVIS-COMPUESTO$c$, $c$M1-ENT-100$c$, 1::smallint),
  ($c$REM-ENT-DIVIS-COMPUESTO$c$, $c$M1-ENT-110$c$, 2::smallint),
  ($c$REM-ENT-DIVIS-COMPUESTO$c$, $c$M1-ENT-117$c$, 3::smallint),
  ($c$REM-ENT-DIVIS-COMPUESTO$c$, $c$M1-ENT-118$c$, 4::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-124$c$, 1::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-126$c$, 2::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-132$c$, 3::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-134$c$, 4::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-141$c$, 5::smallint),
  ($c$REM-ENT-MCM-CAMBIA$c$, $c$M1-ENT-142$c$, 6::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-123$c$, 1::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-124$c$, 2::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-133$c$, 3::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-134$c$, 4::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-140$c$, 5::smallint),
  ($c$REM-ENT-MCM-PRODUCTO$c$, $c$M1-ENT-143$c$, 6::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-125$c$, 1::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-127$c$, 2::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-132$c$, 3::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-135$c$, 4::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-138$c$, 5::smallint),
  ($c$REM-ENT-MCM-SUMA$c$, $c$M1-ENT-142$c$, 6::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-125$c$, 1::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-126$c$, 2::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-131$c$, 3::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-133$c$, 4::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-139$c$, 5::smallint),
  ($c$REM-ENT-MCM-MAYOR$c$, $c$M1-ENT-140$c$, 6::smallint),
  ($c$REM-ENT-MCM-SOLOCOMUN$c$, $c$M1-ENT-121$c$, 1::smallint),
  ($c$REM-ENT-MCM-SOLOCOMUN$c$, $c$M1-ENT-129$c$, 2::smallint),
  ($c$REM-ENT-MCM-SOLOCOMUN$c$, $c$M1-ENT-133$c$, 3::smallint),
  ($c$REM-ENT-MCM-SOLOCOMUN$c$, $c$M1-ENT-144$c$, 4::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-122$c$, 1::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-127$c$, 2::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-132$c$, 3::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-134$c$, 4::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-139$c$, 5::smallint),
  ($c$REM-ENT-MCM-PRIMERCOMUN$c$, $c$M1-ENT-141$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-05$c$, $c$NUM-ENT$c$, $c$Divisibilidad, mcm y MCD$c$, $c$Todo lo de esta clase sale de una sola pregunta: ¿una división da
exacta? Con eso vas a simplificar fracciones, sumarlas y resolver
problemas de repartos y de cosas que se repiten.

## Múltiplos, divisores y números primos

### Múltiplo y divisor son la misma relación

$42 = 6 \cdot 7$. Eso se puede decir de dos maneras:

- $42$ es **múltiplo** de $6$ (está en la tabla del $6$);
- $6$ es **divisor** de $42$ ($42 \div 6$ da exacto).

**El múltiplo es el grande; el divisor es el chico.** Si confundes cuál
es cuál, pregúntate quién divide a quién. $6$ divide a $42$; $42$ no
divide a $6$.

Todo número es múltiplo y divisor de sí mismo, y el $1$ es divisor de
todos. Un número tiene una cantidad limitada de divisores, pero
infinitos múltiplos.

### Listar divisores

Para listar los divisores de $30$, busca las parejas que multiplicadas
dan $30$:

$$1 \cdot 30 \qquad 2 \cdot 15 \qquad 3 \cdot 10 \qquad 5 \cdot 6$$

Los divisores de $30$ son $1, 2, 3, 5, 6, 10, 15$ y $30$: ocho en
total. No olvides los extremos ($1$ y $30$), y no te quedes solo con los
primos: $6$, $10$ y $15$ también dividen a $30$.

### Criterios de divisibilidad

- Por $2$: termina en cifra par.
- Por $5$: termina en $0$ o en $5$.
- Por $10$: termina en $0$.
- Por $4$: sus dos últimas cifras forman un múltiplo de $4$.
- Por $3$: **la suma de sus cifras** es múltiplo de $3$.
- Por $9$: **la suma de sus cifras** es múltiplo de $9$.
- Por $6$: es divisible por $2$ **y** por $3$.

El error típico es mirar la última cifra para el $3$ y el $9$. $73$
termina en $3$ y no es divisible por $3$ ($7 + 3 = 10$). En cambio $78$
sí lo es ($7 + 8 = 15$).

Otro: divisible por $3$ no significa divisible por $9$. La suma de
cifras de $78$ es $15$: múltiplo de $3$, pero no de $9$.

### Primos y compuestos

Un número **primo** tiene exactamente dos divisores: el $1$ y él mismo.
Un **compuesto** tiene más de dos.

- El $1$ tiene un solo divisor: **no es primo ni compuesto**.
- El $2$ es primo, y es el único primo par.
- Impar no es lo mismo que primo: $39 = 3 \cdot 13$ es impar y
  compuesto.

Los primos menores que $30$ son $2, 3, 5, 7, 11, 13, 17, 19, 23$ y
$29$.

### Descomposición en factores primos

Todo compuesto se escribe como producto de primos. Se divide
repetidamente por el menor primo que se pueda:

$$150 = 2 \cdot 75 = 2 \cdot 3 \cdot 25 = 2 \cdot 3 \cdot 5 \cdot 5$$

**Todos los factores tienen que ser primos**, y un primo que se repite
se escribe las veces que aparece. $150 = 6 \cdot 25$ es un producto
correcto, pero no es la descomposición en primos.

## Mínimo común múltiplo y máximo común divisor

### Qué es cada uno

- El **mcm** de dos números es el menor número que es múltiplo de los
  dos.
- El **MCD** es el mayor número que divide a los dos.

El mcm es mayor o igual que los dos números. El MCD es menor o igual
que los dos. Si tu mcm es más chico que alguno de los números, o tu MCD
más grande, cambiaste uno por el otro.

### Por listado

Para $10$ y $25$:

- múltiplos de $10$: $10, 20, 30, 40, 50, \dots$ y de $25$: $25, 50,
  \dots$ El primero común es $50$: $\text{mcm}(10, 25) = 50$.
- divisores de $10$: $1, 2, 5, 10$ y de $25$: $1, 5, 25$. El mayor
  común es $5$: $\text{MCD}(10, 25) = 5$.

Ojo con el MCD: no es el primer divisor común que encuentras (sería el
$1$, o el menor mayor que $1$), sino **el mayor**.

### Por descomposición

$28 = 2 \cdot 2 \cdot 7$ y $42 = 2 \cdot 3 \cdot 7$.

- **MCD: solo los factores comunes, las veces que se repiten en ambos.**
  En común tienen un $2$ y un $7$: $\text{MCD} = 14$.
- **mcm: todos los factores, las veces que más se repiten.** Dos $2$, un
  $3$ y un $7$: $\text{mcm} = 2 \cdot 2 \cdot 3 \cdot 7 = 84$.

El mcm no es, en general, el producto de los números: $28 \cdot 42 =
1.176$ es múltiplo común, pero no el menor. El producto coincide con el
mcm solo cuando los números no comparten factores (se llaman **primos
entre sí**, y su MCD es $1$).

Además, siempre se cumple
$\text{mcm}(a, b) \cdot \text{MCD}(a, b) = a \cdot b$. En el ejemplo:
$84 \cdot 14 = 1.176$.

### ¿mcm o MCD? Lee qué pide el problema

- **Cosas que se repiten y hay que saber cuándo vuelven a coincidir**:
  mcm. Dos buses que pasan cada $10$ y cada $25$ minutos coinciden cada
  $50$ minutos. No se suman los tiempos: sumarlos no da un momento en
  que los dos pasen.
- **Repartir en la mayor cantidad de grupos iguales, o en grupos lo más
  grandes posible, sin que sobre**: MCD. Con $10$ manzanas y $25$
  naranjas se arman como máximo $\text{MCD}(10, 25) = 5$ bolsas iguales,
  cada una con $2$ manzanas y $5$ naranjas.

Un control rápido: en los problemas de coincidir, la respuesta es
**mayor** que los datos; en los de repartir, es **menor**.$c$, 5::smallint)
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
  ($c$LES-NUM-ENT-05$c$, $c$NUM-ENT-DIVIS$c$, 1::smallint, $c$multiplos-divisores-y-numeros-primos$c$),
  ($c$LES-NUM-ENT-05$c$, $c$NUM-ENT-MCM$c$, 2::smallint, $c$minimo-comun-multiplo-y-maximo-comun-divisor$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-ENT-097$c$, $c$M1-ENT-098$c$, $c$M1-ENT-099$c$, $c$M1-ENT-100$c$, $c$M1-ENT-101$c$, $c$M1-ENT-102$c$, $c$M1-ENT-103$c$, $c$M1-ENT-104$c$, $c$M1-ENT-105$c$, $c$M1-ENT-106$c$, $c$M1-ENT-107$c$, $c$M1-ENT-108$c$, $c$M1-ENT-109$c$, $c$M1-ENT-110$c$, $c$M1-ENT-111$c$, $c$M1-ENT-112$c$, $c$M1-ENT-113$c$, $c$M1-ENT-114$c$, $c$M1-ENT-115$c$, $c$M1-ENT-116$c$, $c$M1-ENT-117$c$, $c$M1-ENT-118$c$, $c$M1-ENT-119$c$, $c$M1-ENT-120$c$, $c$M1-ENT-121$c$, $c$M1-ENT-122$c$, $c$M1-ENT-123$c$, $c$M1-ENT-124$c$, $c$M1-ENT-125$c$, $c$M1-ENT-126$c$, $c$M1-ENT-127$c$, $c$M1-ENT-128$c$, $c$M1-ENT-129$c$, $c$M1-ENT-130$c$, $c$M1-ENT-131$c$, $c$M1-ENT-132$c$, $c$M1-ENT-133$c$, $c$M1-ENT-134$c$, $c$M1-ENT-135$c$, $c$M1-ENT-136$c$, $c$M1-ENT-137$c$, $c$M1-ENT-138$c$, $c$M1-ENT-139$c$, $c$M1-ENT-140$c$, $c$M1-ENT-141$c$, $c$M1-ENT-142$c$, $c$M1-ENT-143$c$, $c$M1-ENT-144$c$);
  if c <> 48 then
    raise exception 'items: se esperaban 48, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-097$c$, $c$M1-ENT-098$c$, $c$M1-ENT-099$c$, $c$M1-ENT-100$c$, $c$M1-ENT-101$c$, $c$M1-ENT-102$c$, $c$M1-ENT-103$c$, $c$M1-ENT-104$c$, $c$M1-ENT-105$c$, $c$M1-ENT-106$c$, $c$M1-ENT-107$c$, $c$M1-ENT-108$c$, $c$M1-ENT-109$c$, $c$M1-ENT-110$c$, $c$M1-ENT-111$c$, $c$M1-ENT-112$c$, $c$M1-ENT-113$c$, $c$M1-ENT-114$c$, $c$M1-ENT-115$c$, $c$M1-ENT-116$c$, $c$M1-ENT-117$c$, $c$M1-ENT-118$c$, $c$M1-ENT-119$c$, $c$M1-ENT-120$c$, $c$M1-ENT-121$c$, $c$M1-ENT-122$c$, $c$M1-ENT-123$c$, $c$M1-ENT-124$c$, $c$M1-ENT-125$c$, $c$M1-ENT-126$c$, $c$M1-ENT-127$c$, $c$M1-ENT-128$c$, $c$M1-ENT-129$c$, $c$M1-ENT-130$c$, $c$M1-ENT-131$c$, $c$M1-ENT-132$c$, $c$M1-ENT-133$c$, $c$M1-ENT-134$c$, $c$M1-ENT-135$c$, $c$M1-ENT-136$c$, $c$M1-ENT-137$c$, $c$M1-ENT-138$c$, $c$M1-ENT-139$c$, $c$M1-ENT-140$c$, $c$M1-ENT-141$c$, $c$M1-ENT-142$c$, $c$M1-ENT-143$c$, $c$M1-ENT-144$c$);
  if c <> 192 then
    raise exception 'item_options: se esperaban 192, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-097$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-098$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-099$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-100$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-101$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-102$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-103$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-104$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-105$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-106$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-107$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-108$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-109$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-110$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-111$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-112$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-113$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-114$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-115$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-116$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-117$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-118$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-119$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-120$c$, $c$NUM-ENT-DIVIS$c$),
      ($c$M1-ENT-121$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-122$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-123$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-124$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-125$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-126$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-127$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-128$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-129$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-130$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-131$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-132$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-133$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-134$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-135$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-136$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-137$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-138$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-139$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-140$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-141$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-142$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-143$c$, $c$NUM-ENT-MCM$c$),
      ($c$M1-ENT-144$c$, $c$NUM-ENT-MCM$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 48 then
    raise exception 'node_items: 48 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-097$c$, $c$M1-ENT-098$c$, $c$M1-ENT-099$c$, $c$M1-ENT-100$c$, $c$M1-ENT-101$c$, $c$M1-ENT-102$c$, $c$M1-ENT-103$c$, $c$M1-ENT-104$c$, $c$M1-ENT-105$c$, $c$M1-ENT-106$c$, $c$M1-ENT-107$c$, $c$M1-ENT-108$c$, $c$M1-ENT-109$c$, $c$M1-ENT-110$c$, $c$M1-ENT-111$c$, $c$M1-ENT-112$c$, $c$M1-ENT-113$c$, $c$M1-ENT-114$c$, $c$M1-ENT-115$c$, $c$M1-ENT-116$c$, $c$M1-ENT-117$c$, $c$M1-ENT-118$c$, $c$M1-ENT-119$c$, $c$M1-ENT-120$c$, $c$M1-ENT-121$c$, $c$M1-ENT-122$c$, $c$M1-ENT-123$c$, $c$M1-ENT-124$c$, $c$M1-ENT-125$c$, $c$M1-ENT-126$c$, $c$M1-ENT-127$c$, $c$M1-ENT-128$c$, $c$M1-ENT-129$c$, $c$M1-ENT-130$c$, $c$M1-ENT-131$c$, $c$M1-ENT-132$c$, $c$M1-ENT-133$c$, $c$M1-ENT-134$c$, $c$M1-ENT-135$c$, $c$M1-ENT-136$c$, $c$M1-ENT-137$c$, $c$M1-ENT-138$c$, $c$M1-ENT-139$c$, $c$M1-ENT-140$c$, $c$M1-ENT-141$c$, $c$M1-ENT-142$c$, $c$M1-ENT-143$c$, $c$M1-ENT-144$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-DIVIS-COMPUESTO$c$, $c$ENT-DIVIS-CRITERIO$c$, $c$ENT-DIVIS-EXTREMOS$c$, $c$ENT-DIVIS-IMPARPRIMO$c$, $c$ENT-DIVIS-INVIERTE$c$, $c$ENT-DIVIS-SOLOPRIMOS$c$, $c$ENT-DIVIS-ULTCIFRA$c$, $c$ENT-DIVIS-UNO$c$, $c$ENT-MCM-CAMBIA$c$, $c$ENT-MCM-MAYOR$c$, $c$ENT-MCM-PRIMERCOMUN$c$, $c$ENT-MCM-PRODUCTO$c$, $c$ENT-MCM-SOLOCOMUN$c$, $c$ENT-MCM-SUMA$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

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

-- 48 ítems (48 curated), 192 alternativas, 14 misconceptions referenciadas,
-- 14 remediaciones, 0 figuras, 1 clase sobre 2 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 48 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-ENT-097$c$, $c$M1-ENT-098$c$, $c$M1-ENT-099$c$, $c$M1-ENT-100$c$, $c$M1-ENT-101$c$, $c$M1-ENT-102$c$, $c$M1-ENT-103$c$, $c$M1-ENT-104$c$, $c$M1-ENT-105$c$, $c$M1-ENT-106$c$, $c$M1-ENT-107$c$, $c$M1-ENT-108$c$, $c$M1-ENT-109$c$, $c$M1-ENT-110$c$, $c$M1-ENT-111$c$, $c$M1-ENT-112$c$, $c$M1-ENT-113$c$, $c$M1-ENT-114$c$, $c$M1-ENT-115$c$, $c$M1-ENT-116$c$, $c$M1-ENT-117$c$, $c$M1-ENT-118$c$, $c$M1-ENT-119$c$, $c$M1-ENT-120$c$, $c$M1-ENT-121$c$, $c$M1-ENT-122$c$, $c$M1-ENT-123$c$, $c$M1-ENT-124$c$, $c$M1-ENT-125$c$, $c$M1-ENT-126$c$, $c$M1-ENT-127$c$, $c$M1-ENT-128$c$, $c$M1-ENT-129$c$, $c$M1-ENT-130$c$, $c$M1-ENT-131$c$, $c$M1-ENT-132$c$, $c$M1-ENT-133$c$, $c$M1-ENT-134$c$, $c$M1-ENT-135$c$, $c$M1-ENT-136$c$, $c$M1-ENT-137$c$, $c$M1-ENT-138$c$, $c$M1-ENT-139$c$, $c$M1-ENT-140$c$, $c$M1-ENT-141$c$, $c$M1-ENT-142$c$, $c$M1-ENT-143$c$, $c$M1-ENT-144$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-DIVIS-INVIERTE$c$, $c$REM-ENT-DIVIS-UNO$c$, $c$REM-ENT-DIVIS-IMPARPRIMO$c$, $c$REM-ENT-DIVIS-ULTCIFRA$c$, $c$REM-ENT-DIVIS-CRITERIO$c$, $c$REM-ENT-DIVIS-EXTREMOS$c$, $c$REM-ENT-DIVIS-SOLOPRIMOS$c$, $c$REM-ENT-DIVIS-COMPUESTO$c$, $c$REM-ENT-MCM-CAMBIA$c$, $c$REM-ENT-MCM-PRODUCTO$c$, $c$REM-ENT-MCM-SUMA$c$, $c$REM-ENT-MCM-MAYOR$c$, $c$REM-ENT-MCM-SOLOCOMUN$c$, $c$REM-ENT-MCM-PRIMERCOMUN$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-05$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-ENT-097$c$, $c$M1-ENT-098$c$, $c$M1-ENT-099$c$, $c$M1-ENT-100$c$, $c$M1-ENT-101$c$, $c$M1-ENT-102$c$, $c$M1-ENT-103$c$, $c$M1-ENT-104$c$, $c$M1-ENT-105$c$, $c$M1-ENT-106$c$, $c$M1-ENT-107$c$, $c$M1-ENT-108$c$, $c$M1-ENT-109$c$, $c$M1-ENT-110$c$, $c$M1-ENT-111$c$, $c$M1-ENT-112$c$, $c$M1-ENT-113$c$, $c$M1-ENT-114$c$, $c$M1-ENT-115$c$, $c$M1-ENT-116$c$, $c$M1-ENT-117$c$, $c$M1-ENT-118$c$, $c$M1-ENT-119$c$, $c$M1-ENT-120$c$, $c$M1-ENT-121$c$, $c$M1-ENT-122$c$, $c$M1-ENT-123$c$, $c$M1-ENT-124$c$, $c$M1-ENT-125$c$, $c$M1-ENT-126$c$, $c$M1-ENT-127$c$, $c$M1-ENT-128$c$, $c$M1-ENT-129$c$, $c$M1-ENT-130$c$, $c$M1-ENT-131$c$, $c$M1-ENT-132$c$, $c$M1-ENT-133$c$, $c$M1-ENT-134$c$, $c$M1-ENT-135$c$, $c$M1-ENT-136$c$, $c$M1-ENT-137$c$, $c$M1-ENT-138$c$, $c$M1-ENT-139$c$, $c$M1-ENT-140$c$, $c$M1-ENT-141$c$, $c$M1-ENT-142$c$, $c$M1-ENT-143$c$, $c$M1-ENT-144$c$) group by 1;
