-- =====================================================================
-- LES-ALG-EXP-03 — Términos semejantes y suma de polinomios
-- Generado por cargar_contenido.py desde LES-ALG-EXP-03.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-EXP-046$c$, $c$¿Cuál es el resultado de reducir $5x + 3x$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-047$c$, $c$¿Cuál es el resultado de reducir $7a + 2b + a$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-048$c$, $c$¿Cuál de los siguientes pares de términos son semejantes?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-049$c$, $c$¿Cuál es el resultado de reducir $9m - m + 2m^2$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-050$c$, $c$¿Cuál es el resultado de reducir $-6y + 2y + y^2$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-051$c$, $c$¿Cuál es el resultado de reducir $-3p - 5p$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-052$c$, $c$¿Cuál es el resultado de reducir $4x + 3 + 2x - 1$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-053$c$, $c$¿Cuál es el resultado de reducir $2ab + 3ba$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-054$c$, $c$Sofía tiene $x$ láminas, Tomás tiene el triple que Sofía y Luis tiene $5$ menos que Tomás. ¿Qué expresión representa la cantidad de láminas que tienen entre los tres?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-055$c$, $c$¿Cuál es el resultado de reducir $4x - 2y - 3x + 5y$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-056$c$, $c$¿Cuál es el resultado de reducir $3x^2 + 5x - x^2 + 2x$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-057$c$, $c$¿Cuál es el resultado de reducir $5ab - 2a + 3ab - 7a$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-058$c$, $c$En una librería cada cuaderno cuesta $p$ pesos y cada lápiz $q$ pesos. Ana compra $3$ cuadernos y $2$ lápices, y Beto compra $2$ cuadernos y $5$ lápices. ¿Qué expresión representa lo que gastan entre los dos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-059$c$, $c$¿Cuál es el resultado de reducir $6xy - 2yx + x$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-060$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-061$c$, $c$¿Cuál expresión es equivalente a $a + a + a + b + b$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-062$c$, $c$Considera las siguientes igualdades:

I. $3x + 2x = 5x$

II. $4a^2 + 3a = 7a^2$

III. $6b - b = 6$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-063$c$, $c$Un sitio web tuvo $v$ visitas el lunes. El martes tuvo el doble de visitas que el lunes, y el miércoles tuvo $30$ visitas menos que el martes. ¿Qué expresión representa el total de visitas de los tres días?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-064$c$, $c$Los términos $3x^ny$ y $-2x^2y$ son semejantes. ¿Cuál es el resultado de sumarlos?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-065$c$, $c$Considera las siguientes afirmaciones:

I. $x^2 + x^2 = 2x^2$

II. $x^2$ y $x$ son semejantes, porque tienen la misma letra.

III. $-3a - a = -4a$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-066$c$, $c$Una tienda vende poleras a $p$ pesos cada una. El lunes vendió $12$ poleras, el martes $8$ menos que el lunes, y el miércoles le devolvieron $3$ poleras y devolvió el dinero. ¿Qué expresión representa el dinero que ganó la tienda en los tres días?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-067$c$, $c$¿Cuál es el resultado de reducir $-4ab + 7ab - 3ab$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-068$c$, $c$¿Qué expresión representa «el triple de un número, más el doble del mismo número, menos el número»?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-069$c$, $c$¿Cuál de los siguientes desarrollos para reducir $5a - 3b + 2a - b$ es correcto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-070$c$, $c$¿Cuál es el resultado de $2a - (5a - 4)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-071$c$, $c$¿Cuál es el resultado de $(4x + 3) + (2x - 7)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-072$c$, $c$¿Cuál es el resultado de $(5y - 2) - (3y + 1)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-073$c$, $c$¿Cuál expresión es igual a $-(-2m + 6)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-074$c$, $c$Ana tenía $3x + 2$ dulces y regaló $x - 4$ de ellos. ¿Qué expresión representa la cantidad de dulces que le quedan?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-075$c$, $c$¿Cuál es el resultado de $(x^2 + 3x) + (2x^2 - x)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-076$c$, $c$¿Cuál expresión es equivalente a $7 - (2x - 3)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-077$c$, $c$¿Cuál es el resultado de $(6a - 1) + (-2a + 5)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-078$c$, $c$¿Cuál es el resultado de $-(a + b) + (a - b)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-079$c$, $c$¿Cuál es el resultado de $3m - (m + 2) + (4 - m)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-080$c$, $c$Si $P = 3x^2 - 2x + 1$ y $Q = x^2 + 4x - 3$, ¿cuál es el resultado de $P - Q$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-081$c$, $c$Si $A = 5a - 2b$ y $B = -a + 3b$, ¿cuál es el resultado de $A + B$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-082$c$, $c$Un taller tenía $2n + 5$ inscritos. Se retiraron $n - 3$ y después se inscribieron $n + 1$ más. ¿Qué expresión representa la cantidad de inscritos al final?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-083$c$, $c$¿Cuál es el resultado de $(2x^2 - 3x) - (x^2 - 3x)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-084$c$, $c$Si $M = x - 2$, ¿cuál es el resultado de $3x - M$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-085$c$, $c$¿Cuál es el resultado de $(3a + 2b) - (a - 4b) + (-2a + b)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-086$c$, $c$¿Qué expresión hay que restarle a $5x + 2$ para obtener $3x - 4$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-087$c$, $c$¿Cuál es el resultado de $-[\,x - (2 - x)\,]$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-088$c$, $c$Considera las siguientes igualdades:

I. $-(a - b) = -a + b$

II. $+(x - 3) = x + 3$

