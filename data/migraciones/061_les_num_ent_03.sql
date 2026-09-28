-- =====================================================================
-- LES-NUM-ENT-03 — Multiplicación y división de enteros
-- Generado por cargar_contenido.py desde LES-NUM-ENT-03.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-ENT-049$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-050$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-051$c$, $c$¿Qué número multiplicado por $-5$ da $-35$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-052$c$, $c$¿Cuál de las siguientes operaciones tiene resultado positivo?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-053$c$, $c$En $4$ días, el saldo de una cuenta bajó $\$12.000$ en total, la misma cantidad cada día. ¿Qué operación permite calcular el cambio diario del saldo?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-054$c$, $c$Un ascensor baja $3$ pisos por minuto durante $4$ minutos. ¿Qué expresión representa el cambio de piso del ascensor?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-055$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-056$c$, $c$¿Cuál de las siguientes multiplicaciones tiene resultado $-24$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-057$c$, $c$¿Cuál es el valor de $(-1)(2)(5)(6)$ y por qué?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-058$c$, $c$¿Cuál de los siguientes productos es negativo?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-059$c$, $c$A las 22:00 un termómetro marcaba $2$ °C y a las 02:00 marcaba $10$ °C bajo cero. Si la temperatura bajó lo mismo cada hora, ¿cuál fue la variación por hora?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-060$c$, $c$Se sabe que $a(-4) = 48$. ¿Cuál es el valor de $a \div 2$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-061$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-062$c$, $c$¿Cuál de las siguientes operaciones da el mismo resultado que $(-6)\cdot(-4)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-063$c$, $c$El producto de dos números enteros es $-54$. Si uno de ellos es $-9$, ¿cuál es el otro?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-064$c$, $c$Un submarino pasó de estar a $-40$ m a estar a $-100$ m en $5$ minutos, bajando lo mismo cada minuto. ¿Cuál fue su variación de posición por minuto?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-065$c$, $c$Considera las siguientes afirmaciones:

I. $(-6)\cdot(-7) = 42$

II. $(-2)\cdot 3 \cdot 4 = 24$

III. $0 \div (-5) = 0$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-066$c$, $c$Considera las siguientes afirmaciones sobre números enteros:

I. Si un producto tiene cuatro factores y tres de ellos son positivos, el producto es positivo.

II. Si uno de los factores de un producto es $0$, el producto es $0$.

III. $(-12) \div 0 = 0$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-067$c$, $c$Sean $p$ y $q$ números enteros tales que $p < 0$ y $q > 0$. ¿Cuál de las siguientes expresiones es **siempre** negativa?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-068$c$, $c$Considera las siguientes afirmaciones:

I. $(-3)(-4)(-5) = -60$

II. $(-8) \div (-2) = -4$

III. $(-5)(0)(-2) = 10$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-069$c$, $c$Considera las siguientes afirmaciones:

I. Si un número multiplicado por $-6$ da $42$, ese número es $-7$.

II. Si $x \div (-2) = 5$, entonces $x = -\frac{5}{2}$.

