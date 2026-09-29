"use client";

import Link from "next/link";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import Icon from "./Icon";
import LessonTree, { type SlideEntry } from "./LessonTree";
import MathText from "./MathText";
import StatePill from "./StatePill";
import { LessonSkeleton } from "./Skeleton";
import { useApi, type CourseDetail, type Lesson, type LessonNode } from "../lib/api";
import { splitSections, splitSubsections, type Section } from "../lib/sections";
import { LESSON_STATE_LABEL, NODE_STATE_LABEL, nodeState, prereqWhere } from "../lib/status";

export function practiceHref(nodeCode: string, courseCode: string, lessonCode: string) {
  const q = new URLSearchParams({ curso: courseCode, clase: lessonCode });
  return `/practica/${nodeCode}?${q}`;
}

// A lesson reads like a deck: a cover, one slide per "### " subtitle,
// and a closing slide. "## " sections (one node each) group those slides
// and are what gets practiced. One slide on screen at a time so the
// student doesn't lose focus scrolling; the tree on the left keeps the
// route in view.
type Slide =
  | { kind: "cover"; key: string; title: string }
  | {
      kind: "section";
      key: string;
      title: string;
      section: Section;
      node: LessonNode | null;
      // Text before the first "### ", shown on the section's first slide.
      lead: string;
      body: string;
      part: number;
      parts: number;
    }
  | { kind: "end"; key: string; title: string };

const COVER = "inicio";
const END = "fin";

function buildSlides(lesson: Lesson): { intro: string; slides: Slide[] } {
  const { intro, sections } = splitSections(lesson.body);
  const nodeByAnchor = new Map(lesson.nodes.filter((n) => n.anchor).map((n) => [n.anchor!, n]));
  return {
    intro,
    slides: [
      { kind: "cover", key: COVER, title: "Inicio" },
      ...sections.flatMap((s) => {
        const node = nodeByAnchor.get(s.slug) ?? null;
        const { intro: lead, sections: subs } = splitSubsections(s.body);
        // A section with no subtitles is a single slide.
        const parts = subs.length > 0 ? subs : [{ title: s.title, slug: "", body: lead }];
        return parts.map((sub, i) => ({
          kind: "section" as const,
          // The section's first slide keeps its plain slug, so #anchor
          // links still land on the section.
          key: i === 0 ? s.slug : `${s.slug}.${i + 1}`,
          title: sub.title,
          section: s,
          node,
          lead: subs.length > 0 && i === 0 ? lead : "",
          body: sub.body,
          part: i,
          parts: parts.length,
        }));
      }),
      { kind: "end", key: END, title: "Cierre" },
    ],
  };
}

