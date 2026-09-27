-- =====================================================================
-- Publicación de LES-NUM-ENT-07 (cargada en 050 como 'draft').
-- Bloque de publicación de 050_les_num_ent_07.sql, descomentado.
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- =====================================================================

-- 33 ítems curated -> active:
update items set status = 'active'
 where code in ($c$M2-ENT-001$c$, $c$M2-ENT-002$c$, $c$M2-ENT-003$c$, $c$M2-ENT-004$c$, $c$M2-ENT-005$c$, $c$M2-ENT-006$c$, $c$M2-ENT-007$c$, $c$M2-ENT-008$c$, $c$M2-ENT-009$c$, $c$M2-ENT-010$c$, $c$M2-ENT-011$c$, $c$M2-ENT-012$c$, $c$M2-ENT-013$c$, $c$M2-ENT-014$c$, $c$M2-ENT-015$c$, $c$M2-ENT-016$c$, $c$M2-ENT-017$c$, $c$M2-ENT-018$c$, $c$M2-ENT-019$c$, $c$M2-ENT-020$c$, $c$M2-ENT-021$c$, $c$M2-ENT-022$c$, $c$M2-ENT-023$c$, $c$M2-ENT-024$c$, $c$M2-ENT-025$c$, $c$M2-ENT-026$c$, $c$M2-ENT-027$c$, $c$M2-ENT-028$c$, $c$M2-ENT-029$c$, $c$M2-ENT-030$c$, $c$M2-ENT-031$c$, $c$M2-ENT-032$c$, $c$M2-ENT-033$c$);

update remediations set status = 'active'
 where code in ($c$REM-ENT-ABS-CAMBIA$c$, $c$REM-ENT-ABS-PARENT$c$, $c$REM-ENT-ABS-SIGNOFUERA$c$, $c$REM-ENT-ABS-UNASOL$c$, $c$REM-ENT-ABS-NEGSOL$c$, $c$REM-ENT-ABS-DISTTAM$c$, $c$REM-ENT-ABS-SALTOS$c$, $c$REM-ENT-ABS-DISTRIB$c$, $c$REM-ENT-ABS-QUITASIGNO$c$);

update lessons set status = 'active'
 where code = $c$LES-NUM-ENT-07$c$;
