-- =====================================================================
-- LES-NUM-ENT-01 — Los enteros en la recta y su orden
-- Generado por cargar_contenido.py desde LES-NUM-ENT-01.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status)
values
  ($c$M1-ENT-001$c$, $c$¿Cuál de las siguientes desigualdades es verdadera?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-002$c$, $c$En la recta numérica, ¿qué número está 3 unidades a la izquierda de $1$?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-003$c$, $c$¿Cuál de las siguientes afirmaciones es verdadera?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-004$c$, $c$Una noche la temperatura fue de 5 °C bajo cero. ¿Qué número representa esa temperatura y cuál es su sucesor?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-005$c$, $c$Al ordenar los números $-4$, $2$, $-9$ y $0$ de menor a mayor, se obtiene:$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-006$c$, $c$En una recta numérica, las marcas están separadas de 2 en 2 y el $0$ está sobre una de ellas. ¿Qué número corresponde a la tercera marca a la izquierda del $0$?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-007$c$, $c$En la recta numérica, ¿qué número está 7 unidades a la izquierda de $3$?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-008$c$, $c$¿Cuál es el antecesor del antecesor de $-8$?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-009$c$, $c$Considerando el nivel del mar como $0$, un buzo está a 15 m bajo el nivel del mar, un pez está a 20 m bajo el nivel del mar y un pelícano vuela a 8 m sobre el nivel del mar. ¿Cuál de las siguientes afirmaciones es verdadera?$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-010$c$, $c$Considera las siguientes afirmaciones:

I) $-12 < -5$

II) El sucesor de $-10$ es $-11$

III) $0 > -3$

¿Cuál(es) es(son) verdadera(s)?
$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-011$c$, $c$En una recta numérica las marcas están separadas de 5 en 5 y el $0$ está sobre una de ellas. El punto $P$ está 4 marcas a la izquierda del $0$ y el punto $Q$ está 1 marca a la derecha del $0$. ¿Cuántas unidades hay entre $P$ y $Q$?$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-012$c$, $c$Un bote flota en la superficie del mar. Tres submarinos están a 40 m, 120 m y 75 m bajo la superficie. Si la superficie es $0$ y se representan las cuatro posiciones con enteros, ¿cuál es el orden de menor a mayor?$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-013$c$, $c$¿Cuál de los siguientes números es menor que $-4$?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-014$c$, $c$En la recta numérica, ¿qué número está 6 unidades a la izquierda de $2$?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-015$c$, $c$En un edificio, la calle es el piso $0$. El auto de Ana está en el tercer subterráneo y el de Luis en el primer subterráneo. ¿Cuál afirmación es correcta?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-016$c$, $c$En una recta numérica, las marcas están separadas de 10 en 10 y el $0$ está sobre una de ellas. ¿Qué número corresponde a la segunda marca a la izquierda del $0$?$c$, 1, $c$propio$c$, 'draft'),
  ($c$M1-ENT-017$c$, $c$Al ordenar los números $-3$, $-11$, $5$, $0$ y $-7$ de mayor a menor, se obtiene:$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-018$c$, $c$En una recta numérica, las marcas están separadas de 3 en 3. El punto $A$ está sobre la marca del $-9$. ¿Qué número está 2 marcas a la derecha de $A$?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-019$c$, $c$Si $a$ es el sucesor de $-13$ y $b$ es el antecesor de $-13$, ¿cuál afirmación es correcta?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-020$c$, $c$Sofía debe 8 mil pesos y Tomás debe 3 mil pesos. Si se representan sus saldos con enteros, en miles de pesos, ¿cuál afirmación es correcta?$c$, 2, $c$propio$c$, 'draft'),
  ($c$M1-ENT-021$c$, $c$Considera las siguientes afirmaciones:

I) $-1 > -20$

II) El antecesor de $-7$ es $-6$

III) El número que está 5 unidades a la izquierda de $2$ es $-3$

