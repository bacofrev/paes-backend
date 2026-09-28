-- =====================================================================
-- LES-NUM-ENT-04 — Prioridad de operaciones
-- Generado por cargar_contenido.py desde LES-NUM-ENT-04.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-ENT-073$c$, $c$¿Cuál es el valor de $7 + 3 \cdot (-4)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-074$c$, $c$¿Cuál es el valor de $-20 + 12 \div 4 \cdot 3$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-075$c$, $c$¿Cuál es el valor de $-5 - (8 - 14)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-076$c$, $c$¿Cuál es el valor de $3(7 - 10)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-077$c$, $c$¿Cuál es el valor de $\dfrac{-12 + 4}{-2}$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-078$c$, $c$¿Cuál es el valor de $-6 + 18 \div (-3)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-079$c$, $c$¿Cuál es el valor de $8 - 2(-5)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-080$c$, $c$¿Cuál de las siguientes igualdades es verdadera?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-ENT-081$c$, $c$¿Cuál es el valor de $-30 + 12 \div 3 \cdot 2$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-082$c$, $c$¿Cuál es el valor de $2 \cdot [5 - (3 - 7)]$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-083$c$, $c$¿Cuál es el valor de $\dfrac{8 - 2 \cdot 5}{-2}$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-084$c$, $c$¿Cuál es el valor de $-4 - 3 \cdot (2 - 6)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-085$c$, $c$A las 6:00 la temperatura en Punta Arenas era $-4$ °C. Luego subió $3$ °C por hora durante $5$ horas y, al nublarse, bajó $7$ °C. Para calcular la temperatura final, Matías escribió $-4 + 3 \cdot 5 - 7$. ¿Cuál es el valor de esa expresión?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-086$c$, $c$¿Cuál es el valor de $-(5 - 12) - 2 \cdot 4$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-087$c$, $c$¿Cuál es el valor de $2 \cdot \dfrac{14 - 35}{7} - 5$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-088$c$, $c$¿Cuál es el valor de $-6 + 18 \div (-3) \cdot 2$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-ENT-089$c$, $c$Considera las siguientes igualdades:

I. $10 - 4 \cdot 2 = 12$

II. $-(3 - 8) = 5$

III. $\dfrac{9 - 3}{3} = 2$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-090$c$, $c$¿Cuál de los siguientes desarrollos para calcular $12 - 3 \cdot (1 - 5)$ es correcto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-091$c$, $c$Considera las siguientes igualdades:

I. $(-2) \cdot 3 - 4 = -10$

II. $24 \div 6 \cdot 2 = 2$

III. $7 - (2 - 9) = -4$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-092$c$, $c$¿Cuál de los siguientes desarrollos para calcular $\dfrac{-16 + 4}{-4} + 2$ es correcto?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-093$c$, $c$¿Cuál es el valor de $-2 \cdot [3 - 4 \cdot (1 - 3)]$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-094$c$, $c$¿Cuál es el valor de $\dfrac{-6 \cdot 4}{-8} - (2 - 11)$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-095$c$, $c$Considera las siguientes igualdades:

I. $\dfrac{10 - 4}{2} = 3$

II. $2(5 - 8) = 2$

III. $-(6 - 1) = -5$

