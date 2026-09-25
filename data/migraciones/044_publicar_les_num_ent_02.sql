-- =====================================================================
-- Publicación de LES-NUM-ENT-02 (cargada en 043 como 'draft').
-- Bloque de publicación de 043_les_num_ent_02.sql, descomentado.
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- =====================================================================

-- 24 ítems curated -> active:
update items set status = 'active'
 where code in ($c$M1-ENT-025$c$, $c$M1-ENT-026$c$, $c$M1-ENT-027$c$, $c$M1-ENT-028$c$, $c$M1-ENT-029$c$, $c$M1-ENT-030$c$, $c$M1-ENT-031$c$, $c$M1-ENT-032$c$, $c$M1-ENT-033$c$, $c$M1-ENT-034$c$, $c$M1-ENT-035$c$, $c$M1-ENT-036$c$, $c$M1-ENT-037$c$, $c$M1-ENT-038$c$, $c$M1-ENT-039$c$, $c$M1-ENT-040$c$, $c$M1-ENT-041$c$, $c$M1-ENT-042$c$, $c$M1-ENT-043$c$, $c$M1-ENT-044$c$, $c$M1-ENT-045$c$, $c$M1-ENT-046$c$, $c$M1-ENT-047$c$, $c$M1-ENT-048$c$);

update remediations set status = 'active'
 where code in ($c$REM-ENT-ADI-REGLAMUL$c$, $c$REM-ENT-ADI-MAGNOP$c$, $c$REM-ENT-ADI-INVIERTE$c$, $c$REM-ENT-ADI-DOBLENEG$c$, $c$REM-ENT-ADI-RESTAGRUPA$c$, $c$REM-ENT-ADI-VARORDEN$c$);

update lessons set status = 'active'
 where code = $c$LES-NUM-ENT-02$c$;
