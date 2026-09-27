-- =====================================================================
-- 12 aristas nuevas: revisión de hojas del grafo
-- Fuente: data/loaders/grafo.py (bloque «Revisión de hojas», 27 sep 2026).
--
-- Se revisaron los 59 nodos que ningún otro pedía. La mayoría son metas
-- legítimas del examen (modelación, aplicaciones); estos 12 casos sí
-- sostienen a otro nodo y faltaba la arista. Solo se agregan aristas,
-- ninguna se borra. Verificado contra grafo.py: sin ciclos entre nodos
-- ni entre clases, sin M2 -> M1, y sin romper el orden dentro de
-- ninguna unidad del plan. El trigger node_edges_no_cycles lo vuelve a
-- revisar al insertar.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

insert into node_edges (prereq_id, target_id, note)
select a.id, b.id, v.note
from (values
  ($c$NUM-FRA-SIG$c$, $c$ALG-ECU-FRA$c$, $c$Las ecuaciones con coeficientes fraccionarios traen fracciones negativas.$c$),
  ($c$NUM-FRA-SIG$c$, $c$ALG-FLI-PEND$c$, $c$(y2 - y1)/(x2 - x1) produce fracciones negativas.$c$),
  ($c$NUM-RAI-RAC$c$, $c$GEO-TRI-NOT$c$, $c$sen 45° = 1/√2 = √2/2 es racionalizar.$c$),
  ($c$NUM-RAI-SIG$c$, $c$ALG-CUA-INC$c$, $c$x² = 9 da ±3 y x² = -4 no tiene solución real.$c$),
  ($c$NUM-RAI-SIG$c$, $c$ALG-CUA-DIS$c$, $c$Discriminante negativo es raíz de un negativo.$c$),
  ($c$ALG-CUA-INC$c$, $c$ALG-FCU-CEROS$c$, $c$Ceros de y = x² - k y de y = x² + bx.$c$),
  ($c$ALG-CUA-DIS$c$, $c$ALG-FCU-CEROS$c$, $c$El discriminante dice cuántas veces la parábola corta al eje x.$c$),
  ($c$ALG-PRO-REP$c$, $c$ALG-FLI-CONC$c$, $c$Graficar y = kx es el puente de proporción directa a función lineal.$c$),
  ($c$NUM-LOG-REL$c$, $c$ALG-FLO-CONC$c$, $c$La función logarítmica como inversa de la exponencial usa la relación potencia–raíz–logaritmo.$c$),
  ($c$GEO-CUE-UNID$c$, $c$GEO-CUE-VOL-CIL$c$, $c$Volumen de cilindros en contexto se pide en litros (cm³ ↔ L).$c$),
  ($c$EST-TAB-ACUM$c$, $c$EST-POS-MEDIANA$c$, $c$La mediana desde una tabla de frecuencias se ubica con la frecuencia acumulada.$c$),
  ($c$ALG-FAC-ELEC$c$, $c$ALG-FRA-ALG$c$, $c$Simplificar (x² - 1)/(x - 1) exige factorizar. Cierra la decisión abierta 2 del plan de clases.$c$)
) as v(prereq, target, note)
join nodes a on a.code = v.prereq
join nodes b on b.code = v.target;

-- Verificación: la migración falla si falta alguna de las 12.
do $$
declare
  n int;
begin
  select count(*) into n
    from node_edges e
    join nodes a on a.id = e.prereq_id
    join nodes b on b.id = e.target_id
   where (a.code, b.code) in (
     ('NUM-FRA-SIG', 'ALG-ECU-FRA'),
     ('NUM-FRA-SIG', 'ALG-FLI-PEND'),
     ('NUM-RAI-RAC', 'GEO-TRI-NOT'),
     ('NUM-RAI-SIG', 'ALG-CUA-INC'),
     ('NUM-RAI-SIG', 'ALG-CUA-DIS'),
     ('ALG-CUA-INC', 'ALG-FCU-CEROS'),
     ('ALG-CUA-DIS', 'ALG-FCU-CEROS'),
     ('ALG-PRO-REP', 'ALG-FLI-CONC'),
     ('NUM-LOG-REL', 'ALG-FLO-CONC'),
     ('GEO-CUE-UNID', 'GEO-CUE-VOL-CIL'),
     ('EST-TAB-ACUM', 'EST-POS-MEDIANA'),
     ('ALG-FAC-ELEC', 'ALG-FRA-ALG'));
  if n <> 12 then
    raise exception 'se esperaban 12 aristas nuevas, quedaron %', n;
  end if;
end $$;