¿Cuál o cuáles son verdaderas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-ENT-096$c$, $c$¿Cuál de los siguientes desarrollos para calcular $-40 \div 5 \cdot 2 + 6$ es correcto?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-ENT-073$c$, $c$A$c$, $c$$-19$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-073$c$, $c$B$c$, $c$$5$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-073$c$, $c$C$c$, $c$$-5$$c$, true, null),
  ($c$M1-ENT-073$c$, $c$D$c$, $c$$-40$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-074$c$, $c$A$c$, $c$$-6$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-074$c$, $c$B$c$, $c$$-19$$c$, false, $c$ENT-PRIOR-MULTDIV$c$),
  ($c$M1-ENT-074$c$, $c$C$c$, $c$$-29$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-074$c$, $c$D$c$, $c$$-11$$c$, true, null),
  ($c$M1-ENT-075$c$, $c$A$c$, $c$$-27$$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-075$c$, $c$B$c$, $c$$1$$c$, true, null),
  ($c$M1-ENT-075$c$, $c$C$c$, $c$$-1$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-075$c$, $c$D$c$, $c$$-11$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-076$c$, $c$A$c$, $c$$-9$$c$, true, null),
  ($c$M1-ENT-076$c$, $c$B$c$, $c$$11$$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-076$c$, $c$C$c$, $c$$9$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-076$c$, $c$D$c$, $c$$0$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-077$c$, $c$A$c$, $c$$-4$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-077$c$, $c$B$c$, $c$$4$$c$, true, null),
  ($c$M1-ENT-077$c$, $c$C$c$, $c$$-14$$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-077$c$, $c$D$c$, $c$$8$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-078$c$, $c$A$c$, $c$$-4$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-078$c$, $c$B$c$, $c$$0$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-078$c$, $c$C$c$, $c$$12$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-078$c$, $c$D$c$, $c$$-12$$c$, true, null),
  ($c$M1-ENT-079$c$, $c$A$c$, $c$$-2$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-079$c$, $c$B$c$, $c$$-30$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-079$c$, $c$C$c$, $c$$18$$c$, true, null),
  ($c$M1-ENT-079$c$, $c$D$c$, $c$$11$$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-080$c$, $c$A$c$, $c$$-15 - 9 \div 3 + 2 = -16$$c$, true, null),
  ($c$M1-ENT-080$c$, $c$B$c$, $c$$16 \div 4 \cdot 2 = 2$$c$, false, $c$ENT-PRIOR-MULTDIV$c$),
  ($c$M1-ENT-080$c$, $c$C$c$, $c$$\dfrac{6 + 4}{2} = 8$$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-080$c$, $c$D$c$, $c$$6 + 4 \cdot 2 = 20$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-081$c$, $c$A$c$, $c$$-38$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-081$c$, $c$B$c$, $c$$-28$$c$, false, $c$ENT-PRIOR-MULTDIV$c$),
  ($c$M1-ENT-081$c$, $c$C$c$, $c$$-12$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-081$c$, $c$D$c$, $c$$-22$$c$, true, null),
  ($c$M1-ENT-082$c$, $c$A$c$, $c$$-10$$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-082$c$, $c$B$c$, $c$$18$$c$, true, null),
  ($c$M1-ENT-082$c$, $c$C$c$, $c$$14$$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-082$c$, $c$D$c$, $c$$2$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-083$c$, $c$A$c$, $c$$1$$c$, true, null),
  ($c$M1-ENT-083$c$, $c$B$c$, $c$$-1$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-083$c$, $c$C$c$, $c$$13$$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-083$c$, $c$D$c$, $c$$-15$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-084$c$, $c$A$c$, $c$$28$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-084$c$, $c$B$c$, $c$$-16$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-084$c$, $c$C$c$, $c$$8$$c$, true, null),
  ($c$M1-ENT-084$c$, $c$D$c$, $c$$-4$$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-085$c$, $c$A$c$, $c$$-26$ °C$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-085$c$, $c$B$c$, $c$$-3$ °C$c$, false, $c$ENT-MUL-SUMA$c$),
  ($c$M1-ENT-085$c$, $c$C$c$, $c$$4$ °C$c$, true, null),
  ($c$M1-ENT-085$c$, $c$D$c$, $c$$-12$ °C$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-086$c$, $c$A$c$, $c$$-25$$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-086$c$, $c$B$c$, $c$$-1$$c$, true, null),
  ($c$M1-ENT-086$c$, $c$C$c$, $c$$20$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-086$c$, $c$D$c$, $c$$-15$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-087$c$, $c$A$c$, $c$$1$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-087$c$, $c$B$c$, $c$$11$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-087$c$, $c$C$c$, $c$$13$$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-087$c$, $c$D$c$, $c$$-11$$c$, true, null),
  ($c$M1-ENT-088$c$, $c$A$c$, $c$$-18$$c$, true, null),
  ($c$M1-ENT-088$c$, $c$B$c$, $c$$-9$$c$, false, $c$ENT-PRIOR-MULTDIV$c$),
  ($c$M1-ENT-088$c$, $c$C$c$, $c$$18$$c$, false, $c$ENT-ADI-REGLAMUL$c$),
  ($c$M1-ENT-088$c$, $c$D$c$, $c$$-8$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-089$c$, $c$A$c$, $c$Solo III$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-089$c$, $c$B$c$, $c$Solo II y III$c$, true, null),
  ($c$M1-ENT-089$c$, $c$C$c$, $c$I, II y III$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-089$c$, $c$D$c$, $c$Solo II$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-090$c$, $c$A$c$, $c$$12 - 3 \cdot (-4) = 12 - 12 = 0$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-090$c$, $c$B$c$, $c$$12 - 3 \cdot (-4) = 9 \cdot (-4) = -36$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-090$c$, $c$C$c$, $c$$12 - (3 - 5) = 12 - (-2) = 14$$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-090$c$, $c$D$c$, $c$$12 - 3 \cdot (-4) = 12 + 12 = 24$$c$, true, null),
  ($c$M1-ENT-091$c$, $c$A$c$, $c$Ninguna de ellas$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-091$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$ENT-PRIOR-MULTDIV$c$),
  ($c$M1-ENT-091$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-ENT-091$c$, $c$D$c$, $c$Solo I y III$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-092$c$, $c$A$c$, $c$$\dfrac{-12}{-4} + 2 = 3 + 2 = 5$$c$, true, null),
  ($c$M1-ENT-092$c$, $c$B$c$, $c$$-16 + \dfrac{4}{-4} + 2 = -16 - 1 + 2 = -15$$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-092$c$, $c$C$c$, $c$$\dfrac{-20}{-4} + 2 = 5 + 2 = 7$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-092$c$, $c$D$c$, $c$$\dfrac{-12}{-4} + 2 = -3 + 2 = -1$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-093$c$, $c$A$c$, $c$$-4$$c$, false, $c$ENT-PRIOR-IZQDER$c$),
  ($c$M1-ENT-093$c$, $c$B$c$, $c$$2$$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-093$c$, $c$C$c$, $c$$10$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-093$c$, $c$D$c$, $c$$-22$$c$, true, null),
  ($c$M1-ENT-094$c$, $c$A$c$, $c$$12$$c$, true, null),
  ($c$M1-ENT-094$c$, $c$B$c$, $c$$6$$c$, false, $c$ENT-MUL-REGLASUMA$c$),
  ($c$M1-ENT-094$c$, $c$C$c$, $c$$-6$$c$, false, $c$ENT-ADI-DOBLENEG$c$),
  ($c$M1-ENT-094$c$, $c$D$c$, $c$$-10$$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-095$c$, $c$A$c$, $c$Solo I$c$, false, $c$ENT-PRIOR-SIGNOPAR$c$),
  ($c$M1-ENT-095$c$, $c$B$c$, $c$I, II y III$c$, false, $c$ENT-PRIOR-PARCIAL$c$),
  ($c$M1-ENT-095$c$, $c$C$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-095$c$, $c$D$c$, $c$Solo III$c$, false, $c$ENT-PRIOR-RAYA$c$),
  ($c$M1-ENT-096$c$, $c$A$c$, $c$$-8 \cdot 2 + 6 = -16 + 6 = 10$$c$, false, $c$ENT-ADI-INVIERTE$c$),
  ($c$M1-ENT-096$c$, $c$B$c$, $c$$-8 \cdot 2 + 6 = -16 + 6 = -10$$c$, true, null),
  ($c$M1-ENT-096$c$, $c$C$c$, $c$$-8 \cdot 2 + 6 = -16 + 6 = -22$$c$, false, $c$ENT-ADI-MAGNOP$c$),
  ($c$M1-ENT-096$c$, $c$D$c$, $c$$-40 \div 10 + 6 = -4 + 6 = 2$$c$, false, $c$ENT-PRIOR-MULTDIV$c$)
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
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-073$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-074$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-075$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-076$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-077$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-078$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-079$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-080$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-081$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-082$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-083$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-084$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-085$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-086$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-087$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-088$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-089$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-090$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-091$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-092$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-093$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-094$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-095$c$),
  ($c$NUM-ENT-PRIOR$c$, $c$M1-ENT-096$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$ENT-PRIOR-IZQDER$c$, $c$Multiplicar y dividir va antes que sumar y restar$c$, $c$Calculaste de izquierda a derecha, en el orden en que se lee. Por
ejemplo, en $2 + 6 \cdot 3$ sumaste primero $2 + 6 = 8$ y después
$8 \cdot 3 = 24$.

**Las multiplicaciones y divisiones se hacen antes que las sumas y
restas, estén donde estén.**

$$2 + 6 \cdot 3 = 2 + 18 = 20$$

Sumar primero es resolver $(2 + 6) \cdot 3$. Esa expresión tiene
paréntesis y la original no: son dos cuentas distintas y dan
resultados distintos.

Con negativos es igual. En $-9 + 15 \div 3$, la división va primero:
$-9 + 5 = -4$.

Un control rápido: antes de empezar, subraya cada multiplicación y
cada división con sus dos números. Esos resultados reemplazan a lo
subrayado, y recién ahí sumas y restas.$c$),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$ENT-PRIOR-MULTDIV$c$, $c$Multiplicación y división, en el orden en que aparecen$c$, $c$Hiciste la multiplicación antes que la división, aunque la división
estaba primero. Por ejemplo, en $40 \div 4 \cdot 2$ calculaste
$4 \cdot 2 = 8$ y después $40 \div 8 = 5$.

