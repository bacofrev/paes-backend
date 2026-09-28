// Placeholders shaped like the screen that's loading, so the layout
// doesn't jump when the data lands. Only shown when nothing is cached.
function Bar({ w, h = 14, r = 8 }: { w: string | number; h?: number; r?: number }) {
  return <span className="skeleton" style={{ width: w, height: h, borderRadius: r }} />;
}

export function CoursesSkeleton() {
  return (
    <div className="course-grid" aria-busy="true">
      {[0, 1, 2].map((i) => (
        <div key={i} className="course-card">
          <div className="course-card-head">
            <Bar w={50} h={50} r={15} />
            <span className="course-card-titles skeleton-stack">
              <Bar w={150} h={18} />
              <Bar w={110} h={12} />
            </span>
          </div>
          <Bar w="70%" h={14} />
          <div className="course-card-foot">
            <Bar w="100%" h={6} r={99} />
            <Bar w="100%" h={44} r={12} />
          </div>
        </div>
      ))}
    </div>
  );
}

export function CourseSkeleton() {
  return (
    <div className="page page-narrow" aria-busy="true">
      <div className="course-header-main">
        <Bar w={56} h={56} r={16} />
        <span className="skeleton-stack">
          <Bar w={200} h={24} />
          <Bar w={160} h={14} />
        </span>
      </div>
      <div className="tabs">
        {[110, 160, 100, 110].map((w, i) => (
          <Bar key={i} w={w} h={38} r={12} />
        ))}
      </div>
      <div className="unit-list">
        {[0, 1, 2, 3].map((i) => (
          <div key={i} className="unit-card">
            <div className="unit-head">
              <Bar w={30} h={30} r={9} />
              <span className="unit-main">
                <Bar w={140} h={18} />
                <Bar w={96} h={8} r={4} />
              </span>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export function LessonSkeleton() {
  return (
    <div className="lesson-body skeleton-stack" aria-busy="true">
      <Bar w={180} h={12} />
      <Bar w="80%" h={30} />
      <Bar w={220} h={24} r={99} />
      <div className="section-chips">
        <Bar w={180} h={36} r={12} />
        <Bar w={200} h={36} r={12} />
      </div>
      {["100%", "95%", "88%", "60%"].map((w, i) => (
        <Bar key={i} w={w} h={16} />
      ))}
      <div className="node-section skeleton-stack">
        <Bar w="40%" h={22} />
        {["100%", "92%", "70%"].map((w, i) => (
          <Bar key={i} w={w} h={16} />
        ))}
      </div>
    </div>
  );
}