III. $a - (b + c) = a - b + c$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-089$c$, $c$Pedro tenía $4k - 1$ figuritas. Le regaló $2k - 5$ a su hermana y después ella le devolvió $k - 2$. ¿Qué expresión representa las figuritas que tiene Pedro ahora?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-090$c$, $c$Sean $P$ y $Q$ dos polinomios. ¿Cuál de las siguientes afirmaciones es **siempre** verdadera?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-091$c$, $c$¿Cuál de los siguientes desarrollos de $5x - (2x - 3) - (x + 4)$ es correcto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-092$c$, $c$El sueldo de Ana es $4s + 50$ y el de Beto es $s - 30$, en miles de pesos. ¿Cuál es el exceso del sueldo de Ana sobre el de Beto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-093$c$, $c$Si $A = 2x - 1$, $B = x + 3$ y $C = 4 - x$, ¿cuál es el resultado de $A - B - C$?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-EXP-046$c$, $c$A$c$, $c$$8 + 2x$$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-046$c$, $c$B$c$, $c$$8x^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-046$c$, $c$C$c$, $c$$8x$$c$, true, null),
  ($c$M1-EXP-046$c$, $c$D$c$, $c$$15x^2$$c$, false, $c$EXP-TERM-MULTIPLICA$c$),
  ($c$M1-EXP-047$c$, $c$A$c$, $c$$8a + 2b$$c$, true, null),
  ($c$M1-EXP-047$c$, $c$B$c$, $c$$7a + 2b$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-047$c$, $c$C$c$, $c$$10ab$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-047$c$, $c$D$c$, $c$$8a^2 + 2b$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-048$c$, $c$A$c$, $c$$5a$ y $5b$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-048$c$, $c$B$c$, $c$$x^2$ y $2x$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-048$c$, $c$C$c$, $c$$3x^2$ y $3x$$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-048$c$, $c$D$c$, $c$$4x^2y$ y $-7x^2y$$c$, true, null),
  ($c$M1-EXP-049$c$, $c$A$c$, $c$$9m + 2m^2$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-049$c$, $c$B$c$, $c$$8m + 2m^2$$c$, true, null),
  ($c$M1-EXP-049$c$, $c$C$c$, $c$$9 + 2m^2$$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-049$c$, $c$D$c$, $c$$10m^2$$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-050$c$, $c$A$c$, $c$$-8y + y^2$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-EXP-050$c$, $c$B$c$, $c$$-3y^2$$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-050$c$, $c$C$c$, $c$$-4y$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-050$c$, $c$D$c$, $c$$-4y + y^2$$c$, true, null),
  ($c$M1-EXP-051$c$, $c$A$c$, $c$$8p$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-051$c$, $c$B$c$, $c$$-8p$$c$, true, null),
  ($c$M1-EXP-051$c$, $c$C$c$, $c$$15p^2$$c$, false, $c$EXP-TERM-MULTIPLICA$c$),
  ($c$M1-EXP-051$c$, $c$D$c$, $c$$-2p$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-EXP-052$c$, $c$A$c$, $c$$8x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-052$c$, $c$B$c$, $c$$6x^2 + 2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-052$c$, $c$C$c$, $c$$6x + 2$$c$, true, null),
  ($c$M1-EXP-052$c$, $c$D$c$, $c$$6x + 4$$c$, false, $c$EXP-TERM-SIGNOSUELTO$c$),
  ($c$M1-EXP-053$c$, $c$A$c$, $c$$5ab$$c$, true, null),
  ($c$M1-EXP-053$c$, $c$B$c$, $c$$6a^2b^2$$c$, false, $c$EXP-TERM-MULTIPLICA$c$),
  ($c$M1-EXP-053$c$, $c$C$c$, $c$$5a^2b^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-053$c$, $c$D$c$, $c$$5 + 2a + 2b$$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-054$c$, $c$A$c$, $c$$7x - 5$$c$, true, null),
  ($c$M1-EXP-054$c$, $c$B$c$, $c$$2x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-054$c$, $c$C$c$, $c$$6x - 5$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-054$c$, $c$D$c$, $c$$3x + 1$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-055$c$, $c$A$c$, $c$$7x + 3y$$c$, false, $c$EXP-TERM-SIGNOSUELTO$c$),
  ($c$M1-EXP-055$c$, $c$B$c$, $c$$4xy$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-055$c$, $c$C$c$, $c$$1 + 3y$$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-055$c$, $c$D$c$, $c$$x + 3y$$c$, true, null),
  ($c$M1-EXP-056$c$, $c$A$c$, $c$$2x^4 + 7x^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-056$c$, $c$B$c$, $c$$2x^2 + 7x$$c$, true, null),
  ($c$M1-EXP-056$c$, $c$C$c$, $c$$9x^2$$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-056$c$, $c$D$c$, $c$$3x^2 + 7x$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-057$c$, $c$A$c$, $c$$8ab + 9a$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-057$c$, $c$B$c$, $c$$8a^2b^2 - 9a^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-057$c$, $c$C$c$, $c$$8ab - 9a$$c$, true, null),
  ($c$M1-EXP-057$c$, $c$D$c$, $c$$-ab$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-058$c$, $c$A$c$, $c$$5p^2 + 7q^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-058$c$, $c$B$c$, $c$$12pq$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-058$c$, $c$C$c$, $c$$12 + 2p + 2q$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-058$c$, $c$D$c$, $c$$5p + 7q$$c$, true, null),
  ($c$M1-EXP-059$c$, $c$A$c$, $c$$5xy$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-059$c$, $c$B$c$, $c$$4xy$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-059$c$, $c$C$c$, $c$$4xy + x$$c$, true, null),
  ($c$M1-EXP-059$c$, $c$D$c$, $c$$4x^2y^2 + x$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-060$c$, $c$A$c$, $c$$4w + w = 4w$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-060$c$, $c$B$c$, $c$$8n - 7n = n$$c$, true, null),
  ($c$M1-EXP-060$c$, $c$C$c$, $c$$2z + 2z = 4z^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-060$c$, $c$D$c$, $c$$6k - 5k = 1$$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-061$c$, $c$A$c$, $c$$3a + 2b$$c$, true, null),
  ($c$M1-EXP-061$c$, $c$B$c$, $c$$a^3 + b^2$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-061$c$, $c$C$c$, $c$$5ab$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-061$c$, $c$D$c$, $c$$6ab$$c$, false, $c$EXP-TERM-MULTIPLICA$c$),
  ($c$M1-EXP-062$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-062$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-062$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-062$c$, $c$D$c$, $c$Solo I$c$, true, null),
  ($c$M1-EXP-063$c$, $c$A$c$, $c$$5v - 30$$c$, true, null),
  ($c$M1-EXP-063$c$, $c$B$c$, $c$$-25v$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-063$c$, $c$C$c$, $c$$v + 30$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-063$c$, $c$D$c$, $c$$4v - 30$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-064$c$, $c$A$c$, $c$$5x^2y$$c$, false, $c$EXP-TERM-SIGNOSUELTO$c$),
  ($c$M1-EXP-064$c$, $c$B$c$, $c$$-6x^4y^2$$c$, false, $c$EXP-TERM-MULTIPLICA$c$),
  ($c$M1-EXP-064$c$, $c$C$c$, $c$$x^2y$$c$, true, null),
  ($c$M1-EXP-064$c$, $c$D$c$, $c$$x^4y^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-065$c$, $c$A$c$, $c$Solo III$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-065$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-EXP-065$c$, $c$C$c$, $c$I, II y III$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-065$c$, $c$D$c$, $c$Solo I$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-066$c$, $c$A$c$, $c$$13 + p$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-066$c$, $c$B$c$, $c$$5p$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-066$c$, $c$C$c$, $c$$13p$$c$, true, null),
  ($c$M1-EXP-066$c$, $c$D$c$, $c$$19p$$c$, false, $c$EXP-TERM-SIGNOSUELTO$c$),
  ($c$M1-EXP-067$c$, $c$A$c$, $c$$-14ab$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-EXP-067$c$, $c$B$c$, $c$$14ab$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-067$c$, $c$C$c$, $c$$3a^2b^2 - 3ab$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-067$c$, $c$D$c$, $c$$0$$c$, true, null),
  ($c$M1-EXP-068$c$, $c$A$c$, $c$$5x$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-068$c$, $c$B$c$, $c$$4x$$c$, true, null),
  ($c$M1-EXP-068$c$, $c$C$c$, $c$$5$$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-068$c$, $c$D$c$, $c$$x^3 + x^2 - x$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-069$c$, $c$A$c$, $c$$(5a + 2a) + (-3b - b) = 7a - 4b$$c$, true, null),
  ($c$M1-EXP-069$c$, $c$B$c$, $c$$(5a + 2a) + (-3b + b) = 7a - 2b$$c$, false, $c$EXP-TERM-SIGNOSUELTO$c$),
  ($c$M1-EXP-069$c$, $c$C$c$, $c$$(5a + 2a) + (-3b - b) = 7a + 4b$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-069$c$, $c$D$c$, $c$$(5a + 2a) + (-3b - b) = 7a - 3b$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-070$c$, $c$A$c$, $c$$-3a - 4$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-070$c$, $c$B$c$, $c$$-3a + 4$$c$, true, null),
  ($c$M1-EXP-070$c$, $c$C$c$, $c$$7a - 4$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-070$c$, $c$D$c$, $c$$a$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-071$c$, $c$A$c$, $c$$6x + 10$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-071$c$, $c$B$c$, $c$$6x^2 - 4$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-071$c$, $c$C$c$, $c$$6x - 4$$c$, true, null),
  ($c$M1-EXP-071$c$, $c$D$c$, $c$$2x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-072$c$, $c$A$c$, $c$$2y - 3$$c$, true, null),
  ($c$M1-EXP-072$c$, $c$B$c$, $c$$-y$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-072$c$, $c$C$c$, $c$$2y - 1$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-072$c$, $c$D$c$, $c$$2y + 3$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-073$c$, $c$A$c$, $c$$2m + 6$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-073$c$, $c$B$c$, $c$$-4m$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-073$c$, $c$C$c$, $c$$-2m + 6$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-073$c$, $c$D$c$, $c$$2m - 6$$c$, true, null),
  ($c$M1-EXP-074$c$, $c$A$c$, $c$$-2x - 6$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-074$c$, $c$B$c$, $c$$4x - 2$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-074$c$, $c$C$c$, $c$$2x - 2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-074$c$, $c$D$c$, $c$$2x + 6$$c$, true, null),
  ($c$M1-EXP-075$c$, $c$A$c$, $c$$3x^2 + 2x$$c$, true, null),
  ($c$M1-EXP-075$c$, $c$B$c$, $c$$5x^2$$c$, false, $c$EXP-TERM-GRADO$c$),
  ($c$M1-EXP-075$c$, $c$C$c$, $c$$2x^2 + 3x$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-075$c$, $c$D$c$, $c$$3x^4 + 2x^2$$c$, false, $c$EXP-TERM-EXPSUMA$c$),
  ($c$M1-EXP-076$c$, $c$A$c$, $c$$8x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-076$c$, $c$B$c$, $c$$10 - 2x$$c$, true, null),
  ($c$M1-EXP-076$c$, $c$C$c$, $c$$4 - 2x$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-076$c$, $c$D$c$, $c$$4 + 2x$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-077$c$, $c$A$c$, $c$$8a$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-077$c$, $c$B$c$, $c$$-8a + 4$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-EXP-077$c$, $c$C$c$, $c$$4a + 4$$c$, true, null),
  ($c$M1-EXP-077$c$, $c$D$c$, $c$$8a - 6$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-078$c$, $c$A$c$, $c$$0$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-078$c$, $c$B$c$, $c$$-2b$$c$, true, null),
  ($c$M1-EXP-078$c$, $c$C$c$, $c$$2a$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-078$c$, $c$D$c$, $c$$2b$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-079$c$, $c$A$c$, $c$$3m + 2$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-079$c$, $c$B$c$, $c$$3m - 6$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-079$c$, $c$C$c$, $c$$m + 2$$c$, true, null),
  ($c$M1-EXP-079$c$, $c$D$c$, $c$$m + 6$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-080$c$, $c$A$c$, $c$$2x^2 - 6x + 4$$c$, true, null),
  ($c$M1-EXP-080$c$, $c$B$c$, $c$$2x^2 + 6x + 4$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-EXP-080$c$, $c$C$c$, $c$$-2x^2 + 6x - 4$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-080$c$, $c$D$c$, $c$$2x^2 + 2x - 2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-081$c$, $c$A$c$, $c$$5ab$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-081$c$, $c$B$c$, $c$$-6a + b$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-EXP-081$c$, $c$C$c$, $c$$6a - 5b$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-081$c$, $c$D$c$, $c$$4a + b$$c$, true, null),
  ($c$M1-EXP-082$c$, $c$A$c$, $c$$2n + 3$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-082$c$, $c$B$c$, $c$$4n + 3$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-082$c$, $c$C$c$, $c$$11n$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-082$c$, $c$D$c$, $c$$2n + 9$$c$, true, null),
  ($c$M1-EXP-083$c$, $c$A$c$, $c$$x^2 - 6x$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-083$c$, $c$B$c$, $c$$2x^2$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-083$c$, $c$C$c$, $c$$x^2$$c$, true, null),
  ($c$M1-EXP-083$c$, $c$D$c$, $c$$1$$c$, false, $c$EXP-TERM-CANCELA$c$),
  ($c$M1-EXP-084$c$, $c$A$c$, $c$$2x + 2$$c$, true, null),
  ($c$M1-EXP-084$c$, $c$B$c$, $c$$4x - 2$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-084$c$, $c$C$c$, $c$$2x - 2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-084$c$, $c$D$c$, $c$$4x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-085$c$, $c$A$c$, $c$$-b$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-085$c$, $c$B$c$, $c$$7b$$c$, true, null),
  ($c$M1-EXP-085$c$, $c$C$c$, $c$$4a + 5b$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-085$c$, $c$D$c$, $c$$a + 6b$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-086$c$, $c$A$c$, $c$$2x - 2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-086$c$, $c$B$c$, $c$$2x + 6$$c$, true, null),
  ($c$M1-EXP-086$c$, $c$C$c$, $c$$-2x - 6$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-086$c$, $c$D$c$, $c$$8x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-087$c$, $c$A$c$, $c$$-2$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-087$c$, $c$B$c$, $c$$-2x - 2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-087$c$, $c$C$c$, $c$$2$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-087$c$, $c$D$c$, $c$$-2x + 2$$c$, true, null),
  ($c$M1-EXP-088$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-EXP-088$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-088$c$, $c$C$c$, $c$Solo III$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-088$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-089$c$, $c$A$c$, $c$$3k - 8$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-089$c$, $c$B$c$, $c$$-k - 6$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-089$c$, $c$C$c$, $c$$3k + 2$$c$, true, null),
  ($c$M1-EXP-089$c$, $c$D$c$, $c$$3k + 6$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-090$c$, $c$A$c$, $c$$P - Q$ es el opuesto de $Q - P$.$c$, true, null),
  ($c$M1-EXP-090$c$, $c$B$c$, $c$$+(P - Q) = P + Q$$c$, false, $c$EXP-ADI-MASCAMBIA$c$),
  ($c$M1-EXP-090$c$, $c$C$c$, $c$$-(P + Q) = -P + Q$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-090$c$, $c$D$c$, $c$$P - Q = Q - P$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-091$c$, $c$A$c$, $c$$5x + 2x - 3 + x + 4 = 8x + 1$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-091$c$, $c$B$c$, $c$$5x - 2x - 3 - x + 4 = 2x + 1$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-091$c$, $c$C$c$, $c$$5x - 2x + 3 - x - 4 = 2x - 1$$c$, true, null),
  ($c$M1-EXP-091$c$, $c$D$c$, $c$$5x - 2x + 3 - x - 4 = 3x - 1$$c$, false, $c$EXP-TERM-COEFUNO$c$),
  ($c$M1-EXP-092$c$, $c$A$c$, $c$$3s + 20$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-092$c$, $c$B$c$, $c$$3s + 80$$c$, true, null),
  ($c$M1-EXP-092$c$, $c$C$c$, $c$$5s + 20$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-092$c$, $c$D$c$, $c$$-3s - 80$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-093$c$, $c$A$c$, $c$$-2$$c$, false, $c$EXP-ADI-SIGNOPAR$c$),
  ($c$M1-EXP-093$c$, $c$B$c$, $c$$2x + 6$$c$, false, $c$EXP-ADI-IGNORA$c$),
  ($c$M1-EXP-093$c$, $c$C$c$, $c$$-6x$$c$, false, $c$EXP-TERM-JUNTA$c$),
  ($c$M1-EXP-093$c$, $c$D$c$, $c$$2x - 8$$c$, true, null)
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
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-046$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-047$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-048$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-049$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-050$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-051$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-052$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-053$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-054$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-055$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-056$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-057$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-058$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-059$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-060$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-061$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-062$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-063$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-064$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-065$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-066$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-067$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-068$c$),
  ($c$ALG-EXP-TERM$c$, $c$M1-EXP-069$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-070$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-071$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-072$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-073$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-074$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-075$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-076$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-077$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-078$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-079$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-080$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-081$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-082$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-083$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-084$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-085$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-086$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-087$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-088$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-089$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-090$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-091$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-092$c$),
  ($c$ALG-EXP-ADI$c$, $c$M1-EXP-093$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-EXP-TERM-JUNTA$c$, $c$EXP-TERM-JUNTA$c$, $c$Solo se juntan los términos con la misma parte literal$c$, $c$Juntaste términos que no son semejantes. Por ejemplo, escribiste
$6r + 2s = 8rs$, o $5k + 1 = 6k$.

**Dos términos se pueden sumar solo si tienen exactamente las mismas
letras con los mismos exponentes.**

Piénsalo con objetos: $6r$ son seis cosas de un tipo y $2s$ son dos
de otro. Juntos no forman ocho cosas del tipo «$rs$»; siguen siendo
seis y dos. Por eso $6r + 2s$ ya está reducido.

Lo mismo con un número solo: en $5k + 1$, el $1$ no es un $k$. Queda
$5k + 1$.

Un control rápido: antes de sumar dos coeficientes, tapa los números
y compara lo que queda. Si las partes literales no son idénticas, no
los sumes.$c$),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$EXP-TERM-EXPSUMA$c$, $c$Al sumar semejantes, el exponente no cambia$c$, $c$Sumaste los exponentes al sumar términos semejantes. Por ejemplo,
escribiste $4k^2 + 3k^2 = 7k^4$, o $k + k = k^2$.

