-- =====================================================================
-- Cursos, planes y qué ve el estudiante en el módulo de cursos
--
-- Lo que se CONTRATA (plan) no es lo que se VE (curso). "Ciencias
-- mención Biología" es un plan que da tres cursos: FIS común, QUI común
-- y BIO específica (que incluye BIO común). Un estudiante con LEN + M1 +
-- Ciencias-BIO ve cinco casillas: LEN, M1, FIS, QUI, BIO-E.
--
-- student_courses (vacía, nunca usada por el backend) se reemplaza por
-- la vista v_student_courses, derivada de student_plans. Guardar los
-- cursos a mano perdía qué se compró y no manejaba solapes: CIE-BIO y
-- CIE-QUI dan ambos QUI común, y pausar uno no debe quitarlo.
--
-- La regla de visibilidad vive en vistas, no en queries.py, para que
-- data/sim_cursos_alcance.sql pruebe exactamente lo que usa el endpoint:
--   v_course_lessons           qué clases ve cada curso (TODOS sus nodos
--                              en alcance, no "alguno")
--   v_student_visible_courses  las casillas, con subsunción por área
--
-- Una clase no puede mezclar nodos de nivel 1 y 2 (trigger abajo): es lo
-- que garantiza que M1 no vea una clase de M2 ni BIO una de BIO-E. El
-- nivel 0 combina con cualquiera: es contenido previo.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 0. student_courses tiene que estar vacía para poder botarla
-- ---------------------------------------------------------------------
do $$
begin
  if exists (select 1 from student_courses) then
    raise exception 'student_courses tiene filas: migrarlas a student_plans antes de botarla';
  end if;
end $$;

-- ---------------------------------------------------------------------
-- 1. Asignaturas. Orden de la PAES: Lectora, Matemática, Historia, Ciencias
-- ---------------------------------------------------------------------
update subjects set position = 2 where code = 'MAT';

insert into subjects (code, name, position) values
  ('LEN', $c$Competencia Lectora$c$, 1),
  ('HIS', $c$Historia y Ciencias Sociales$c$, 3),
  ('CIE', $c$Ciencias$c$, 4);

comment on table subjects is
$c$La asignatura. NO es la prueba ni lo que se contrata: Matemática tiene dos pruebas (M1 y M2), que viven como cursos. Ciencias es el caso que lo aclara: una asignatura, una prueba, con módulos electivos adentro.$c$;

-- ---------------------------------------------------------------------
-- 2. Áreas de Ciencias. LEN e HIS no llevan áreas todavía: sus cursos
--    cubren la asignatura completa (area_id null) y las áreas llegan con
--    los primeros nodos.
-- ---------------------------------------------------------------------
insert into areas (code, name, position, subject_id)
select v.code, v.name, v.position, s.id
from (values ('FIS', $c$Física$c$,   1),
             ('QUI', $c$Química$c$,  2),
             ('BIO', $c$Biología$c$, 3)) v(code, name, position)
cross join subjects s
where s.code = 'CIE';

-- ---------------------------------------------------------------------
-- 3. Cursos: las casillas del módulo de cursos
-- ---------------------------------------------------------------------
insert into courses (code, name, subject_id, area_id, exam_level, position)
select v.code, v.name, s.id, a.id, v.exam_level, v.position
from (values ('LEN',   $c$Competencia Lectora$c$,          'LEN', null,  1, 1),
             ('HIS',   $c$Historia y Ciencias Sociales$c$, 'HIS', null,  1, 1),
             ('FIS',   $c$Física$c$,                       'CIE', 'FIS', 1, 1),
             ('QUI',   $c$Química$c$,                      'CIE', 'QUI', 1, 2),
             ('BIO',   $c$Biología$c$,                     'CIE', 'BIO', 1, 3),
             ('FIS-E', $c$Física específica$c$,            'CIE', 'FIS', 2, 4),
             ('QUI-E', $c$Química específica$c$,           'CIE', 'QUI', 2, 5),
             ('BIO-E', $c$Biología específica$c$,          'CIE', 'BIO', 2, 6))
     v(code, name, subject_code, area_code, exam_level, position)
join subjects s on s.code = v.subject_code
left join areas a on a.code = v.area_code;

comment on table courses is
$c$Lo que el estudiante VE en el módulo de cursos, no lo que compra (eso es plans) ni lo que rinde. La PAES de Ciencias es una sola prueba (54 comunes + 26 de la mención), pero se ve como FIS, QUI y BIO-E: el curso recorta contenido y no representa un instrumento de evaluación.$c$;

-- ---------------------------------------------------------------------
-- 4. Planes: lo que se contrata
-- ---------------------------------------------------------------------
create table plans (
  id         bigint generated always as identity primary key,
  code       code_text not null unique,
  name       text not null,
  position   smallint not null unique,
  status     text not null default 'active' check (status in ('active', 'retired')),
  created_at timestamptz not null default now()
);

