-- =====================================================================
-- Publicación de LES-ALG-EXP-01 (cargada en 046 como 'draft').
-- Bloque de publicación de 046_les_alg_exp_01.sql, descomentado.
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- =====================================================================

-- 45 ítems curated -> active:
update items set status = 'active'
 where code in ($c$M1-EXP-001$c$, $c$M1-EXP-002$c$, $c$M1-EXP-003$c$, $c$M1-EXP-004$c$, $c$M1-EXP-005$c$, $c$M1-EXP-006$c$, $c$M1-EXP-007$c$, $c$M1-EXP-008$c$, $c$M1-EXP-009$c$, $c$M1-EXP-010$c$, $c$M1-EXP-011$c$, $c$M1-EXP-012$c$, $c$M1-EXP-013$c$, $c$M1-EXP-014$c$, $c$M1-EXP-015$c$, $c$M1-EXP-016$c$, $c$M1-EXP-017$c$, $c$M1-EXP-018$c$, $c$M1-EXP-019$c$, $c$M1-EXP-020$c$, $c$M1-EXP-021$c$, $c$M1-EXP-022$c$, $c$M1-EXP-023$c$, $c$M1-EXP-024$c$, $c$M1-EXP-025$c$, $c$M1-EXP-026$c$, $c$M1-EXP-027$c$, $c$M1-EXP-028$c$, $c$M1-EXP-029$c$, $c$M1-EXP-030$c$, $c$M1-EXP-031$c$, $c$M1-EXP-032$c$, $c$M1-EXP-033$c$, $c$M1-EXP-034$c$, $c$M1-EXP-035$c$, $c$M1-EXP-036$c$, $c$M1-EXP-037$c$, $c$M1-EXP-038$c$, $c$M1-EXP-039$c$, $c$M1-EXP-040$c$, $c$M1-EXP-041$c$, $c$M1-EXP-042$c$, $c$M1-EXP-043$c$, $c$M1-EXP-044$c$, $c$M1-EXP-045$c$);

update remediations set status = 'active'
 where code in ($c$REM-EXP-LENG-LINEAL$c$, $c$REM-EXP-LENG-SOBREAGRUPA$c$, $c$REM-EXP-LENG-ORDENRESTA$c$, $c$REM-EXP-LENG-ADITIVO$c$, $c$REM-EXP-LENG-PARTEMUL$c$, $c$REM-EXP-LENG-POTMUL$c$, $c$REM-EXP-LENG-EXCESO$c$, $c$REM-EXP-LENG-OPUINV$c$, $c$REM-EXP-LENG-JUXTA$c$, $c$REM-EXP-LENG-INVREL$c$, $c$REM-EXP-LENG-NUEVAVAR$c$, $c$REM-EXP-LENG-TIEMPO$c$, $c$REM-EXP-LENG-TASA$c$, $c$REM-EXP-LENG-CONSEC$c$, $c$REM-EXP-LENG-PARCONSEC$c$, $c$REM-EXP-LENG-DIGITOS$c$, $c$REM-EXP-LENG-PATRDIF$c$);

update lessons set status = 'active'
 where code = $c$LES-ALG-EXP-01$c$;
