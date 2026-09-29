"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import Icon, { CourseBadge } from "./Icon";
import { practiceHref } from "./LessonView";
import MathText from "./MathText";
import StatePill from "./StatePill";
import { CourseSkeleton } from "./Skeleton";
import {
  useApi,
  type Area,
  type CourseDetail,
  type LessonCard,
  type LessonNode,
  type LessonState,
  type Unit,
} from "../lib/api";
import { LESSON_STATE_LABEL, prereqWhere } from "../lib/status";

type Placed = { area: Area; unit: Unit; lesson: LessonCard };

function allLessons(course: CourseDetail): Placed[] {
  return course.areas.flatMap((area) =>
    area.units.flatMap((unit) => unit.lessons.map((lesson) => ({ area, unit, lesson }))),
  );
}

// Where the course opens: the lesson the student is working on (or has
// to review), else the first one they can start, else the very first.
function focusLesson(course: CourseDetail): Placed | null {
  const all = allLessons(course);
  return (
    all.find((x) => x.lesson.state === "in_progress" || x.lesson.state === "review") ??
    all.find((x) => x.lesson.state === "available") ??
    all[0] ??
    null
  );
}

// The node a lesson is "at": the one being reviewed or worked on, else
// the first the student can practice and hasn't mastered.
function currentNode(lesson: LessonCard): LessonNode | null {
  return (
    lesson.nodes.find((n) => n.status === "revisit" || n.status === "lapsed") ??
    lesson.nodes.find((n) => n.status === "in_progress") ??
    lesson.nodes.find((n) => n.status !== "mastered" && n.pending_prereqs.length === 0) ??
    null
  );
}

function lessonHref(courseCode: string, lesson: LessonCard, node?: LessonNode | null) {
  return `/cursos/${courseCode}/clases/${lesson.code}${node ? `#${node.code}` : ""}`;
}

function ResumeBanner({ course }: { course: CourseDetail }) {
  const focus = focusLesson(course);
  if (!focus || focus.lesson.state === "locked" || focus.lesson.state === "completed") return null;
  const { unit, lesson } = focus;
  const node = currentNode(lesson);
  const started = lesson.state === "in_progress" || lesson.state === "review";
  const href =
    started && node ? practiceHref(node.code, course.code, lesson.code) : lessonHref(course.code, lesson);

  return (
    <section className="resume" aria-label="Retomar tu aprendizaje">
      <span className="resume-icon" aria-hidden="true">
        <Icon name="resume" size={17} strokeWidth={1.8} />
      </span>
      <div className="resume-text">
        <p className="resume-eyebrow">{started ? "Continúa donde quedaste" : "Empieza por aquí"}</p>
        <div className="resume-where">
          <span className="resume-unit">{unit.name}</span>
          <span className="resume-sep" aria-hidden="true">
            ·
          </span>
          {started && node ? (
            <span className="resume-node">{node.name}</span>
          ) : (
            <MathText text={lesson.title} as="span" className="resume-node" />
          )}
        </div>
      </div>
      <Link href={href} className="resume-btn">
        {started ? "Continuar" : "Empezar"}
        <Icon name="arrow" size={15} strokeWidth={1.8} />
      </Link>
    </section>
  );
}

const ACTION: Record<LessonState, string> = {
  in_progress: "Seguir practicando",
  review: "Repasar",
  available: "Ir a la clase",
  completed: "Ver la clase",
  locked: "Ver requisitos",
};

function LessonRow({
  lesson,
  courseCode,
  onRequirements,
}: {
  lesson: LessonCard;
  courseCode: string;
  onRequirements: () => void;
}) {
  const { state } = lesson;
  const node = currentNode(lesson);
  const actionHref =
    state === "in_progress" && node
      ? practiceHref(node.code, courseCode, lesson.code)
      : lessonHref(courseCode, lesson, state === "review" ? node : null);

  return (
    <div className={`lesson-row lesson-row-${state}`}>
      <div className="lesson-row-main">
        <span className="lesson-row-pos">CLASE {lesson.position}</span>
        <Link href={lessonHref(courseCode, lesson)} className="lesson-row-title">
          <MathText text={lesson.title} as="span" />
        </Link>
        <StatePill state={state} label={LESSON_STATE_LABEL[state]} soft />
        {lesson.read_minutes != null && (
          <span className="lesson-row-time">
            <Icon name="clock" size={13} strokeWidth={2} />
            {lesson.read_minutes} min de lectura
          </span>
        )}
      </div>
      <div className="lesson-row-side">
        <span className="lesson-row-count">
          {lesson.done_nodes} de {lesson.total_nodes}
        </span>
        {state === "locked" ? (
          <button className="lesson-row-action" onClick={onRequirements}>
            <Icon name="lock" size={15} strokeWidth={2.4} />
            {ACTION[state]}
          </button>
        ) : (
          <Link href={actionHref} className="lesson-row-action">
            <Icon name="arrow" size={15} strokeWidth={2.4} />
            {ACTION[state]}
          </Link>
        )}
      </div>
    </div>
  );
}

