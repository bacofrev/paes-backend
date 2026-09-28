"use client";

import Link from "next/link";
import { useShell } from "./AppShell";
import Icon, { CourseBadge } from "./Icon";
import ProgressBar from "./ProgressBar";
import { CoursesSkeleton } from "./Skeleton";
import { relativeDay } from "../lib/status";
import type { CourseTile } from "../lib/api";

function CourseCard({ course }: { course: CourseTile }) {
  const started = course.last_activity_at !== null;
  const hasContent = course.lesson_count > 0;
  const pct = course.total_nodes ? Math.round((100 * course.done_nodes) / course.total_nodes) : 0;

  return (
    <div className={`course-card${started ? " started" : ""}`}>
      <div className="course-card-head">
        <CourseBadge course={course} size="md" active={started} />
        <span className="course-card-titles">
          <span className="course-card-name">{course.name}</span>
          {course.description && <span className="muted-sm">{course.description}</span>}
        </span>
      </div>

      {started ? (
        <div className="meta">
          <Icon name="clock" size={13} strokeWidth={2} />
          Última sesión: {relativeDay(course.last_activity_at!)}
        </div>
      ) : (
        <div className="meta meta-dim">{hasContent ? "Sin empezar" : "Próximamente"}</div>
      )}

      {course.current_node && (
        <div className="course-card-where">Estás en {course.current_node.name}.</div>
      )}

      {hasContent && (
        <span className="skill-tree-link" aria-disabled="true" title="Pronto">
          <Icon name="tree" size={15} strokeWidth={2.2} />
          Ver Skill Tree <span className="soon">Pronto</span>
        </span>
      )}

      <div className="course-card-foot">
        <ProgressBar
          done={course.done_nodes}
          total={course.total_nodes}
          label={`${course.done_nodes} de ${course.total_nodes} secciones`}
          right={`${pct}%`}
        />
        {hasContent ? (
          <Link
            href={`/cursos/${course.code}`}
            className={`btn ${started ? "btn-primary" : "btn-secondary"}`}
          >
            {started ? "Continuar" : "Comenzar"}
          </Link>
        ) : (
          <span className="btn btn-secondary btn-disabled">Próximamente</span>
        )}
      </div>
    </div>
  );
}

export default function CoursesGrid() {
  const { courses, coursesError } = useShell();

  return (
    <div className="page">
      <header className="page-header">
        <h1 className="page-title">Cursos</h1>
        <p className="page-subtitle">Cada curso es una prueba PAES.</p>
      </header>

      {!courses && !coursesError && <CoursesSkeleton />}
      {coursesError && !courses && (
        <p className="screen-message">No pudimos cargar tus cursos. Intenta de nuevo.</p>
      )}
      {courses && courses.length === 0 && (
        <p className="screen-message">Todavía no tienes cursos activos.</p>
      )}
      {courses && courses.length > 0 && (
        <>
          <div className="eyebrow">TUS CURSOS</div>
          <div className="course-grid">
            {courses.map((c) => (
              <CourseCard key={c.code} course={c} />
            ))}
          </div>
        </>
      )}
    </div>
  );
}
