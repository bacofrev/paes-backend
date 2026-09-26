-- =====================================================================
-- LES-ALG-EXP-01 — Lenguaje algebraico
-- Generado por cargar_contenido.py desde LES-ALG-EXP-01.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-EXP-001$c$, $c$¿Cuál expresión representa el triple de un número $x$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-002$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-003$c$, $c$La semisuma de $a$ y $b$ se escribe:$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-004$c$, $c$Si $n$ es el menor de tres números naturales consecutivos, ¿cuál expresión representa la suma de los tres?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-005$c$, $c$Si $x \neq 0$, ¿cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-006$c$, $c$¿Cuál expresión representa «$x$ aumentado en el doble de $y$»?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-007$c$, $c$¿Qué enunciado corresponde a la expresión $4x + 1$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-008$c$, $c$Luis tiene $x$ láminas y Marta tiene el doble de láminas que Luis. ¿Cuántas láminas tiene Marta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-009$c$, $c$Ana tiene $a$ años y su hermano tiene 3 años más que ella. ¿Cuál expresión representa la suma de las edades de ambos?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-010$c$, $c$Si $2n$ es un número par, ¿cuál es el número par que le sigue?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-011$c$, $c$Un taxi cobra $b$ pesos al subir y $t$ pesos por cada kilómetro recorrido. ¿Cuánto cobra por un viaje de $k$ kilómetros?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-012$c$, $c$El doble de la suma de $a$ y $b$ se escribe:$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-013$c$, $c$La suma de los cuadrados de $x$ y de $y$ se escribe:$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-014$c$, $c$Cada escalón de una escalera sube 15 cm. ¿A qué altura, en cm, queda el escalón número $n$, medida desde el suelo?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-015$c$, $c$Si $x \neq 0$, ¿cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-EXP-016$c$, $c$¿Cuál expresión representa «7 menos que el doble de un número $x$»?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-017$c$, $c$El exceso del triple de $a$ sobre $b$ se escribe:$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-018$c$, $c$¿Qué enunciado corresponde a la expresión $(2x)^2$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-019$c$, $c$¿Qué enunciado corresponde a la expresión $3(x - 5)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-020$c$, $c$El opuesto del triple de un número $x$ es:$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-021$c$, $c$Si $a \neq 0$, el inverso del doble de $a$ es:$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-022$c$, $c$Pedro tiene el triple del dinero que tiene Juan. Si Pedro tiene $p$ pesos, ¿cuánto dinero tienen entre los dos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-023$c$, $c1$Camila tiene $c$ años. ¿Cuál expresión representa el doble de la edad que tenía hace 3 años?$c1$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-024$c$, $c$Si $2n + 1$ es el menor de tres números impares consecutivos, ¿cuál es el mayor de ellos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-025$c$, $c$Sofía gana $s$ pesos por semana y gasta $g$ pesos cada día, los 7 días de la semana. ¿Cuánto dinero ahorra en una semana?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-026$c$, $c$Un número de dos cifras tiene $d$ como cifra de las decenas y $u$ como cifra de las unidades. ¿Cuál expresión representa ese número?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-027$c$, $c$Un bidón tiene 20 litros de agua y cada día se sacan 3 litros. ¿Cuántos litros quedan después de $d$ días?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-028$c$, $c$¿Qué enunciado corresponde a la expresión $-3x$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-029$c$, $c$En un número de dos cifras, la cifra de las decenas es $x$ y la de las unidades es el número que sigue a $x$. ¿Cuál expresión representa ese número?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-030$c$, $c$Si $2n$ es el del medio de tres números pares consecutivos, ¿cuál expresión representa la suma de los tres?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-EXP-031$c$, $c$Una secuencia de figuras se arma con palitos. La figura 1 tiene 4 palitos y cada figura tiene 3 palitos más que la anterior. ¿Cuántos palitos tiene la figura $n$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-032$c$, $c$Una planta mide 5 cm y crece 4 cm cada semana. ¿Cuánto medirá, en cm, dentro de $n$ semanas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-033$c$, $c1$Un estacionamiento cobra $c$ pesos por la primera hora y $d$ pesos por cada hora adicional. ¿Cuánto paga una persona que deja su auto $h$ horas, con $h > 1$?$c1$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-034$c$, $c$Una persona gana $a$ pesos al mes y paga una cuenta de $b$ pesos cada dos meses. ¿Cuánto dinero le queda en un año, después de pagar esa cuenta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-035$c$, $c$Un número de dos cifras tiene $a$ como cifra de las decenas y $b$ como cifra de las unidades. ¿Cuál expresión representa el doble de ese número?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-036$c$, $c$Hace 4 años, la edad de Martín era el triple de la edad que tenía su hija. Si hoy la hija tiene $h$ años, ¿qué edad tenía Martín hace 4 años?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-037$c$, $c$Rocío tiene $r$ años y su hermano es 5 años mayor que ella. ¿Cuál expresión representa la suma de sus edades dentro de 2 años?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-038$c$, $c$Un padre tiene $p$ años y su hijo tiene $h$ años. ¿Cuál expresión representa el exceso de la edad que tendrá el padre dentro de 6 años sobre la edad que tenía el hijo hace 2 años?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-039$c$, $c$Si $y \neq 0$, el exceso del doble de $x$ sobre el inverso de $y$ se escribe:$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-040$c$, $c$Hoy Ignacio tiene $x$ años y su prima Valentina tiene el doble de la edad de Ignacio. ¿Cuál(es) de las siguientes afirmaciones es (son) verdadera(s)?

I) Valentina tiene $2x$ años.

II) Hace 3 años, Ignacio tenía $x + 3$ años.

III) Si Ignacio tiene más de 5 años, el exceso de su edad sobre 5 se escribe $x - 5$.
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-041$c$, $c$Si $n$ es un dígito entre 1 y 9, ¿cuál(es) de las siguientes afirmaciones es (son) verdadera(s)?

I) $n$, $n + 1$ y $n + 2$ son tres números consecutivos.

II) $2n$ y $2n + 1$ son dos números pares consecutivos.

