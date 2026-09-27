# Plataforma PAES — Bitácora: cursos, planes y qué ve el estudiante

*Sesión: 27 de septiembre de 2026*

---

## 1. El problema

Un estudiante contrata LEN, M1 y Ciencias mención Biología. En el módulo
de cursos tiene que ver **LEN, M1, FIS, QUI, BIO específica**. La PAES de
Ciencias es una prueba con un módulo común de las tres disciplinas más el
electivo de la mención.

Lo que había: `subjects → areas → units → nodes`, `courses(subject, area
nullable, exam_level)` y `student_courses`. El modelo de cursos ya
alcanzaba para las casillas (BIO específica = `(CIE, BIO, 2)`, que
incluye el común). Faltaba lo que se **contrata**: "Ciencias-BIO" da tres
cursos, no uno. Además `student_courses` estaba vacía, solo existía MAT y
ningún endpoint usaba cursos.

## 2. Decisiones

**Plan ≠ curso.** `plans` + `plan_courses` + `student_plans`. El plan es
lo que se compra y el curso es la casilla. `student_courses` se borró y
pasó a ser la vista `v_student_courses`, derivada de los planes activos.
Guardar los cursos a mano perdía qué se compró y rompía los solapes:
CIE-BIO y CIE-QUI dan ambos QUI común, y pausar uno no debe quitarlo.

**Códigos de curso sin prefijo:** `FIS`, `QUI`, `BIO`, `FIS-E`, `QUI-E`,
`BIO-E`, `LEN`, `HIS`. Los agrupa el plan (`CIE-BIO`), no el código.

**Subsunción solo por área.** Con CIE-BIO + CIE-QUI se ve `QUI-E` y se
oculta `QUI`, porque el nivel 2 incluye el 1. M1 y M2 (área nula) se ven
los dos: son pruebas distintas.

**M1 no ve M2: el filtro va por clase, no por unidad.** Diez unidades
mezclan niveles (NUM-ENT: REC/ADI son nivel 1 y ABS nivel 2). Una clase
entra al curso solo si **todos** sus nodos están en alcance. Con "alguno"
en vez de "todos", una clase mixta se filtraría a M1. Para que "todos" no
esconda contenido de nivel 1, el trigger `check_lesson_single_level`
prohíbe que una clase tenga nodos de nivel 1 y 2 a la vez, al insertar
en `lesson_nodes` y al cambiar `nodes.exam_level`. El nivel 0 combina
con cualquiera (LES-NUM-POT-04 es 0+1). Si una clase necesita ambos
niveles, se separa en dos. Lo mismo vale para BIO vs. BIO-E.

**La regla vive en vistas** (`v_course_lessons`,
`v_student_visible_courses`), no en `queries.py`: así
`data/sim_cursos_alcance.sql` prueba exactamente lo que usa el endpoint.
Las vistas son `security_invoker`: el backend (postgres, bypassrls) no
cambia, y anon/authenticated vía PostgREST no ven planes ajenos.
`v_available_nodes` se recreó igual, pero leyendo `v_student_courses`.

**LEN e HIS sin áreas todavía.** Sus cursos cubren la asignatura
completa (`area_id` null). Las áreas se crean con los primeros nodos,
porque `nodes.area_id` es NOT NULL. El orden de las asignaturas quedó
como en la PAES: LEN 1, MAT 2, HIS 3, CIE 4.

## 3. Endpoints

- `GET /courses`: las casillas, ordenadas por asignatura y curso. Una
  lista vacía es válida: no compró nada.
- `GET /courses/{code}`: unidades → clases → nodos, con status y
  `pending_prereqs`. Da 404 `course_not_found` tanto si el curso no
  existe como si no es del estudiante.

No hay endpoint de compra: `student_plans` se llena a mano hasta que
exista el pago.

## 4. Pendiente

- `/nodes/{code}/next` y `POST /sessions` no revisan el alcance: un
  estudiante puede practicar un nodo de M2 si conoce el código. Cerrarlo
  exige que los estudiantes actuales tengan un plan; si no, se quedan sin
  nada.
- La pantalla del módulo de cursos en `frontend/`.

## 5. Ojo: SET contra el pooler

`DATABASE_URL` apunta al pooler de Supabase en **modo transacción**
(puerto 6543). Un `set ...` suelto (fuera de `begin`) queda pegado a la
conexión del servidor, y la hereda el próximo cliente, backend de
producción incluido. Pasó en esta sesión con `set
default_transaction_read_only=on`: una prueba posterior recibió "cannot
execute UPDATE in a read-only transaction". La conexión ya se había
reciclado y se verificó que ninguna quedó así. Para consultas de solo
lectura hay que usar `begin read only; ...; rollback;` o `set local`,
nunca un `set` de sesión.