function RequirementsDialog({
  lesson,
  unit,
  courseCode,
  onClose,
}: {
  lesson: LessonCard;
  unit: Unit;
  courseCode: string;
  onClose: () => void;
}) {
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && onClose();
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div className="dialog-overlay" onClick={onClose}>
      <div
        className="dialog"
        role="dialog"
        aria-modal="true"
        aria-labelledby="req-title"
        onClick={(e) => e.stopPropagation()}
      >
        <span className="eyebrow">CLASE {lesson.position}</span>
        <h2 id="req-title" className="dialog-title">
          <MathText text={lesson.title} as="span" />
        </h2>
        <p className="muted">Para practicar esta clase primero necesitas dominar:</p>
        <ul className="req-list">
          {lesson.blocking_prereqs.map((p) => (
            <li key={p.code} className="req-item">
              <span className="req-text">
                <strong>{p.name}</strong>
                <span className="muted-sm">{prereqWhere(p, unit.name)}</span>
              </span>
              {p.lesson_code && (
                <Link href={`/cursos/${courseCode}/clases/${p.lesson_code}#${p.code}`} className="req-go">
                  Ir
                  <Icon name="arrow" size={14} strokeWidth={2.4} />
                </Link>
              )}
            </li>
          ))}
        </ul>
        <div className="dialog-actions">
          <Link href={lessonHref(courseCode, lesson)} className="btn btn-secondary btn-inline">
            Leer la clase igual
          </Link>
          <button className="btn btn-primary btn-inline" onClick={onClose}>
            Entendido
          </button>
        </div>
      </div>
    </div>
  );
}

function UnitCard({
  unit,
  lessons,
  index,
  open,
  onToggle,
  courseCode,
  onRequirements,
}: {
  unit: Unit;
  lessons: LessonCard[];
  index: number;
  open: boolean;
  onToggle: () => void;
  courseCode: string;
  onRequirements: (lesson: LessonCard) => void;
}) {
  const done = unit.total_lessons > 0 && unit.done_lessons === unit.total_lessons;
  return (
    <section className={`unit-card${open ? " open" : ""}`}>
      <button className="unit-head" onClick={onToggle} aria-expanded={open}>
        <span className="unit-index">{index}</span>
        <span className="unit-main">
          <span className="unit-title-row">
            <span className="unit-name-row">
              <span className="unit-name">{unit.name}</span>
              {done && (
                <span className="unit-done" aria-label="Unidad completa">
                  <Icon name="check" size={18} strokeWidth={3} />
                </span>
              )}
            </span>
            <span className="unit-title-right">
              {/* Collapsed, the label says there's something to review;
                  open, the lesson row already says which one, so only
                  the icon stays. */}
              {unit.has_review && <StatePill state="review" label="Repaso" iconOnly={open} />}
              <span className="unit-count">
                {unit.done_lessons} de {unit.total_lessons}
              </span>
            </span>
          </span>
          <span className="unit-pills">
            {unit.lessons.map((l) => (
              <span key={l.code} className={`unit-pill unit-pill-${l.state}`} />
            ))}
          </span>
        </span>
      </button>

      {open && (
        <div className="lesson-list">
          {lessons.map((l) => (
            <LessonRow key={l.code} lesson={l} courseCode={courseCode} onRequirements={() => onRequirements(l)} />
          ))}
        </div>
      )}
    </section>
  );
}

type Filter = "all" | "review" | "in_progress";

