-- =====================================================================
-- sim_revisit_racha.sql
-- ¿recompute_node_mastery entra y sale de 'revisit' correctamente?
--
-- Seis alumnos sintéticos, uno por caso de la racha de corte. Reusa la
-- selección de nodo/pool de sim_criterio_dominio.sql (mismo criterio,
-- umbral de ítems fáciles subido de 8 a 10 porque el caso H necesita
-- que el criterio de dominio Y la racha de 3 se cumplan A LA VEZ en el
-- estado final — ver el bloque 4 más abajo para la derivación exacta).
--
-- UUIDs propios (...0101-...0106), NO los de sim_criterio_dominio.sql /
-- sim_report_escalera.sql: ese último termina en COMMIT y solo se
-- limpia a mano con sim_report_cleanup.sql — reusar sus ids acá
-- arriesgaría un choque real de clave si corre antes de esa limpieza.
--
-- Todo corre dentro de una transacción que termina en ROLLBACK. No deja
-- nada en la base. Correr SIN -1:
--   psql -X -v ON_ERROR_STOP=1 -f sim_revisit_racha.sql "$DATABASE_URL"
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- 0. Contra qué estamos probando
-- ---------------------------------------------------------------------
select 'CRITERIO ACTIVO' as bloque, version, p_threshold, min_items,
       min_difficulty, min_hard_correct, revisit_streak
from mastery_config where is_active;

select pg_get_functiondef('recompute_node_mastery'::regproc) as funcion_actual;

-- ---------------------------------------------------------------------
-- 1. Nodo con munición suficiente (8 fáciles, 4 difíciles)
--
-- El nodo más grande de esta base solo tiene 9 fáciles + 5 difíciles
-- (ningún nodo llega a 10 fáciles) — por eso el caso H se arma con más
-- difíciles-correctas de lo mínimo (4, no 2) para no necesitar más de
-- 8 fáciles. Ver el bloque 4 más abajo para la derivación completa.
-- ---------------------------------------------------------------------
create temp table sim_node on commit drop as
select ni.node_id
from node_items ni
join items i on i.id = ni.item_id
cross join (select * from mastery_config where is_active) cfg
group by ni.node_id, cfg.min_difficulty
having count(*) filter (where i.author_difficulty <  cfg.min_difficulty) >= 8
   and count(*) filter (where i.author_difficulty >= cfg.min_difficulty) >= 4
order by count(*) desc
limit 1;

do $$
begin
  if not exists (select 1 from sim_node) then
    raise exception
      'Ningún nodo tiene 8 ítems bajo el piso de dificultad + 4 sobre '
      'el piso. No es un problema del script: el caso H (dominio + '
      'racha final, ambas condiciones a la vez) no se puede armar sin '
      'esa munición.';
  end if;
end $$;

select 'NODO ELEGIDO' as bloque, n.code, n.name
from sim_node sn join nodes n on n.id = sn.node_id;

-- ---------------------------------------------------------------------
-- 2. Pool partido por dificultad (idéntico a sim_criterio_dominio.sql)
-- ---------------------------------------------------------------------
create temp table sim_pool on commit drop as
select i.id as item_id,
       (i.author_difficulty >= cfg.min_difficulty) as dificil,
       row_number() over (
         partition by (i.author_difficulty >= cfg.min_difficulty)
         order by i.id
       ) as seq
from sim_node sn
join node_items ni on ni.node_id = sn.node_id
join items i       on i.id = ni.item_id
cross join (select * from mastery_config where is_active) cfg;

-- ---------------------------------------------------------------------
-- 3. Una clase 'active' real, para el evento lesson_viewed del caso I
-- ---------------------------------------------------------------------
create temp table sim_lesson on commit drop as
select id, version from lessons where status = 'active' limit 1;

do $$
begin
  if not exists (select 1 from sim_lesson) then
    raise exception
      'No hay ninguna lesson con status=active: el caso '
      '"3 fallas -> lesson_viewed -> 1 falla" no se puede armar sin una.';
  end if;
end $$;

-- ---------------------------------------------------------------------
-- 4. Los seis alumnos y lo que se espera de cada uno
-- ---------------------------------------------------------------------
create temp table sim_students (
  code       text primary key,
  student_id uuid,
  session_id uuid,
  espera     text
) on commit drop;

