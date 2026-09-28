-- =====================================================================
-- Nodo nuevo GEO-FIG-ANG «Suma de ángulos interiores» y sus 3 aristas
-- Fuente: data/loaders/grafo.py (28 sep 2026).
--
-- El grafo no tenía dónde poner la suma de los ángulos interiores de
-- triángulos (180°) y polígonos (180°·(n − 2)). Es base de geometría: el
-- criterio AA de semejanza cierra con el tercer ángulo, y los problemas
-- de ángulo inscrito terminan en la suma de 180° de un triángulo.
-- Nivel 0 (pre), como GEO-FIG-CLAS: se ve en básica y la PAES lo usa sin
-- evaluarlo por separado. Queda en la clase LES-GEO-FIG-08 del plan (ola 2).
--   GEO-FIG-CLAS -> GEO-FIG-ANG
--   GEO-FIG-ANG  -> GEO-SEM-CRIT
--   GEO-FIG-ANG  -> GEO-CIRC-INS
-- Verificado contra grafo.py: sin ciclos. El trigger node_edges_no_cycles
-- lo vuelve a revisar al insertar.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

insert into nodes (code, name, area_id, unit_id, exam_level, description)
select $c$GEO-FIG-ANG$c$, $c$Suma de ángulos interiores$c$, a.id, u.id, 0,
       $c$Suma de los ángulos interiores de un triángulo (180°) y de un polígono de n lados (180° · (n − 2)); ángulo que falta; ángulo interior de un polígono regular.$c$
from areas a, units u
where a.code = 'GEO' and u.code = 'GEO-FIG';

insert into node_edges (prereq_id, target_id, note)
select a.id, b.id, v.note
from (values
  ($c$GEO-FIG-CLAS$c$, $c$GEO-FIG-ANG$c$, $c$Sumar ángulos interiores pide reconocer triángulos, cuadriláteros y polígonos regulares.$c$),
  ($c$GEO-FIG-ANG$c$, $c$GEO-SEM-CRIT$c$, $c$Criterio AA: si dos ángulos son iguales, el tercero también, porque suman 180°.$c$),
  ($c$GEO-FIG-ANG$c$, $c$GEO-CIRC-INS$c$, $c$Los problemas de ángulo inscrito se cierran con la suma de ángulos de un triángulo.$c$)
) as v(prereq, target, note)
join nodes a on a.code = v.prereq
join nodes b on b.code = v.target;

-- Verificación: la migración falla si falta el nodo o alguna arista.
do $$
declare
  n int;
begin
  if not exists (select 1 from nodes where code = 'GEO-FIG-ANG' and exam_level = 0) then
    raise exception 'GEO-FIG-ANG no quedó creado con exam_level = 0';
  end if;
  select count(*) into n
    from node_edges e
    join nodes a on a.id = e.prereq_id
    join nodes b on b.id = e.target_id
   where (a.code, b.code) in (
     ('GEO-FIG-CLAS', 'GEO-FIG-ANG'),
     ('GEO-FIG-ANG', 'GEO-SEM-CRIT'),
     ('GEO-FIG-ANG', 'GEO-CIRC-INS'));
  if n <> 3 then
    raise exception 'se esperaban 3 aristas nuevas, quedaron %', n;
  end if;
end $$;
