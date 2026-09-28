"use client";

import Link from "next/link";
import { useState } from "react";
import Icon, { CourseBadge } from "./Icon";
import MathText from "./MathText";
import StatePill from "./StatePill";
import { CourseSkeleton } from "./Skeleton";
import { useApi, type Area, type CourseDetail, type LessonCard, type Unit } from "../lib/api";
import { LESSON_STATE_LABEL, prereqWhere } from "../lib/status";

// Where the course opens: the lesson the student is working on (or has
// to review), else the first one they can start, else the very first.
function focusLesson(course: CourseDetail): { area: string; unit: string } | null {
  const all = course.areas.flatMap((a) =>
    a.units.flatMap((u) => u.lessons.map((l) => ({ area: a.code, unit: u.code, l }))),
  );
  const pick =
    all.find((x) => x.l.state === "in_progress" || x.l.state === "review") ??
    all.find((x) => x.l.state === "available") ??
    all[0];
  return pick ? { area: pick.area, unit: pick.unit } : null;
}

function LockedNote({ lesson, unit }: { lesson: LessonCard; unit: Unit }) {
  const [first, ...rest] = lesson.blocking_prereqs;
  if (!first) return null;
  return (
    <div className="lesson-card-note">
      Para practicar necesitas{" "}
      <strong>
        {first.name} ({prereqWhere(first, unit.name)})
      </strong>
      {rest.length > 0 && ` y ${rest.length} más`}. Puedes leerla igual.
    </div>
  );
}

function LessonCardLink({
  lesson,
  unit,
  courseCode,
}: {
  lesson: LessonCard;
  unit: Unit;
  courseCode: string;
}) {
  return (
    <Link
      href={`/cursos/${courseCode}/clases/${lesson.code}`}
      className={`lesson-card lesson-card-${lesson.state}`}
    >
      <div className="lesson-card-head">
        <span className="lesson-card-titles">
          <span className="eyebrow">
            CLASE {lesson.position} · {lesson.done_nodes} de {lesson.total_nodes}
          </span>
          <MathText text={lesson.title} as="span" className="lesson-card-title" />
        </span>
        <StatePill state={lesson.state} label={LESSON_STATE_LABEL[lesson.state]} />
      </div>
      {lesson.state === "locked" && <LockedNote lesson={lesson} unit={unit} />}
    </Link>
  );
}

function UnitCard({
  unit,
  index,
  open,
  onToggle,
  courseCode,
}: {
  unit: Unit;
  index: number;
  open: boolean;
  onToggle: () => void;
  courseCode: string;
}) {
  return (
    <section className={`unit-card${open ? " open" : ""}`}>
      <button className="unit-head" onClick={onToggle} aria-expanded={open}>
        <span className="unit-index">{index}</span>
        <span className="unit-main">
          <span className="unit-title-row">
            <span className="unit-name">{unit.name}</span>
            <span className="unit-title-right">
              {/* Collapsed, the label says there's something to review;
                  open, the lesson card already says which one, so only
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
        <span className="unit-chevron">
          <Icon name="chevron" size={18} />
        </span>
      </button>

      {open && (
        <div className="lesson-grid">
          {unit.lessons.map((l) => (
            <LessonCardLink key={l.code} lesson={l} unit={unit} courseCode={courseCode} />
          ))}
        </div>
      )}
    </section>
  );
}

function AreaUnits({ area, focusUnit, courseCode }: { area: Area; focusUnit: string | null; courseCode: string }) {
  // Explicit toggles override the default (only the focus unit open).
  const [toggled, setToggled] = useState<Record<string, boolean>>({});
  return (
    <div className="unit-list">
      {area.units.map((u, i) => {
        const open = toggled[u.code] ?? u.code === focusUnit;
        return (
          <UnitCard
            key={u.code}
            unit={u}
            index={i + 1}
            open={open}
            onToggle={() => setToggled((t) => ({ ...t, [u.code]: !open }))}
            courseCode={courseCode}
          />
        );
      })}
    </div>
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
  const areaCode = areaChoice ?? focus?.area ?? course.areas[0]?.code;
  const area = course.areas.find((a) => a.code === areaCode);

  return (
    <div className="page page-narrow">
      <header className="course-header">
        <div className="course-header-main">
          <CourseBadge course={course} size="lg" variant="short" active />
          <span className="course-header-titles">
            <h1 className="course-title">{course.name}</h1>
            <span className="muted">
              {course.done_nodes} de {course.total_nodes} secciones dominadas
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

          {area && (
            <AreaUnits
              key={area.code}
              area={area}
              focusUnit={
                focus?.area === area.code
                  ? focus.unit
                  : (area.units.find((u) => u.done_lessons < u.total_lessons) ?? area.units[0])
                      ?.code ?? null
              }
              courseCode={course.code}
            />
          )}
        </>
      )}
    </div>
  );
}