III. $(-10)(-3) = -13$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-070$c$, $c$¿Qué número multiplicado por $-12$ da $0$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-071$c$, $c$Sea $a$ un número entero negativo. ¿Cuál de las siguientes expresiones tiene **siempre** el mismo signo que $a$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-072$c$, $c$Tres socios tienen una deuda común de $\$45.000$. Acuerdan pagarla en partes iguales entre los tres y cada uno en $5$ cuotas mensuales iguales. Si la deuda se anota con signo negativo, ¿qué número representa la parte de la deuda que corresponde a cada cuota de un socio?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-ENT-049$c$, $c$A$c$, $c$$(-8) \div 0 = 0$$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-049$c$, $c$B$c$, $c$$(-7)\cdot(-3) = 21$$c$, true, null),
  ($c$M1-ENT-049$c$, $c$C$c$, $c$$(-6)(2) = -4$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-049$c$, $c$D$c$, $c$$(-4)\cdot(-5) = -20$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-050$c$, $c$A$c$, $c$$(-2)(5) = 3$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-050$c$, $c$B$c$, $c$$(-3)\cdot 10 = 30$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-050$c$, $c$C$c$, $c$$(-56) \div 8 = -7$$c$, true, null),
  ($c$M1-ENT-050$c$, $c$D$c$, $c$$9 \cdot 0 = 9$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-051$c$, $c$A$c$, $c$$-7$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-051$c$, $c$B$c$, $c$$175$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-051$c$, $c$C$c$, $c$$-30$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-051$c$, $c$D$c$, $c$$7$$c$, true, null),
  ($c$M1-ENT-052$c$, $c$A$c$, $c$$(-42) \div (-7)$$c$, true, null),
  ($c$M1-ENT-052$c$, $c$B$c$, $c$$(-6)\cdot 0 \cdot (-1)$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-052$c$, $c$C$c$, $c$$42 \div (-7)$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-052$c$, $c$D$c$, $c$$(-5)\cdot 2 \cdot 3$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-053$c$, $c$A$c$, $c$$12.000 \div 4$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-053$c$, $c$B$c$, $c$$(-12.000) + 4$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-053$c$, $c$C$c$, $c$$(-12.000) \cdot 4$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-053$c$, $c$D$c$, $c$$(-12.000) \div 4$$c$, true, null),
  ($c$M1-ENT-054$c$, $c$A$c$, $c$$(-3) \div 4$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-054$c$, $c$B$c$, $c$$(-3) \cdot 4$$c$, true, null),
  ($c$M1-ENT-054$c$, $c$C$c$, $c$$3 \cdot 4$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-054$c$, $c$D$c$, $c$$(-3) + 4$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-055$c$, $c$A$c$, $c$$(-4) \cdot 0 = -4$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-055$c$, $c$B$c$, $c$$(-4) \cdot (-1) = -4$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-055$c$, $c$C$c$, $c$$0 \div (-4) = 0$$c$, true, null),
  ($c$M1-ENT-055$c$, $c$D$c$, $c$$(-4) \div 0 = 0$$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-056$c$, $c$A$c$, $c$$(-3)\cdot 8$$c$, true, null),
  ($c$M1-ENT-056$c$, $c$B$c$, $c$$(-4)\cdot(-6)$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-056$c$, $c$C$c$, $c$$(-30)(6)$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-056$c$, $c$D$c$, $c$$(-1)\cdot(-2)\cdot 12$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-057$c$, $c$A$c$, $c$$60$, porque el factor de mayor tamaño es positivo.$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-057$c$, $c$B$c$, $c$$12$, porque los paréntesis seguidos se suman.$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-057$c$, $c$C$c$, $c$$-60$, porque hay una cantidad impar de factores negativos.$c$, true, null),
  ($c$M1-ENT-057$c$, $c$D$c$, $c$$60$, porque hay más factores positivos que negativos.$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-058$c$, $c$A$c$, $c$$(-2)\cdot(-3)\cdot 10$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-058$c$, $c$B$c$, $c$$(-1)\cdot 3 \cdot 4 \cdot 2$$c$, true, null),
  ($c$M1-ENT-058$c$, $c$C$c$, $c$$(-9)\cdot(-1)\cdot 2 \cdot 3 \cdot 2$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-058$c$, $c$D$c$, $c$$(-7)\cdot 0 \cdot 2$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-059$c$, $c$A$c$, $c$$-3$ °C$c$, true, null),
  ($c$M1-ENT-059$c$, $c$B$c$, $c$$2$ °C$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-059$c$, $c$C$c$, $c$$3$ °C$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-059$c$, $c$D$c$, $c$$-48$ °C$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-060$c$, $c$A$c$, $c$$6$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-060$c$, $c$B$c$, $c$$-96$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-060$c$, $c$C$c$, $c$$26$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-060$c$, $c$D$c$, $c$$-6$$c$, true, null),
  ($c$M1-ENT-061$c$, $c$A$c$, $c$$(-6)\cdot 11 = 66$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-061$c$, $c$B$c$, $c$$(-72) \div (-8) = 9$$c$, true, null),
  ($c$M1-ENT-061$c$, $c$C$c$, $c$$15 \div 0 = 0$$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-061$c$, $c$D$c$, $c$$(-1)\cdot 2 \cdot 3 \cdot 4 = 24$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-062$c$, $c$A$c$, $c$$(-48) \div (-2)$$c$, true, null),
  ($c$M1-ENT-062$c$, $c$B$c$, $c$$(-1)\cdot 3 \cdot 8$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-062$c$, $c$C$c$, $c$$(-12)\cdot 2$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-062$c$, $c$D$c$, $c$$24 \cdot 0$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-063$c$, $c$A$c$, $c$$-6$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-063$c$, $c$B$c$, $c$$486$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-063$c$, $c$C$c$, $c$$6$$c$, true, null),
  ($c$M1-ENT-063$c$, $c$D$c$, $c$$-45$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-064$c$, $c$A$c$, $c$$-300$ m$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-064$c$, $c$B$c$, $c$$-28$ m$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-064$c$, $c$C$c$, $c$$12$ m$c$, false, $c$ENT-ADI-VARORDEN$c$),
  ($c$M1-ENT-064$c$, $c$D$c$, $c$$-12$ m$c$, true, null),
  ($c$M1-ENT-065$c$, $c$A$c$, $c$Solo III$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-065$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-065$c$, $c$C$c$, $c$Solo I$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-065$c$, $c$D$c$, $c$I, II y III$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-066$c$, $c$A$c$, $c$Solo II$c$, true, null),
  ($c$M1-ENT-066$c$, $c$B$c$, $c$Solo II y III$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-066$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-066$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-067$c$, $c$A$c$, $c$$p \cdot p \cdot q$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-067$c$, $c$B$c$, $c$$p \cdot 0 \cdot q$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-067$c$, $c$C$c$, $c$$p \cdot p$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-067$c$, $c$D$c$, $c$$p \cdot q \cdot q$$c$, true, null),
  ($c$M1-ENT-068$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-068$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-068$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-ENT-068$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-069$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-069$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-069$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-069$c$, $c$D$c$, $c$Solo I$c$, true, null),
  ($c$M1-ENT-070$c$, $c$A$c$, $c$$12$, porque $-12 + 12 = 0$.$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-070$c$, $c$B$c$, $c$$0$, porque cualquier número multiplicado por $0$ da $0$.$c$, true, null),
  ($c$M1-ENT-070$c$, $c$C$c$, $c$Ninguno, porque multiplicar por $0$ deja el número igual.$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-070$c$, $c$D$c$, $c$Ninguno, porque $0 \div (-12)$ no está definido.$c$, false, $c$ENT-MUL-DIVCERO$c$),
  ($c$M1-ENT-071$c$, $c$A$c$, $c$$a \cdot a \cdot 5$$c$, false, $c$ENT-MUL-MAYORIA$c$),
  ($c$M1-ENT-071$c$, $c$B$c$, $c$$a \cdot a$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-071$c$, $c$C$c$, $c$$2 \cdot 5 \cdot a$$c$, true, null),
  ($c$M1-ENT-071$c$, $c$D$c$, $c$$a \cdot 0$$c$, false, $c$ENT-MUL-CERONEUTRO$c$),
  ($c$M1-ENT-072$c$, $c$A$c$, $c$$-3.000$$c$, true, null),
  ($c$M1-ENT-072$c$, $c$B$c$, $c$$-75.000$$c$, false, $c$ENT-MUL-INVERSA$c$),
  ($c$M1-ENT-072$c$, $c$C$c$, $c$$-5.625$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-072$c$, $c$D$c$, $c$$3.000$$c$, false, $c$ENT-REC-CTXSIGNO$c$)
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
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-049$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-050$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-051$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-052$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-053$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-054$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-055$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-056$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-057$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-058$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-059$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-060$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-061$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-062$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-063$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-064$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-065$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-066$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-067$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-068$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-069$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-070$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-071$c$),
  ($c$NUM-ENT-MUL$c$, $c$M1-ENT-072$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$ENT-MUL-REGLASUMA$c$, $c$Signos iguales, positivo; signos distintos, negativo$c$, $c$Usaste la regla de la suma para multiplicar. Por ejemplo, dijiste que
$(-6)\cdot(-2)$ es $-12$, como cuando sumas dos deudas, o le pusiste
al producto el signo del número más grande.

**En la multiplicación y la división, signos iguales dan positivo y
signos distintos dan negativo. El tamaño de los números no decide el
signo.**

$(-6)\cdot 2$ es sumar dos veces $-6$: $-12$. Multiplicar por $-2$ en
vez de $2$ da el resultado al otro lado del $0$:

$$(-6)\cdot(-2) = 12$$

Y en $(-2) \cdot 6$ los signos son distintos, así que el resultado es
$-12$, aunque el $6$ sea más grande y positivo.

Un control rápido: separa la cuenta en dos preguntas. El tamaño sale
de multiplicar $6 \cdot 2 = 12$. El signo sale solo de comparar los
signos: ¿iguales o distintos?$c$),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$ENT-MUL-MAYORIA$c$, $c$El signo lo decide cuántos negativos hay$c$, $c$Con varios factores, le pusiste al resultado el signo que más se
repetía. Por ejemplo, en $(-3)\cdot 2 \cdot 5$ viste más positivos y
dijiste $30$.