**La multiplicación y la división tienen la misma prioridad: se
hacen de izquierda a derecha, la que aparezca primero.**

$$40 \div 4 \cdot 2 = 10 \cdot 2 = 20$$

Hacer $4 \cdot 2$ primero equivale a escribir $40 \div (4 \cdot 2)$.
Sin ese paréntesis, el $40$ se divide solo por $4$.

El orden «primero multiplicar, después dividir» no existe. Lo que sí
existe es «multiplicar y dividir antes que sumar y restar».

Un control rápido: en una cadena de solo multiplicaciones y
divisiones, avanza de a un paso desde la izquierda y reescribe la
expresión después de cada paso.$c$),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$ENT-PRIOR-SIGNOPAR$c$, $c$El menos afecta a todo el paréntesis$c$, $c$Sacaste el paréntesis y el signo menos quedó solo con el primer
número. Por ejemplo, en $4 - (7 - 10)$ escribiste $4 - 7 - 10 = -13$.

**Cuando hay un menos delante de un paréntesis, calcula primero lo de
adentro y después resta ese resultado completo.**

$$4 - (7 - 10) = 4 - (-3) = 4 + 3 = 7$$

El paréntesis dice «resta todo esto». Todo esto vale $-3$, y restar
$-3$ es sumar $3$.

