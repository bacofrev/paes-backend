"use client";

import Link from "next/link";
import { useShell } from "./AppShell";
import Icon from "./Icon";
import MathText from "./MathText";
import StatePill from "./StatePill";
import { LessonSkeleton } from "./Skeleton";
import { useApi, type Lesson, type LessonNode } from "../lib/api";
import { splitSections } from "../lib/sections";
import { LESSON_STATE_LABEL, NODE_STATE_LABEL, nodeState, prereqWhere } from "../lib/status";

export function practiceHref(nodeCode: string, courseCode: string, lessonCode: string) {
  const q = new URLSearchParams({ curso: courseCode, clase: lessonCode });
  return `/practica/${nodeCode}?${q}`;
}

function PracticeAction({
  node,
  lesson,
  courseCode,
}: {
  node: LessonNode;
  lesson: Lesson;
  courseCode: string;
}) {
  if (node.pending_prereqs.length > 0) {
    return (
      <div className="section-locked">
        <span className="btn btn-secondary btn-disabled btn-inline">
          <Icon name="lock" size={15} strokeWidth={2.4} />
          Practicar esta sección
        </span>
        <span className="muted-sm">
          Necesitas{" "}
          {node.pending_prereqs.map((p, i) => (
            <span key={p.code}>
              {i > 0 && (i === node.pending_prereqs.length - 1 ? " y " : ", ")}
              <strong>
                {p.name} ({prereqWhere(p, lesson.unit.name)})
              </strong>
            </span>
          ))}
          .
        </span>
      </div>
    );
  }
  return (
    <Link href={practiceHref(node.code, courseCode, lesson.code)} className="btn btn-primary btn-inline">
      <Icon name="play" size={15} strokeWidth={2.4} />
      {node.status === "mastered" ? "Practicar de nuevo" : "Practicar esta sección"}
    </Link>
  );
}

export default function LessonView({ courseCode, lessonCode }: { courseCode: string; lessonCode: string }) {
  const { courses } = useShell();
  const { data: lesson, error, loading } = useApi<Lesson>(`/lessons/${lessonCode}`);
  const courseName = courses?.find((c) => c.code === courseCode)?.name;

  const back = (
    <Link href={`/cursos/${courseCode}`} className="back-link">
      <Icon name="back" size={16} strokeWidth={2.4} />
      {courseName ?? "Volver al curso"}
    </Link>
  );

  if (loading) {
    return (
      <div className="page page-narrow">
        {back}
        <LessonSkeleton />
      </div>
    );
  }
  if (!lesson) {
    return (
      <div className="page page-narrow">
        {back}
        <p className="screen-message">
          {error === 404 ? "Esta clase no está en tus cursos." : "No pudimos cargar la clase. Intenta de nuevo."}
        </p>
      </div>
    );
  }

  const { intro, sections } = splitSections(lesson.body);
  const nodeByAnchor = new Map(lesson.nodes.filter((n) => n.anchor).map((n) => [n.anchor!, n]));

  return (
    <div className="page page-narrow">
      {back}

      <header className="lesson-header">
        <span className="eyebrow">
          {lesson.unit.name.toUpperCase()} · CLASE {lesson.position}
        </span>
        <MathText text={lesson.title} className="lesson-title" />
        <div className="lesson-header-meta">
          <StatePill state={lesson.state} label={LESSON_STATE_LABEL[lesson.state]} />
          <span className="muted">
            {lesson.done_nodes} de {lesson.total_nodes} secciones dominadas
          </span>
        </div>
        {lesson.state === "locked" && (
          <p className="lesson-locked-note">
            Todavía no puedes practicar esta clase, pero puedes leerla completa.
          </p>
        )}
      </header>

      <nav className="section-chips" aria-label="Secciones">
        {lesson.nodes.map((n) => {
          const state = nodeState(n);
          return (
            <a key={n.code} href={n.anchor ? `#${n.anchor}` : undefined} className="section-chip">
              <span className={`section-dot dot-${state}`} />
              <span className="section-chip-name">{n.name}</span>
              <span className="section-chip-state">{NODE_STATE_LABEL[state]}</span>
            </a>
          );
        })}
      </nav>

      <article className="lesson-body">
        {intro && (
          <div className="lesson-md">
            <MathText text={intro} figures={lesson.figures} />
          </div>
        )}

        {sections.map((s) => {
          const node = nodeByAnchor.get(s.slug);
          if (!node) {
            return (
              <section key={s.slug} id={s.slug} className="lesson-section">
                <h2 className="lesson-section-title">
                  <MathText text={s.title} as="span" />
                </h2>
                <div className="lesson-md">
                <MathText text={s.body} figures={lesson.figures} />
              </div>
              </section>
            );
          }
          const state = nodeState(node);
          return (
            <section key={s.slug} id={s.slug} className={`lesson-section node-section node-${state}`}>
              <div className="node-section-head">
                <span className="eyebrow">SECCIÓN · {node.name.toUpperCase()}</span>
                <StatePill state={state} label={NODE_STATE_LABEL[state]} />
              </div>
              <h2 className="lesson-section-title">
                <MathText text={s.title} as="span" />
              </h2>
              <div className="lesson-md">
                <MathText text={s.body} figures={lesson.figures} />
              </div>
              <div className="node-section-foot">
                <PracticeAction node={node} lesson={lesson} courseCode={courseCode} />
              </div>
            </section>
          );
        })}
      </article>
    </div>
  );
}
