-- =====================================================================
-- 035_trigger_signup_soft_delete.sql
-- Tres cambios de identidad de alumno, relacionados entre sí:
--
-- 1. Alta automática. Hoy la fila en public.students para un alumno
--    nuevo se crea a mano (033, 034). Cualquier alumno real que se
--    registre hoy pasa el JWT de get_current_student pero revienta en
--    el primer endpoint que inserte/joinee contra students, porque su
--    fila no existe. Trigger en auth.users que la crea sola.
--
-- 2. FK a restrict. students_id_fkey tenía on delete cascade (033).
--    Borrar una cuenta desde el panel de Supabase borra en silencio al
--    alumno y todo su historial de aprendizaje — ya pasó una vez, en la
--    sesión anterior. Con restrict, la baja tiene que pasar por el soft
--    delete del punto 3.
--
-- 3. Soft delete. Columna deleted_at (timestamptz, no boolean: interesa
--    saber cuándo). La columna sola es decorativa — lo que la hace
--    significar algo es el chequeo en auth.get_current_student()
--    (Python): 403 al alumno que la tenga seteada. Ese chequeo se
--    agrega junto con esta migración, no acá — SQL no es donde vive la
--    autorización en este proyecto.
--
-- Correr atómico:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- El editor SQL de Supabase NO respeta begin/commit ni muestra notices.
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 1. Alta automática al registrarse.
-- ---------------------------------------------------------------------

create function public.handle_new_user() returns trigger
    language plpgsql
    security definer set search_path = public
    as $$
begin
  insert into public.students (id, display_name)
  values (new.id, new.raw_user_meta_data ->> 'display_name')
  on conflict (id) do nothing;
  return new;
end;
$$;

comment on function public.handle_new_user() is
  'Trigger de alta: crea la fila en students al crearse la cuenta en '
  'auth.users. security definer porque el rol que dispara el trigger '
  '(el de Supabase Auth) no tiene permisos sobre public.students por sí '
  'solo — sin esto el alta entera falla. on conflict (id) do nothing '
  'para que sea idempotente (reintentos, o una fila ya creada a mano '
  'antes de que este trigger existiera).';

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ---------------------------------------------------------------------
-- 2. FK a restrict: la baja de un alumno deja de ser un side effect
--    silencioso de borrar la cuenta de auth.
-- ---------------------------------------------------------------------

alter table students drop constraint students_id_fkey;

alter table students
  add constraint students_id_fkey
  foreign key (id) references auth.users(id) on delete restrict;

-- ---------------------------------------------------------------------
-- 3. Soft delete.
-- ---------------------------------------------------------------------

alter table students add column deleted_at timestamptz;

comment on column students.deleted_at is
  'Nula = alumno activo. Timestamp, no boolean: interesa saber cuándo. '
  'El rechazo real pasa en auth.get_current_student() (403 si está '
  'seteada) — sin ese chequeo esta columna es decorativa.';

-- ---------------------------------------------------------------------
-- 4. Verificación (SELECT, no RAISE NOTICE).
-- ---------------------------------------------------------------------

select column_name, data_type, is_nullable
from information_schema.columns
where table_schema = 'public' and table_name = 'students'
order by ordinal_position;

select tgname, tgrelid::regclass, tgenabled
from pg_trigger
where tgname = 'on_auth_user_created';

select conname, confdeltype
from pg_constraint
where conname = 'students_id_fkey';

commit;
