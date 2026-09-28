"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { createContext, useContext } from "react";
import { useAuth } from "./AuthProvider";
import Icon, { CourseBadge } from "./Icon";
import { useApi, type CourseTile, type Me } from "../lib/api";

type Shell = { courses: CourseTile[] | null; coursesError: boolean; me: Me | null };

const ShellContext = createContext<Shell>({ courses: null, coursesError: false, me: null });

export function useShell() {
  return useContext(ShellContext);
}

const NAV = [
  { href: "/", label: "Inicio", icon: "home" },
  { href: "/cursos", label: "Cursos", icon: "courses" },
  { href: "/perfil", label: "Perfil", icon: "profile" },
];

function isActive(pathname: string, href: string) {
  return href === "/" ? pathname === "/" : pathname.startsWith(href);
}

export function courseSubtitle(c: CourseTile): string {
  if (c.lesson_count === 0) return "Próximamente";
  if (c.current_node) return `${c.current_node.unit_name} en curso`;
  return "Sin empezar";
}

export default function AppShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const { user, signOut } = useAuth();
  // Refetched on every navigation: coming back from a practice, the
  // progress in the sidebar and the course tiles has to be fresh.
  const courses = useApi<CourseTile[]>("/courses", pathname);
  const me = useApi<Me>("/me");

  const name = me.data?.display_name || user.email || "";

  return (
    <ShellContext.Provider
      value={{ courses: courses.data, coursesError: courses.error !== null, me: me.data }}
    >
      <div className="shell">
        <aside className="sidebar">
          <Link href="/" className="logo">
            <span>rank</span>
            <span className="logo-accent">up</span>
          </Link>

          <nav className="nav">
            {NAV.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className={`nav-item${isActive(pathname, item.href) ? " active" : ""}`}
              >
                <Icon name={item.icon} strokeWidth={2.2} />
                {item.label}
              </Link>
            ))}
          </nav>

          {courses.data && courses.data.length > 0 && (
            <div className="nav">
              <div className="eyebrow nav-eyebrow">TUS CURSOS</div>
              {courses.data.map((c) => (
                <Link
                  key={c.code}
                  href={`/cursos/${c.code}`}
                  className={`nav-course${pathname.startsWith(`/cursos/${c.code}`) ? " active" : ""}`}
                >
                  <CourseBadge
                    course={c}
                    size="sm"
                    variant="short"
                    active={pathname.startsWith(`/cursos/${c.code}`)}
                  />
                  <span className="nav-course-text">
                    <span className="nav-course-name">{c.name}</span>
                    <span className="nav-course-sub">{courseSubtitle(c)}</span>
                  </span>
                </Link>
              ))}
            </div>
          )}

          <div className="user-card">
            <span className="avatar">{name.charAt(0).toUpperCase()}</span>
            <span className="user-card-text">
              <span className="user-card-name">{name}</span>
              <button className="link-button" onClick={signOut}>
                Cerrar sesión
              </button>
            </span>
          </div>
        </aside>

        <header className="topbar">
          <Link href="/" className="logo">
            <span>rank</span>
            <span className="logo-accent">up</span>
          </Link>
          <span className="avatar">{name.charAt(0).toUpperCase()}</span>
        </header>

        <main className="main">{children}</main>

        <nav className="tabbar">
          {NAV.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={`tab${isActive(pathname, item.href) ? " active" : ""}`}
            >
              <Icon name={item.icon} strokeWidth={2.2} />
              {item.label}
            </Link>
          ))}
        </nav>
      </div>
    </ShellContext.Provider>
  );
}