¿Cuál(es) es(son) verdadera(s)?
$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-022$c$, $c$Un termómetro tiene marcas cada 2 °C. En la mañana marcaba $0$ °C y durante la noche la temperatura bajó hasta quedar 7 marcas bajo el $0$. ¿Qué temperatura marcaba en la noche?$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-023$c$, $c$Un minero trabaja a 350 m bajo la superficie, otro trabaja a 120 m bajo la superficie y una topógrafa está en un cerro a 200 m sobre la superficie. Si la superficie es $0$, ¿cuál de las siguientes desigualdades ordena correctamente sus posiciones?$c$, 3, $c$propio$c$, 'draft'),
  ($c$M1-ENT-024$c$, $c$Sean $p$ y $q$ enteros tales que $p$ está a la izquierda de $q$ en la recta numérica. ¿Cuál de las siguientes afirmaciones es siempre verdadera?$c$, 3, $c$propio$c$, 'draft')
on conflict (code) do update
  set stem = excluded.stem,
      author_difficulty = excluded.author_difficulty,
      source = excluded.source;

-- 2. item_options — la señal diagnóstica -----------------------------
-- Upsert sobre (item_id, label), que ya tiene índice único.
-- No se borra: responses.option_id apunta acá con on delete restrict,
-- y el delete rompería la publicación apenas exista una respuesta.
insert into item_options (item_id, label, body, is_correct, misconception_id)
select i.id, v.label, v.body, v.is_correct, m.id
from (values
  ($c$M1-ENT-001$c$, $c$A$c$, $c$$-9 > -2$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-001$c$, $c$B$c$, $c$$-6 > 4$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-001$c$, $c$C$c$, $c$$0 < -5$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-001$c$, $c$D$c$, $c$$-3 > -7$$c$, true, null),
  ($c$M1-ENT-002$c$, $c$A$c$, $c$$-1$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-002$c$, $c$B$c$, $c$$-2$$c$, true, null),
  ($c$M1-ENT-002$c$, $c$C$c$, $c$$4$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-002$c$, $c$D$c$, $c$$0$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-003$c$, $c$A$c$, $c$El sucesor de $-5$ es $-6$$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-003$c$, $c$B$c$, $c$El $0$ no tiene antecesor en los enteros$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-003$c$, $c$C$c$, $c$El sucesor de $-5$ es $-4$$c$, true, null),
  ($c$M1-ENT-003$c$, $c$D$c$, $c$$-10$ es mayor que $-1$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-004$c$, $c$A$c$, $c$$5$, y su sucesor es $6$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-004$c$, $c$B$c$, $c$$-5$, y su sucesor es $-6$$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-004$c$, $c$C$c$, $c$$-5$, y su sucesor es $-4$, que es menor que $-5$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-004$c$, $c$D$c$, $c$$-5$, y su sucesor es $-4$$c$, true, null),
  ($c$M1-ENT-005$c$, $c$A$c$, $c$$-4,\ -9,\ 0,\ 2$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-005$c$, $c$B$c$, $c$$0,\ 2,\ -4,\ -9$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-005$c$, $c$C$c$, $c$$-9,\ -4,\ 0,\ 2$$c$, true, null),
  ($c$M1-ENT-005$c$, $c$D$c$, $c$$0,\ -9,\ -4,\ 2$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-006$c$, $c$A$c$, $c$$-3$$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M1-ENT-006$c$, $c$B$c$, $c$$-6$$c$, true, null),
  ($c$M1-ENT-006$c$, $c$C$c$, $c$$-4$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-006$c$, $c$D$c$, $c$$6$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-007$c$, $c$A$c$, $c$$-3$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-007$c$, $c$B$c$, $c$$10$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-007$c$, $c$C$c$, $c$$0$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-007$c$, $c$D$c$, $c$$-4$$c$, true, null),
  ($c$M1-ENT-008$c$, $c$A$c$, $c$$-10$, que es menor que $-8$$c$, true, null),
  ($c$M1-ENT-008$c$, $c$B$c$, $c$$-6$, que es mayor que $-8$$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-008$c$, $c$C$c$, $c$$-9$, que es menor que $-8$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-008$c$, $c$D$c$, $c$$-10$, que es mayor que $-8$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-009$c$, $c$A$c$, $c$La posición del buzo es $15$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-009$c$, $c$B$c$, $c$La posición del pez es $-20$ y está más abajo que el buzo$c$, true, null),
  ($c$M1-ENT-009$c$, $c$C$c$, $c$El pez está más arriba que el buzo, porque $-20 > -15$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-009$c$, $c$D$c$, $c$El pelícano está más abajo que el buzo, porque $8 < 15$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-010$c$, $c$A$c$, $c$I, II y III$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-010$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-010$c$, $c$C$c$, $c$Solo III$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-010$c$, $c$D$c$, $c$Solo I$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-011$c$, $c$A$c$, $c$$5$$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M1-ENT-011$c$, $c$B$c$, $c$$30$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-011$c$, $c$C$c$, $c$$25$$c$, true, null),
  ($c$M1-ENT-011$c$, $c$D$c$, $c$$15$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-012$c$, $c$A$c$, $c$$-120,\ -75,\ -40,\ 0$$c$, true, null),
  ($c$M1-ENT-012$c$, $c$B$c$, $c$$-40,\ -75,\ -120,\ 0$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-012$c$, $c$C$c$, $c$$0,\ -120,\ -75,\ -40$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-012$c$, $c$D$c$, $c$$0,\ 40,\ 75,\ 120$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-013$c$, $c$A$c$, $c$$-2$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-013$c$, $c$B$c$, $c$$3$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-013$c$, $c$C$c$, $c$$-6$$c$, true, null),
  ($c$M1-ENT-013$c$, $c$D$c$, $c$$0$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-014$c$, $c$A$c$, $c$$-4$$c$, true, null),
  ($c$M1-ENT-014$c$, $c$B$c$, $c$$8$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-014$c$, $c$C$c$, $c$$-3$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-014$c$, $c$D$c$, $c$$0$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-015$c$, $c$A$c$, $c$El auto de Ana está más abajo, porque $-3 < -1$$c$, true, null),
  ($c$M1-ENT-015$c$, $c$B$c$, $c$El auto de Luis está más abajo, porque $-1 < -3$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-015$c$, $c$C$c$, $c$El auto de Luis está más abajo, porque $1 < 3$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-015$c$, $c$D$c$, $c$Entre los dos autos hay 3 pisos de diferencia$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-016$c$, $c$A$c$, $c$$-2$$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M1-ENT-016$c$, $c$B$c$, $c$$-10$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-016$c$, $c$C$c$, $c$$20$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-016$c$, $c$D$c$, $c$$-20$$c$, true, null),
  ($c$M1-ENT-017$c$, $c$A$c$, $c$$5,\ 0,\ -11,\ -7,\ -3$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-017$c$, $c$B$c$, $c$$-11,\ -7,\ 5,\ -3,\ 0$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-017$c$, $c$C$c$, $c$$5,\ -3,\ -7,\ -11,\ 0$$c$, false, $c$ENT-REC-CERO$c$),
  ($c$M1-ENT-017$c$, $c$D$c$, $c$$5,\ 0,\ -3,\ -7,\ -11$$c$, true, null),
  ($c$M1-ENT-018$c$, $c$A$c$, $c$$-3$$c$, true, null),
  ($c$M1-ENT-018$c$, $c$B$c$, $c$$-7$$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M1-ENT-018$c$, $c$C$c$, $c$$-15$$c$, false, $c$ENT-REC-DIRECCION$c$),
  ($c$M1-ENT-018$c$, $c$D$c$, $c$$-6$$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-019$c$, $c$A$c$, $c$$a = -14$ y $b = -12$$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-019$c$, $c$B$c$, $c$$a = -12$ y $b = -14$, por lo que $a > b$$c$, true, null),
  ($c$M1-ENT-019$c$, $c$C$c$, $c$$a = -12$ y $b = -14$, que están a 3 unidades entre sí$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-019$c$, $c$D$c$, $c$$a = -12$ y $b = -14$, por lo que $a < b$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-020$c$, $c$A$c$, $c$El saldo de Tomás es menor, porque $-3 < -8$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-020$c$, $c$B$c$, $c$El saldo de Sofía es $-8$ y es menor que el de Tomás$c$, true, null),
  ($c$M1-ENT-020$c$, $c$C$c$, $c$El saldo de Tomás es menor, porque $3 < 8$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-020$c$, $c$D$c$, $c$La diferencia entre ambos saldos es de 6 mil pesos$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-021$c$, $c$A$c$, $c$I, II y III$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-021$c$, $c$B$c$, $c$Solo III$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-021$c$, $c$C$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-ENT-021$c$, $c$D$c$, $c$Solo I$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-022$c$, $c$A$c$, $c$$-7$ °C$c$, false, $c$ENT-REC-ESCALA$c$),
  ($c$M1-ENT-022$c$, $c$B$c$, $c$$-12$ °C$c$, false, $c$ENT-REC-CONTEO$c$),
  ($c$M1-ENT-022$c$, $c$C$c$, $c$$-14$ °C$c$, true, null),
  ($c$M1-ENT-022$c$, $c$D$c$, $c$$14$ °C$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-023$c$, $c$A$c$, $c$$-350 < -120 < 200$$c$, true, null),
  ($c$M1-ENT-023$c$, $c$B$c$, $c$$-120 < -350 < 200$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-023$c$, $c$C$c$, $c$$-120 < 200 < -350$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-023$c$, $c$D$c$, $c$$120 < 200 < 350$$c$, false, $c$ENT-REC-CTXSIGNO$c$),
  ($c$M1-ENT-024$c$, $c$A$c$, $c$Si $p$ y $q$ son negativos, entonces $p > q$$c$, false, $c$ENT-REC-MAGN$c$),
  ($c$M1-ENT-024$c$, $c$B$c$, $c$Si $p = -9$ y $q = 4$, entonces $p > q$$c$, false, $c$ENT-REC-SINSIGNO$c$),
  ($c$M1-ENT-024$c$, $c$C$c$, $c$Si $q$ es el sucesor de $p$ y $p = -6$, entonces $q = -7$$c$, false, $c$ENT-REC-SUCESOR$c$),
  ($c$M1-ENT-024$c$, $c$D$c$, $c$$p < q$, cualesquiera sean sus signos$c$, true, null)
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
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-001$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-002$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-003$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-004$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-005$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-006$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-007$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-008$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-009$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-010$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-011$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-012$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-013$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-014$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-015$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-016$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-017$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-018$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-019$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-020$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-021$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-022$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-023$c$),
  ($c$NUM-ENT-REC$c$, $c$M1-ENT-024$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-ENT-REC-MAGN$c$, $c$ENT-REC-MAGN$c$, $c$Con negativos, el número más grande a la vista es el menor$c$, $c$Elegiste como mayor al negativo con el número más grande, como si
$-8$ fuera mayor que $-5$ porque $8 > 5$. Con los negativos pasa
justo al revés.

La regla de la recta es una sola y sirve para todos los enteros:
**el que está más a la derecha es el mayor**.

$$-8 \quad -7 \quad -6 \quad -5 \quad -4 \quad -3 \quad -2 \quad -1 \quad 0$$

El $-5$ está más a la derecha que el $-8$. Entonces $-5 > -8$.

Piénsalo con temperaturas: $-8$ °C es más frío que $-5$ °C. Más
frío significa menos temperatura, así que $-8$ es menor.

Un control rápido: entre dos negativos, el mayor es el que está
**más cerca del $0$**.$c$),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$ENT-REC-SINSIGNO$c$, $c$El signo menos no se puede borrar$c$, $c$Trabajaste con los números como si no tuvieran signo: miraste el $8$
de $-8$ y lo comparaste o lo contaste como un $8$ positivo. Pero $-8$
y $8$ son números distintos, que están en lados opuestos de la recta.