// The hash names a slide by its slug, or by a node code (the practice
// sends the student back to the slide of the node they just practiced).
function slideFromHash(hash: string, slides: Slide[], lesson: Lesson): number {
  const h = decodeURIComponent(hash.replace(/^#/, ""));
  if (!h) return 0;
  const anchor = lesson.nodes.find((n) => n.code === h)?.anchor ?? h;
  return Math.max(0, slides.findIndex((s) => s.key === anchor));
}

// What "Practicar" opens when the slide isn't about one node: the first
// node the student can practice and hasn't mastered yet.
function defaultNode(lesson: Lesson): LessonNode | null {
  return (
    lesson.nodes.find((n) => n.status !== "mastered" && n.pending_prereqs.length === 0) ??
    lesson.nodes.find((n) => n.pending_prereqs.length === 0) ??
    lesson.nodes[0] ??
    null
  );
}

function PrereqNote({ node, lesson }: { node: LessonNode; lesson: Lesson }) {
  return (
    <p className="muted-sm prereq-note">
      <Icon name="lock" size={13} strokeWidth={2.4} /> Para practicar esta sección necesitas{" "}
      {node.pending_prereqs.map((p, i) => (
        <span key={p.code}>
          {i > 0 && (i === node.pending_prereqs.length - 1 ? " y " : ", ")}
          <strong>
            {p.name} ({prereqWhere(p, lesson.unit.name)})
          </strong>
        </span>
      ))}
      . Puedes leerla igual.
    </p>
  );
}

function PracticeButton({
  node,
  lesson,
  courseCode,
  big = false,
}: {
  node: LessonNode | null;
  lesson: Lesson;
  courseCode: string;
  big?: boolean;
}) {
  if (!node) return null;
  const cls = `btn btn-primary btn-inline slide-practice${big ? " big" : ""}`;
  const label = node.status === "mastered" ? "Practicar de nuevo" : "Practicar";
  if (node.pending_prereqs.length > 0) {
    return (
      <span className={`${cls} btn-disabled`} title={`${node.name}: tiene prerrequisitos pendientes`}>
        <Icon name="lock" size={15} strokeWidth={2.4} />
        {label}
        <span className="slide-practice-name">{node.name}</span>
      </span>
    );
  }
  return (
    <Link href={practiceHref(node.code, courseCode, lesson.code)} className={cls} title={node.name}>
      <Icon name="play" size={15} strokeWidth={2.4} />
      {label}
      <span className="slide-practice-name">{node.name}</span>
    </Link>
  );
}

function SlideContent({
  slide,
  intro,
  lesson,
  course,
  courseCode,
  onNext,
}: {
  slide: Slide;
  intro: string;
  lesson: Lesson;
  course: CourseDetail | null;
  courseCode: string;
  onNext: () => void;
}) {
  if (slide.kind === "cover") {
    return (
      <>
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
        {intro && (
          <div className="lesson-md">
            <MathText text={intro} figures={lesson.figures} />
          </div>
        )}
        <div>
          <button className="btn btn-secondary btn-inline" onClick={onNext}>
            Empezar
            <Icon name="forward" size={15} strokeWidth={2.4} />
          </button>
        </div>
      </>
    );
  }

  if (slide.kind === "end") {
    const unit = course?.areas.flatMap((a) => a.units).find((u) => u.code === lesson.unit.code);
    const next = unit?.lessons.find((l) => l.position > lesson.position);
    return (
      <div className="slide-end">
        <span className="eyebrow">FIN DE LA CLASE {lesson.position}</span>
        <h2 className="lesson-title">Terminaste de leer</h2>
        <p className="muted">
          {lesson.done_nodes} de {lesson.total_nodes} secciones dominadas. Lo que fija la clase es
          practicar.
        </p>
        <div className="slide-end-actions">
          <PracticeButton node={defaultNode(lesson)} lesson={lesson} courseCode={courseCode} big />
          {next ? (
            <Link href={`/cursos/${courseCode}/clases/${next.code}`} className="btn btn-secondary btn-inline">
              Siguiente: Clase {next.position}
              <Icon name="forward" size={15} strokeWidth={2.4} />
            </Link>
          ) : (
            <Link href={`/cursos/${courseCode}`} className="btn btn-secondary btn-inline">
              Volver al curso
            </Link>
          )}
        </div>
      </div>
    );
  }

  const { section, node, lead, body, part, parts } = slide;
  const state = node ? nodeState(node) : null;
  const titled = slide.title !== section.title;
  return (
    <section className={`lesson-section${state ? ` node-section node-${state}` : ""}`}>
      <div className="node-section-head">
        <span className="eyebrow">
          {node ? `SECCIÓN · ${node.name.toUpperCase()}` : section.title.toUpperCase()}
          {parts > 1 && (
            <span className="slide-part">
              {" "}
              · {part + 1} de {parts}
            </span>
          )}
        </span>
        {state && <StatePill state={state} label={NODE_STATE_LABEL[state]} />}
      </div>
      {titled && part === 0 && (
        <p className="slide-section-name">
          <MathText text={section.title} as="span" />
        </p>
      )}
      {lead && (
        <div className="lesson-md slide-lead">
          <MathText text={lead} figures={lesson.figures} />
        </div>
      )}
      <h2 className="lesson-section-title">
        <MathText text={slide.title} as="span" />
      </h2>
      <div className="lesson-md">
        <MathText text={body} figures={lesson.figures} />
      </div>
      {node && node.pending_prereqs.length > 0 && part === parts - 1 && (
        <div className="node-section-foot">
          <PrereqNote node={node} lesson={lesson} />
        </div>
      )}
    </section>
  );
}

export default function LessonView({ courseCode, lessonCode }: { courseCode: string; lessonCode: string }) {
  const { data: lesson, error, loading } = useApi<Lesson>(`/lessons/${lessonCode}`);
  const { data: course } = useApi<CourseDetail>(`/courses/${courseCode}`);
  const [index, setIndex] = useState<number | null>(null);
  const [treeOpen, setTreeOpen] = useState(false);
  const stageRef = useRef<HTMLDivElement>(null);

  const built = useMemo(() => (lesson ? buildSlides(lesson) : null), [lesson]);
  const slides = useMemo(() => built?.slides ?? [], [built]);
  const last = slides.length - 1;
  // Until the hash is read (first render after the lesson arrives), the cover.
  const current = index === null ? 0 : Math.min(index, Math.max(last, 0));

  // Read the starting slide from the hash once the lesson is here, and
  // follow it if it changes (e.g. a link to #NODE-CODE).
  useEffect(() => {
    if (!lesson) return;
    const sync = () => setIndex(slideFromHash(window.location.hash, slides, lesson));
    sync();
    window.addEventListener("hashchange", sync);
    return () => window.removeEventListener("hashchange", sync);
  }, [lesson, slides]);

  const go = useCallback(
    (i: number) => {
      if (i < 0 || i > last) return;
      setIndex(i);
      const key = slides[i].key;
      // replaceState: moving through slides doesn't fill the history, so
      // "back" leaves the lesson; a reload stays on the same slide.
      history.replaceState(null, "", i === 0 ? window.location.pathname : `#${key}`);
    },
    [slides, last],
  );

  useEffect(() => {
    stageRef.current?.scrollTo({ top: 0 });
  }, [current]);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.altKey || e.ctrlKey || e.metaKey || e.shiftKey) return;
      const t = e.target as HTMLElement | null;
      if (t && (t.isContentEditable || ["INPUT", "TEXTAREA", "SELECT"].includes(t.tagName))) return;
      if (e.key === "Escape") setTreeOpen(false);
      else if (e.key === "ArrowRight") go(current + 1);
      else if (e.key === "ArrowLeft") go(current - 1);
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [go, current]);

  const slide = slides[current];
  const entries: SlideEntry[] = slides.map((s) => ({
    key: s.key,
    title: s.title,
    group:
      s.kind === "section" && s.parts > 1
        ? { key: s.section.slug, title: s.section.title, state: s.node ? nodeState(s.node) : null }
        : null,
    state: s.kind === "section" && s.node ? nodeState(s.node) : null,
  }));
  const practiceNode = lesson
    ? slide?.kind === "section" && slide.node
      ? slide.node
      : defaultNode(lesson)
    : null;

  let body: React.ReactNode;
  if (loading) {
    body = <LessonSkeleton />;
  } else if (!lesson || !slide) {
    body = (
      <p className="screen-message">
        {error === 404 ? "Esta clase no está en tus cursos." : "No pudimos cargar la clase. Intenta de nuevo."}
      </p>
    );
  } else {
    body = (
      <div key={slide.key} className="slide">
        <SlideContent
          slide={slide}
          intro={built!.intro}
          lesson={lesson}
          course={course}
          courseCode={courseCode}
          onNext={() => go(current + 1)}
        />
      </div>
    );
  }

  return (
    <div className="lesson-shell">
      <LessonTree
        course={course}
        courseCode={courseCode}
        lesson={lesson}
        slides={entries}
        index={current}
        onSelect={go}
        open={treeOpen}
        onClose={() => setTreeOpen(false)}
      />

      <div className="lesson-main">
        <header className="lesson-topbar">
          <button className="icon-button" onClick={() => setTreeOpen(true)} aria-label="Ver la ruta">
            <Icon name="menu" size={20} strokeWidth={2.2} />
          </button>
          <span className="lesson-topbar-title">
            {lesson ? <MathText text={lesson.title} as="span" /> : "Clase"}
          </span>
          {slides.length > 0 && (
            <span className="lesson-topbar-count">
              {current + 1}/{slides.length}
            </span>
          )}
        </header>

        <div className="lesson-stage" ref={stageRef}>
          <div className="lesson-stage-inner">{body}</div>
        </div>

        {lesson && slides.length > 0 && (
          <nav className="slide-bar" aria-label="Diapositivas">
            <button
              className="btn btn-secondary btn-inline slide-nav"
              onClick={() => go(current - 1)}
              disabled={current === 0}
              aria-label="Anterior"
            >
              <Icon name="back" size={16} strokeWidth={2.4} />
              <span className="slide-nav-label">Anterior</span>
            </button>

            <div className="slide-dots">
              {slides.map((s, i) => (
                <button
                  key={s.key}
                  className={`slide-dot${i === current ? " active" : ""}${i < current ? " seen" : ""}`}
                  onClick={() => go(i)}
                  aria-label={s.title}
                  title={s.title}
                />
              ))}
            </div>

            <button
              className="btn btn-secondary btn-inline slide-nav"
              onClick={() => go(current + 1)}
              disabled={current === last}
              aria-label="Siguiente"
            >
              <span className="slide-nav-label">Siguiente</span>
              <Icon name="forward" size={16} strokeWidth={2.4} />
            </button>

            <PracticeButton node={practiceNode} lesson={lesson} courseCode={courseCode} />
          </nav>
        )}
      </div>
    </div>
  );
}