insert into sim_students values
 ('E-tres-fallas',         '00000000-0000-4000-8000-000000000101',
                            '00000000-0000-4000-8000-0000000001e1', 'revisit'),
 ('F-dos-uno-dos',         '00000000-0000-4000-8000-000000000102',
                            '00000000-0000-4000-8000-0000000001e2', 'in_progress'),
 ('G-carril-no-cuenta',    '00000000-0000-4000-8000-000000000103',
                            '00000000-0000-4000-8000-0000000001e3', 'in_progress'),
 ('H-domina-luego-cae',    '00000000-0000-4000-8000-000000000104',
                            '00000000-0000-4000-8000-0000000001e4', 'revisit'),
 ('I-lesson-corta-racha',  '00000000-0000-4000-8000-000000000105',
                            '00000000-0000-4000-8000-0000000001e5', 'in_progress'),
 ('J-reset-no-revisit',    '00000000-0000-4000-8000-000000000106',
                            '00000000-0000-4000-8000-0000000001e6', 'in_progress');

-- students.id references auth.users(id) on delete restrict since 035
-- (on_auth_user_created trigger creates the students row from here —
-- inserting into students directly now fails the FK). Same fix needed
-- in sim_criterio_dominio.sql, unrelated to this feature: flagged
-- separately, not touched here.
insert into auth.users (id, email, raw_app_meta_data, raw_user_meta_data, aud, role)
select ss.student_id, ss.code || '@sim-revisit.local', '{}'::jsonb, '{}'::jsonb,
       'authenticated', 'authenticated'
from sim_students ss;

do $$
begin
  if to_regclass('public.sessions') is not null then
    execute $q$
      insert into sessions (id, student_id, mode, started_at)
      select ss.session_id, ss.student_id, 'practice', now()
      from sim_students ss
    $q$;
  end if;
end $$;

-- ---------------------------------------------------------------------
-- 5. Plan de respuestas (orden = posición cronológica por alumno)
-- ---------------------------------------------------------------------
--  E: 3 fallas seguidas                              -> revisit
--  F: 2 fallas, 1 acierto, 1 falla                    -> in_progress
--  G: 3 fallas, 2 del carril (context=remediation)    -> in_progress
--  H: el criterio de dominio Y la racha de 3 se cumplen A LA VEZ en el
--     estado FINAL (después de las 3 fallas, no antes) -> revisit (gana)
--
--     La precedencia se evalúa sobre el estado final, no sobre un
--     estado previo a las fallas: si las 3 fallas finales simplemente
--     tiran a un alumno por debajo de p_threshold, revisit gana por
--     walkover (mastered ni siquiera era candidato) y el caso no prueba
--     nada. Para que sea una prueba real, con p_correct = (c+alpha)/
--     (n+alpha+beta), alpha=beta=1 (activos hoy), hacen falta n y c
--     tales que el estado final YA cumpla p_threshold con las 3 fallas
--     adentro:
--       c >= p_threshold*n + alpha*p_threshold + alpha  (despejando la
--       desigualdad de p_threshold)  y  c <= n - 3 (solo 3 incorrectas
--       existen). Con p_threshold=0.700 y alpha=1 eso da c >= 0.7n+0.4,
--       y combinado con c = n-3 (las 3 fallas son las únicas
--       incorrectas): n-3 >= 0.7n+0.4 -> n >= 11.33 -> n=12, c=9.
--       p_correct final = (9+1)/(12+2) = 0.7143 >= 0.700. min_items=8
--       <= 12. Cualquier split de las 9 correctas que deje
--       hard_correct >= min_hard_correct(2) sirve — acá van 4
--       difíciles-correctas, no el mínimo de 2, porque ningún nodo de
--       esta base tiene 10 ítems fáciles (el más grande tiene 9
--       fáciles + 5 difíciles) y con 4 difíciles-correctas alcanza con
--       8 fáciles. Las 3 incorrectas son las últimas cronológicamente,
--       sin carril, sin eventos que corten la ventana: la racha
--       también se cumple. Ambas condiciones a la vez, sobre el mismo
--       estado final -> revisit gana por precedencia real, no por
--       descarte.
--
--       12 ítems = 8 fáciles (5 correctas + 3 incorrectas al final) +
--       4 difíciles (las 4 correctas). La aserción del bloque 6.1 más
--       abajo no confía en esta derivación a mano: vuelve a leer
--       mastery_config en vivo y compara contra lo que
--       recompute_node_mastery realmente escribió en node_mastery, así
--       que si algún día cambia p_threshold/min_items/min_hard_correct
--       (fuera de alcance hoy, pero parqueado), el caso falla ruidoso
--       en vez de pasar en falso.
--  I: 3 fallas -> lesson_viewed -> 1 falla             -> in_progress
--  J: 2 fallas -> streak_reset -> 2 fallas             -> in_progress
create temp table sim_plan (
  code text, orden int, item_id uuid, correcta boolean, context text
) on commit drop;