**Al sumar o restar términos semejantes, operas los coeficientes y la
parte literal queda igual.**

$4k^2 + 3k^2$ son cuatro «$k^2$» más tres «$k^2$»: siete «$k^2$».

$$4k^2 + 3k^2 = 7k^2$$

Los exponentes se suman cuando se **multiplican** potencias de igual
base, no cuando se suman términos. $k + k$ es el doble de $k$,
$2k$; $k^2$ es $k$ por $k$.

Un control rápido: la parte literal de tu resultado tiene que ser la
misma de los términos que juntaste.$c$),
  ($c$REM-EXP-TERM-GRADO$c$, $c$EXP-TERM-GRADO$c$, $c$Misma letra con distinto exponente no es semejante$c$, $c$Juntaste términos con la misma letra pero distinto exponente. Por
ejemplo, escribiste $5k^2 + 3k = 8k^2$.

**Para ser semejantes, las letras tienen que coincidir y también sus
exponentes.**

$k^2$ y $k$ son cantidades distintas: si $k = 10$, $k^2 = 100$ y
$k = 10$. Cinco de los primeros y tres de los segundos no son ocho de
ninguno.

$$5k^2 + 3k \quad \text{ya está reducido.}$$

En una expresión larga, separa por familias: los $k^2$ con los $k^2$,
los $k$ con los $k$, los números con los números.

Un control rápido: si dos términos tienen la misma letra, mira
también el exponente antes de juntarlos.$c$),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$EXP-TERM-COEFUNO$c$, $c$Una letra sola vale uno de ella, no cero$c$, $c$Trataste una letra sin número adelante como si no contara. Por
ejemplo, escribiste $10z - z = 10z$, o $6v + v = 6v$.

