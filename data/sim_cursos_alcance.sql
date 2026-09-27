-- =====================================================================
-- sim_cursos_alcance.sql
-- ¿Cada curso muestra solo lo suyo? (migración 052)
--
--   M1 no ve clases de M2 · M2 sí · BIO no ve BIO-E · BIO-E ve ambas
--   las casillas de LEN + M1 + CIE-BIO son LEN, M1, FIS, QUI, BIO-E
--   subsunción: + CIE-QUI muestra QUI-E y oculta QUI
--   el trigger rechaza una clase con nodos de nivel 1 y 2
--
-- Prueba las vistas v_course_lessons / v_student_visible_courses, que
-- son las mismas que leen GET /courses y GET /courses/{code}.
--
-- Ciencias no tiene contenido todavía: el bloque 1 arma una unidad BIO
-- de mentira con un nodo y una clase de nivel 1, y otro par de nivel 2.
--
-- UUID propio (...0201), distinto de los otros sim_*.sql. Cada caso
-- falla con raise exception; si llega al final, imprime OK por caso.
-- Todo corre dentro de una transacción que termina en ROLLBACK. No deja
-- nada en la base. Correr SIN -1:
--   psql -X -v ON_ERROR_STOP=1 -f sim_cursos_alcance.sql "$DATABASE_URL"
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 0. Estudiante sintético (el trigger de auth.users crea students)
-- ---------------------------------------------------------------------
insert into auth.users (id, email, raw_app_meta_data, raw_user_meta_data, aud, role)
values ('00000000-0000-4000-8000-000000000201', 'cursos@sim-cursos.local',
        '{}'::jsonb, '{}'::jsonb, 'authenticated', 'authenticated');

-- ---------------------------------------------------------------------
-- 1. Contenido BIO de mentira: nivel 1 (común) y nivel 2 (específico)
-- ---------------------------------------------------------------------
insert into units (code, name, area_id, position)
select 'BIO-SIM', 'Unidad simulada', id, 99 from areas where code = 'BIO';

insert into nodes (code, name, area_id, unit_id, exam_level, status)
select v.code, v.code, a.id, u.id, v.lvl, 'active'
from (values ('BIO-SIM-COM', 1), ('BIO-SIM-ESP', 2)) v(code, lvl)
cross join areas a
cross join units u
where a.code = 'BIO' and u.code = 'BIO-SIM';

insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.code, '## sim', v.pos, 'active'
from (values ('LES-BIO-SIM-01', 1), ('LES-BIO-SIM-02', 2)) v(code, pos)
cross join units u
where u.code = 'BIO-SIM';

insert into lesson_nodes (lesson_id, node_id, position)
select l.id, n.id, 1
from (values ('LES-BIO-SIM-01', 'BIO-SIM-COM'),
             ('LES-BIO-SIM-02', 'BIO-SIM-ESP')) v(lesson, node)
join lessons l on l.code = v.lesson
join nodes n   on n.code = v.node;

-- ---------------------------------------------------------------------
-- 2. Ayudas: fijar los planes del estudiante y leer lo que ve
-- ---------------------------------------------------------------------
create function pg_temp.set_plans(p_plans text[]) returns void
language sql as $$
  delete from student_plans where student_id = '00000000-0000-4000-8000-000000000201';
  insert into student_plans (student_id, plan_id)
  select '00000000-0000-4000-8000-000000000201', id from plans where code = any(p_plans);
$$;

-- Casillas, en el orden de GET /courses
create function pg_temp.tiles() returns text[]
language sql as $$
  select coalesce(array_agg(c.code order by s.position, c.position), '{}')
  from v_student_visible_courses vc
  join courses c  on c.id = vc.course_id
  join subjects s on s.id = c.subject_id
  where vc.student_id = '00000000-0000-4000-8000-000000000201';
$$;

-- Clases de un curso, solo si el estudiante lo tiene (lo que ve GET /courses/{code})
create function pg_temp.lessons_of(p_course text) returns text[]
language sql as $$
  select coalesce(array_agg(l.code order by l.code), '{}')
  from v_course_lessons cl
  join courses c on c.id = cl.course_id
  join lessons l on l.id = cl.lesson_id
  join v_student_courses sc on sc.course_id = c.id
  where c.code = p_course
    and sc.student_id = '00000000-0000-4000-8000-000000000201';
$$;

