"use client";

import { useCallback, useEffect, useState } from "react";
import { useAuth } from "../app/AuthProvider";
import { cached, remember } from "./cache";

export const API_URL = process.env.NEXT_PUBLIC_API_URL;

// ---------------------------------------------------------------------
// Response shapes. Everything a screen shows comes from here: the front
// knows no course, area, unit, lesson or node code of its own.
// ---------------------------------------------------------------------

export type NodeStatus = "not_started" | "in_progress" | "mastered" | "revisit" | "lapsed";
export type LessonState = "completed" | "review" | "in_progress" | "available" | "locked";

export type PendingPrereq = {
  code: string;
  name: string;
  unit_name: string;
  // null when the prereq has no active lesson yet.
  lesson_code: string | null;
  lesson_title: string | null;
  lesson_position: number | null;
};

export type CourseTile = {
  code: string;
  name: string;
  description: string | null;
  short_name: string | null;
  icon: string | null;
  lesson_count: number;
  total_nodes: number;
  done_nodes: number;
  last_activity_at: string | null;
  current_node: { code: string; name: string; unit_name: string } | null;
};

export type LessonNode = {
  code: string;
  name: string;
  anchor: string | null;
  status: NodeStatus;
  pending_prereqs: PendingPrereq[];
};

type LessonSummary = {
  state: LessonState;
  total_nodes: number;
  done_nodes: number;
  blocking_prereqs: PendingPrereq[];
};

export type LessonCard = LessonSummary & {
  code: string;
  title: string;
  position: number;
  // Optional until every backend serving the app sends it.
  read_minutes?: number;
  nodes: LessonNode[];
};

export type Unit = {
  code: string;
  name: string;
  lessons: LessonCard[];
  total_lessons: number;
  done_lessons: number;
  has_review: boolean;
};

export type Area = { code: string; name: string; units: Unit[] };

export type CourseDetail = {
  code: string;
  name: string;
  description: string | null;
  short_name: string | null;
  icon: string | null;
  total_nodes: number;
  done_nodes: number;
  areas: Area[];
};

export type Lesson = LessonSummary & {
  code: string;
  title: string;
  position: number;
  unit: { code: string; name: string };
  area: { code: string; name: string };
  body: string;
  figures: Record<string, string>;
  nodes: LessonNode[];
};

export type Me = { display_name: string | null };

// ---------------------------------------------------------------------
// Fetching
// ---------------------------------------------------------------------

export async function errorDetail(res: Response): Promise<string | null> {
  try {
    const data = await res.json();
    const detail = data?.detail;
    if (typeof detail === "string") return detail;
    if (detail && typeof detail.reason === "string") return detail.reason;
  } catch {
    // no body, or not JSON
  }
  return null;
}

export function apiFetch(path: string, token: string, init?: RequestInit) {
  return fetch(`${API_URL}${path}`, {
    ...init,
    headers: {
      Authorization: `Bearer ${token}`,
      ...(init?.body ? { "Content-Type": "application/json" } : {}),
      ...init?.headers,
    },
  });
}

type Loaded<T> = { key: string; data: T | null; error: number | null };

// GET a path with the signed-in student's token. What this tab already
// fetched for the path (lib/cache.ts) shows at once while a fresh copy
// is requested; with nothing cached, `loading` is true until it lands.
// The result is tagged with the key it was fetched for, so a stale
// response never shows under a new path. `refreshKey` refetches the
// same path when it changes (e.g. on navigation, so progress is fresh
// after a practice).
export function useApi<T>(path: string | null, refreshKey?: string) {
  const { token } = useAuth();
  const key = `${path}|${refreshKey ?? ""}`;
  const [loaded, setLoaded] = useState<Loaded<T> | null>(null);
  const [nonce, setNonce] = useState(0);

  useEffect(() => {
    if (!path) return;
    let cancelled = false;
    apiFetch(path, token)
      .then(async (res) => {
        const data = res.ok ? ((await res.json()) as T) : null;
        if (res.ok) remember(path, data);
        if (!cancelled) setLoaded({ key, data, error: res.ok ? null : res.status });
      })
      .catch(() => {
        if (!cancelled) setLoaded({ key, data: null, error: 0 });
      });
    return () => {
      cancelled = true;
    };
  }, [path, token, key, nonce]);

  const reload = useCallback(() => setNonce((n) => n + 1), []);
  const current = loaded?.key === key ? loaded : null;
  const data = current ? current.data : path ? (cached<T>(path) ?? null) : null;
  return {
    data,
    error: current?.error ?? null,
    loading: data === null && current === null,
    reload,
  };
}

// Identifies this browser/device so the backend can tell two devices on
// the same student apart. Persisted so reloads and other tabs on the
// same device don't look like a new one; falls back to an in-memory id
// for this page load if localStorage is unavailable.
export function getDeviceId(): string {
  if (typeof window === "undefined") return "";
  try {
    const key = "paes_device_id";
    const existing = window.localStorage.getItem(key);
    if (existing) return existing;
    const created = crypto.randomUUID();
    window.localStorage.setItem(key, created);
    return created;
  } catch {
    return crypto.randomUUID();
  }
}