**Con varios factores, cuenta solo los negativos: si son una
cantidad par, el producto es positivo; si son impar, negativo.**

Multiplica de a dos y mira qué pasa con el signo:

$$(-3)\cdot 2 = -6 \qquad (-6)\cdot 5 = -30$$

Los factores positivos no cambian el signo: multiplicar por $2$ o por
$5$ deja el signo como estaba. Cada negativo, en cambio, lo da vuelta.
Por eso importa cuántas vueltas hay, no cuántos positivos.

Un control rápido: tacha los factores positivos y cuenta lo que queda.
Un negativo: resultado negativo. Dos: positivo. Tres: negativo.$c$),
  ($c$REM-ENT-MUL-SUMA$c$, $c$ENT-MUL-SUMA$c$, $c$Dos paréntesis seguidos se multiplican$c$, $c$Sumaste números que se estaban multiplicando. Por ejemplo, leíste
$(-8)(3)$ como $-8 + 3$ y respondiste $-5$.

**Cuando dos paréntesis van pegados, o un número va pegado a un
paréntesis, hay una multiplicación aunque no se vea el punto.**

$$(-8)(3) = (-8)\cdot 3 = -24$$

$$2(-8) = 2 \cdot (-8) = -16$$

Para sumar tiene que aparecer el signo $+$ entre los números:
$(-8) + 3 = -5$.

En un problema pasa lo mismo: si algo se repite (baja $8$ metros,
$3$ veces), es una multiplicación, no una suma de los dos datos.

Un control rápido: si entre dos números no hay ningún signo de
operación, pon un punto de multiplicación antes de calcular.$c$),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$ENT-MUL-DIVCERO$c$, $c$Se puede dividir el cero, no dividir por cero$c$, $c$Confundiste el cero que se divide con el cero que divide. Por
ejemplo, dijiste que $(-6) \div 0$ es $0$, o que $0 \div (-6)$ no se
puede calcular.