III) El número de dos cifras que tiene $n$ decenas y 5 unidades se escribe $n + 5$.
$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-042$c$, $c$Un número de dos cifras tiene $a$ como cifra de las decenas y $b$ como cifra de las unidades, con $a < 9$. Si la cifra de las decenas aumenta en 1, ¿cuál expresión representa el nuevo número?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-043$c$, $c$Joaquín ahorra $s$ pesos cada semana desde hace 6 semanas y no ha sacado nada. Hoy tiene $A$ pesos en total. ¿Cuánto dinero tenía hace 6 semanas, cuando empezó a ahorrar?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-044$c$, $c$Si $2n$ es un número par, ¿cuál expresión representa el exceso del número par que le sigue sobre $2n$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-EXP-045$c$, $c$Se escriben en orden los números de dos cifras que terminan en 5: $15,\ 25,\ 35,\ \ldots$ ¿Cuál expresión representa el número que ocupa el lugar $n$ de esa lista?$c$, 3, $c$propio$c$::text, null::text)
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
  ($c$M1-EXP-001$c$, $c$A$c$, $c$$3x$$c$, true, null),
  ($c$M1-EXP-001$c$, $c$B$c$, $c$$x + 3$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-001$c$, $c$C$c$, $c$$x^3$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-001$c$, $c$D$c$, $c$$\frac{x}{3}$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-002$c$, $c$A$c$, $c$$x^3$ es $x \cdot x \cdot x$$c$, true, null),
  ($c$M1-EXP-002$c$, $c$B$c$, $c$$x^2$ es el doble de $x$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-002$c$, $c$C$c$, $c$$5x$ es $x$ aumentado en $5$$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-002$c$, $c$D$c$, $c$$\frac{x}{4}$ es el cuádruplo de $x$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-003$c$, $c$A$c$, $c$$a + \frac{b}{2}$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-003$c$, $c$B$c$, $c$$\frac{a + b}{2}$$c$, true, null),
  ($c$M1-EXP-003$c$, $c$C$c$, $c$$2(a + b)$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-003$c$, $c$D$c$, $c$$(a + b) - 2$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-004$c$, $c$A$c$, $c$$n + 2n + 3n$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-004$c$, $c$B$c$, $c$$n + m + p$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-004$c$, $c$C$c$, $c$$n + (n + 1) + (n + 2)$$c$, true, null),
  ($c$M1-EXP-004$c$, $c$D$c$, $c$$n + (n + 2) + (n + 4)$$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-005$c$, $c$A$c$, $c$El opuesto de $x$ es $\frac{1}{x}$$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-005$c$, $c$B$c$, $c$El opuesto de $x$ es $-x$$c$, true, null),
  ($c$M1-EXP-005$c$, $c$C$c$, $c$$7$ menos que $x$ es $7 - x$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-005$c$, $c$D$c$, $c$El exceso de $x$ sobre $3$ es $x + 3$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-006$c$, $c$A$c$, $c$$2(x + y)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-006$c$, $c$B$c$, $c$$x + y^2$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-006$c$, $c$C$c$, $c$$x + 2y$$c$, true, null),
  ($c$M1-EXP-006$c$, $c$D$c$, $c$$x + y + 2$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-007$c$, $c$A$c$, $c$Un número aumentado en 4, y luego aumentado en 1$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-007$c$, $c$B$c$, $c$La cuarta potencia de un número, aumentada en 1$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-007$c$, $c$C$c$, $c$El cuádruplo de un número, aumentado en 1$c$, true, null),
  ($c$M1-EXP-007$c$, $c$D$c$, $c$La cuarta parte de un número, aumentada en 1$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-008$c$, $c$A$c$, $c$$\frac{x}{2}$$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-008$c$, $c$B$c$, $c$$x + 2$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-008$c$, $c$C$c$, $c$$x^2$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-008$c$, $c$D$c$, $c$$2x$$c$, true, null),
  ($c$M1-EXP-009$c$, $c$A$c$, $c$$a + b$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-009$c$, $c$B$c$, $c$$a + (a + 3)$$c$, true, null),
  ($c$M1-EXP-009$c$, $c$C$c$, $c$$a + (a - 3)$$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-009$c$, $c$D$c$, $c$$a + 3a$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-010$c$, $c$A$c$, $c$$2n + 2$$c$, true, null),
  ($c$M1-EXP-010$c$, $c$B$c$, $c$$2n + 1$$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-010$c$, $c$C$c$, $c$$3n$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-010$c$, $c$D$c$, $c$$2m$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-011$c$, $c$A$c$, $c$$b + t$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-011$c$, $c$B$c$, $c$$b + tk$$c$, true, null),
  ($c$M1-EXP-011$c$, $c$C$c$, $c$$b + t + k$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-011$c$, $c$D$c$, $c$$(b + t)k$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-012$c$, $c$A$c$, $c$$2a + b$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-012$c$, $c$B$c$, $c$$(a + b)^2$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-012$c$, $c$C$c$, $c$$\frac{a + b}{2}$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-012$c$, $c$D$c$, $c$$2(a + b)$$c$, true, null),
  ($c$M1-EXP-013$c$, $c$A$c$, $c$$(x + y)^2$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-013$c$, $c$B$c$, $c$$2x + 2y$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-013$c$, $c$C$c$, $c$$x + y^2$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-013$c$, $c$D$c$, $c$$x^2 + y^2$$c$, true, null),
  ($c$M1-EXP-014$c$, $c$A$c$, $c$$n + 15$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-014$c$, $c$B$c$, $c$$\frac{n}{15}$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-014$c$, $c$C$c$, $c$$15n$$c$, true, null),
  ($c$M1-EXP-014$c$, $c$D$c$, $c$$15$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-015$c$, $c$A$c$, $c$El inverso de $x$ es $-x$$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-015$c$, $c$B$c$, $c$$7x$ es la suma de $7$ y $x$$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-015$c$, $c$C$c$, $c$El doble de $x$, aumentado en 1, es $2x + 1$$c$, true, null),
  ($c$M1-EXP-015$c$, $c$D$c$, $c$Si hoy tienes $x$ años, hace 2 años tenías $x + 2$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-016$c$, $c$A$c$, $c$$7 - 2x$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-016$c$, $c$B$c$, $c$$2(x - 7)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-016$c$, $c$C$c$, $c$$x^2 - 7$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-016$c$, $c$D$c$, $c$$2x - 7$$c$, true, null),
  ($c$M1-EXP-017$c$, $c$A$c$, $c$$3a + b$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-017$c$, $c$B$c$, $c$$3(a - b)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-017$c$, $c$C$c$, $c$$\frac{a}{3} - b$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-017$c$, $c$D$c$, $c$$3a - b$$c$, true, null),
  ($c$M1-EXP-018$c$, $c$A$c$, $c$El doble del cuadrado de un número$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-018$c$, $c$B$c$, $c$El doble del doble de un número$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-018$c$, $c$C$c$, $c$El cuadrado del doble de un número$c$, true, null),
  ($c$M1-EXP-018$c$, $c$D$c$, $c$El cuadrado de la suma de 2 y un número$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-019$c$, $c$A$c$, $c$El triple de un número, disminuido en 5$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-019$c$, $c$B$c$, $c$3 más la diferencia entre un número y 5$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-019$c$, $c$C$c$, $c$El triple de la diferencia entre un número y 5$c$, true, null),
  ($c$M1-EXP-019$c$, $c$D$c$, $c$El triple de la diferencia entre 5 y un número$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-020$c$, $c$A$c$, $c$$-3x$$c$, true, null),
  ($c$M1-EXP-020$c$, $c$B$c$, $c$$\frac{1}{3x}$$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-020$c$, $c$C$c$, $c$$-(x + 3)$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-020$c$, $c$D$c$, $c$$-x^3$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-021$c$, $c$A$c$, $c$$\frac{1}{2a}$$c$, true, null),
  ($c$M1-EXP-021$c$, $c$B$c$, $c$$-2a$$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-021$c$, $c$C$c$, $c$$2 \cdot \frac{1}{a}$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-021$c$, $c$D$c$, $c$$\frac{1}{a + 2}$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-022$c$, $c$A$c$, $c$$p + 3p$$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-022$c$, $c$B$c$, $c$$p + q$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-022$c$, $c$C$c$, $c$$p + \frac{p}{3}$$c$, true, null),
  ($c$M1-EXP-022$c$, $c$D$c$, $c$$p + (p - 3)$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-023$c$, $c$A$c$, $c$$2(c + 3)$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-023$c$, $c$B$c$, $c$$2c - 3$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-023$c$, $c$C$c$, $c$$2(3 - c)$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-023$c$, $c$D$c$, $c$$2(c - 3)$$c$, true, null),
  ($c$M1-EXP-024$c$, $c$A$c$, $c$$2n + 3$$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-024$c$, $c$B$c$, $c$$3(2n + 1)$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-024$c$, $c$C$c$, $c$$2n + 5$$c$, true, null),
  ($c$M1-EXP-024$c$, $c$D$c$, $c$$2p + 1$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-025$c$, $c$A$c$, $c$$s - g$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-025$c$, $c$B$c$, $c$$7g - s$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-025$c$, $c$C$c$, $c$$7(s - g)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-025$c$, $c$D$c$, $c$$s - 7g$$c$, true, null),
  ($c$M1-EXP-026$c$, $c$A$c$, $c$$d + u$$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-026$c$, $c$B$c$, $c$$10(d + u)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-026$c$, $c$C$c$, $c$$d + u + 10$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-026$c$, $c$D$c$, $c$$10d + u$$c$, true, null),
  ($c$M1-EXP-027$c$, $c$A$c$, $c$$d - 3$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-027$c$, $c$B$c$, $c$$3d - 20$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-027$c$, $c$C$c$, $c$$20 - 3d$$c$, true, null),
  ($c$M1-EXP-027$c$, $c$D$c$, $c$$20 - 3$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-028$c$, $c$A$c$, $c$El inverso del triple de un número$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-028$c$, $c$B$c$, $c$El opuesto del triple de un número$c$, true, null),
  ($c$M1-EXP-028$c$, $c$C$c$, $c$El opuesto de la suma de 3 y un número$c$, false, $c$EXP-LENG-JUXTA$c$),
  ($c$M1-EXP-028$c$, $c$D$c$, $c$El opuesto del cubo de un número$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-029$c$, $c$A$c$, $c$$x + (x + 1)$$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-029$c$, $c$B$c$, $c$$10x + (x + 1)$$c$, true, null),
  ($c$M1-EXP-029$c$, $c$C$c$, $c$$10x + 2x$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-029$c$, $c$D$c$, $c$$10x + y$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-030$c$, $c$A$c$, $c$$(2n - 2) + 2n + (2n + 2)$$c$, true, null),
  ($c$M1-EXP-030$c$, $c$B$c$, $c$$(2n - 1) + 2n + (2n + 1)$$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-030$c$, $c$C$c$, $c$$n + 2n + 3n$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-030$c$, $c$D$c$, $c$$2m + 2n + 2p$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-031$c$, $c$A$c$, $c$$n + 3$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-031$c$, $c$B$c$, $c$$4 + 3(n - 1)$$c$, true, null),
  ($c$M1-EXP-031$c$, $c$C$c$, $c$$4 + 3n - 1$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-031$c$, $c$D$c$, $c$$4 + 3 + (n - 1)$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-032$c$, $c$A$c$, $c$$5 + 4n$$c$, true, null),
  ($c$M1-EXP-032$c$, $c$B$c$, $c$$n + 4$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-032$c$, $c$C$c$, $c$$5 + 4 + n$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-032$c$, $c$D$c$, $c$$4(5 + n)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-033$c$, $c$A$c$, $c$$h + d$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-033$c$, $c$B$c$, $c$$c + d(h - 1)$$c$, true, null),
  ($c$M1-EXP-033$c$, $c$C$c$, $c$$c + dh - 1$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-033$c$, $c$D$c$, $c$$c + d$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-034$c$, $c$A$c$, $c$$12a - 12b$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-034$c$, $c$B$c$, $c$$6b - 12a$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-034$c$, $c$C$c$, $c$$12a - 6b$$c$, true, null),
  ($c$M1-EXP-034$c$, $c$D$c$, $c$$12a - \frac{b}{2}$$c$, false, $c$EXP-LENG-PARTEMUL$c$),
  ($c$M1-EXP-035$c$, $c$A$c$, $c$$2(10a + b)$$c$, true, null),
  ($c$M1-EXP-035$c$, $c$B$c$, $c$$2 \cdot 10a + b$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-035$c$, $c$C$c$, $c$$2(a + b)$$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-035$c$, $c$D$c$, $c$$10a + b + 2$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-036$c$, $c$A$c$, $c$$3(h - 4)$$c$, true, null),
  ($c$M1-EXP-036$c$, $c$B$c$, $c$$3(h + 4)$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-036$c$, $c$C$c$, $c$$3h - 4$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-036$c$, $c$D$c$, $c$$\frac{h - 4}{3}$$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-037$c$, $c$A$c$, $c$$(r - 2) + (r + 5 - 2)$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-037$c$, $c$B$c$, $c$$(r + 2) + (s + 2)$$c$, false, $c$EXP-LENG-NUEVAVAR$c$),
  ($c$M1-EXP-037$c$, $c$C$c$, $c$$(r + 2) + (r - 5 + 2)$$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-037$c$, $c$D$c$, $c$$(r + 2) + (r + 5 + 2)$$c$, true, null),
  ($c$M1-EXP-038$c$, $c$A$c$, $c$$(p + 6) + (h - 2)$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-038$c$, $c$B$c$, $c$$(p - 6) - (h + 2)$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-038$c$, $c$C$c$, $c$$6p - 2h$$c$, false, $c$EXP-LENG-ADITIVO$c$),
  ($c$M1-EXP-038$c$, $c$D$c$, $c$$(p + 6) - (h - 2)$$c$, true, null),
  ($c$M1-EXP-039$c$, $c$A$c$, $c$$2x - \frac{1}{y}$$c$, true, null),
  ($c$M1-EXP-039$c$, $c$B$c$, $c$$2x + \frac{1}{y}$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-039$c$, $c$C$c$, $c$$2x - (-y)$$c$, false, $c$EXP-LENG-OPUINV$c$),
  ($c$M1-EXP-039$c$, $c$D$c$, $c$$x^2 - \frac{1}{y}$$c$, false, $c$EXP-LENG-POTMUL$c$),
  ($c$M1-EXP-040$c$, $c$A$c$, $c$Solo I$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-040$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-EXP-040$c$, $c$C$c$, $c$Solo III$c$, false, $c$EXP-LENG-INVREL$c$),
  ($c$M1-EXP-040$c$, $c$D$c$, $c$I, II y III$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-041$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-EXP-041$c$, $c$B$c$, $c$Solo I y II$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-041$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-041$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-042$c$, $c$A$c$, $c$$(a + 1) + b$$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-042$c$, $c$B$c$, $c$$10(a + 1) + b$$c$, true, null),
  ($c$M1-EXP-042$c$, $c$C$c$, $c$$10a + 1 + b$$c$, false, $c$EXP-LENG-LINEAL$c$),
  ($c$M1-EXP-042$c$, $c$D$c$, $c$$10(a + 1 + b)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$),
  ($c$M1-EXP-043$c$, $c$A$c$, $c$$A - s$$c$, false, $c$EXP-LENG-TASA$c$),
  ($c$M1-EXP-043$c$, $c$B$c$, $c$$A - 6s$$c$, true, null),
  ($c$M1-EXP-043$c$, $c$C$c$, $c$$A + 6s$$c$, false, $c$EXP-LENG-TIEMPO$c$),
  ($c$M1-EXP-043$c$, $c$D$c$, $c$$6s - A$$c$, false, $c$EXP-LENG-ORDENRESTA$c$),
  ($c$M1-EXP-044$c$, $c$A$c$, $c$$(2n + 2) + 2n$$c$, false, $c$EXP-LENG-EXCESO$c$),
  ($c$M1-EXP-044$c$, $c$B$c$, $c$$(2n + 1) - 2n$$c$, false, $c$EXP-LENG-PARCONSEC$c$),
  ($c$M1-EXP-044$c$, $c$C$c$, $c$$3n - 2n$$c$, false, $c$EXP-LENG-CONSEC$c$),
  ($c$M1-EXP-044$c$, $c$D$c$, $c$$(2n + 2) - 2n$$c$, true, null),
  ($c$M1-EXP-045$c$, $c$A$c$, $c$$10n + 5$$c$, true, null),
  ($c$M1-EXP-045$c$, $c$B$c$, $c$$n + 10$$c$, false, $c$EXP-LENG-PATRDIF$c$),
  ($c$M1-EXP-045$c$, $c$C$c$, $c$$n + 5$$c$, false, $c$EXP-LENG-DIGITOS$c$),
  ($c$M1-EXP-045$c$, $c$D$c$, $c$$10(n + 5)$$c$, false, $c$EXP-LENG-SOBREAGRUPA$c$)
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
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-001$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-002$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-003$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-004$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-005$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-006$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-007$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-008$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-009$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-010$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-011$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-012$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-013$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-014$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-015$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-016$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-017$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-018$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-019$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-020$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-021$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-022$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-023$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-024$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-025$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-026$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-027$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-028$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-029$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-030$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-031$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-032$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-033$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-034$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-035$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-036$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-037$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-038$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-039$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-040$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-041$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-042$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-043$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-044$c$),
  ($c$ALG-EXP-LENG$c$, $c$M1-EXP-045$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-EXP-LENG-LINEAL$c$, $c$EXP-LENG-LINEAL$c$, $c$«De la suma de» pide paréntesis$c$, $c$Escribiste los símbolos en el orden en que leíste las palabras, y la
operación del comienzo tomó solo el término que tenía al lado. Para
«el cuádruplo de la suma de $m$ y $9$» escribiste $4m + 9$.

**Cuando la frase dice «de la suma de…» o «de la diferencia
entre…», la operación afecta a ese resultado completo, y eso se
escribe con paréntesis.**

«El cuádruplo de la suma de $m$ y $9$»: primero se forma la suma,
$m + 9$. Después se toma su cuádruplo:

$$4(m + 9)$$

Compáralo con «la suma del cuádruplo de $m$ y $9$». Ahí primero va
el cuádruplo de $m$ y después se suma: $4m + 9$. Las mismas palabras
en otro orden dan otra expresión.

Un control rápido: lee en voz alta lo que escribiste. $4m + 9$ se lee
«el cuádruplo de $m$, más $9$». Si la frase original decía «de la
suma», falta el paréntesis.$c$),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$EXP-LENG-SOBREAGRUPA$c$, $c$El paréntesis va solo si la frase agrupa$c$, $c$Pusiste un paréntesis que la frase no pedía: la primera operación
terminó afectando a todo lo que venía después. Para «el quíntuplo
de $w$, aumentado en $8$» escribiste $5(w + 8)$.