insert into sim_plan
  select 'E-tres-fallas', 1, item_id, false, 'practice' from sim_pool where not dificil and seq = 1
  union all select 'E-tres-fallas', 2, item_id, false, 'practice' from sim_pool where not dificil and seq = 2
  union all select 'E-tres-fallas', 3, item_id, false, 'practice' from sim_pool where not dificil and seq = 3

  union all select 'F-dos-uno-dos', 1, item_id, false, 'practice' from sim_pool where not dificil and seq = 1
  union all select 'F-dos-uno-dos', 2, item_id, false, 'practice' from sim_pool where not dificil and seq = 2
  union all select 'F-dos-uno-dos', 3, item_id, true,  'practice' from sim_pool where not dificil and seq = 3
  union all select 'F-dos-uno-dos', 4, item_id, false, 'practice' from sim_pool where not dificil and seq = 4

  union all select 'G-carril-no-cuenta', 1, item_id, false, 'remediation' from sim_pool where not dificil and seq = 1
  union all select 'G-carril-no-cuenta', 2, item_id, false, 'remediation' from sim_pool where not dificil and seq = 2
  union all select 'G-carril-no-cuenta', 3, item_id, false, 'practice'    from sim_pool where not dificil and seq = 3

  union all select 'H-domina-luego-cae', 1, item_id, true,  'practice' from sim_pool where not dificil and seq = 1
  union all select 'H-domina-luego-cae', 2, item_id, true,  'practice' from sim_pool where not dificil and seq = 2
  union all select 'H-domina-luego-cae', 3, item_id, true,  'practice' from sim_pool where not dificil and seq = 3
  union all select 'H-domina-luego-cae', 4, item_id, true,  'practice' from sim_pool where not dificil and seq = 4
  union all select 'H-domina-luego-cae', 5, item_id, true,  'practice' from sim_pool where not dificil and seq = 5
  union all select 'H-domina-luego-cae', 6, item_id, true,  'practice' from sim_pool where dificil     and seq = 1
  union all select 'H-domina-luego-cae', 7, item_id, true,  'practice' from sim_pool where dificil     and seq = 2
  union all select 'H-domina-luego-cae', 8, item_id, true,  'practice' from sim_pool where dificil     and seq = 3
  union all select 'H-domina-luego-cae', 9, item_id, true,  'practice' from sim_pool where dificil     and seq = 4
  union all select 'H-domina-luego-cae',10, item_id, false, 'practice' from sim_pool where not dificil and seq = 6
  union all select 'H-domina-luego-cae',11, item_id, false, 'practice' from sim_pool where not dificil and seq = 7
  union all select 'H-domina-luego-cae',12, item_id, false, 'practice' from sim_pool where not dificil and seq = 8

  union all select 'I-lesson-corta-racha', 1, item_id, false, 'practice' from sim_pool where not dificil and seq = 1
  union all select 'I-lesson-corta-racha', 2, item_id, false, 'practice' from sim_pool where not dificil and seq = 2
  union all select 'I-lesson-corta-racha', 3, item_id, false, 'practice' from sim_pool where not dificil and seq = 3
  union all select 'I-lesson-corta-racha', 6, item_id, false, 'practice' from sim_pool where not dificil and seq = 4

  union all select 'J-reset-no-revisit', 1, item_id, false, 'practice' from sim_pool where not dificil and seq = 1
  union all select 'J-reset-no-revisit', 2, item_id, false, 'practice' from sim_pool where not dificil and seq = 2
  union all select 'J-reset-no-revisit', 5, item_id, false, 'practice' from sim_pool where not dificil and seq = 3
  union all select 'J-reset-no-revisit', 6, item_id, false, 'practice' from sim_pool where not dificil and seq = 4;

insert into responses (student_id, item_id, option_id, session_id, context, created_at)
select st.student_id, p.item_id, o.id, st.session_id, p.context,
       now() - interval '1 hour' + (p.orden || ' seconds')::interval
from sim_plan p
join sim_students st on st.code = p.code
join lateral (
  select io.id from item_options io
  where io.item_id = p.item_id and io.is_correct = p.correcta
  order by io.id limit 1
) o on true;

-- Eventos: orden 4 para I (entre orden 3 y 6), orden 3 para J (entre
-- orden 2 y 5).
create temp table sim_eventos (
  code text, orden int, event_type text
) on commit drop;

insert into sim_eventos values
  ('I-lesson-corta-racha', 4, 'lesson_viewed'),
  ('J-reset-no-revisit',   3, 'streak_reset');

insert into student_node_events
  (student_id, node_id, event_type, lesson_id, lesson_version, created_at)
select st.student_id, sn.node_id, e.event_type,
       case when e.event_type = 'lesson_viewed' then sl.id end,
       case when e.event_type = 'lesson_viewed' then sl.version end,
       now() - interval '1 hour' + (e.orden || ' seconds')::interval
from sim_eventos e
join sim_students st on st.code = e.code
cross join sim_node sn
cross join sim_lesson sl;