Si quieres sacar el paréntesis sin calcular adentro, el menos cambia
el signo de **cada** término: $4 - 7 + 10 = 7$. Da lo mismo, pero es
más fácil equivocarse.

Un control rápido: calcula siempre lo de adentro primero. Así el
menos queda frente a un solo número y no hay que decidir a quién
afecta.$c$),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$ENT-PRIOR-PARCIAL$c$, $c$El número de afuera multiplica a todo el paréntesis$c$, $c$Multiplicaste el número de afuera solo por el primer número de
adentro. Por ejemplo, en $5(2 - 7)$ hiciste $5 \cdot 2 - 7 = 3$.

**Un número pegado a un paréntesis multiplica al resultado completo
de lo que está adentro.**

Calcula primero el paréntesis y después multiplica:

$$5(2 - 7) = 5 \cdot (-5) = -25$$

Piénsalo con dinero: si $5$ personas pagan cada una $2$ mil pesos
menos un descuento de $7$ mil, cada una paga $-5$ mil y el grupo
$-25$ mil. El descuento es de cada persona, no de una sola.

Un control rápido: si hay un número pegado a un paréntesis, resuelve
el paréntesis antes de mirar ese número.$c$),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$ENT-PRIOR-RAYA$c$, $c$La raya de fracción agrupa arriba y abajo$c$, $c$Dividiste solo el término que estaba más cerca de la raya. Por
ejemplo, en $\frac{-10 + 6}{2}$ hiciste $-10 + \frac{6}{2} = -7$.