**Una operación abarca una suma o una resta completa solo cuando la
frase lo dice: «de la suma de», «de la diferencia entre».**

«El quíntuplo de $w$, aumentado en $8$»: primero el quíntuplo, $5w$.
Después se le agregan $8$:

$$5w + 8$$

«El quíntuplo de la suma de $w$ y $8$»: acá sí se suma primero, y
queda $5(w + 8)$.

Con las potencias pasa lo mismo. El cuadrado de la suma de $2$ y $3$
es $5^2 = 25$. La suma de los cuadrados de $2$ y $3$ es
$4 + 9 = 13$. Son cantidades distintas.

Un control rápido: antes de poner un paréntesis, busca en la frase
la palabra que lo justifica («suma», «diferencia»). Si no está, no
hay paréntesis.$c$),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$En una resta, primero va de donde se quita$c$, $c$Escribiste la resta en el orden en que aparecieron los números en
la frase. Para «$9$ menos que $k$» escribiste $9 - k$.

**Antes de escribir una resta, pregúntate de qué cantidad se está
quitando. Esa va primero.**

- «$k$ disminuido en $9$»: a $k$ se le quitan $9$, así que $k - 9$.
- «$9$ menos que $k$»: un número que tiene $9$ menos que $k$, así
  que $k - 9$.