comment on table plans is
$c$Lo que el estudiante contrata. Agrupa cursos: "Ciencias mención Biología" da FIS, QUI y BIO-E. Separado de courses porque la compra y la casilla no coinciden, y porque dos planes pueden dar el mismo curso (CIE-BIO y CIE-QUI dan ambos QUI común).$c$;

create table plan_courses (
  plan_id   bigint not null references plans(id) on delete cascade,
  course_id bigint not null references courses(id),
  primary key (plan_id, course_id)
);

comment on table plan_courses is
$c$Qué cursos da cada plan. Cambiar esto cambia el alcance de todos los estudiantes con ese plan en el acto: v_student_courses es una vista, no una copia.$c$;

create table student_plans (
  student_id  uuid not null references students(id) on delete cascade,
  plan_id     bigint not null references plans(id),
  enrolled_at timestamptz not null default now(),
  status      text not null default 'active' check (status in ('active', 'paused', 'finished')),
  primary key (student_id, plan_id)
);

comment on table student_plans is
$c$Los planes que contrató un estudiante. Su alcance es la UNIÓN de los cursos de sus planes activos (v_student_courses). Sin endpoint de alta todavía: el pago no existe, las filas se insertan a mano.$c$;

alter table plans         enable row level security;
alter table plan_courses  enable row level security;
alter table student_plans enable row level security;

insert into plans (code, name, position) values
  ('LEN',     $c$Competencia Lectora$c$,           1),
  ('M1',      $c$Competencia Matemática 1$c$,      2),
  ('M2',      $c$Competencia Matemática 2$c$,      3),
  ('HIS',     $c$Historia y Ciencias Sociales$c$,  4),
  ('CIE-BIO', $c$Ciencias mención Biología$c$,     5),
  ('CIE-FIS', $c$Ciencias mención Física$c$,       6),
  ('CIE-QUI', $c$Ciencias mención Química$c$,      7);

insert into plan_courses (plan_id, course_id)
select p.id, c.id
from (values ('LEN', 'LEN'), ('M1', 'M1'), ('M2', 'M2'), ('HIS', 'HIS'),
             ('CIE-BIO', 'FIS'), ('CIE-BIO', 'QUI'), ('CIE-BIO', 'BIO-E'),
             ('CIE-FIS', 'QUI'), ('CIE-FIS', 'BIO'), ('CIE-FIS', 'FIS-E'),
             ('CIE-QUI', 'FIS'), ('CIE-QUI', 'BIO'), ('CIE-QUI', 'QUI-E'))
     v(plan_code, course_code)
join plans p   on p.code = v.plan_code
join courses c on c.code = v.course_code;

-- ---------------------------------------------------------------------
-- 5. Cursos del estudiante, derivados de sus planes
--
-- security_invoker: el backend entra como postgres (bypassrls) y no
-- cambia nada; anon/authenticated vía PostgREST quedan bajo el RLS de
-- las tablas y no ven los planes de otros.
-- ---------------------------------------------------------------------
drop view v_available_nodes;
drop table student_courses;

create view v_student_courses with (security_invoker = true) as
select distinct sp.student_id, pc.course_id
from student_plans sp
join plans p         on p.id = sp.plan_id
join plan_courses pc on pc.plan_id = p.id
join courses c       on c.id = pc.course_id
where sp.status = 'active'
  and p.status = 'active'
  and c.status = 'active';

comment on view v_student_courses is
$c$El alcance del estudiante: los cursos de sus planes activos, sin repetir. Reemplaza a la tabla student_courses (migración 052). Incluye cursos subsumidos (QUI común junto a QUI-E): para las casillas usar v_student_visible_courses.$c$;

create view v_student_visible_courses with (security_invoker = true) as
select sc.student_id, sc.course_id
from v_student_courses sc
join courses c on c.id = sc.course_id
where not exists (
  select 1
  from v_student_courses sc2
  join courses c2 on c2.id = sc2.course_id
  where sc2.student_id = sc.student_id
    and c.area_id is not null
    and c2.area_id = c.area_id
    and c2.exam_level > c.exam_level
);

comment on view v_student_visible_courses is
$c$Las casillas del módulo de cursos. Un curso de área se oculta si el estudiante tiene otro de la misma área con nivel mayor (CIE-BIO + CIE-QUI: se ve QUI-E, no QUI), porque el de nivel 2 ya lo incluye. Los de asignatura completa (area_id null, M1/M2) no se subsumen: son pruebas distintas.$c$;

create view v_course_lessons with (security_invoker = true) as
select c.id as course_id, l.id as lesson_id
from courses c
cross join lessons l
join lesson_nodes ln on ln.lesson_id = l.id
join nodes n         on n.id = ln.node_id
join areas a         on a.id = n.area_id
where l.status = 'active'
group by c.id, l.id
having bool_and(a.subject_id = c.subject_id
                and (c.area_id is null or n.area_id = c.area_id)
                and n.exam_level <= c.exam_level);