$$-8 \quad \cdots \quad -1 \quad 0 \quad 1 \quad \cdots \quad 8$$

Todo negativo está a la izquierda del $0$. Todo positivo está a la
derecha. Por eso **cualquier negativo es menor que cualquier
positivo**, sin importar los dígitos:

$$-8 < 5 \qquad -100 < 1$$

Antes de comparar o contar, ubica cada número en su lado de la
recta. Recién después miras los dígitos.$c$),
  ($c$REM-ENT-REC-CERO$c$, $c$ENT-REC-CERO$c$, $c$El 0 no es el piso$c$, $c$Trataste el $0$ como si fuera el número más chico de todos. En los
números que usas para contar ($0, 1, 2, 3, \ldots$) sí lo es, pero
los enteros siguen hacia la izquierda: $-1, -2, -3, \ldots$ sin
terminar nunca.

$$\cdots \quad -3 \quad -2 \quad -1 \quad 0 \quad 1 \quad 2 \quad 3 \quad \cdots$$

Como cualquier negativo está a la izquierda del $0$, **todo negativo
es menor que $0$**:

$$-1 < 0 \qquad -50 < 0$$

Si te sirve, piensa en un termómetro: bajo cero existen
temperaturas, y son más frías que $0$ °C.$c$),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$ENT-REC-SUCESOR$c$, $c$El sucesor siempre está a la derecha$c$, $c$Para el sucesor de un negativo te alejaste del $0$: diste como
sucesor un número más lejos del $0$, como si el sucesor de $-16$
fuera $-17$. Con los positivos "el que sigue" coincide
con "el de número más grande", y por eso la costumbre engaña.