- «restar $9$ de $k$»: se quita de $k$, así que $k - 9$.

Las tres frases nombran los números en distinto orden, y las tres
dan $k - 9$.

En contexto funciona igual. Si tenías $m$ pesos y gastaste $900$, lo
que te queda es $m - 900$: se quita de lo que tenías.

Un control rápido: prueba con un número fácil. «$9$ menos que $30$»
es $21$. Si con $k = 30$ tu expresión no da $21$, la resta está al
revés.$c$),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$EXP-LENG-ADITIVO$c$, $c$«Veces» multiplica, «más» suma$c$, $c$Confundiste cuántas veces se toma una cantidad con cuánto se le
agrega. Para «el quíntuplo de $r$» escribiste $r + 5$.

**Doble, triple, quíntuplo, «$k$ veces» y «$p$ pesos cada uno»
multiplican. «Aumentado en», «más que» y «se le agregan» suman.**

- El quíntuplo de $r$ son cinco copias de $r$:
  $r + r + r + r + r = 5r$.
- $r$ aumentado en $5$ es una sola suma: $r + 5$.

Con la mitad o la tercera parte pasa lo mismo, pero se divide, no se
resta. La tercera parte de $r$ es $\frac{r}{3}$, no $r - 3$.

En contexto: $8$ cuadernos a $q$ pesos cada uno cuestan $8q$. Sumar
$8 + q$ sería juntar cuadernos con pesos.