-- ---------------------------------------------------------------------
-- 3. Casos
-- ---------------------------------------------------------------------
do $$
declare v text[];
begin
  -- M1 no ve M2
  perform pg_temp.set_plans(array['M1']);
  v := pg_temp.lessons_of('M1');
  if not v @> array['LES-NUM-ENT-01', 'LES-NUM-ENT-02'] then
    raise exception 'M1: faltan clases de nivel 1: %', v;
  end if;
  if 'LES-NUM-ENT-07' = any(v) then
    raise exception 'M1 ve LES-NUM-ENT-07 (nivel 2): %', v;
  end if;
  if exists (
    select 1 from v_course_lessons cl
    join courses c on c.id = cl.course_id
    join lesson_nodes ln on ln.lesson_id = cl.lesson_id
    join nodes n on n.id = ln.node_id
    where c.code = 'M1' and n.exam_level > 1) then
    raise exception 'M1 tiene una clase con un nodo de nivel 2';
  end if;
  if pg_temp.lessons_of('M2') <> '{}' then
    raise exception 'con plan M1 se ve el curso M2';
  end if;
  raise notice 'OK  M1 no ve clases de M2 (% clases)', cardinality(v);

  -- M2 sí ve nivel 2
  perform pg_temp.set_plans(array['M2']);
  if not 'LES-NUM-ENT-07' = any(pg_temp.lessons_of('M2')) then
    raise exception 'M2 no ve LES-NUM-ENT-07';
  end if;
  raise notice 'OK  M2 ve LES-NUM-ENT-07';

  -- BIO (común) no ve BIO-E
  perform pg_temp.set_plans(array['CIE-FIS']);
  v := pg_temp.lessons_of('BIO');
  if v <> array['LES-BIO-SIM-01'] then
    raise exception 'BIO debería ver solo LES-BIO-SIM-01, ve %', v;
  end if;
  if pg_temp.lessons_of('BIO-E') <> '{}' then
    raise exception 'con plan CIE-FIS se ve el curso BIO-E';
  end if;
  raise notice 'OK  BIO no ve BIO-E';

  -- BIO-E ve común y específico
  perform pg_temp.set_plans(array['CIE-BIO']);
  v := pg_temp.lessons_of('BIO-E');
  if v <> array['LES-BIO-SIM-01', 'LES-BIO-SIM-02'] then
    raise exception 'BIO-E debería ver las dos clases, ve %', v;
  end if;
  raise notice 'OK  BIO-E ve común y específico';

  -- Casillas del ejemplo
  perform pg_temp.set_plans(array['LEN', 'M1', 'CIE-BIO']);
  v := pg_temp.tiles();
  if v <> array['LEN', 'M1', 'FIS', 'QUI', 'BIO-E'] then
    raise exception 'casillas LEN+M1+CIE-BIO: %', v;
  end if;
  raise notice 'OK  casillas %', v;

  -- Subsunción
  perform pg_temp.set_plans(array['LEN', 'M1', 'CIE-BIO', 'CIE-QUI']);
  v := pg_temp.tiles();
  if v <> array['LEN', 'M1', 'FIS', 'QUI-E', 'BIO-E'] then
    raise exception 'subsunción CIE-BIO+CIE-QUI: %', v;
  end if;
  raise notice 'OK  subsunción %', v;

  -- M1 + M2 no se subsumen
  perform pg_temp.set_plans(array['M1', 'M2']);
  v := pg_temp.tiles();
  if v <> array['M1', 'M2'] then
    raise exception 'M1+M2: %', v;
  end if;
  raise notice 'OK  M1 y M2 se ven los dos';

  -- Plan pausado no da cursos
  update student_plans set status = 'paused'
  where student_id = '00000000-0000-4000-8000-000000000201';
  if pg_temp.tiles() <> '{}' then
    raise exception 'un plan pausado sigue dando cursos';
  end if;
  raise notice 'OK  plan pausado no da cursos';
end $$;

-- Trigger: una clase de nivel 1 no acepta un nodo de nivel 2
do $$
begin
  begin
    insert into lesson_nodes (lesson_id, node_id, position)
    select l.id, n.id, 2 from lessons l, nodes n
    where l.code = 'LES-BIO-SIM-01' and n.code = 'BIO-SIM-ESP';
    raise exception 'FALLA: el trigger dejó mezclar niveles en lesson_nodes';
  exception when raise_exception then
    if sqlerrm like 'FALLA%' then raise; end if;
    raise notice 'OK  trigger lesson_nodes: %', sqlerrm;
  end;

  begin
    update nodes set exam_level = 2 where code = 'NUM-POT-SIG';  -- LES-NUM-POT-01 = CONC:1 + SIG:1
    raise exception 'FALLA: el trigger dejó subir un nodo a nivel 2 dentro de una clase de nivel 1';
  exception when raise_exception then
    if sqlerrm like 'FALLA%' then raise; end if;
    raise notice 'OK  trigger nodes: %', sqlerrm;
  end;
end $$;

rollback;