La definición no mira los dígitos, mira la recta:

- El **sucesor** es el entero que está justo **a la derecha**.
- El **antecesor** es el entero que está justo **a la izquierda**.

$$-17 \quad \underbrace{-16}_{\text{número}} \quad -15$$

El antecesor de $-16$ es $-17$ y su sucesor es $-15$.

Un control que no falla: el sucesor siempre es **mayor** que el
número. Como $-15 > -16$, el sucesor de $-16$ es $-15$.$c$),
  ($c$REM-ENT-REC-ESCALA$c$, $c$ENT-REC-ESCALA$c$, $c$Cada marca vale lo que dice la escala$c$, $c$Contaste las marcas de la recta como si cada una valiera $1$. Cuando
las marcas van de 4 en 4, cada salto vale $4$, no $1$.

$$\underset{-16}{|} \quad \underset{-12}{|} \quad \underset{-8}{|} \quad \underset{-4}{|} \quad \underset{0}{|} \quad \underset{4}{|}$$

La cuarta marca a la izquierda del $0$ está a cuatro saltos, y cada
salto vale $4$: $4$ saltos de $4$ son $16$ unidades. Por eso es
$-16$, no $-4$.

Antes de leer un punto, busca dos marcas con número y mira cuánto
cambia entre una y la siguiente. Ese es el valor de cada salto.$c$),
  ($c$REM-ENT-REC-CONTEO$c$, $c$ENT-REC-CONTEO$c$, $c$Se cuentan saltos, no números$c$, $c$Al moverte en la recta contaste el número de partida como si fuera
un paso. Por eso te sobra una unidad.

Para ir de $-4$ a $2$ no importa cuántos números tocas, importa
cuántos **saltos** das:

$$-4 \to -3 \to -2 \to -1 \to 0 \to 1 \to 2$$

Son $7$ números, pero solo $6$ flechas. La distancia es $6$.

Lo mismo al moverte desde un punto: "4 a la izquierda de $2$"
significa cuatro saltos, y el primer salto termina en $1$, no en
$2$: $2 \to 1 \to 0 \to -1 \to -2$.

Cuenta las flechas, nunca los puntos.$c$),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$ENT-REC-DIRECCION$c$, $c$A la izquierda se baja, a la derecha se sube$c$, $c$Te moviste hacia el lado contrario: para ir a la izquierda
sumaste, como si "4 a la izquierda de 6" fuera $10$.