Un control rápido: si una cantidad se repite («cada uno», «cada día»,
«por kilómetro»), en tu expresión tiene que haber una multiplicación.$c$),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$EXP-LENG-PARTEMUL$c$, $c$Parte divide, veces multiplica$c$, $c$Viste el número dentro de la palabra y multiplicaste cuando había
que dividir, o al revés. Para «la quinta parte de $w$» escribiste
$5w$.

**«Parte» y «mitad» reparten: dividen. «Doble», «triple», «cuádruplo»
y «veces» juntan copias: multiplican.**

- La quinta parte de $w$ es $w$ repartido en $5$ partes iguales:
  $\frac{w}{5}$.
- El quíntuplo de $w$ son $5$ copias de $w$: $5w$.
- La mitad de $w$ es $\frac{w}{2}$; el doble de $w$ es $2w$.

Con un número se nota enseguida. La quinta parte de $40$ es $8$. El
quíntuplo de $40$ es $200$.

Un control rápido: una parte de algo es más chica que ese algo; el
doble o el triple son más grandes. Si tu expresión para «la quinta
parte» agranda el número, está al revés.$c$),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$EXP-LENG-POTMUL$c$, $c$El doble suma dos veces, el cuadrado multiplica dos veces$c$, $c$Confundiste una multiplicación por $2$ o por $3$ con una potencia.
Para «el cuadrado de $w$» escribiste $2w$.

**El doble es el número sumado dos veces. El cuadrado es el número
multiplicado por sí mismo.** Lo mismo con el triple y el cubo:

- doble de $w$: $w + w = 2w$
- cuadrado de $w$: $w \cdot w = w^2$
- triple de $w$: $w + w + w = 3w$
- cubo de $w$: $w \cdot w \cdot w = w^3$

Con un número se ve la diferencia. El doble de $9$ es $18$; el
cuadrado de $9$ es $81$.

Un control rápido: el número chico arriba ($w^2$, $w^3$) dice cuántas
veces se multiplica la letra por sí misma. El número de adelante
($2w$, $3w$) dice cuántas veces se suma.$c$),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$EXP-LENG-EXCESO$c$, $c$El exceso siempre es una resta$c$, $c$Leíste «exceso» como una suma, o pusiste la resta al revés. Para «el
exceso de $m$ sobre $11$» escribiste $m + 11$.

**«El exceso de $A$ sobre $B$» es cuánto le sobra a $A$ comparado con
$B$: $A - B$. Primero va lo que se nombra justo después de «exceso
de».**

Piénsalo con estaturas. Si Carla mide $172$ cm y Diego $160$ cm, el
exceso de la estatura de Carla sobre la de Diego es
$172 - 160 = 12$ cm. Es lo que Carla tiene de más.

- El exceso de $m$ sobre $11$: $m - 11$.
- El exceso de $11$ sobre $m$: $11 - m$.

Un control rápido: «exceso» nunca es una suma. Y lo que se nombra
primero es lo que excede, así que va antes del signo menos.$c$),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$EXP-LENG-OPUINV$c$, $c$El opuesto suma 0, el inverso multiplica 1$c$, $c$Confundiste el opuesto con el inverso. Por ejemplo, dijiste que el
opuesto de $m$ es $\frac{1}{m}$.

**El opuesto de un número es el que sumado con él da $0$. El inverso
es el que multiplicado por él da $1$.**

- Opuesto de $8$: $-8$, porque $8 + (-8) = 0$.
- Inverso de $8$: $\frac{1}{8}$, porque $8 \cdot \frac{1}{8} = 1$.

Con letras, el opuesto de $m$ es $-m$ y el inverso de $m$ (si
$m \neq 0$) es $\frac{1}{m}$.

Si la frase compone, primero se arma lo de adentro. «El opuesto del
séxtuplo de $m$»: primero el séxtuplo, $6m$; después su opuesto,
$-6m$.

Un control rápido: el opuesto cambia el signo y nada más. El inverso
pone el número abajo de una fracción con $1$ arriba.$c$),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$EXP-LENG-JUXTA$c$, $c$Pegados, se multiplican$c$, $c$Leíste un número y una letra pegados como una suma: tomaste $6m$ como
«$6$ más $m$».

**Cuando un número va pegado a una letra o a un paréntesis, se
multiplican. $6m$ significa $6 \cdot m$: el séxtuplo de $m$.**

Mira cómo cambia todo con la escritura:

- $6m$: el séxtuplo de $m$.
- $m + 6$: $m$ aumentado en $6$.
- $m^6$: la sexta potencia de $m$.
- $6(m + 1)$: el séxtuplo de la suma de $m$ y $1$.

Son cuatro cantidades distintas. Con $m = 10$ valen $60$, $16$, un
millón y $66$.

Un control rápido: si en tu enunciado aparece «aumentado» o «más»,
en la expresión tiene que haber un signo $+$ escrito. Si no lo hay,
no hay suma.$c$),
  ($c$REM-EXP-LENG-INVREL$c$, $c$EXP-LENG-INVREL$c$, $c$Pregúntate quién tiene más$c$, $c$Le pusiste la comparación a la persona equivocada. Por ejemplo, si
Elena tiene el cuádruplo de libros que Tomás y Elena tiene $e$
libros, escribiste que Tomás tiene $4e$.

**«$A$ tiene el cuádruplo que $B$» significa que $A$ es cuatro veces
$B$. El cuádruplo se aplica a $B$, la cantidad con la que se
compara.**

Elena tiene $e$ libros, y eso es el cuádruplo de lo de Tomás. Tomás
tiene la cuarta parte: $\frac{e}{4}$.

Con «más que» funciona igual. Si Elena es $4$ años mayor que Tomás y
Tomás tiene $t$ años, Elena tiene $t + 4$, no $t - 4$.

Un control rápido: antes de escribir, decide quién tiene más. Elena
tiene el cuádruplo, así que tiene más. Si tu expresión le da más a
Tomás, está al revés.$c$),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$EXP-LENG-NUEVAVAR$c$, $c$Una letra, y lo demás en función de ella$c$, $c$Usaste una letra nueva para una cantidad que el enunciado ya describe
a partir de otra. Si Elisa tiene $e$ láminas y Bruno tiene $6$ más
que ella, escribiste lo de ambos como $e + b$.

