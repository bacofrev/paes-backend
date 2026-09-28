-- =====================================================================
-- Cómo se presenta un curso en el módulo de cursos
--
-- La tarjeta del curso (mockups/Flujo 2 · Cursos) muestra un título, un
-- subtítulo, un ícono y, en el sidebar y el encabezado del curso, una
-- sigla ("M1"). Nada de eso puede vivir en el front mapeado por código:
-- un curso nuevo tendría que esperar un deploy del front para verse
-- bien. Va en la base, junto al curso.
--
--   description  el subtítulo ("Competencia Matemática 1")
--   short_name   la sigla del cuadrito ("M1")
--   icon         clave de un set GENÉRICO de íconos del front (math,
--                book, atom, flask, leaf, globe). El front no sabe qué
--                curso es cuál: solo sabe dibujar esas claves. Sin
--                ícono, o con una clave que no conoce, muestra short_name.
--
-- M1 y M2 pasan a llamarse "Matemática M1/M2", como en el mockup; el
-- nombre oficial de la prueba queda como descripción.
--
-- Correr con: psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql
-- Este archivo NO trae begin/commit: la transacción la pone el -1.
-- =====================================================================

alter table courses
  add column description text,
  add column short_name  text,
  add column icon        text;

comment on column courses.description is
$c$Subtítulo de la tarjeta del curso ("Competencia Matemática 1", "Ciencias · Física"). Texto para el estudiante.$c$;

comment on column courses.short_name is
$c$Sigla corta para el cuadrito del sidebar y del encabezado del curso ("M1", "FIS"). El front la usa también cuando el curso no tiene ícono.$c$;

comment on column courses.icon is
$c$Clave de un set genérico de íconos del front (math, book, atom, flask, leaf, globe). No es un código de curso: el front dibuja la clave sin saber a qué curso pertenece. Null o una clave desconocida → se muestra short_name.$c$;

update courses c
set name        = coalesce(v.name, c.name),
    description = v.description,
    short_name  = v.short_name,
    icon        = v.icon
from (values
  ('LEN',   null,              $c$Comprensión lectora$c$,           'LEN', 'book'),
  ('M1',    $c$Matemática M1$c$, $c$Competencia Matemática 1$c$,    'M1',  'math'),
  ('M2',    $c$Matemática M2$c$, $c$Competencia Matemática 2$c$,    'M2',  'math'),
  ('HIS',   null,              $c$Historia, Geografía y Ciencias Sociales$c$, 'HIS', 'globe'),
  ('FIS',   null,              $c$Ciencias · Física$c$,             'FIS', 'atom'),
  ('QUI',   null,              $c$Ciencias · Química$c$,            'QUI', 'flask'),
  ('BIO',   null,              $c$Ciencias · Biología$c$,           'BIO', 'leaf'),
  ('FIS-E', null,              $c$Ciencias · Física, mención$c$,    'FIS', 'atom'),
  ('QUI-E', null,              $c$Ciencias · Química, mención$c$,   'QUI', 'flask'),
  ('BIO-E', null,              $c$Ciencias · Biología, mención$c$,  'BIO', 'leaf')
) v(code, name, description, short_name, icon)
where c.code = v.code;

-- Los 10 cursos quedan con sigla: si alguno no calzó por código, que falle.
do $$
begin
  if exists (select 1 from courses where short_name is null) then
    raise exception 'hay cursos sin short_name después de 075';
  end if;
end $$;
