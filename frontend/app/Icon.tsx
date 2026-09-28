// A generic icon set. Course icons are picked by the key stored in
// courses.icon (migration 075): this file knows how to draw "math" or
// "leaf", never which course is which.
const PATHS: Record<string, React.ReactNode> = {
  home: <path d="M4 11l8-7 8 7v8a1 1 0 0 1-1 1h-4v-6h-6v6H5a1 1 0 0 1-1-1z" />,
  courses: <path d="M4 5h7v14H4zM13 5h7v14h-7z" />,
  profile: (
    <>
      <circle cx="12" cy="8" r="4" />
      <path d="M4 20c1.5-4 4.5-6 8-6s6.5 2 8 6" />
    </>
  ),
  clock: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="M12 7v5l3 2" />
    </>
  ),
  tree: (
    <>
      <circle cx="5" cy="6" r="2" />
      <circle cx="19" cy="6" r="2" />
      <circle cx="12" cy="18" r="2" />
      <path d="M5 8v4M19 8v3a2 2 0 0 1-2 2h-3M5 12v4" />
    </>
  ),
  check: <path d="M5 12.5l4.5 4.5L19 7" />,
  lock: (
    <>
      <rect x="5" y="11" width="14" height="9" rx="2" />
      <path d="M8 11V8a4 4 0 0 1 8 0v3" />
    </>
  ),
  play: <path d="M8 5.5v13l10-6.5z" />,
  review: (
    <>
      <path d="M4 12a8 8 0 1 0 2.5-5.8" />
      <path d="M4 4v4h4" />
    </>
  ),
  dot: <circle cx="12" cy="12" r="4" />,
  back: <path d="M15 5l-7 7 7 7" />,
  chevron: <path d="M6 9l6 6 6-6" />,
  logout: (
    <>
      <path d="M15 4h3a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-3" />
      <path d="M10 16l-4-4 4-4M6 12h10" />
    </>
  ),
  // Course icons
  math: <path d="M3 13h2.4l2.6 6 4-14H21" />,
  book: (
    <>
      <path d="M12 6.5v14" />
      <path d="M12 6.5C10 5 7 5 4 5.6v13.4c3-0.6 6-0.6 8 0.9" />
      <path d="M12 6.5c2-1.5 5-1.5 8-0.9v13.4c-3-0.6-6-0.6-8 0.9" />
    </>
  ),
  atom: (
    <>
      <circle cx="12" cy="12" r="1.6" />
      <ellipse cx="12" cy="12" rx="9.5" ry="3.8" />
      <ellipse cx="12" cy="12" rx="9.5" ry="3.8" transform="rotate(60 12 12)" />
      <ellipse cx="12" cy="12" rx="9.5" ry="3.8" transform="rotate(120 12 12)" />
    </>
  ),
  flask: (
    <>
      <path d="M9 3.5h6" />
      <path d="M10 3.5v5L5.2 18a2 2 0 0 0 1.8 3h10a2 2 0 0 0 1.8-3L14 8.5v-5" />
      <path d="M8 14h8" />
    </>
  ),
  leaf: (
    <>
      <path d="M5 21c0-9 7-16 16-16 0 9-7 16-16 16z" />
      <path d="M5.5 20.5C9 17 13 15 17 13" />
    </>
  ),
  globe: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="M3 12h18M12 3c2.5 2.7 3.8 5.7 3.8 9s-1.3 6.3-3.8 9c-2.5-2.7-3.8-5.7-3.8-9S9.5 5.7 12 3z" />
    </>
  ),
};

export function hasIcon(name: string | null | undefined): name is string {
  return !!name && name in PATHS;
}

export default function Icon({
  name,
  size = 20,
  strokeWidth = 2.1,
}: {
  name: string;
  size?: number;
  strokeWidth?: number;
}) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={strokeWidth}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      {PATHS[name]}
    </svg>
  );
}

// The course's square: its icon if the key is one we can draw, its
// short_name otherwise (and its name's initial as a last resort).
// variant="short" prefers the short_name: M1 and M2 share an icon, so
// where they sit side by side (sidebar, course header) the letters are
// what tells them apart.
export function CourseBadge({
  course,
  size,
  active,
  variant = "icon",
}: {
  course: { name: string; short_name: string | null; icon: string | null };
  size: "sm" | "md" | "lg";
  active?: boolean;
  variant?: "icon" | "short";
}) {
  const iconSize = { sm: 20, md: 26, lg: 28 }[size];
  const useIcon = hasIcon(course.icon) && !(variant === "short" && course.short_name);
  return (
    <span className={`course-badge course-badge-${size}${active ? " active" : ""}`}>
      {useIcon ? (
        <Icon name={course.icon!} size={iconSize} />
      ) : (
        course.short_name ?? course.name.charAt(0)
      )}
    </span>
  );
}