**Si una cantidad se describe comparándola con otra, no lleva letra
propia: se escribe con la letra de la otra.**

Bruno tiene $6$ más que Elisa: $e + 6$. Entre los dos tienen
$e + (e + 6)$. Una sola letra, porque lo de Bruno depende de lo de
Elisa.

Con números seguidos pasa lo mismo. Si el primero es $k$, los
siguientes se escriben a partir de $k$, no con letras nuevas.

Un control rápido: tu expresión solo puede tener las letras que da
el enunciado. Si aparece una letra que nadie nombró, sobra.$c$),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$EXP-LENG-TIEMPO$c$, $c$Hacia atrás se resta, hacia adelante se suma$c$, $c$Invertiste el pasado y el futuro. Si Gabriel tiene $g$ años, dijiste
que hace $9$ años tenía $g + 9$.

**Hacia el pasado se resta; hacia el futuro se suma.**

- Hace $9$ años: $g - 9$.
- Dentro de $9$ años: $g + 9$.

Hace $9$ años Gabriel era más joven, así que su edad tiene que ser
menor que $g$. La palabra «hace» no pide sumar: dice que miras hacia
atrás.

Lo mismo con cualquier cantidad que cambia con el tiempo. Lo que
había antes de un aumento es lo de ahora menos el aumento.

Un control rápido: pasado, menos que hoy; futuro, más que hoy. Si tu
expresión para el pasado es mayor que la de hoy, está al revés.$c$),
  ($c$REM-EXP-LENG-TASA$c$, $c$EXP-LENG-TASA$c$, $c$Cuenta cuántas veces ocurre$c$, $c$Usaste la cantidad de un período como si ocurriera una sola vez. Si
una tienda vende $v$ pesos cada día y paga $m$ pesos de luz al mes,
dijiste que en un mes de $30$ días le queda $v - m$.

**Antes de sumar o restar, lleva cada cantidad al período que te
piden, multiplicándola por las veces que ocurre.**

En $30$ días la tienda vende $30$ veces $v$: $30v$. La luz se paga una
vez en el mes: $m$. Le queda:

$$30v - m$$

Lo mismo con los cobros «por cada» unidad: por cada kilo, cada hora
o cada kilómetro. El precio se multiplica por las unidades.

Un control rápido: mira cada cantidad y pregúntate cuántas veces
pasa en el período que te piden. Si pasa más de una vez, va
multiplicada.$c$),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$EXP-LENG-CONSEC$c$, $c$Consecutivo es sumar, no multiplicar$c$, $c$Escribiste números consecutivos como si fueran múltiplos: el número,
su doble y su triple.

**Dos números son consecutivos cuando el segundo es el primero más
$1$. Se avanza sumando, siempre el mismo paso.**

Con números se ve claro. $14$, $15$ y $16$ son consecutivos: cada uno
es el anterior más $1$. En cambio, $14$, $28$ y $42$ son un número, su
doble y su triple: los saltos son de $14$, no de $1$.

Con letras, si el primero es $k$, el segundo es $k + 1$, no $2k$.

Un control rápido: entre consecutivos, la distancia de uno al
siguiente siempre es la misma ($1$, o $2$ si se cuentan solo pares o
solo impares). Entre $k$ y $2k$ la distancia es $k$, que cambia
según el número.$c$),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$EXP-LENG-PARCONSEC$c$, $c$Entre pares o impares, el paso es 2$c$, $c$Usaste el paso equivocado: avanzaste de $1$ en $1$ entre pares o
impares, o de $2$ en $2$ entre números consecutivos cualesquiera.

**Entre consecutivos cualesquiera el paso es $1$. Entre pares
consecutivos, o entre impares consecutivos, el paso es $2$.**

Mira una fila de números: $38$, $39$, $40$, $41$, $42$, $43$.

- Consecutivos: $38$, $39$, $40$.
- Pares consecutivos: $38$, $40$, $42$.
- Impares consecutivos: $39$, $41$, $43$.

Entre dos pares siempre queda un impar al medio. Por eso, para pasar
de un par al siguiente, hay que sumar $2$.

Un control rápido: un par más $1$ da un impar, y un impar más $1$ da
un par. Si al «par que sigue» le sumaste $1$, te salió un impar.$c$),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$EXP-LENG-DIGITOS$c$, $c$Cada decena vale 10$c$, $c$Escribiste un número de dos cifras como la suma de sus cifras, como
si cada cifra valiera lo que dice.

**En un número de dos cifras, la cifra de las decenas vale diez
veces lo que dice. El número es $10$ por las decenas, más las
unidades.**

El $73$ tiene $7$ decenas y $3$ unidades:

$$73 = 10 \cdot 7 + 3$$

Si sumas las cifras, $7 + 3 = 10$, y eso no es $73$.

Con letras: si la cifra de las decenas es $p$ y la de las unidades
es $q$, el número es $10p + q$.

Un control rápido: prueba tu expresión con un número que conozcas.
Con $7$ decenas y $3$ unidades tiene que dar $73$.$c$),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$EXP-LENG-PATRDIF$c$, $c$No es cuánto cambia, es cuánto hay$c$, $c$Escribiste lo que cambia en cada paso, en vez de cuánto hay en el
paso $n$. Una alcancía parte con $800$ pesos y cada semana se le
agregan $300$, y dijiste que después de $n$ semanas tiene $n + 300$.

**En el paso $n$ hay lo inicial, más el aumento repetido tantas veces
como pasos hubo.**

Después de $n$ semanas se agregaron $300$ pesos $n$ veces: $300n$.
Más lo que había al comienzo:

$$800 + 300n$$

Si lo inicial ya cuenta como el paso $1$ (la figura $1$, la primera
hora), el aumento se repite una vez menos: $n - 1$ veces.