**Cuando un término no muestra coeficiente, su coeficiente es $1$. Y
si solo tiene un menos, es $-1$.**

$z$ es «un $z$». Entonces:

$$10z - z = 10z - 1z = 9z \qquad 6v + v = 6v + 1v = 7v$$

Con un solo $z$ restado, tienes uno menos. No puede quedar igual.

Un control rápido: escribe el $1$ que no se ve antes de operar:
$-z$ es $-1z$.$c$),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$EXP-TERM-CANCELA$c$, $c$Al restar semejantes, la letra se queda$c$, $c$Al restar dos términos semejantes, la letra desapareció. Por ejemplo,
escribiste $6w - 5w = 1$.

**Al restar términos semejantes, restas los coeficientes y la parte
literal se copia igual.**

$$6w - 5w = 1w = w$$

Seis $w$ menos cinco $w$ es un $w$, no el número $1$. La letra solo
desaparece cuando el coeficiente queda en $0$: $6w - 6w = 0$.

Un control rápido: si tu resultado es un número suelto, comprueba que
los coeficientes se hayan anulado del todo. Si no dio $0$, la letra
tiene que seguir ahí.$c$),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$EXP-TERM-SIGNOSUELTO$c$, $c$Cada término se mueve con su signo$c$, $c$Al ordenar los términos, uno perdió el signo que tenía adelante. Por
ejemplo, en $6t - 2u - 4t$ juntaste $6t + 4t = 10t$.

