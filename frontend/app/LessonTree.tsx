"use client";

import Link from "next/link";
import Icon from "./Icon";
import MathText from "./MathText";
import type { CourseDetail, Lesson, LessonState } from "../lib/api";
import { LESSON_STATE_LABEL } from "../lib/status";

type Group = { key: string; title: string; state: LessonState | null };

// A slide, and the "## " section it belongs to when that section is split
// into several "### " slides (null for the cover, the end, and one-slide
// sections, which show as a single row).
export type SlideEntry = { key: string; title: string; state: LessonState | null; group: Group | null };

type Row =
  | { kind: "slide"; entry: SlideEntry; index: number }
  | { kind: "group"; group: Group; items: { entry: SlideEntry; index: number }[] };

function groupRows(slides: SlideEntry[]): Row[] {
  const rows: Row[] = [];
  slides.forEach((entry, index) => {
    const prev = rows[rows.length - 1];
    if (!entry.group) rows.push({ kind: "slide", entry, index });
    else if (prev?.kind === "group" && prev.group.key === entry.group.key) prev.items.push({ entry, index });
    else rows.push({ kind: "group", group: entry.group, items: [{ entry, index }] });
  });
  return rows;
}

// The route the student is on, always in view while reading a lesson:
// the unit's lessons, with the open one unfolded into its slides.
export default function LessonTree({
  course,
  courseCode,
  lesson,
  slides,
  index,
  onSelect,
  open,
  onClose,
}: {
  course: CourseDetail | null;
  courseCode: string;
  lesson: Lesson | null;
  slides: SlideEntry[];
  index: number;
  onSelect: (i: number) => void;
  open: boolean;
  onClose: () => void;
}) {
  const unit = lesson
    ? course?.areas.flatMap((a) => a.units).find((u) => u.code === lesson.unit.code)
    : undefined;
  // Until the course arrives, the tree is just the open lesson.
  const lessons = unit?.lessons ?? (lesson ? [lesson] : []);

  function select(i: number) {
    onSelect(i);
    onClose();
  }

  function slideButton(entry: SlideEntry, i: number, dot = false) {
    return (
      <button
        className={`tree-slide${dot ? "" : " tree-subslide"}${i === index ? " active" : ""}${i < index ? " seen" : ""}`}
        onClick={() => select(i)}
        aria-current={i === index ? "step" : undefined}
      >
        {dot && <span className={`section-dot${entry.state ? ` dot-${entry.state}` : " dot-none"}`} />}
        <MathText text={entry.title} as="span" className="tree-slide-title" />
      </button>
    );
  }

  return (
    <>
      <div className={`tree-overlay${open ? " open" : ""}`} onClick={onClose} />
      <aside className={`lesson-tree${open ? " open" : ""}`} aria-label="Ruta de la unidad">
        <div className="lesson-tree-top">
          <Link href={`/cursos/${courseCode}`} className="back-link">
            <Icon name="back" size={16} strokeWidth={2.4} />
            {course?.name ?? "Volver al curso"}
          </Link>
          <button className="icon-button tree-close" onClick={onClose} aria-label="Cerrar">
            <Icon name="close" size={18} strokeWidth={2.4} />
          </button>
        </div>

        {lesson && (
          <div className="lesson-tree-unit">
            <span className="eyebrow">{lesson.unit.name.toUpperCase()}</span>
            {unit && (
              <span className="muted-sm">
                {unit.done_lessons} de {unit.total_lessons} clases completas
              </span>
            )}
          </div>
        )}

        <ol className="tree-lessons">
          {lessons.map((l) => {
            const current = l.code === lesson?.code;
            return (
              <li key={l.code} className={`tree-lesson${current ? " current" : ""}`}>
                {current ? (
                  <div className="tree-lesson-head">
                    <span className={`tree-lesson-dot dot-${l.state}`} title={LESSON_STATE_LABEL[l.state]} />
                    <span className="tree-lesson-text">
                      <span className="tree-lesson-pos">CLASE {l.position}</span>
                      <MathText text={l.title} as="span" className="tree-lesson-title" />
                    </span>
                  </div>
                ) : (
                  <Link
                    href={`/cursos/${courseCode}/clases/${l.code}`}
                    className="tree-lesson-head"
                    onClick={onClose}
                  >
                    <span className={`tree-lesson-dot dot-${l.state}`} title={LESSON_STATE_LABEL[l.state]} />
                    <span className="tree-lesson-text">
                      <span className="tree-lesson-pos">CLASE {l.position}</span>
                      <MathText text={l.title} as="span" className="tree-lesson-title" />
                    </span>
                  </Link>
                )}

                {current && slides.length > 0 && (
                  <ol className="tree-slides">
                    {groupRows(slides).map((row) =>
                      row.kind === "slide" ? (
                        <li key={row.entry.key}>
                          {slideButton(row.entry, row.index, true)}
                        </li>
                      ) : (
                        <li key={row.group.key} className="tree-group">
                          <button
                            className={`tree-slide tree-group-head${
                              row.items.some((x) => x.index === index) ? " within" : ""
                            }`}
                            onClick={() => select(row.items[0].index)}
                          >
                            <span
                              className={`section-dot${row.group.state ? ` dot-${row.group.state}` : " dot-none"}`}
                            />
                            <MathText text={row.group.title} as="span" className="tree-slide-title" />
                          </button>
                          <ol className="tree-subslides">
                            {row.items.map((x) => (
                              <li key={x.entry.key}>
                                {slideButton(x.entry, x.index)}
                              </li>
                            ))}
                          </ol>
                        </li>
                      ),
                    )}
                  </ol>
                )}
              </li>
            );
          })}
        </ol>
      </aside>
    </>
  );
}