function AreaUnits({
  area,
  focusUnit,
  courseCode,
}: {
  area: Area;
  focusUnit: string | null;
  courseCode: string;
}) {
  // Explicit toggles override the default (only the focus unit open).
  const [toggled, setToggled] = useState<Record<string, boolean>>({});
  const [filter, setFilter] = useState<Filter>("all");
  const [requirements, setRequirements] = useState<{ lesson: LessonCard; unit: Unit } | null>(null);

  const lessons = area.units.flatMap((u) => u.lessons);
  const count = (s: LessonState) => lessons.filter((l) => l.state === s).length;
  const filters: { key: Filter; label: string; n?: number }[] = [
    { key: "all", label: "Todas" },
    { key: "review", label: "Por repasar", n: count("review") },
    { key: "in_progress", label: "En curso", n: count("in_progress") },
  ];

  // Filtered, only the units with a matching lesson show, open, listing
  // just those lessons.
  const units = area.units
    .map((u, i) => ({
      unit: u,
      index: i + 1,
      lessons: filter === "all" ? u.lessons : u.lessons.filter((l) => l.state === filter),
    }))
    .filter((x) => filter === "all" || x.lessons.length > 0);

  return (
    <>
      <div className="lessons-head">
        <div>
          <h2 className="lessons-title">Clases de {area.name}</h2>
          <div className="lessons-sub">
            {area.units.length} {area.units.length === 1 ? "unidad" : "unidades"} · {lessons.length}{" "}
            {lessons.length === 1 ? "clase" : "clases"}
          </div>
        </div>
        <div className="segmented" role="group" aria-label="Filtrar clases">
          {filters.map((f) => (
            <button
              key={f.key}
              type="button"
              aria-pressed={filter === f.key}
              className={`segmented-btn${filter === f.key ? " active" : ""}`}
              onClick={() => setFilter(f.key)}
            >
              {f.label}
              {f.n ? <span className={`segmented-n segmented-n-${f.key}`}>{f.n}</span> : null}
            </button>
          ))}
        </div>
      </div>

      {units.length === 0 ? (
        <p className="screen-message">
          {filter === "review"
            ? `No tienes clases por repasar en ${area.name}.`
            : `No tienes clases en curso en ${area.name}.`}
        </p>
      ) : (
        <div className="unit-list">
          {units.map(({ unit, index, lessons }) => {
            const open = filter !== "all" || (toggled[unit.code] ?? unit.code === focusUnit);
            return (
              <UnitCard
                key={unit.code}
                unit={unit}
                lessons={lessons}
                index={index}
                open={open}
                onToggle={() => setToggled((t) => ({ ...t, [unit.code]: !open }))}
                courseCode={courseCode}
                onRequirements={(lesson) => setRequirements({ lesson, unit })}
              />
            );
          })}
        </div>
      )}

      {requirements && (
        <RequirementsDialog
          lesson={requirements.lesson}
          unit={requirements.unit}
          courseCode={courseCode}
          onClose={() => setRequirements(null)}
        />
      )}
    </>
  );
}

export default function CourseView({ courseCode }: { courseCode: string }) {
  const { data: course, error, loading } = useApi<CourseDetail>(`/courses/${courseCode}`);
  const [areaChoice, setAreaChoice] = useState<string | null>(null);

  if (loading) return <CourseSkeleton />;
  if (error === 404) {
    return (
      <div className="page">
        <p className="screen-message">Este curso no está en tu plan.</p>
        <Link href="/cursos" className="btn btn-secondary btn-inline">
          Volver a cursos
        </Link>
      </div>
    );
  }
  if (!course) {
    return (
      <div className="page">
        <p className="screen-message">No pudimos cargar el curso. Intenta de nuevo.</p>
      </div>
    );
  }

  const focus = focusLesson(course);
  const areaCode = areaChoice ?? focus?.area.code ?? course.areas[0]?.code;
  const area = course.areas.find((a) => a.code === areaCode);
  const pct = course.total_nodes ? Math.round((100 * course.done_nodes) / course.total_nodes) : 0;

  return (
    <div className="page page-narrow page-course">
      <header className="course-header">
        <div className="course-header-main">
          <CourseBadge course={course} size="lg" variant="short" active />
          <span className="course-header-titles">
            <h1 className="course-title">{course.name}</h1>
            <span className="course-progress">
              <span>
                {course.done_nodes} de {course.total_nodes} secciones dominadas
              </span>
              <span className="course-progress-track">
                <span className="course-progress-fill" style={{ width: `${pct}%` }} />
              </span>
              <strong>{pct}%</strong>
            </span>
          </span>
        </div>
        <span className="btn-ghost" aria-disabled="true" title="Pronto">
          <Icon name="tree" size={16} strokeWidth={2.2} />
          Skill Tree <span className="soon">Pronto</span>
        </span>
      </header>

      {course.areas.length === 0 ? (
        <p className="screen-message">Este curso todavía no tiene clases publicadas.</p>
      ) : (
        <>
          <div className="tabs" role="tablist">
            {course.areas.map((a) => (
              <button
                key={a.code}
                role="tab"
                aria-selected={a.code === areaCode}
                className={`tab-chip${a.code === areaCode ? " active" : ""}`}
                onClick={() => setAreaChoice(a.code)}
              >
                {a.name}
              </button>
            ))}
          </div>

          <ResumeBanner course={course} />

          {area && (
            <AreaUnits
              key={area.code}
              area={area}
              focusUnit={
                focus?.area.code === area.code
                  ? focus.unit.code
                  : (area.units.find((u) => u.done_lessons < u.total_lessons) ?? area.units[0])?.code ??
                    null
              }
              courseCode={course.code}
            />
          )}
        </>
      )}
    </div>
  );
}
