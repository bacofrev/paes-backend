export default function ProgressBar({
  done,
  total,
  label,
  right,
}: {
  done: number;
  total: number;
  label?: string;
  right?: string;
}) {
  const pct = total ? (100 * done) / total : 0;
  return (
    <div className="progress">
      <div className="progress-track">
        <div className="progress-fill" style={{ width: `${pct}%` }} />
      </div>
      {(label || right) && (
        <div className="progress-labels">
          <span>{label}</span>
          <span>{right}</span>
        </div>
      )}
    </div>
  );
}
