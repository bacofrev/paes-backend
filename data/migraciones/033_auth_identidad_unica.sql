-- =====================================================================
-- 033_auth_identidad_unica.sql
-- El alumno deja de venir hardcodeado en el frontend y deja de venir
-- del cliente en el backend (student_id como body/query param). Pasa a
-- salir del JWT de Supabase Auth vía Depends(get_current_student).
--
-- Decisión de modelo: students.id pasa a ser el mismo uuid que
-- auth.users.id. Un solo identificador en todo el sistema, sin columna
-- auth_user_id ni traducción entre ids.
--
-- Los 4 alumnos de prueba existentes no están ligados a ningún
-- auth.users real (auth_user_id vacío en los 4) y no tienen forma de
-- estarlo bajo el modelo nuevo: se descartan junto con sus sesiones y
-- respuestas, no se migran.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- El editor SQL de Supabase NO respeta begin/commit ni muestra notices.
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 1. Descarte de datos de prueba, en orden de FKs.
--    responses referencia a sessions y a students; sessions referencia
--    a students. Se borran primero para no depender de que el cascade
--    esté bien configurado en cada tabla.
--    node_mastery, student_misconceptions y student_courses NO se
--    tocan a mano: las tres tienen fk a students(id) on delete cascade
--    desde que se crearon, así que quedan vacías solas al borrar la
--    fila de students más abajo.
-- ---------------------------------------------------------------------
delete from responses;
delete from sessions;
delete from students;

-- ---------------------------------------------------------------------
-- 2. auth_user_id deja de existir: ya no hace falta traducir entre un
--    id propio y el de Supabase Auth porque pasan a ser el mismo valor.
-- ---------------------------------------------------------------------
alter table students drop column auth_user_id;

-- id ya no lo genera la aplicación: lo asigna Supabase Auth al crear
-- la cuenta y students.id lo copia tal cual. Un default aleatorio acá
-- permitiría crear un alumno sin cuenta de auth, que es justo lo que
-- este cambio de modelo elimina.
alter table students alter column id drop default;

-- Hace cumplir en la base lo que el modelo ya asume: todo student
-- existe porque existe un auth.users con el mismo id. on delete cascade
-- porque un alumno sin su cuenta de auth no tiene sentido en este
-- modelo.
alter table students
  add constraint students_id_fkey
  foreign key (id) references auth.users(id) on delete cascade;

comment on table students is
  'Un alumno = una cuenta de Supabase Auth. Fila creada a mano hoy '
  '(no hay todavía un trigger de alta automática en el signup); el id '
  'se copia de auth.users.id, nunca se genera acá.';

comment on column students.id is
  'Mismo uuid que auth.users.id. No hay traducción entre ids: este ES '
  'el id de la cuenta de Supabase Auth, no una referencia externa a '
  'ella.';

-- ---------------------------------------------------------------------
-- 3. El primer alumno real.
-- ---------------------------------------------------------------------
insert into students (id) values ('9ea21d4a-e4b4-49bd-9eac-901b7b0cb455');

-- ---------------------------------------------------------------------
-- 4. Verificación (SELECT, no RAISE NOTICE — no se ve en el editor de
--    Supabase y acá tampoco hace falta).
-- ---------------------------------------------------------------------
select 'students' as tabla, count(*) as filas from students
union all select 'sessions', count(*) from sessions
union all select 'responses', count(*) from responses
union all select 'node_mastery', count(*) from node_mastery
union all select 'student_misconceptions', count(*) from student_misconceptions
union all select 'student_courses', count(*) from student_courses;

select id, created_at from students;

commit;
