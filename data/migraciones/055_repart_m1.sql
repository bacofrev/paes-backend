-- =====================================================================
-- ALG-PRO-REPART pasa de contenido previo (0) a M1 (1)
-- Fuente: data/loaders/grafo.py (27 sep 2026).
--
-- Reparto proporcional («reparte 120.000 en razón 2 : 3») es
-- proporcionalidad, que la PAES M1 evalúa. Estaba marcado `pre`, pero
-- ningún nodo lo pedía: un contenido previo que no sostiene nada no
-- tiene razón de estar en el grafo. Como M1 es una meta del examen.
-- La clase que lo contiene (LES-ALG-PRO-01) es toda M1, así que el
-- trigger nodes_lesson_single_level no tiene nada que rechazar.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

update nodes set exam_level = 1
 where code = $c$ALG-PRO-REPART$c$ and exam_level = 0;

-- Verificación: la migración falla si el nodo no quedó en 1.
do $$
begin
  if not exists (select 1 from nodes
                  where code = 'ALG-PRO-REPART' and exam_level = 1) then
    raise exception 'ALG-PRO-REPART no quedó con exam_level = 1';
  end if;
end $$;