**El signo que está delante de un término es parte de ese término.
Donde lo lleves, se va con él.**

En $6t - 2u - 4t$ los términos son $6t$, $-2u$ y $-4t$. Los $t$ son
$6t$ y $-4t$:

$$6t - 4t = 2t \qquad \text{y queda} \quad 2t - 2u$$

Una forma segura es subrayar cada término junto con el signo que
tiene a su izquierda antes de agruparlos.

Un control rápido: cuenta los signos menos antes y después de
ordenar. Tienen que ser los mismos, en los mismos términos.$c$),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$EXP-TERM-MULTIPLICA$c$, $c$Sumar semejantes no es multiplicarlos$c$, $c$Multiplicaste cuando había que sumar. Por ejemplo, escribiste
$9k + 4k = 36k^2$.

**Para sumar términos semejantes se suman los coeficientes; la parte
literal no cambia.**

$9k + 4k$ es nueve $k$ más cuatro $k$: trece $k$.

$$9k + 4k = 13k$$

$36k^2$ es el resultado de $9k \cdot 4k$, que es otra operación. El
signo que aparece entre los términos decide qué haces: $+$ es sumar.

Un control rápido: si el problema es una suma de semejantes, tu
resultado tiene la misma parte literal que los términos. Si te
apareció un exponente nuevo, multiplicaste.$c$),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$EXP-ADI-SIGNOPAR$c$, $c$El menos cambia el signo de todo el paréntesis$c$, $c$Al sacar un paréntesis con un menos adelante, cambiaste solo el signo
del primer término. Por ejemplo, escribiste
$-(4c - 9) = -4c - 9$.

**Un menos delante de un paréntesis cambia el signo de cada término
que está adentro.**

$$-(4c - 9) = -4c + 9$$

El paréntesis significa «resta todo esto». Restar $4c - 9$ es quitar
el $4c$ y también quitar el $-9$, y quitar $-9$ es sumar $9$.

Lo mismo con una resta de polinomios:

$$10c - (3c - 2) = 10c - 3c + 2 = 7c + 2$$

Un control rápido: después de sacar el paréntesis, revisa que **todos**
los términos que estaban adentro hayan cambiado de signo, no solo el
primero.$c$),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$EXP-ADI-MASCAMBIA$c$, $c$Un más delante del paréntesis no cambia nada$c$, $c$Cambiaste los signos de un paréntesis que tenía un más adelante. Por
ejemplo, escribiste $+(3c - 8) = 3c + 8$.

**Si delante del paréntesis hay un $+$ (o no hay nada), se saca el
paréntesis y todos los signos quedan igual.**

$$(5c + 1) + (3c - 8) = 5c + 1 + 3c - 8 = 8c - 7$$

Sumar un polinomio es sumar cada uno de sus términos tal como están.
Solo el menos delante del paréntesis da vuelta los signos.

Un control rápido: antes de sacar un paréntesis, mira qué signo tiene
justo adelante. Si es $+$, copia; si es $-$, cambia todo.$c$),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$EXP-ADI-IGNORA$c$, $c$El menos no desaparece con el paréntesis$c$, $c1$Borraste el paréntesis junto con el signo menos que tenía adelante,
como si no estuviera. Por ejemplo, escribiste
$10 - (c + 2) = 10 + c + 2$.

**El menos que está delante de un paréntesis no se borra: se aplica a
cada término de adentro.**

$$10 - (c + 2) = 10 - c - 2 = 8 - c$$

Si los $c + 2$ se van, se restan los dos: el $c$ y el $2$.

