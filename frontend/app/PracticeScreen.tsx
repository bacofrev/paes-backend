"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import { useAuth } from "./AuthProvider";
import Icon from "./Icon";
import MathText from "./MathText";
import Figure from "./Figure";
import { apiFetch, errorDetail, getDeviceId, type Lesson } from "../lib/api";
import { splitSections } from "../lib/sections";

type Option = { id: string; label: string; body: string };

type NextItem = {
  id: string;
  code: string;
  stem: string;
  figure: { code: string; svg: string } | null;
  author_difficulty: number;
  options: Option[];
  source: "pool" | "lane";
};

type Misconception = { code: string; name: string };
type Remediation = {
  code: string;
  title: string;
  body: string;
  // Only the figures its body references as ![](fig:CODE).
  figures: Record<string, string>;
};
type CorrectOption = { id: string; label: string };

type ResponseResult = {
  recorded: true;
  is_correct: boolean;
  misconception: Misconception | null;
  remediation: Remediation | null;
  correct_option: CorrectOption;
};

type Screen =
  | "starting"
  | "item"
  | "empty"
  | "closed"
  | "taken_over"
  | "locked"
  | "not_found"
  | "revisit";

// The section of the lesson this node points at, for the review screen.
type RevisitSection = { title: string; body: string; figures: Record<string, string> };

