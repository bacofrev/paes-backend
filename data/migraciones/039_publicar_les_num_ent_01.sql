-- =====================================================================
-- Publicación de LES-NUM-ENT-01 (cargada en 038 como 'draft').
-- Bloque de publicación de 038_les_num_ent_01.sql, descomentado.
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- =====================================================================

-- 24 ítems curated -> active:
update items set status = 'active'
 where code in ($c$M1-ENT-001$c$, $c$M1-ENT-002$c$, $c$M1-ENT-003$c$, $c$M1-ENT-004$c$, $c$M1-ENT-005$c$, $c$M1-ENT-006$c$, $c$M1-ENT-007$c$, $c$M1-ENT-008$c$, $c$M1-ENT-009$c$, $c$M1-ENT-010$c$, $c$M1-ENT-011$c$, $c$M1-ENT-012$c$, $c$M1-ENT-013$c$, $c$M1-ENT-014$c$, $c$M1-ENT-015$c$, $c$M1-ENT-016$c$, $c$M1-ENT-017$c$, $c$M1-ENT-018$c$, $c$M1-ENT-019$c$, $c$M1-ENT-020$c$, $c$M1-ENT-021$c$, $c$M1-ENT-022$c$, $c$M1-ENT-023$c$, $c$M1-ENT-024$c$);

update remediations set status = 'active'
 where code in ($c$REM-ENT-REC-MAGN$c$, $c$REM-ENT-REC-SINSIGNO$c$, $c$REM-ENT-REC-CERO$c$, $c$REM-ENT-REC-SUCESOR$c$, $c$REM-ENT-REC-ESCALA$c$, $c$REM-ENT-REC-CONTEO$c$, $c$REM-ENT-REC-DIRECCION$c$, $c$REM-ENT-REC-CTXSIGNO$c$);

update lessons set status = 'active'
 where code = $c$LES-NUM-ENT-01$c$;