-- ---------------------------------------------------------------------
-- 6. Recalcular
-- ---------------------------------------------------------------------
do $$
declare r record;
begin
  for r in select st.student_id, sn.node_id from sim_students st cross join sim_node sn
  loop
    perform recompute_node_mastery(r.student_id, r.node_id);
  end loop;
end $$;

-- ---------------------------------------------------------------------
-- 6.1 Prueba de precedencia real para H — se afirma ANTES del veredicto
-- general. No confía en la derivación a mano del comentario de arriba:
-- vuelve a leer mastery_config EN VIVO (no hardcodea p_threshold=0.700
-- ni min_items=8 ni min_hard_correct=2) y compara contra lo que
-- recompute_node_mastery realmente escribió en node_mastery para H. Si
-- el criterio de dominio NO se cumple en el estado final, H no prueba
-- precedencia — sería revisit por descarte, igual que E — y el script
-- tiene que fallar ruidoso acá, no seguir como si nada.
-- ---------------------------------------------------------------------
do $verif$
declare
  cfg mastery_config%rowtype;
  h   node_mastery%rowtype;
begin
  select * into cfg from mastery_config where is_active;

  select nm.* into h
  from sim_students st
  cross join sim_node sn
  join node_mastery nm on nm.student_id = st.student_id and nm.node_id = sn.node_id
  where st.code = 'H-domina-luego-cae';

  if h.p_correct is null then
    raise exception '*** FALLA precedencia ***: H no tiene fila en node_mastery.';
  end if;

  if not (h.p_correct >= cfg.p_threshold
          and h.items_answered >= cfg.min_items
          and h.hard_correct >= cfg.min_hard_correct) then
    raise exception
      '*** FALLA precedencia ***: el criterio de dominio NO se cumple '
      'en el estado final de H (p_correct=%, items_answered=%, '
      'hard_correct=% vs p_threshold=%, min_items=%, min_hard_correct=%'
      ' — activos ahora). Este caso no prueba que revisit gane por '
      'precedencia, solo que gana por descarte. Ajustar el plan de '
      'respuestas de H hasta que el criterio de dominio SÍ se cumpla '
      'con las 3 fallas finales ya incluidas.',
      h.p_correct, h.items_answered, h.hard_correct,
      cfg.p_threshold, cfg.min_items, cfg.min_hard_correct;
  end if;

  if h.status <> 'revisit' then
    raise exception
      '*** FALLA precedencia ***: H cumple el criterio de dominio en el '
      'estado final (mastered SÍ era candidato) pero recompute_node_mastery '
      'devolvió status=% en vez de revisit — revisit dejó de ganar la '
      'precedencia sobre mastered.', h.status;
  end if;

  raise info
    'PASA precedencia: H cumple dominio (p_correct=%, items_answered=%,'
    ' hard_correct=%) Y terminó en revisit — revisit gana por '
    'precedencia real, no por descarte.',
    h.p_correct, h.items_answered, h.hard_correct;
end;
$verif$;

-- ---------------------------------------------------------------------
-- 7. Veredicto
-- ---------------------------------------------------------------------
select st.code,
       nm.items_answered as respondidos,
       nm.p_correct,
       nm.hard_correct,
       st.espera         as esperado,
       nm.status         as obtenido,
       case when nm.status = st.espera then 'PASA' else '*** FALLA ***' end as veredicto
from sim_students st
cross join sim_node sn
left join node_mastery nm on nm.student_id = st.student_id and nm.node_id = sn.node_id
order by st.code;

-- Caso 6 de la tabla del brief ("3 fallas -> streak_reset" -> debe ser
-- rechazado): reusa a E, que ya terminó en revisit arriba. El RECHAZO
-- en sí NO se puede probar acá — vive en Python
-- (POST /nodes/{node_code}/events, ver main.py: streak_reset con
-- node_mastery.status = 'revisit' -> 409 cannot_reset_in_revisit), no
-- en una constraint de base de datos. Esta consulta solo confirma la
-- PRECONDICIÓN que dispararía ese 409. Falta, y queda como hueco
-- documentado, un chequeo HTTP real (curl o un futuro test de FastAPI):
--   POST /nodes/{node_code}/events {event_type: streak_reset, ...}
--   contra E -> debe responder 409 cannot_reset_in_revisit.
select 'CASO 6 (precondicion, falta HTTP)' as bloque, nm.status,
       case when nm.status = 'revisit'
            then 'precondicion OK -- falta la prueba HTTP del 409'
            else '*** FALLA precondicion ***' end as veredicto
from sim_students st
cross join sim_node sn
left join node_mastery nm on nm.student_id = st.student_id and nm.node_id = sn.node_id
where st.code = 'E-tres-fallas';

rollback;