En la recta los números crecen hacia la derecha. Por eso:

- Moverse a la **derecha** es ir hacia números **mayores**.
- Moverse a la **izquierda** es ir hacia números **menores**.

$$2 \leftarrow 3 \leftarrow 4 \leftarrow 5 \leftarrow 6$$

Cuatro saltos a la izquierda de $6$ llegan a $2$, no a $10$.

Esto no cambia al cruzar el cero. Dos a la izquierda de $1$ es $-1$:
sigues bajando, aunque ahora aparezca el signo menos.

Un control rápido: si te moviste a la izquierda, tu respuesta tiene
que ser **menor** que el punto de partida.$c$),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$Bajo cero, bajo el mar y deuda son negativos$c$, $c$Escribiste como positiva una cantidad que en el problema estaba
"bajo" algo. Todo lo que queda bajo el punto de referencia se
escribe con signo menos:

- 7 °C **bajo cero** es $-7$.
- 30 m **bajo el nivel del mar** es $-30$.
- Una **deuda** de 12 mil pesos es $-12000$.

Lo que está sobre la referencia (sobre cero, sobre el nivel del mar,
a favor) es positivo.

El orden correcto es primero **escribir el entero con su signo** y
recién después comparar. Si comparas antes de poner el signo,
comparas otros números.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-ENT-REC-MAGN$c$, $c$REM-ENT-REC-SINSIGNO$c$, $c$REM-ENT-REC-CERO$c$, $c$REM-ENT-REC-SUCESOR$c$, $c$REM-ENT-REC-ESCALA$c$, $c$REM-ENT-REC-CONTEO$c$, $c$REM-ENT-REC-DIRECCION$c$, $c$REM-ENT-REC-CTXSIGNO$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-001$c$, 1::smallint),
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-005$c$, 2::smallint),
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-012$c$, 3::smallint),
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-013$c$, 4::smallint),
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-017$c$, 5::smallint),
  ($c$REM-ENT-REC-MAGN$c$, $c$M1-ENT-023$c$, 6::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-001$c$, 1::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-005$c$, 2::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-009$c$, 3::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-013$c$, 4::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-017$c$, 5::smallint),
  ($c$REM-ENT-REC-SINSIGNO$c$, $c$M1-ENT-023$c$, 6::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-001$c$, 1::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-002$c$, 2::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-005$c$, 3::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-010$c$, 4::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-012$c$, 5::smallint),
  ($c$REM-ENT-REC-CERO$c$, $c$M1-ENT-013$c$, 6::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-003$c$, 1::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-004$c$, 2::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-008$c$, 3::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-010$c$, 4::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-019$c$, 5::smallint),
  ($c$REM-ENT-REC-SUCESOR$c$, $c$M1-ENT-024$c$, 6::smallint),
  ($c$REM-ENT-REC-ESCALA$c$, $c$M1-ENT-006$c$, 1::smallint),
  ($c$REM-ENT-REC-ESCALA$c$, $c$M1-ENT-011$c$, 2::smallint),
  ($c$REM-ENT-REC-ESCALA$c$, $c$M1-ENT-016$c$, 3::smallint),
  ($c$REM-ENT-REC-ESCALA$c$, $c$M1-ENT-018$c$, 4::smallint),
  ($c$REM-ENT-REC-ESCALA$c$, $c$M1-ENT-022$c$, 5::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-002$c$, 1::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-007$c$, 2::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-008$c$, 3::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-014$c$, 4::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-020$c$, 5::smallint),
  ($c$REM-ENT-REC-CONTEO$c$, $c$M1-ENT-021$c$, 6::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-002$c$, 1::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-006$c$, 2::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-007$c$, 3::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-014$c$, 4::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-016$c$, 5::smallint),
  ($c$REM-ENT-REC-DIRECCION$c$, $c$M1-ENT-018$c$, 6::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-004$c$, 1::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-009$c$, 2::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-012$c$, 3::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-015$c$, 4::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-020$c$, 5::smallint),
  ($c$REM-ENT-REC-CTXSIGNO$c$, $c$M1-ENT-022$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-NUM-ENT-01$c$, $c$NUM-ENT$c$, $c$Los enteros en la recta y su orden$c$, $c$Esta es la primera clase de todo el eje de números. Todo lo que viene
después (sumar, restar, multiplicar con signos, las fracciones en la
recta) se apoya en una sola idea: dónde está cada número y cuál es
mayor.

## Los enteros en la recta y su orden

### De los naturales a los enteros

Los números que usas para contar son los **naturales**: $1, 2, 3,
\ldots$ Si les agregas el $0$, en la recta quedan todos del $0$ hacia
la derecha.

Pero hay situaciones que se quedan cortas con eso: una temperatura bajo
cero, un piso subterráneo, una deuda. Para ellas la recta sigue hacia
la izquierda del $0$ con los **negativos**: $-1, -2, -3, \ldots$

Los naturales, el $0$ y los negativos juntos forman los **números
enteros**, que se escriben $\mathbb{Z}$.

$$\cdots \quad -4 \quad -3 \quad -2 \quad -1 \quad 0 \quad 1 \quad 2 \quad 3 \quad 4 \quad \cdots$$

Todo natural es entero, pero no todo entero es natural: $-3$ es entero
y no es natural.

### La regla del orden

En la recta hay una sola regla, y sirve para todos los enteros:

**El que está más a la derecha es el mayor.**

Por lo mismo, moverse a la derecha es ir a números mayores y moverse a
la izquierda es ir a números menores, crucen o no el $0$.

De ahí salen tres consecuencias:

- Cualquier positivo es mayor que $0$.
- Cualquier negativo es menor que $0$. El $0$ no es el piso.
- Cualquier negativo es menor que cualquier positivo: $-100 < 1$.

### Comparar dos negativos

Este es el caso que más se equivoca. Entre $-8$ y $-5$, el $8$ parece
"más grande", pero en la recta el $-8$ está más a la izquierda:

$$-8 \quad -7 \quad -6 \quad -5 \quad -4 \quad -3 \quad -2 \quad -1 \quad 0$$

Entonces $-8 < -5$.

Una forma de verlo: entre dos negativos, el mayor es el que está **más
cerca del $0$**. Con temperaturas es natural: $-8$ °C es más frío que
$-5$ °C.

### Antecesor y sucesor

- El **sucesor** de un entero es el que está justo a su derecha.
- El **antecesor** es el que está justo a su izquierda.

Con positivos no hay sorpresa: el sucesor de $4$ es $5$. Con negativos
hay que mirar la recta, no los dígitos:

$$\text{antecesor de } -16 = -17 \qquad \text{sucesor de } -16 = -15$$

El sucesor siempre es mayor que el número. Si tu sucesor te dio menor,
te moviste hacia el lado equivocado.

### Leer una recta con escala

No todas las rectas van de 1 en 1. Antes de leer un punto, busca dos
marcas con número y mira cuánto cambia de una a la siguiente:

$$\underset{-75}{|} \quad \underset{-50}{|} \quad \underset{-25}{|} \quad \underset{0}{|} \quad \underset{25}{|} \quad \underset{50}{|}$$

Aquí cada salto vale $25$. La tercera marca a la izquierda del $0$ es
$-75$, no $-3$.

Para medir cuántas unidades hay entre dos puntos, **cuenta saltos, no
números**. De $-3$ a $4$ hay ocho números pero siete saltos, así que la
distancia es $7$.

### Enteros en contexto

En los problemas los números vienen escritos con palabras. Primero
traduce cada dato a un entero con su signo, y recién después compara.

- Bajo cero, bajo el nivel del mar, subterráneo, deuda: **negativo**.
- Sobre cero, sobre el nivel del mar, a favor: **positivo**.
- La referencia (el cero, la superficie, la calle): **$0$**.

Si una ancla está a 10 m bajo el mar y una roca a 25 m bajo el mar, sus
posiciones son $-10$ y $-25$. Como $-25 < -10$, la roca está más
abajo.$c$, 1::smallint)
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
  ($c$LES-NUM-ENT-01$c$, $c$NUM-ENT-REC$c$, 1::smallint, $c$los-enteros-en-la-recta-y-su-orden$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer;
begin
  select count(*) into c from items where code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$);
  if c <> 24 then
    raise exception 'items: se esperaban 24, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$);
  if c <> 96 then
    raise exception 'item_options: se esperaban 96, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-ENT-001$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-002$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-003$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-004$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-005$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-006$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-007$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-008$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-009$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-010$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-011$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-012$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-013$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-014$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-015$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-016$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-017$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-018$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-019$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-020$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-021$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-022$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-023$c$, $c$NUM-ENT-REC$c$),
      ($c$M1-ENT-024$c$, $c$NUM-ENT-REC$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 24 then
    raise exception 'node_items: 24 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$ENT-REC-CERO$c$, $c$ENT-REC-CONTEO$c$, $c$ENT-REC-CTXSIGNO$c$, $c$ENT-REC-DIRECCION$c$, $c$ENT-REC-ESCALA$c$, $c$ENT-REC-MAGN$c$, $c$ENT-REC-SINSIGNO$c$, $c$ENT-REC-SUCESOR$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;
end
$verif$;

-- 24 ítems (24 curated), 96 alternativas, 8 misconceptions referenciadas,
-- 8 remediaciones, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 24 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-ENT-REC-MAGN$c$, $c$REM-ENT-REC-SINSIGNO$c$, $c$REM-ENT-REC-CERO$c$, $c$REM-ENT-REC-SUCESOR$c$, $c$REM-ENT-REC-ESCALA$c$, $c$REM-ENT-REC-CONTEO$c$, $c$REM-ENT-REC-DIRECCION$c$, $c$REM-ENT-REC-CTXSIGNO$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-NUM-ENT-01$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$) group by 1;