**$0 \div a = 0$ para cualquier $a$ distinto de cero. En cambio,
$a \div 0$ no está definido.**

Toda división se comprueba con una multiplicación:

- $0 \div (-6)$ pregunta qué número por $-6$ da $0$. Respuesta: $0$.
- $(-6) \div 0$ pregunta qué número por $0$ da $-6$. Cualquier
  número por $0$ da $0$, nunca $-6$. No hay respuesta.

Un control rápido: mira dónde está el cero. Arriba (el que se divide),
el resultado es $0$. Abajo (el divisor), la división no existe.$c$),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$ENT-MUL-CERONEUTRO$c$, $c$Un factor cero hace cero todo el producto$c$, $c$Te saltaste el cero en una multiplicación, como si no cambiara nada.
Por ejemplo, en $(-5)\cdot 0 \cdot (-2)$ multiplicaste solo
$(-5)\cdot(-2)$ y respondiste $10$.

**Si uno de los factores es $0$, el producto completo es $0$.**

El número que no cambia nada al multiplicar es el $1$, no el $0$:
$(-5)\cdot 1 = -5$. Multiplicar por $0$ es tomar el número cero
veces:

$$(-5)\cdot 0 = 0 \qquad 0 \cdot (-2) = 0$$

Da lo mismo cuántos factores haya o qué signos tengan: basta un cero
para que todo sea $0$.

Un control rápido: antes de contar negativos o multiplicar tamaños,
busca si hay un $0$ entre los factores.$c$),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$ENT-MUL-INVERSA$c$, $c$Para encontrar el factor que falta, se divide$c$, $c$Multiplicaste cuando había que dividir. Por ejemplo, para saber qué
número multiplicado por $-3$ da $24$, hiciste $24 \cdot (-3) = -72$.

**Si conoces el producto y uno de los factores, el otro factor se
obtiene dividiendo el producto por el factor conocido.**