comment on view v_course_lessons is
$c$Qué clases ve cada curso. Una clase entra solo si TODOS sus nodos caen en el alcance del curso, no si alguno cae: así M1 no muestra una clase con nodos de M2. No depende del estudiante; se cruza con v_student_courses para saber si el estudiante tiene el curso.$c$;

create view v_available_nodes with (security_invoker = true) as
select st.id as student_id,
       n.id as node_id,
       n.code,
       n.name,
       u.code as unit_code,
       n.exam_level,
       coalesce(vm.effective_status, 'not_started'::text) as status,
       count(*) filter (where pre.status <> 'rejected'::text
                          and coalesce(pm.effective_status, 'not_started'::text) <> 'mastered'::text) as pending_prereqs
from students st
cross join nodes n
join units u  on u.id = n.unit_id
join areas ar on ar.id = n.area_id
left join v_node_mastery vm on vm.student_id = st.id and vm.node_code::text = n.code::text
left join node_edges pre    on pre.target_id = n.id
left join nodes prn         on prn.id = pre.prereq_id
left join v_node_mastery pm on pm.student_id = st.id and pm.node_code::text = prn.code::text
where n.status = 'active'::text
  and exists (
    select 1
    from v_student_courses sc
    join courses c on c.id = sc.course_id
    where sc.student_id = st.id
      and c.subject_id = ar.subject_id
      and (c.area_id is null or c.area_id = n.area_id)
      and n.exam_level <= c.exam_level)
group by st.id, n.id, n.code, n.name, u.code, n.exam_level, vm.effective_status;

comment on view v_available_nodes is
$c$Ojo al costo: es students × nodes. Filtrar siempre por student_id, nunca leerla entera. Un estudiante sin planes activos no ve ningún nodo, que es lo correcto: no compró nada. Desde 052 lee v_student_courses (planes) en vez de la tabla student_courses.$c$;

-- ---------------------------------------------------------------------
-- 6. Una clase no mezcla niveles 1 y 2
-- ---------------------------------------------------------------------
create function check_lesson_single_level() returns trigger
language plpgsql as $$
declare
  v_lessons bigint[];
  v_lesson  text;
begin
  -- new es una fila de lesson_nodes o de nodes según quién disparó:
  -- leer new.lesson_id desde nodes revienta, por eso el if.
  if tg_table_name = 'lesson_nodes' then
    v_lessons := array[new.lesson_id];
  else
    select array_agg(lesson_id) into v_lessons
    from lesson_nodes where node_id = new.id;
  end if;

  select l.code into v_lesson
  from lessons l
  join lesson_nodes ln on ln.lesson_id = l.id
  join nodes n         on n.id = ln.node_id
  where l.id = any(v_lessons)
  group by l.code
  having bool_or(n.exam_level = 1) and bool_or(n.exam_level = 2)
  limit 1;

  if v_lesson is not null then
    raise exception
      'La clase % quedaría con nodos de nivel 1 y 2: M1 no puede ver contenido de M2 ni BIO de BIO-E. Separarla en dos clases.',
      v_lesson;
  end if;
  return null;
end
$$;

comment on function check_lesson_single_level() is
$c$Rechaza una clase con nodos de nivel 1 y 2 a la vez. v_course_lessons ocultaría esa clase del curso de nivel 1 completa, y con ella su contenido de nivel 1; mejor que falle al cargar. El nivel 0 combina con cualquiera.$c$;

create trigger lesson_nodes_single_level
  after insert or update on lesson_nodes
  for each row execute function check_lesson_single_level();

create trigger nodes_lesson_single_level
  after update of exam_level on nodes
  for each row execute function check_lesson_single_level();

-- ---------------------------------------------------------------------
-- Verificación: la migración falla si algo no quedó
-- ---------------------------------------------------------------------
do $$
declare v_bad text;
begin
  select string_agg(l.code, ', ') into v_bad
  from (select ln.lesson_id
        from lesson_nodes ln join nodes n on n.id = ln.node_id
        group by ln.lesson_id
        having bool_or(n.exam_level = 1) and bool_or(n.exam_level = 2)) x
  join lessons l on l.id = x.lesson_id;
  if v_bad is not null then
    raise exception 'clases que ya mezclan niveles 1 y 2: %', v_bad;
  end if;

  if (select count(*) from courses) <> 10 then
    raise exception 'se esperaban 10 cursos, hay %', (select count(*) from courses);
  end if;

  if (select count(*) from plan_courses) <> 13 then
    raise exception 'se esperaban 13 filas en plan_courses, hay %', (select count(*) from plan_courses);
  end if;

  if exists (
    select 1 from v_course_lessons cl
    join courses c on c.id = cl.course_id
    join lessons l on l.id = cl.lesson_id
    where c.code = 'M1' and l.code = 'LES-NUM-ENT-07') then
    raise exception 'M1 ve LES-NUM-ENT-07, que es de nivel 2';
  end if;
end $$;