export default function PracticeScreen({
  nodeCode,
  courseCode,
  lessonCode,
}: {
  nodeCode: string;
  courseCode: string | null;
  lessonCode: string | null;
}) {
  const router = useRouter();
  const { token } = useAuth();
  const [deviceId] = useState(getDeviceId);
  const [screen, setScreen] = useState<Screen>("starting");
  const [nodeName, setNodeName] = useState<string | null>(null);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [currentItem, setCurrentItem] = useState<NextItem | null>(null);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [answer, setAnswer] = useState<ResponseResult | null>(null);
  const [itemShownAt, setItemShownAt] = useState<number | null>(null);
  const [resultShownAt, setResultShownAt] = useState<number | null>(null);
  const [revisit, setRevisit] = useState<RevisitSection | null>(null);
  const [isBusy, setIsBusy] = useState(false);
  const started = useRef(false);

  // Back to the lesson lands on the slide of this node (LessonView reads
  // a node code in the hash).
  const backHref =
    courseCode && lessonCode
      ? `/cursos/${courseCode}/clases/${lessonCode}#${nodeCode}`
      : courseCode
        ? `/cursos/${courseCode}`
        : "/cursos";

  useEffect(() => {
    let cancelled = false;
    apiFetch(`/nodes/${nodeCode}`, token)
      .then((res) => (res.ok ? res.json() : null))
      .then((data) => {
        if (!cancelled && data) setNodeName(data.name);
      })
      .catch(() => {
        // stays null; the header just shows no name
      });
    return () => {
      cancelled = true;
    };
  }, [nodeCode, token]);

  async function loadRevisitSection() {
    if (!lessonCode) return;
    const res = await apiFetch(`/lessons/${lessonCode}`, token);
    if (!res.ok) return;
    const lesson: Lesson = await res.json();
    const anchor = lesson.nodes.find((n) => n.code === nodeCode)?.anchor;
    const section = splitSections(lesson.body).sections.find((s) => s.slug === anchor);
    if (section) setRevisit({ title: section.title, body: section.body, figures: lesson.figures });
  }

  async function fetchNext(sid: string) {
    const res = await apiFetch(
      `/nodes/${nodeCode}/next?session_id=${sid}&device_id=${deviceId}`,
      token,
    );

    if (res.ok) {
      const item: NextItem = await res.json();
      setCurrentItem(item);
      setSelectedOptionId(null);
      setAnswer(null);
      setItemShownAt(Date.now());
      setScreen("item");
      return;
    }

    const detail = await errorDetail(res);
    if (res.status === 404 && detail === "sin_items") {
      setScreen("empty");
      return;
    }
    if (detail === "node_not_found") {
      setScreen("not_found");
      return;
    }
    if (detail === "node_locked") {
      setScreen("locked");
      return;
    }
    if (detail === "node_in_revisit") {
      // The node asks to re-read its section before serving anything
      // else; only lesson_viewed (below) lets it out of revisit.
      await loadRevisitSection();
      setScreen("revisit");
      return;
    }
    if (detail === "session_taken_over") {
      setScreen("taken_over");
      return;
    }
    // session_not_found / session_not_in_progress / session_not_yours
    setScreen("closed");
  }

  async function startSession(retry = true): Promise<void> {
    const res = await apiFetch("/sessions", token, {
      method: "POST",
      body: JSON.stringify({ mode: "practice", node_code: nodeCode, device_id: deviceId }),
    });

    if (res.ok) {
      const session = await res.json();
      setSessionId(session.session_id);
      await fetchNext(session.session_id);
      return;
    }

    const body = await res.json().catch(() => null);
    const detail = body?.detail;
    const reason = typeof detail === "string" ? detail : detail?.reason;

    if (reason === "node_locked") {
      setScreen("locked");
      return;
    }
    if (reason === "node_not_found") {
      setScreen("not_found");
      return;
    }
    if (reason === "session_already_open" && detail?.session_id) {
      // Same practice of this node (another tab, a second device, a
      // reload): pick it up. Anything else was left open when the
      // student moved on; close it and open this one, once.
      if (detail.mode === "practice" && detail.node_code === nodeCode) {
        setSessionId(detail.session_id);
        await fetchNext(detail.session_id);
        return;
      }
      if (retry) {
        await apiFetch(`/sessions/${detail.session_id}/end`, token, { method: "POST" });
        return startSession(false);
      }
    }
    setScreen("closed");
  }

  // The student already chose "Practicar": the session opens on arrival.
  // The ref keeps dev's double effect from opening it twice.
  useEffect(() => {
    if (started.current) return;
    started.current = true;
    startSession();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function run(action: () => Promise<void>) {
    setIsBusy(true);
    try {
      await action();
    } finally {
      setIsBusy(false);
    }
  }

  async function handleResponder() {
    if (!selectedOptionId || !currentItem || !sessionId || itemShownAt === null) return;

    const response_time_ms = Math.round(Date.now() - itemShownAt);
    const res = await apiFetch("/responses", token, {
      method: "POST",
      body: JSON.stringify({
        item_id: currentItem.id,
        option_id: selectedOptionId,
        session_id: sessionId,
        response_time_ms,
        device_id: deviceId,
      }),
    });

    if (!res.ok) {
      const detail = await errorDetail(res);
      if (detail === "item_already_answered_in_session") {
        // The session is still alive — another device (or an old tab)
        // already answered this exact item. Not a dead session, just
        // a stale screen: pull a fresh item instead of dead-ending.
        await fetchNext(sessionId);
        return;
      }
      if (detail === "session_taken_over") {
        setScreen("taken_over");
        return;
      }
      setScreen("closed");
      return;
    }

    const result: ResponseResult = await res.json();
    setAnswer(result);
    setResultShownAt(Date.now());
  }

  function handleContinuar() {
    if (resultShownAt !== null) {
      // Not accepted by the backend today — kept as a log per product ask.
      console.log("result_block_open_ms", Math.round(Date.now() - resultShownAt));
    }
    if (sessionId) run(() => fetchNext(sessionId));
  }

  async function handleRepasado() {
    if (!sessionId || !lessonCode) return;
    const res = await apiFetch(`/nodes/${nodeCode}/events`, token, {
      method: "POST",
      body: JSON.stringify({
        event_type: "lesson_viewed",
        session_id: sessionId,
        device_id: deviceId,
        lesson_code: lessonCode,
      }),
    });
    if (!res.ok) {
      const detail = await errorDetail(res);
      setScreen(detail === "session_taken_over" ? "taken_over" : "closed");
      return;
    }
    await fetchNext(sessionId);
  }

  async function handleSalir() {
    if (sessionId) {
      await apiFetch(`/sessions/${sessionId}/end`, token, { method: "POST" });
    }
    router.push(backHref);
  }

  function handleEmpezarDeNuevo() {
    setSessionId(null);
    setCurrentItem(null);
    setAnswer(null);
    setScreen("starting");
    run(() => startSession());
  }

  const header = (
    <div className="practice-top">
      <button className="back-link" onClick={() => run(handleSalir)} disabled={isBusy}>
        <Icon name="back" size={16} strokeWidth={2.4} />
        Salir
      </button>
      {nodeName && <span className="practice-node">{nodeName}</span>}
    </div>
  );

  function message(text: string, actions: React.ReactNode) {
    return (
      <main className="screen">
        {header}
        <div className="card">
          <p className="screen-message">{text}</p>
          <div className="button-stack">{actions}</div>
        </div>
      </main>
    );
  }

  const backButton = (
    <Link href={backHref} className="btn btn-secondary">
      Volver a la clase
    </Link>
  );

  if (screen === "starting") {
    return <main className="screen">{header}</main>;
  }

  if (screen === "empty") {
    return message(
      "No quedan ejercicios en esta sección por ahora.",
      <button className="btn btn-primary" onClick={() => run(handleSalir)} disabled={isBusy}>
        Terminar sesión
      </button>,
    );
  }

  if (screen === "locked") {
    return message(
      "Esta sección todavía está bloqueada: primero domina las secciones que necesita.",
      backButton,
    );
  }

  if (screen === "not_found") {
    return message("Esta sección no está en tus cursos.", backButton);
  }

  if (screen === "closed") {
    return message(
      "Tu sesión se cerró.",
      <button className="btn btn-primary" onClick={handleEmpezarDeNuevo} disabled={isBusy}>
        Empezar de nuevo
      </button>,
    );
  }

  if (screen === "taken_over") {
    return message(
      "Tienes esta sesión abierta en otro dispositivo.",
      <>
        <button className="btn btn-primary" onClick={() => run(() => startSession())} disabled={isBusy}>
          Seguir acá
        </button>
        <button className="btn btn-secondary" onClick={() => run(handleSalir)} disabled={isBusy}>
          Salir
        </button>
      </>,
    );
  }

  if (screen === "revisit") {
    return (
      <main className="screen">
        {header}
        <div className="card card-wide">
          <p className="revisit-lead">
            Antes de seguir, repasa esta parte de la clase: los últimos ejercicios mostraron que
            conviene volver a verla.
          </p>
          {revisit ? (
            <>
              <h2 className="lesson-section-title">
                <MathText text={revisit.title} as="span" />
              </h2>
              <div className="lesson-md">
                <MathText text={revisit.body} figures={revisit.figures} />
              </div>
              <button className="btn btn-primary" onClick={() => run(handleRepasado)} disabled={isBusy}>
                Ya la repasé
              </button>
            </>
          ) : (
            backButton
          )}
        </div>
      </main>
    );
  }

  if (!currentItem) return null;

  const showsLaneBanner = currentItem.source === "lane";

  return (
    <main className="screen">
      {header}
      <div className="card">
        {showsLaneBanner && (
          <div className="lane-block">
            <p>Ahora uno para ver si quedó claro.</p>
          </div>
        )}

        <MathText text={currentItem.stem} className="stem" />
        {currentItem.figure && <Figure svg={currentItem.figure.svg} />}

        <div className="options">
          {currentItem.options.map((option) => {
            const isSelected = option.id === selectedOptionId;
            const isYourAnswer = answer !== null && isSelected;
            return (
              <label
                key={option.id}
                className={`option${isSelected ? " selected" : ""}${answer !== null ? " disabled" : ""}`}
              >
                <input
                  type="radio"
                  name="option"
                  value={option.id}
                  checked={isSelected}
                  disabled={answer !== null}
                  onChange={() => setSelectedOptionId(option.id)}
                />
                <span>
                  {option.label}. <MathText text={option.body} as="span" />
                  {isYourAnswer && <span className="option-your-answer">TU RESPUESTA</span>}
                </span>
              </label>
            );
          })}
        </div>

        {answer === null && (
          <button
            className="btn btn-primary"
            onClick={() => run(handleResponder)}
            disabled={!selectedOptionId || isBusy}
          >
            Responder
          </button>
        )}

        {answer !== null && answer.is_correct && (
          <div className="result-block">
            <p className="result-correct">Correcto</p>
            <button className="btn btn-primary" onClick={handleContinuar} disabled={isBusy}>
              Continuar
            </button>
          </div>
        )}

        {answer !== null && !answer.is_correct && (
          <div className="result-block">
            {answer.misconception && (
              <MathText text={answer.misconception.name} className="misconception-label" />
            )}
            {answer.remediation && (
              <>
                <MathText text={answer.remediation.title} className="remediation-title" />
                <MathText
                  text={answer.remediation.body}
                  className="remediation-body"
                  figures={answer.remediation.figures}
                />
              </>
            )}
            <p className="correct-answer-note">
              La alternativa correcta era la {answer.correct_option.label}.
            </p>
            <button className="btn btn-primary" onClick={handleContinuar} disabled={isBusy}>
              Continuar
            </button>
          </div>
        )}
      </div>
    </main>
  );
}
