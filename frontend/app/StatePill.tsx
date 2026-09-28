import Icon from "./Icon";
import type { LessonState } from "../lib/api";

const STATE_ICON: Record<LessonState, string> = {
  completed: "check",
  review: "review",
  in_progress: "play",
  available: "dot",
  locked: "lock",
};

export default function StatePill({
  state,
  label,
  iconOnly = false,
}: {
  state: LessonState;
  label: string;
  iconOnly?: boolean;
}) {
  return (
    <span
      className={`pill pill-${state}${iconOnly ? " pill-icon-only" : ""}`}
      title={iconOnly ? label : undefined}
      aria-label={iconOnly ? label : undefined}
    >
      <Icon name={STATE_ICON[state]} size={12} strokeWidth={2.6} />
      {!iconOnly && label}
    </span>
  );
}