$$? \cdot (-3) = 24 \quad\Rightarrow\quad ? = 24 \div (-3) = -8$$

Lo mismo al repartir: si algo cambió $-24$ en total en $3$ partes
iguales, cada parte es $(-24) \div 3 = -8$. Repartir es dividir.

Un control rápido: reemplaza tu respuesta en la multiplicación. Con
$-72$ quedaría $(-72)\cdot(-3) = 216$, que no es $24$. Con $-8$:
$(-8)\cdot(-3) = 24$.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-MUL-REGLASUMA$c$, $c$REM-ENT-MUL-MAYORIA$c$, $c$REM-ENT-MUL-SUMA$c$, $c$REM-ENT-MUL-DIVCERO$c$, $c$REM-ENT-MUL-CERONEUTRO$c$, $c$REM-ENT-MUL-INVERSA$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-051$c$, 1::smallint),
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-052$c$, 2::smallint),
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-060$c$, 3::smallint),
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-061$c$, 4::smallint),
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-068$c$, 5::smallint),
  ($c$REM-ENT-MUL-REGLASUMA$c$, $c$M1-ENT-069$c$, 6::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-052$c$, 1::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-056$c$, 2::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-058$c$, 3::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-061$c$, 4::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-066$c$, 5::smallint),
  ($c$REM-ENT-MUL-MAYORIA$c$, $c$M1-ENT-067$c$, 6::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-051$c$, 1::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-053$c$, 2::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-060$c$, 3::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-063$c$, 4::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-069$c$, 5::smallint),
  ($c$REM-ENT-MUL-SUMA$c$, $c$M1-ENT-070$c$, 6::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-049$c$, 1::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-055$c$, 2::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-061$c$, 3::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-065$c$, 4::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-066$c$, 5::smallint),
  ($c$REM-ENT-MUL-DIVCERO$c$, $c$M1-ENT-070$c$, 6::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-052$c$, 1::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-055$c$, 2::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-058$c$, 3::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-062$c$, 4::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-068$c$, 5::smallint),
  ($c$REM-ENT-MUL-CERONEUTRO$c$, $c$M1-ENT-070$c$, 6::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-053$c$, 1::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-054$c$, 2::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-060$c$, 3::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-063$c$, 4::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-069$c$, 5::smallint),
  ($c$REM-ENT-MUL-INVERSA$c$, $c$M1-ENT-072$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-03$c$, $c$NUM-ENT$c$, $c$Multiplicación y división de enteros$c$, $c$Multiplicar y dividir enteros es lo mismo que con naturales, más una
pregunta: ¿qué signo tiene el resultado? Esa regla la vas a usar en
potencias, en álgebra y en cada ecuación que resuelvas.

## Multiplicación y división de enteros

### Primero el tamaño, después el signo

El **tamaño** de un número es su distancia al $0$: el tamaño de $-8$ es
$8$. Para multiplicar o dividir dos enteros, separa las dos preguntas:

1. El tamaño del resultado: multiplicas o divides los tamaños, como con
   naturales.
2. El signo del resultado: lo decide la regla de signos.

Por ejemplo, en $(-5) \cdot 9$ el tamaño es $5 \cdot 9 = 45$. Falta el
signo.

### La regla de signos

**Signos iguales dan positivo. Signos distintos dan negativo.**

$$(+)\cdot(+) = + \qquad (-)\cdot(-) = + \qquad (+)\cdot(-) = - \qquad (-)\cdot(+) = -$$

La división sigue exactamente la misma regla: $(-45) \div (-9) = 5$ y
$45 \div (-9) = -5$.

Por qué menos por menos da más: $(-5) \cdot 9$ es sumar nueve veces
$-5$, y da $-45$. Multiplicar por $-9$ es lo contrario de multiplicar
por $9$: el resultado cambia de lado. Por eso $(-5)\cdot(-9) = 45$.

### El error que más se comete

La regla de la multiplicación **no es la de la suma**. En la suma, dos
negativos juntan una deuda más grande: $-5 + (-9) = -14$. En la
multiplicación, dos negativos dan positivo: $(-5)\cdot(-9) = 45$.

Y en la multiplicación no importa cuál número es más grande. En la suma
$-3 + 11$ gana el signo del $11$. En $(-3) \cdot 11$ no gana nadie: los
signos son distintos, así que el resultado es $-33$.

Un control rápido: **si en tu cuenta hay una multiplicación o una
división, olvídate de «cuál es más grande» para el signo.** Solo mira si
los signos son iguales o distintos.

Cuidado también con la escritura. $(-7)(4)$, sin nada entre los
paréntesis, es una multiplicación: $(-7)(4) = -28$. No es $-7 + 4$.

### Muchos factores: cuenta los negativos

Con tres o más factores, multiplica los tamaños y después **cuenta
cuántos factores son negativos**:

- una cantidad par de negativos: el resultado es positivo;
- una cantidad impar de negativos: el resultado es negativo.

$$(-2)\cdot 3 \cdot (-1) \cdot 7 = 42 \quad \text{(dos negativos)}$$

No importa si hay más positivos que negativos. En
$(-1)\cdot 2 \cdot 3 \cdot 5$ hay tres positivos y un solo negativo, y el
resultado es $-30$: un negativo es cantidad impar.

### El cero

- Si un factor es $0$, el producto es $0$: $(-13) \cdot 0 \cdot 4 = 0$. El
  cero no se salta.
- El cero dividido por cualquier número distinto de cero es $0$:
  $0 \div (-9) = 0$.
- **Dividir por cero no está definido.** $(-9) \div 0$ no tiene
  resultado: ningún número multiplicado por $0$ da $-9$.

Para no confundir los dos últimos, vuelve a la multiplicación. $0 \div
(-9)$ pregunta qué número por $-9$ da $0$: el $0$. $(-9) \div 0$
pregunta qué número por $0$ da $-9$: ninguno.

### El número que falta

Multiplicar y dividir son operaciones inversas. Si te preguntan qué
número multiplicado por $-4$ da $52$, **divide**: $52 \div (-4) = -13$.
Comprueba multiplicando: $(-13)\cdot(-4) = 52$.

La comprobación sirve siempre: una división está bien si al multiplicar
el resultado por el divisor vuelves al dividendo.

### Situaciones

Primero traduce, después opera. Lo que baja, se pierde o se debe es
negativo.

Si un buzo desciende $4$ metros por minuto durante $9$ minutos, su
cambio de posición es $(-4) \cdot 9 = -36$ metros.

Si una deuda de $\$30.000$ se reparte en partes iguales entre $5$
personas, cada una debe $(-30.000) \div 5 = -6.000$ pesos. Repartir es
dividir; el signo dice que sigue siendo deuda.

Cuando te dan el valor inicial y el final, calcula primero la variación
(final menos inicial) y después divide por el número de horas, días o
pasos.$c$, 3::smallint)
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
  ($c$LES-NUM-ENT-03$c$, $c$NUM-ENT-MUL$c$, 1::smallint, $c$multiplicacion-y-division-de-enteros$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-ENT-049$c$, $c$M1-ENT-050$c$, $c$M1-ENT-051$c$, $c$M1-ENT-052$c$, $c$M1-ENT-053$c$, $c$M1-ENT-054$c$, $c$M1-ENT-055$c$, $c$M1-ENT-056$c$, $c$M1-ENT-057$c$, $c$M1-ENT-058$c$, $c$M1-ENT-059$c$, $c$M1-ENT-060$c$, $c$M1-ENT-061$c$, $c$M1-ENT-062$c$, $c$M1-ENT-063$c$, $c$M1-ENT-064$c$, $c$M1-ENT-065$c$, $c$M1-ENT-066$c$, $c$M1-ENT-067$c$, $c$M1-ENT-068$c$, $c$M1-ENT-069$c$, $c$M1-ENT-070$c$, $c$M1-ENT-071$c$, $c$M1-ENT-072$c$);
  if c <> 24 then
    raise exception 'items: se esperaban 24, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-049$c$, $c$M1-ENT-050$c$, $c$M1-ENT-051$c$, $c$M1-ENT-052$c$, $c$M1-ENT-053$c$, $c$M1-ENT-054$c$, $c$M1-ENT-055$c$, $c$M1-ENT-056$c$, $c$M1-ENT-057$c$, $c$M1-ENT-058$c$, $c$M1-ENT-059$c$, $c$M1-ENT-060$c$, $c$M1-ENT-061$c$, $c$M1-ENT-062$c$, $c$M1-ENT-063$c$, $c$M1-ENT-064$c$, $c$M1-ENT-065$c$, $c$M1-ENT-066$c$, $c$M1-ENT-067$c$, $c$M1-ENT-068$c$, $c$M1-ENT-069$c$, $c$M1-ENT-070$c$, $c$M1-ENT-071$c$, $c$M1-ENT-072$c$);
  if c <> 96 then
    raise exception 'item_options: se esperaban 96, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-049$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-050$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-051$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-052$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-053$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-054$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-055$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-056$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-057$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-058$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-059$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-060$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-061$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-062$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-063$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-064$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-065$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-066$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-067$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-068$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-069$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-070$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-071$c$, $c$NUM-ENT-MUL$c$),
      ($c$M1-ENT-072$c$, $c$NUM-ENT-MUL$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 24 then
    raise exception 'node_items: 24 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-049$c$, $c$M1-ENT-050$c$, $c$M1-ENT-051$c$, $c$M1-ENT-052$c$, $c$M1-ENT-053$c$, $c$M1-ENT-054$c$, $c$M1-ENT-055$c$, $c$M1-ENT-056$c$, $c$M1-ENT-057$c$, $c$M1-ENT-058$c$, $c$M1-ENT-059$c$, $c$M1-ENT-060$c$, $c$M1-ENT-061$c$, $c$M1-ENT-062$c$, $c$M1-ENT-063$c$, $c$M1-ENT-064$c$, $c$M1-ENT-065$c$, $c$M1-ENT-066$c$, $c$M1-ENT-067$c$, $c$M1-ENT-068$c$, $c$M1-ENT-069$c$, $c$M1-ENT-070$c$, $c$M1-ENT-071$c$, $c$M1-ENT-072$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-VARORDEN$c$, $c$ENT-MUL-CERONEUTRO$c$, $c$ENT-MUL-DIVCERO$c$, $c$ENT-MUL-INVERSA$c$, $c$ENT-MUL-MAYORIA$c$, $c$ENT-MUL-REGLASUMA$c$, $c$ENT-MUL-SUMA$c$, $c$ENT-REC-CTXSIGNO$c$)
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

-- 24 ítems (24 curated), 96 alternativas, 9 misconceptions referenciadas,
-- 6 remediaciones, 0 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 24 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-ENT-049$c$, $c$M1-ENT-050$c$, $c$M1-ENT-051$c$, $c$M1-ENT-052$c$, $c$M1-ENT-053$c$, $c$M1-ENT-054$c$, $c$M1-ENT-055$c$, $c$M1-ENT-056$c$, $c$M1-ENT-057$c$, $c$M1-ENT-058$c$, $c$M1-ENT-059$c$, $c$M1-ENT-060$c$, $c$M1-ENT-061$c$, $c$M1-ENT-062$c$, $c$M1-ENT-063$c$, $c$M1-ENT-064$c$, $c$M1-ENT-065$c$, $c$M1-ENT-066$c$, $c$M1-ENT-067$c$, $c$M1-ENT-068$c$, $c$M1-ENT-069$c$, $c$M1-ENT-070$c$, $c$M1-ENT-071$c$, $c$M1-ENT-072$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-MUL-REGLASUMA$c$, $c$REM-ENT-MUL-MAYORIA$c$, $c$REM-ENT-MUL-SUMA$c$, $c$REM-ENT-MUL-DIVCERO$c$, $c$REM-ENT-MUL-CERONEUTRO$c$, $c$REM-ENT-MUL-INVERSA$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-03$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-ENT-049$c$, $c$M1-ENT-050$c$, $c$M1-ENT-051$c$, $c$M1-ENT-052$c$, $c$M1-ENT-053$c$, $c$M1-ENT-054$c$, $c$M1-ENT-055$c$, $c$M1-ENT-056$c$, $c$M1-ENT-057$c$, $c$M1-ENT-058$c$, $c$M1-ENT-059$c$, $c$M1-ENT-060$c$, $c$M1-ENT-061$c$, $c$M1-ENT-062$c$, $c$M1-ENT-063$c$, $c$M1-ENT-064$c$, $c$M1-ENT-065$c$, $c$M1-ENT-066$c$, $c$M1-ENT-067$c$, $c$M1-ENT-068$c$, $c$M1-ENT-069$c$, $c$M1-ENT-070$c$, $c$M1-ENT-071$c$, $c$M1-ENT-072$c$) group by 1;
