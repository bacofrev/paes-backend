import type { LessonNode, LessonState, PendingPrereq } from "./api";

// UI labels for states the backend computes. The rule that decides a
// state lives in main.py (lesson_state); this only names and paints it.
export const LESSON_STATE_LABEL: Record<LessonState, string> = {
  completed: "Completa",
  review: "Repaso",
  in_progress: "En curso",
  available: "Disponible",
  locked: "Bloqueada",
};

// A section (node) reuses the lesson palette: locked when it still has
// prereqs pending, review when revisit/lapsed.
export function nodeState(node: LessonNode): LessonState {
  if (node.status === "revisit" || node.status === "lapsed") return "review";
  if (node.status === "mastered") return "completed";
  if (node.pending_prereqs.length > 0) return "locked";
  if (node.status === "in_progress") return "in_progress";
  return "available";
}

export const NODE_STATE_LABEL: Record<LessonState, string> = {
  completed: "Dominada",
  review: "Repaso",
  in_progress: "En curso",
  available: "Sin empezar",
  locked: "Bloqueada",
};

// Where a missing prereq is taught, as the student reads it: "Clase 2"
// inside the same unit, the unit's name outside it, and "próximamente"
// when it has no lesson yet.
export function prereqWhere(p: PendingPrereq, currentUnitName: string): string {
  if (!p.lesson_code) return `${p.unit_name}, próximamente`;
  if (p.unit_name === currentUnitName) return `Clase ${p.lesson_position}`;
  return p.unit_name;
}

const DAY_MS = 24 * 60 * 60 * 1000;

export function relativeDay(iso: string): string {
  const then = new Date(iso);
  const startOf = (d: Date) => new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();
  const days = Math.round((startOf(new Date()) - startOf(then)) / DAY_MS);
  if (days <= 0) return "Hoy";
  if (days === 1) return "Ayer";
  return then.toLocaleDateString("es-CL", { day: "numeric", month: "short" }).replace(".", "");
}