Un control rápido: $n + 300$ crece de a $1$ cuando pasa una semana,
pero la alcancía crece de a $300$. El número que acompaña a la $n$
tiene que ser lo que aumenta en cada paso.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-EXP-LENG-LINEAL$c$, $c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$REM-EXP-LENG-ORDENRESTA$c$, $c$REM-EXP-LENG-ADITIVO$c$, $c$REM-EXP-LENG-PARTEMUL$c$, $c$REM-EXP-LENG-POTMUL$c$, $c$REM-EXP-LENG-EXCESO$c$, $c$REM-EXP-LENG-OPUINV$c$, $c$REM-EXP-LENG-JUXTA$c$, $c$REM-EXP-LENG-INVREL$c$, $c$REM-EXP-LENG-NUEVAVAR$c$, $c$REM-EXP-LENG-TIEMPO$c$, $c$REM-EXP-LENG-TASA$c$, $c$REM-EXP-LENG-CONSEC$c$, $c$REM-EXP-LENG-PARCONSEC$c$, $c$REM-EXP-LENG-DIGITOS$c$, $c$REM-EXP-LENG-PATRDIF$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-003$c$, 1::smallint),
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-012$c$, 2::smallint),
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-018$c$, 3::smallint),
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-019$c$, 4::smallint),
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-031$c$, 5::smallint),
  ($c$REM-EXP-LENG-LINEAL$c$, $c$M1-EXP-033$c$, 6::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-006$c$, 1::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-011$c$, 2::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-016$c$, 3::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-017$c$, 4::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-032$c$, 5::smallint),
  ($c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$M1-EXP-042$c$, 6::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-005$c$, 1::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-016$c$, 2::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-019$c$, 3::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-023$c$, 4::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-034$c$, 5::smallint),
  ($c$REM-EXP-LENG-ORDENRESTA$c$, $c$M1-EXP-043$c$, 6::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-001$c$, 1::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-003$c$, 2::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-020$c$, 3::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-021$c$, 4::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-031$c$, 5::smallint),
  ($c$REM-EXP-LENG-ADITIVO$c$, $c$M1-EXP-032$c$, 6::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-001$c$, 1::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-002$c$, 2::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-003$c$, 3::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-007$c$, 4::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-017$c$, 5::smallint),
  ($c$REM-EXP-LENG-PARTEMUL$c$, $c$M1-EXP-034$c$, 6::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-001$c$, 1::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-002$c$, 2::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-006$c$, 3::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-016$c$, 4::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-018$c$, 5::smallint),
  ($c$REM-EXP-LENG-POTMUL$c$, $c$M1-EXP-039$c$, 6::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-005$c$, 1::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-017$c$, 2::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-038$c$, 3::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-039$c$, 4::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-040$c$, 5::smallint),
  ($c$REM-EXP-LENG-EXCESO$c$, $c$M1-EXP-044$c$, 6::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-005$c$, 1::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-015$c$, 2::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-020$c$, 3::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-021$c$, 4::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-028$c$, 5::smallint),
  ($c$REM-EXP-LENG-OPUINV$c$, $c$M1-EXP-039$c$, 6::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-002$c$, 1::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-007$c$, 2::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-015$c$, 3::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-018$c$, 4::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-019$c$, 5::smallint),
  ($c$REM-EXP-LENG-JUXTA$c$, $c$M1-EXP-028$c$, 6::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-008$c$, 1::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-009$c$, 2::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-022$c$, 3::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-036$c$, 4::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-037$c$, 5::smallint),
  ($c$REM-EXP-LENG-INVREL$c$, $c$M1-EXP-040$c$, 6::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-004$c$, 1::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-009$c$, 2::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-010$c$, 3::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-022$c$, 4::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-024$c$, 5::smallint),
  ($c$REM-EXP-LENG-NUEVAVAR$c$, $c$M1-EXP-037$c$, 6::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-015$c$, 1::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-023$c$, 2::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-036$c$, 3::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-037$c$, 4::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-038$c$, 5::smallint),
  ($c$REM-EXP-LENG-TIEMPO$c$, $c$M1-EXP-040$c$, 6::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-011$c$, 1::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-014$c$, 2::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-025$c$, 3::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-027$c$, 4::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-033$c$, 5::smallint),
  ($c$REM-EXP-LENG-TASA$c$, $c$M1-EXP-034$c$, 6::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-004$c$, 1::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-010$c$, 2::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-024$c$, 3::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-029$c$, 4::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-041$c$, 5::smallint),
  ($c$REM-EXP-LENG-CONSEC$c$, $c$M1-EXP-044$c$, 6::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-004$c$, 1::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-010$c$, 2::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-024$c$, 3::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-030$c$, 4::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-041$c$, 5::smallint),
  ($c$REM-EXP-LENG-PARCONSEC$c$, $c$M1-EXP-044$c$, 6::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-026$c$, 1::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-029$c$, 2::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-035$c$, 3::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-041$c$, 4::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-042$c$, 5::smallint),
  ($c$REM-EXP-LENG-DIGITOS$c$, $c$M1-EXP-045$c$, 6::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-014$c$, 1::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-027$c$, 2::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-031$c$, 3::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-032$c$, 4::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-033$c$, 5::smallint),
  ($c$REM-EXP-LENG-PATRDIF$c$, $c$M1-EXP-045$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-ALG-EXP-01$c$, $c$ALG-EXP$c$, $c$Lenguaje algebraico$c$, $c$El álgebra usa letras para hablar de números que todavía no conoces.
Antes de operar con ellas tienes que saber escribir lo que dice una
frase. Eso es el lenguaje algebraico, y en la PAES está detrás de casi
todos los problemas de planteo.

## Lenguaje algebraico

### Una letra es un número

Una letra representa un número cualquiera. Con ella puedes escribir
cosas que valen para todos los números a la vez.

Cuando un número va pegado a una letra, se multiplican: $5m$ significa
$5 \cdot m$. No es «$5$ más $m$». Lo mismo con un paréntesis: $5(m + 1)$
es $5$ veces la suma.

**Pegados, se multiplican. Para sumar tiene que aparecer el signo $+$.**

### El vocabulario

Estas palabras aparecen en todos los problemas. Las parejas van juntas
porque son las que más se confunden:

- el doble de $x$: $2x$ · el cuadrado de $x$: $x^2$
- el triple de $x$: $3x$ · el cubo de $x$: $x^3$
- el cuádruplo de $x$: $4x$ · la cuarta potencia de $x$: $x^4$
- la mitad de $x$: $\frac{x}{2}$ · la tercera parte de $x$: $\frac{x}{3}$
- $x$ aumentado en $a$: $x + a$ · $x$ disminuido en $a$: $x - a$
- el sucesor de $x$: $x + 1$ · el antecesor de $x$: $x - 1$
- el opuesto de $x$: $-x$ · el inverso de $x$: $\frac{1}{x}$

El doble y el cuadrado no son lo mismo. El doble de $7$ es $14$; el
cuadrado de $7$ es $49$. El doble suma el número dos veces, el cuadrado
lo multiplica por sí mismo.

«Parte» divide y «veces» multiplica. La tercera parte achica, el triple
agranda.

La **semisuma** de dos números es la mitad de su suma.

El **opuesto** es el que sumado con el número da $0$. El **inverso** es
el que multiplicado por el número da $1$.

El **exceso de $A$ sobre $B$** es cuánto le sobra a $A$ respecto de $B$:
$A - B$. Es una resta, nunca una suma.

### Qué abarca cada operación

Este es el error más común: escribir las palabras en el orden en que se
leen, sin fijarse qué abarca cada operación.

- «el triple de la suma de $k$ y $10$»: $3(k + 10)$
- «la suma del triple de $k$ y $10$»: $3k + 10$

**Cuando la frase dice «de la suma de» o «de la diferencia entre», la
operación abarca ese resultado completo, y eso se escribe con
paréntesis.** Si la frase no lo dice, no hay paréntesis.

Con potencias pasa igual: el cuadrado de la suma de $1$ y $4$ es
$5^2 = 25$, pero la suma de sus cuadrados es $1 + 16 = 17$.

En las restas importa el orden. Pregúntate de qué cantidad se quita:
esa va primero. «$10$ menos que $k$» es $k - 10$, aunque el $10$ se
nombre antes.

### De la expresión a la frase

También hay que leer al revés. Lee primero lo que está más afuera:

- $5t - 2$: el quíntuplo de un número, disminuido en $2$.
- $5(t - 2)$: el quíntuplo de la diferencia entre un número y $2$.

El paréntesis cambia la frase. Si tu frase no tiene «de la diferencia»,
no puede corresponder a una expresión con paréntesis.

### Situaciones

En un problema con varias cantidades, **elige una letra para una sola
cantidad y escribe las demás a partir de ella**. Si Beto tiene $b$
pesos y Carla tiene $2.000$ más que él, Carla tiene $b + 2.000$. No le
pongas otra letra.

En las comparaciones, decide primero quién tiene más. «Carla tiene el
doble que Beto» quiere decir que Carla tiene más: su cantidad es $2b$.
Si lo que conoces es lo de Carla, lo de Beto es la mitad.

En las edades, hacia el pasado se resta y hacia el futuro se suma. Si
Beto tiene $b$ años, hace $9$ años tenía $b - 9$ y dentro de $9$ años
tendrá $b + 9$.

Cuando las cantidades vienen por período (por día, por semana, por
kilómetro), **llévalas todas al período que te piden antes de sumar o
restar**. Un arriendo de $q$ pesos al mes cuesta $12q$ en un año.

### Consecutivos, pares, impares y cifras

Dos números son consecutivos cuando el segundo es el primero más $1$.
Si el primero es $k$, los que siguen son $k + 1$ y $k + 2$.

Un número par se escribe $2k$ y un impar, $2k + 1$. Entre pares
consecutivos, o entre impares consecutivos, el paso es $2$: entre dos
pares siempre queda un impar al medio.

En un número de dos cifras, la cifra de las decenas vale diez veces lo
que dice: $58 = 10 \cdot 5 + 8$. Por eso un número con $p$ decenas y
$q$ unidades es $10p + q$, no $p + q$.

### Patrones: cuánto hay en el paso n

Un patrón describe cómo cambia algo paso a paso. La expresión tiene que
decir **cuánto hay** en el paso $n$, no cuánto cambia.

La primera fila de un teatro tiene $6$ butacas y cada fila tiene $2$
más que la anterior. En la fila $n$, el aumento se repitió $n - 1$
veces:

$$6 + 2(n - 1)$$

Un control: el número que multiplica a la $n$ es lo que aumenta en cada
paso. Si escribiste $n + 2$, la cantidad crecería de a $1$, no de a
$2$.$c$, 1::smallint)
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
  ($c$LES-ALG-EXP-01$c$, $c$ALG-EXP-LENG$c$, 1::smallint, $c$lenguaje-algebraico$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$);
  if c <> 45 then
    raise exception 'items: se esperaban 45, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$);
  if c <> 180 then
    raise exception 'item_options: se esperaban 180, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-EXP-001$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-002$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-003$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-004$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-005$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-006$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-007$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-008$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-009$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-010$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-011$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-012$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-013$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-014$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-015$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-016$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-017$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-018$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-019$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-020$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-021$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-022$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-023$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-024$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-025$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-026$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-027$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-028$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-029$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-030$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-031$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-032$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-033$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-034$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-035$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-036$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-037$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-038$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-039$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-040$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-041$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-042$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-043$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-044$c$, $c$ALG-EXP-LENG$c$),
      ($c$M1-EXP-045$c$, $c$ALG-EXP-LENG$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 45 then
    raise exception 'node_items: 45 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$EXP-LENG-ADITIVO$c$, $c$EXP-LENG-CONSEC$c$, $c$EXP-LENG-DIGITOS$c$, $c$EXP-LENG-EXCESO$c$, $c$EXP-LENG-INVREL$c$, $c$EXP-LENG-JUXTA$c$, $c$EXP-LENG-LINEAL$c$, $c$EXP-LENG-NUEVAVAR$c$, $c$EXP-LENG-OPUINV$c$, $c$EXP-LENG-ORDENRESTA$c$, $c$EXP-LENG-PARCONSEC$c$, $c$EXP-LENG-PARTEMUL$c$, $c$EXP-LENG-PATRDIF$c$, $c$EXP-LENG-POTMUL$c$, $c$EXP-LENG-SOBREAGRUPA$c$, $c$EXP-LENG-TASA$c$, $c$EXP-LENG-TIEMPO$c$)
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
      or not (code = any (array[$c$FIG-ENT-ADI-01$c$, $c$FIG-ENT-ADI-02$c$, $c$FIG-ENT-ADI-03$c$, $c$FIG-ENT-ADI-04$c$, $c$FIG-ENT-ADI-05$c$, $c$FIG-ENT-ADI-06$c$, $c$FIG-ENT-ADI-07$c$, $c$FIG-ENT-REC-01$c$, $c$FIG-ENT-REC-02$c$, $c$FIG-ENT-REC-03$c$, $c$FIG-ENT-REC-04$c$, $c$FIG-ENT-REC-05$c$]::text[]));
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

-- 45 ítems (45 curated), 180 alternativas, 17 misconceptions referenciadas,
-- 17 remediaciones, 0 figuras, 1 clase sobre 1 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 45 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-EXP-LENG-LINEAL$c$, $c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$REM-EXP-LENG-ORDENRESTA$c$, $c$REM-EXP-LENG-ADITIVO$c$, $c$REM-EXP-LENG-PARTEMUL$c$, $c$REM-EXP-LENG-POTMUL$c$, $c$REM-EXP-LENG-EXCESO$c$, $c$REM-EXP-LENG-OPUINV$c$, $c$REM-EXP-LENG-JUXTA$c$, $c$REM-EXP-LENG-INVREL$c$, $c$REM-EXP-LENG-NUEVAVAR$c$, $c$REM-EXP-LENG-TIEMPO$c$, $c$REM-EXP-LENG-TASA$c$, $c$REM-EXP-LENG-CONSEC$c$, $c$REM-EXP-LENG-PARCONSEC$c$, $c$REM-EXP-LENG-DIGITOS$c$, $c$REM-EXP-LENG-PATRDIF$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-ALG-EXP-01$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$) group by 1;