**La raya de fracción divide al numerador completo por el
denominador completo. Primero se calcula cada uno, después se
divide.**

$$\frac{-10 + 6}{2} = \frac{-4}{2} = -2$$

Es como si arriba y abajo hubiera paréntesis:
$(-10 + 6) \div 2$.

Un control rápido: antes de dividir, reduce lo de arriba a un solo
número y lo de abajo a un solo número. Solo entonces divides.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-PRIOR-IZQDER$c$, $c$REM-ENT-PRIOR-MULTDIV$c$, $c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$REM-ENT-PRIOR-PARCIAL$c$, $c$REM-ENT-PRIOR-RAYA$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-078$c$, 1::smallint),
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-079$c$, 2::smallint),
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-084$c$, 3::smallint),
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-085$c$, 4::smallint),
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-090$c$, 5::smallint),
  ($c$REM-ENT-PRIOR-IZQDER$c$, $c$M1-ENT-093$c$, 6::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-074$c$, 1::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-080$c$, 2::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-081$c$, 3::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-088$c$, 4::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-091$c$, 5::smallint),
  ($c$REM-ENT-PRIOR-MULTDIV$c$, $c$M1-ENT-096$c$, 6::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-075$c$, 1::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-082$c$, 2::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-086$c$, 3::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-091$c$, 4::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-094$c$, 5::smallint),
  ($c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$M1-ENT-095$c$, 6::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-076$c$, 1::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-082$c$, 2::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-084$c$, 3::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-090$c$, 4::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-093$c$, 5::smallint),
  ($c$REM-ENT-PRIOR-PARCIAL$c$, $c$M1-ENT-095$c$, 6::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-077$c$, 1::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-080$c$, 2::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-083$c$, 3::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-087$c$, 4::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-092$c$, 5::smallint),
  ($c$REM-ENT-PRIOR-RAYA$c$, $c$M1-ENT-095$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-04$c$, $c$NUM-ENT$c$, $c$Prioridad de operaciones$c$, $c$Una misma expresión tiene que dar lo mismo sin importar quién la
calcule. Para eso existe un orden acordado. Si lo cambias, cambias el
resultado, y en la PAES todas las alternativas incorrectas salen de
cambiarlo.

## Prioridad de operaciones

### El orden

**Primero lo que está agrupado; después multiplicaciones y divisiones;
al final sumas y restas.**

1. Paréntesis, corchetes y la raya de fracción: se calcula lo de
   adentro.
2. Multiplicaciones y divisiones, de izquierda a derecha.
3. Sumas y restas, de izquierda a derecha.

Ejemplo: $9 - 4 \cdot 5$. La multiplicación va antes:
$9 - 20 = -11$. Si restaras primero, tendrías $5 \cdot 5 = 25$, que es
otra cuenta.

### El error más común: leer de izquierda a derecha

Leemos de izquierda a derecha, y por eso el impulso es calcular en ese
orden. Pero en $-7 + 12 \div 4$ la división va primero:

$$-7 + 12 \div 4 = -7 + 3 = -4$$

Calcular $-7 + 12 = 5$ y después $5 \div 4$ es resolver la expresión
$(-7 + 12) \div 4$, que tiene paréntesis. La que te dieron no los
tiene.

Un control rápido: **antes de calcular, marca las multiplicaciones y
divisiones**. Esos son los primeros pasos; las sumas y restas esperan.

### Multiplicación y división: la que aparece primero

La multiplicación no va antes que la división. Tienen la misma
prioridad, y entre ellas se avanza de izquierda a derecha:

$$30 \div 5 \cdot 3 = 6 \cdot 3 = 18$$

Hacer primero $5 \cdot 3 = 15$ daría $30 \div 15 = 2$: es otra
expresión, $30 \div (5 \cdot 3)$. Con las sumas y restas pasa lo mismo:
en $11 - 4 + 2$ se resta primero, $7 + 2 = 9$.

### Paréntesis con un signo menos adelante

**Calcula primero lo de adentro, y después aplica el signo.**

$$6 - (2 - 9) = 6 - (-7) = 6 + 7 = 13$$

El error es sacar el paréntesis y dejar el menos solo en el primer
número: $6 - 2 - 9 = -5$. El menos afecta a todo el paréntesis, no solo
a su primer término. Si calculas adentro primero, ese problema no
aparece.

### Un número pegado a un paréntesis

$4(1 - 6)$ significa $4$ **por todo** el paréntesis:

$$4(1 - 6) = 4 \cdot (-5) = -20$$

No es $4 \cdot 1 - 6 = -2$: el $4$ multiplica al resultado completo de
lo de adentro, no solo al primer número.

### La raya de fracción agrupa

En una fracción, **el numerador y el denominador se calculan completos
antes de dividir**. Es como si cada uno tuviera su propio paréntesis:

$$\frac{-20 + 5}{-3} = \frac{-15}{-3} = 5$$

Dividir solo el $5$ por $-3$ sería resolver otra cosa.

### Corchetes

Cuando hay paréntesis dentro de corchetes, se trabaja **de adentro
hacia afuera**:

$$3 \cdot [7 - (1 - 4)] = 3 \cdot [7 - (-3)] = 3 \cdot 10 = 30$$

### Situaciones

En un problema con varios pasos, escribe una expresión que respete lo
que pasa y calcula con el orden de siempre. Si un grupo de $5$ personas
paga cada una $\$2.000$ con un descuento de $\$300$, el total es
$5 \cdot (2.000 - 300) = 8.500$: el paréntesis dice que el descuento es
por persona.$c$, 4::smallint)
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
  ($c$LES-NUM-ENT-04$c$, $c$NUM-ENT-PRIOR$c$, 1::smallint, $c$prioridad-de-operaciones$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-ENT-073$c$, $c$M1-ENT-074$c$, $c$M1-ENT-075$c$, $c$M1-ENT-076$c$, $c$M1-ENT-077$c$, $c$M1-ENT-078$c$, $c$M1-ENT-079$c$, $c$M1-ENT-080$c$, $c$M1-ENT-081$c$, $c$M1-ENT-082$c$, $c$M1-ENT-083$c$, $c$M1-ENT-084$c$, $c$M1-ENT-085$c$, $c$M1-ENT-086$c$, $c$M1-ENT-087$c$, $c$M1-ENT-088$c$, $c$M1-ENT-089$c$, $c$M1-ENT-090$c$, $c$M1-ENT-091$c$, $c$M1-ENT-092$c$, $c$M1-ENT-093$c$, $c$M1-ENT-094$c$, $c$M1-ENT-095$c$, $c$M1-ENT-096$c$);
  if c <> 24 then
    raise exception 'items: se esperaban 24, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-073$c$, $c$M1-ENT-074$c$, $c$M1-ENT-075$c$, $c$M1-ENT-076$c$, $c$M1-ENT-077$c$, $c$M1-ENT-078$c$, $c$M1-ENT-079$c$, $c$M1-ENT-080$c$, $c$M1-ENT-081$c$, $c$M1-ENT-082$c$, $c$M1-ENT-083$c$, $c$M1-ENT-084$c$, $c$M1-ENT-085$c$, $c$M1-ENT-086$c$, $c$M1-ENT-087$c$, $c$M1-ENT-088$c$, $c$M1-ENT-089$c$, $c$M1-ENT-090$c$, $c$M1-ENT-091$c$, $c$M1-ENT-092$c$, $c$M1-ENT-093$c$, $c$M1-ENT-094$c$, $c$M1-ENT-095$c$, $c$M1-ENT-096$c$);
  if c <> 96 then
    raise exception 'item_options: se esperaban 96, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-073$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-074$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-075$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-076$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-077$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-078$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-079$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-080$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-081$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-082$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-083$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-084$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-085$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-086$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-087$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-088$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-089$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-090$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-091$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-092$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-093$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-094$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-095$c$, $c$NUM-ENT-PRIOR$c$),
      ($c$M1-ENT-096$c$, $c$NUM-ENT-PRIOR$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 24 then
    raise exception 'node_items: 24 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-073$c$, $c$M1-ENT-074$c$, $c$M1-ENT-075$c$, $c$M1-ENT-076$c$, $c$M1-ENT-077$c$, $c$M1-ENT-078$c$, $c$M1-ENT-079$c$, $c$M1-ENT-080$c$, $c$M1-ENT-081$c$, $c$M1-ENT-082$c$, $c$M1-ENT-083$c$, $c$M1-ENT-084$c$, $c$M1-ENT-085$c$, $c$M1-ENT-086$c$, $c$M1-ENT-087$c$, $c$M1-ENT-088$c$, $c$M1-ENT-089$c$, $c$M1-ENT-090$c$, $c$M1-ENT-091$c$, $c$M1-ENT-092$c$, $c$M1-ENT-093$c$, $c$M1-ENT-094$c$, $c$M1-ENT-095$c$, $c$M1-ENT-096$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-ADI-DOBLENEG$c$, $c$ENT-ADI-INVIERTE$c$, $c$ENT-ADI-MAGNOP$c$, $c$ENT-ADI-REGLAMUL$c$, $c$ENT-MUL-REGLASUMA$c$, $c$ENT-MUL-SUMA$c$, $c$ENT-PRIOR-IZQDER$c$, $c$ENT-PRIOR-MULTDIV$c$, $c$ENT-PRIOR-PARCIAL$c$, $c$ENT-PRIOR-RAYA$c$, $c$ENT-PRIOR-SIGNOPAR$c$)
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

-- 24 ítems (24 curated), 96 alternativas, 11 misconceptions referenciadas,
-- 5 remediaciones, 0 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 24 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-ENT-073$c$, $c$M1-ENT-074$c$, $c$M1-ENT-075$c$, $c$M1-ENT-076$c$, $c$M1-ENT-077$c$, $c$M1-ENT-078$c$, $c$M1-ENT-079$c$, $c$M1-ENT-080$c$, $c$M1-ENT-081$c$, $c$M1-ENT-082$c$, $c$M1-ENT-083$c$, $c$M1-ENT-084$c$, $c$M1-ENT-085$c$, $c$M1-ENT-086$c$, $c$M1-ENT-087$c$, $c$M1-ENT-088$c$, $c$M1-ENT-089$c$, $c$M1-ENT-090$c$, $c$M1-ENT-091$c$, $c$M1-ENT-092$c$, $c$M1-ENT-093$c$, $c$M1-ENT-094$c$, $c$M1-ENT-095$c$, $c$M1-ENT-096$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-PRIOR-IZQDER$c$, $c$REM-ENT-PRIOR-MULTDIV$c$, $c$REM-ENT-PRIOR-SIGNOPAR$c$, $c$REM-ENT-PRIOR-PARCIAL$c$, $c$REM-ENT-PRIOR-RAYA$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-04$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-ENT-073$c$, $c$M1-ENT-074$c$, $c$M1-ENT-075$c$, $c$M1-ENT-076$c$, $c$M1-ENT-077$c$, $c$M1-ENT-078$c$, $c$M1-ENT-079$c$, $c$M1-ENT-080$c$, $c$M1-ENT-081$c$, $c$M1-ENT-082$c$, $c$M1-ENT-083$c$, $c$M1-ENT-084$c$, $c$M1-ENT-085$c$, $c$M1-ENT-086$c$, $c$M1-ENT-087$c$, $c$M1-ENT-088$c$, $c$M1-ENT-089$c$, $c$M1-ENT-090$c$, $c$M1-ENT-091$c$, $c$M1-ENT-092$c$, $c$M1-ENT-093$c$, $c$M1-ENT-094$c$, $c$M1-ENT-095$c$, $c$M1-ENT-096$c$) group by 1;
