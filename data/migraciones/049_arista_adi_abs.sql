-- =====================================================================
-- Arista NUM-ENT-ADI -> NUM-ENT-ABS
-- Fuente: data/loaders/grafo.py (agregada el 27 sep 2026).
--
-- ABS dependía solo de REC. Los ítems PAES de valor absoluto operan
-- dentro de las barras (|b - a|, distancia |a - b|), y eso es suma y
-- resta de enteros: sin esta arista, esos ítems medirían ADI y ABS a la
-- vez. ADI ya tiene contenido publicado, así que la arista no deja el
-- nodo bloqueado. El trigger node_edges_no_cycles rechaza la inserción
-- si cerrara un ciclo.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

insert into node_edges (prereq_id, target_id, note)
select a.id, b.id,
       $c$Operar dentro de las barras requiere sumar y restar enteros. Decidido en el control 1 de LES-NUM-ENT-07.$c$
from nodes a, nodes b
where a.code = $c$NUM-ENT-ADI$c$ and b.code = $c$NUM-ENT-ABS$c$;

-- Verificación: la migración falla si la arista no quedó.
do $$
begin
  if not exists (
    select 1 from node_edges e
      join nodes a on a.id = e.prereq_id
      join nodes b on b.id = e.target_id
     where a.code = 'NUM-ENT-ADI' and b.code = 'NUM-ENT-ABS') then
    raise exception 'la arista NUM-ENT-ADI -> NUM-ENT-ABS no se insertó';
  end if;
end $$;
