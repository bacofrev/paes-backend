-- =====================================================================
-- 034_alumno_real_uuid_correcto.sql
-- El uuid de auth.users usado en 033 (9ea21d4a-e4b4-49bd-9eac-901b7b0cb455)
-- quedó obsoleto: la cuenta de Supabase Auth se recreó con otro id
-- (4055b69a-c9db-42fc-b69f-fcd6db906161, mismo mail bacofrev@gmail.com).
-- El ON DELETE CASCADE de students_id_fkey (033) ya se encargó de la
-- fila vieja al borrarse esa cuenta de auth.users; students quedó en 0
-- filas. Esta migración solo inserta la fila con el id correcto.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- =====================================================================

begin;

insert into students (id) values ('4055b69a-c9db-42fc-b69f-fcd6db906161');

-- Verificación (SELECT, no RAISE NOTICE).
select id, created_at from students;

commit;
