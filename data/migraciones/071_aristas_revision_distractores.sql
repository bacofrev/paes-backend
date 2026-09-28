-- =====================================================================
-- 4 aristas nuevas: revisión de distractores de NUM-POT
-- Fuente: data/loaders/grafo.py (bloque «Revisión de distractores»,
-- 28 sep 2026).
--
-- Con la regla "un distractor usa una misconception de su clase o de un
-- nodo previo", cuatro ítems publicados de NUM-POT ya medían un nodo que
-- no era previo en el grafo. Los ítems están bien; faltaba la arista:
--   3 · 2^3 = 216 (M1-POT-004/008/009)  -> prioridad antes de potencias
--   (-1/2)^4 = -1/16 (M1-POT-414)        -> signo antes de base fraccionaria
--   (2x^3)^2 = 4x^5 (M1-POT-405)         -> potencia de potencia antes de DIST
--   (a/b)^-3 = b^3/a (M1-POT-507)        -> DIST antes de exponente negativo
-- Solo se agregan aristas. Verificado contra grafo.py: sin ciclos, y
-- ninguna rompe el orden de las clases (ENT-04 va en la ola 1; POT-01..04
-- ya están en secuencia). El trigger node_edges_no_cycles lo vuelve a
-- revisar al insertar.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

insert into node_edges (prereq_id, target_id, note)
select a.id, b.id, v.note
from (values
  ($c$NUM-ENT-PRIOR$c$, $c$NUM-POT-CONC$c$, $c$3 · 2³ y 2 + 3² exigen resolver la potencia antes que la multiplicación o la suma.$c$),
  ($c$NUM-POT-SIG$c$, $c$NUM-POT-FRA$c$, $c$(-1/2)⁴ es una base fraccionaria negativa: el signo sigue la paridad del exponente.$c$),
  ($c$NUM-POT-POT$c$, $c$NUM-POT-DIST$c$, $c$(2x³)² reparte el exponente y eleva una potencia a otra.$c$),
  ($c$NUM-POT-DIST$c$, $c$NUM-POT-NEG$c$, $c$(a/b)⁻³ = b³/a³ reparte el exponente al numerador y al denominador.$c$)
) as v(prereq, target, note)
join nodes a on a.code = v.prereq
join nodes b on b.code = v.target;

-- Verificación: la migración falla si falta alguna de las 4.
do $$
declare
  n int;
begin
  select count(*) into n
    from node_edges e
    join nodes a on a.id = e.prereq_id
    join nodes b on b.id = e.target_id
   where (a.code, b.code) in (
     ('NUM-ENT-PRIOR', 'NUM-POT-CONC'),
     ('NUM-POT-SIG', 'NUM-POT-FRA'),
     ('NUM-POT-POT', 'NUM-POT-DIST'),
     ('NUM-POT-DIST', 'NUM-POT-NEG'));
  if n <> 4 then
    raise exception 'se esperaban 4 aristas nuevas, quedaron %', n;
  end if;
end $$;