Un control rápido: cuenta los signos menos. Si antes de sacar el
paréntesis había uno delante y después ninguno de los términos de
adentro cambió, perdiste ese menos.$c1$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-EXP-TERM-JUNTA$c$, $c$REM-EXP-TERM-EXPSUMA$c$, $c$REM-EXP-TERM-GRADO$c$, $c$REM-EXP-TERM-COEFUNO$c$, $c$REM-EXP-TERM-CANCELA$c$, $c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$REM-EXP-TERM-MULTIPLICA$c$, $c$REM-EXP-ADI-SIGNOPAR$c$, $c$REM-EXP-ADI-MASCAMBIA$c$, $c$REM-EXP-ADI-IGNORA$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-059$c$, 1::smallint),
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-061$c$, 2::smallint),
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-066$c$, 3::smallint),
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-071$c$, 4::smallint),
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-072$c$, 5::smallint),
  ($c$REM-EXP-TERM-JUNTA$c$, $c$M1-EXP-086$c$, 6::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-052$c$, 1::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-053$c$, 2::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-058$c$, 3::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-059$c$, 4::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-064$c$, 5::smallint),
  ($c$REM-EXP-TERM-EXPSUMA$c$, $c$M1-EXP-065$c$, 6::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-049$c$, 1::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-050$c$, 2::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-056$c$, 3::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-062$c$, 4::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-065$c$, 5::smallint),
  ($c$REM-EXP-TERM-GRADO$c$, $c$M1-EXP-075$c$, 6::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-049$c$, 1::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-050$c$, 2::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-060$c$, 3::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-068$c$, 4::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-069$c$, 5::smallint),
  ($c$REM-EXP-TERM-COEFUNO$c$, $c$M1-EXP-079$c$, 6::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-049$c$, 1::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-055$c$, 2::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-060$c$, 3::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-062$c$, 4::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-068$c$, 5::smallint),
  ($c$REM-EXP-TERM-CANCELA$c$, $c$M1-EXP-083$c$, 6::smallint),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$M1-EXP-052$c$, 1::smallint),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$M1-EXP-055$c$, 2::smallint),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$M1-EXP-064$c$, 3::smallint),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$M1-EXP-066$c$, 4::smallint),
  ($c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$M1-EXP-069$c$, 5::smallint),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$M1-EXP-046$c$, 1::smallint),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$M1-EXP-051$c$, 2::smallint),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$M1-EXP-053$c$, 3::smallint),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$M1-EXP-061$c$, 4::smallint),
  ($c$REM-EXP-TERM-MULTIPLICA$c$, $c$M1-EXP-064$c$, 5::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-073$c$, 1::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-074$c$, 2::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-082$c$, 3::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-083$c$, 4::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-089$c$, 5::smallint),
  ($c$REM-EXP-ADI-SIGNOPAR$c$, $c$M1-EXP-090$c$, 6::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-071$c$, 1::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-077$c$, 2::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-081$c$, 3::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-085$c$, 4::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-089$c$, 5::smallint),
  ($c$REM-EXP-ADI-MASCAMBIA$c$, $c$M1-EXP-090$c$, 6::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-073$c$, 1::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-074$c$, 2::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-082$c$, 3::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-084$c$, 4::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-088$c$, 5::smallint),
  ($c$REM-EXP-ADI-IGNORA$c$, $c$M1-EXP-091$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-ALG-EXP-03$c$, $c$ALG-EXP$c$, $c$Términos semejantes y suma de polinomios$c$, $c$Ya sabes escribir en lenguaje algebraico. Ahora toca ordenar lo que
escribes: juntar lo que se puede juntar y sacar paréntesis sin perder
signos. Casi todo el álgebra de la PAES pasa por estos dos pasos.

## Términos semejantes

### Las partes de un término

En el término $-7a^2b$:

- el **coeficiente** es $-7$ (el número, con su signo);
- la **parte literal** es $a^2b$ (las letras con sus exponentes).

Cuando no se ve un número, el coeficiente es $1$: en $m$ hay un $m$, no
cero. Y en $-m$ el coeficiente es $-1$.

### Qué términos son semejantes

**Dos términos son semejantes si tienen exactamente la misma parte
literal: las mismas letras, cada una con el mismo exponente.**

- $4pq$ y $-9pq$ son semejantes.
- $5k^2$ y $5k$ **no** lo son: tienen la misma letra, pero distinto
  exponente.
- $3mn$ y $2nm$ sí lo son: el orden de las letras no importa, porque
  $mn = nm$.
- $6r$ y $6s$ no lo son, aunque tengan el mismo coeficiente.

### Reducir: se suman los coeficientes, la parte literal no cambia

**Para sumar o restar términos semejantes, operas los coeficientes y
copias la parte literal tal cual.**

$$9k + 4k = 13k \qquad 2w^2 - 6w^2 = -4w^2$$

El exponente **no** se suma. $4k^2 + 3k^2$ son $7$ veces $k^2$: $7k^2$.
Si escribes $7k^4$, cambiaste lo que estás contando.

Tampoco se multiplica: $9k + 4k$ no es $36k^2$. Sumar $k$ nueve veces y
cuatro veces más da $13$ veces $k$.

### Lo que no se puede juntar se queda separado

$6r + 2s$ ya está reducido. No es $8rs$: son dos cantidades distintas,
como $6$ lápices y $2$ gomas. Lo mismo con un número suelto: $5k + 1$ no
es $6k$.

En una expresión larga, junta cada familia por separado. **Cada término
se lleva su signo**:

$$6t - 2u - 4t + 7u = (6t - 4t) + (-2u + 7u) = 2t + 5u$$

El error típico es mover $-4t$ al lado de $6t$ y olvidar su menos.

### Coeficiente 1 y resultados sin número

$10z - z = 9z$: al $10z$ le quitas un $z$. No es $10z$ (como si $z$
valiera cero) ni $10$ (la letra no desaparece).

Si al reducir queda coeficiente $1$, se escribe solo la letra:
$4v - 3v = v$. Si queda $0$, el término desaparece:
$5v - 5v = 0$.

## Adición y sustracción de polinomios

### Sumar polinomios

Para sumar, se sacan los paréntesis **sin cambiar ningún signo** y se
reducen los semejantes:

$$(2c^2 - 5c) + (c^2 + 8c) = 2c^2 - 5c + c^2 + 8c = 3c^2 + 3c$$

Un $+$ delante del paréntesis no cambia nada. El error es cambiar
signos igual que con el menos.

### El menos delante del paréntesis cambia todos los signos

**Un signo menos delante de un paréntesis cambia el signo de cada uno de
los términos de adentro, no solo el del primero.**

$$-(4c - 9) = -4c + 9$$

Es restar el polinomio completo. Si solo cambias el primero, quedaría
$-4c - 9$: le restaste el $4c$ pero le sumaste el $9$... que no era lo
que había que hacer.

Tampoco se puede borrar el menos junto con el paréntesis: $10 - (c + 2)$
es $8 - c$, no $12 + c$.

### Restar polinomios

Para calcular $P - Q$, escribe $P$ tal cual, cambia todos los signos de
$Q$ y reduce:

$$(5d - 1) - (2d - 6) = 5d - 1 - 2d + 6 = 3d + 5$$

El orden importa. «Restar $Q$ de $P$» es $P - Q$: se le quita a $P$. Y
$Q - P$ da el opuesto: $-3d - 5$.

El **opuesto** de un polinomio es el que se obtiene cambiando todos sus
signos: el opuesto de $d^2 - 2d + 3$ es $-d^2 + 2d - 3$.

### Corchetes

Con paréntesis dentro de corchetes, trabaja de adentro hacia afuera, y
aplica el signo de cada nivel a todo lo que encierra:

$$-[\,2e - (e - 5)\,] = -[\,2e - e + 5\,] = -[\,e + 5\,] = -e - 5$$

### Situaciones

Si una cantidad se quita, va entre paréntesis con un menos adelante. Si
un curso tenía $4r + 6$ estudiantes y se van $r + 2$, quedan
$4r + 6 - (r + 2) = 3r + 4$. El paréntesis te recuerda que se van los
$r$ **y** los $2$.$c$, 3::smallint)
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
  ($c$LES-ALG-EXP-03$c$, $c$ALG-EXP-TERM$c$, 1::smallint, $c$terminos-semejantes$c$),
  ($c$LES-ALG-EXP-03$c$, $c$ALG-EXP-ADI$c$, 2::smallint, $c$adicion-y-sustraccion-de-polinomios$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-EXP-046$c$, $c$M1-EXP-047$c$, $c$M1-EXP-048$c$, $c$M1-EXP-049$c$, $c$M1-EXP-050$c$, $c$M1-EXP-051$c$, $c$M1-EXP-052$c$, $c$M1-EXP-053$c$, $c$M1-EXP-054$c$, $c$M1-EXP-055$c$, $c$M1-EXP-056$c$, $c$M1-EXP-057$c$, $c$M1-EXP-058$c$, $c$M1-EXP-059$c$, $c$M1-EXP-060$c$, $c$M1-EXP-061$c$, $c$M1-EXP-062$c$, $c$M1-EXP-063$c$, $c$M1-EXP-064$c$, $c$M1-EXP-065$c$, $c$M1-EXP-066$c$, $c$M1-EXP-067$c$, $c$M1-EXP-068$c$, $c$M1-EXP-069$c$, $c$M1-EXP-070$c$, $c$M1-EXP-071$c$, $c$M1-EXP-072$c$, $c$M1-EXP-073$c$, $c$M1-EXP-074$c$, $c$M1-EXP-075$c$, $c$M1-EXP-076$c$, $c$M1-EXP-077$c$, $c$M1-EXP-078$c$, $c$M1-EXP-079$c$, $c$M1-EXP-080$c$, $c$M1-EXP-081$c$, $c$M1-EXP-082$c$, $c$M1-EXP-083$c$, $c$M1-EXP-084$c$, $c$M1-EXP-085$c$, $c$M1-EXP-086$c$, $c$M1-EXP-087$c$, $c$M1-EXP-088$c$, $c$M1-EXP-089$c$, $c$M1-EXP-090$c$, $c$M1-EXP-091$c$, $c$M1-EXP-092$c$, $c$M1-EXP-093$c$);
  if c <> 48 then
    raise exception 'items: se esperaban 48, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-EXP-046$c$, $c$M1-EXP-047$c$, $c$M1-EXP-048$c$, $c$M1-EXP-049$c$, $c$M1-EXP-050$c$, $c$M1-EXP-051$c$, $c$M1-EXP-052$c$, $c$M1-EXP-053$c$, $c$M1-EXP-054$c$, $c$M1-EXP-055$c$, $c$M1-EXP-056$c$, $c$M1-EXP-057$c$, $c$M1-EXP-058$c$, $c$M1-EXP-059$c$, $c$M1-EXP-060$c$, $c$M1-EXP-061$c$, $c$M1-EXP-062$c$, $c$M1-EXP-063$c$, $c$M1-EXP-064$c$, $c$M1-EXP-065$c$, $c$M1-EXP-066$c$, $c$M1-EXP-067$c$, $c$M1-EXP-068$c$, $c$M1-EXP-069$c$, $c$M1-EXP-070$c$, $c$M1-EXP-071$c$, $c$M1-EXP-072$c$, $c$M1-EXP-073$c$, $c$M1-EXP-074$c$, $c$M1-EXP-075$c$, $c$M1-EXP-076$c$, $c$M1-EXP-077$c$, $c$M1-EXP-078$c$, $c$M1-EXP-079$c$, $c$M1-EXP-080$c$, $c$M1-EXP-081$c$, $c$M1-EXP-082$c$, $c$M1-EXP-083$c$, $c$M1-EXP-084$c$, $c$M1-EXP-085$c$, $c$M1-EXP-086$c$, $c$M1-EXP-087$c$, $c$M1-EXP-088$c$, $c$M1-EXP-089$c$, $c$M1-EXP-090$c$, $c$M1-EXP-091$c$, $c$M1-EXP-092$c$, $c$M1-EXP-093$c$);
  if c <> 192 then
    raise exception 'item_options: se esperaban 192, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-EXP-046$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-047$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-048$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-049$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-050$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-051$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-052$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-053$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-054$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-055$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-056$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-057$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-058$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-059$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-060$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-061$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-062$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-063$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-064$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-065$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-066$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-067$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-068$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-069$c$, $c$ALG-EXP-TERM$c$),
      ($c$M1-EXP-070$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-071$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-072$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-073$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-074$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-075$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-076$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-077$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-078$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-079$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-080$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-081$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-082$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-083$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-084$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-085$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-086$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-087$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-088$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-089$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-090$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-091$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-092$c$, $c$ALG-EXP-ADI$c$),
      ($c$M1-EXP-093$c$, $c$ALG-EXP-ADI$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 48 then
    raise exception 'node_items: 48 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-EXP-046$c$, $c$M1-EXP-047$c$, $c$M1-EXP-048$c$, $c$M1-EXP-049$c$, $c$M1-EXP-050$c$, $c$M1-EXP-051$c$, $c$M1-EXP-052$c$, $c$M1-EXP-053$c$, $c$M1-EXP-054$c$, $c$M1-EXP-055$c$, $c$M1-EXP-056$c$, $c$M1-EXP-057$c$, $c$M1-EXP-058$c$, $c$M1-EXP-059$c$, $c$M1-EXP-060$c$, $c$M1-EXP-061$c$, $c$M1-EXP-062$c$, $c$M1-EXP-063$c$, $c$M1-EXP-064$c$, $c$M1-EXP-065$c$, $c$M1-EXP-066$c$, $c$M1-EXP-067$c$, $c$M1-EXP-068$c$, $c$M1-EXP-069$c$, $c$M1-EXP-070$c$, $c$M1-EXP-071$c$, $c$M1-EXP-072$c$, $c$M1-EXP-073$c$, $c$M1-EXP-074$c$, $c$M1-EXP-075$c$, $c$M1-EXP-076$c$, $c$M1-EXP-077$c$, $c$M1-EXP-078$c$, $c$M1-EXP-079$c$, $c$M1-EXP-080$c$, $c$M1-EXP-081$c$, $c$M1-EXP-082$c$, $c$M1-EXP-083$c$, $c$M1-EXP-084$c$, $c$M1-EXP-085$c$, $c$M1-EXP-086$c$, $c$M1-EXP-087$c$, $c$M1-EXP-088$c$, $c$M1-EXP-089$c$, $c$M1-EXP-090$c$, $c$M1-EXP-091$c$, $c$M1-EXP-092$c$, $c$M1-EXP-093$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-REGLAMUL$c$, $c$EXP-ADI-IGNORA$c$, $c$EXP-ADI-MASCAMBIA$c$, $c$EXP-ADI-SIGNOPAR$c$, $c$EXP-LENG-ADITIVO$c$, $c$EXP-LENG-EXCESO$c$, $c$EXP-LENG-JUXTA$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-POTMUL$c$, $c$EXP-TERM-CANCELA$c$, $c$EXP-TERM-COEFUNO$c$, $c$EXP-TERM-EXPSUMA$c$, $c$EXP-TERM-GRADO$c$, $c$EXP-TERM-JUNTA$c$, $c$EXP-TERM-MULTIPLICA$c$, $c$EXP-TERM-SIGNOSUELTO$c$)
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

-- 48 ítems (48 curated), 192 alternativas, 17 misconceptions referenciadas,
-- 10 remediaciones, 0 figuras, 1 clase sobre 2 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 48 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-EXP-046$c$, $c$M1-EXP-047$c$, $c$M1-EXP-048$c$, $c$M1-EXP-049$c$, $c$M1-EXP-050$c$, $c$M1-EXP-051$c$, $c$M1-EXP-052$c$, $c$M1-EXP-053$c$, $c$M1-EXP-054$c$, $c$M1-EXP-055$c$, $c$M1-EXP-056$c$, $c$M1-EXP-057$c$, $c$M1-EXP-058$c$, $c$M1-EXP-059$c$, $c$M1-EXP-060$c$, $c$M1-EXP-061$c$, $c$M1-EXP-062$c$, $c$M1-EXP-063$c$, $c$M1-EXP-064$c$, $c$M1-EXP-065$c$, $c$M1-EXP-066$c$, $c$M1-EXP-067$c$, $c$M1-EXP-068$c$, $c$M1-EXP-069$c$, $c$M1-EXP-070$c$, $c$M1-EXP-071$c$, $c$M1-EXP-072$c$, $c$M1-EXP-073$c$, $c$M1-EXP-074$c$, $c$M1-EXP-075$c$, $c$M1-EXP-076$c$, $c$M1-EXP-077$c$, $c$M1-EXP-078$c$, $c$M1-EXP-079$c$, $c$M1-EXP-080$c$, $c$M1-EXP-081$c$, $c$M1-EXP-082$c$, $c$M1-EXP-083$c$, $c$M1-EXP-084$c$, $c$M1-EXP-085$c$, $c$M1-EXP-086$c$, $c$M1-EXP-087$c$, $c$M1-EXP-088$c$, $c$M1-EXP-089$c$, $c$M1-EXP-090$c$, $c$M1-EXP-091$c$, $c$M1-EXP-092$c$, $c$M1-EXP-093$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-EXP-TERM-JUNTA$c$, $c$REM-EXP-TERM-EXPSUMA$c$, $c$REM-EXP-TERM-GRADO$c$, $c$REM-EXP-TERM-COEFUNO$c$, $c$REM-EXP-TERM-CANCELA$c$, $c$REM-EXP-TERM-SIGNOSUELTO$c$, $c$REM-EXP-TERM-MULTIPLICA$c$, $c$REM-EXP-ADI-SIGNOPAR$c$, $c$REM-EXP-ADI-MASCAMBIA$c$, $c$REM-EXP-ADI-IGNORA$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-ALG-EXP-03$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-EXP-046$c$, $c$M1-EXP-047$c$, $c$M1-EXP-048$c$, $c$M1-EXP-049$c$, $c$M1-EXP-050$c$, $c$M1-EXP-051$c$, $c$M1-EXP-052$c$, $c$M1-EXP-053$c$, $c$M1-EXP-054$c$, $c$M1-EXP-055$c$, $c$M1-EXP-056$c$, $c$M1-EXP-057$c$, $c$M1-EXP-058$c$, $c$M1-EXP-059$c$, $c$M1-EXP-060$c$, $c$M1-EXP-061$c$, $c$M1-EXP-062$c$, $c$M1-EXP-063$c$, $c$M1-EXP-064$c$, $c$M1-EXP-065$c$, $c$M1-EXP-066$c$, $c$M1-EXP-067$c$, $c$M1-EXP-068$c$, $c$M1-EXP-069$c$, $c$M1-EXP-070$c$, $c$M1-EXP-071$c$, $c$M1-EXP-072$c$, $c$M1-EXP-073$c$, $c$M1-EXP-074$c$, $c$M1-EXP-075$c$, $c$M1-EXP-076$c$, $c$M1-EXP-077$c$, $c$M1-EXP-078$c$, $c$M1-EXP-079$c$, $c$M1-EXP-080$c$, $c$M1-EXP-081$c$, $c$M1-EXP-082$c$, $c$M1-EXP-083$c$, $c$M1-EXP-084$c$, $c$M1-EXP-085$c$, $c$M1-EXP-086$c$, $c$M1-EXP-087$c$, $c$M1-EXP-088$c$, $c$M1-EXP-089$c$, $c$M1-EXP-090$c$, $c$M1-EXP-091$c$, $c$M1-EXP-092$c$, $c$M1-EXP-093$c$) group by 1;
