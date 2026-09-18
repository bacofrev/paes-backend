"use client";

import { useEffect, useState } from "react";
import MathText from "./MathText";

const API_URL = process.env.NEXT_PUBLIC_API_URL;
const STUDENT_ID = "0f514ac7-c5f7-49ac-a1c4-4b0f401490ea";
const NODE_CODE = "NUM-POT-PROD";

type Option = { id: string; label: string; body: string };

type NextItem = {
  id: string;
  code: string;
  stem: string;
  author_difficulty: number;
  options: Option[];
  source: "pool" | "lane";
  item_node_code?: string;
  item_node_name?: string;
};

type Misconception = { code: string; name: string };
type Remediation = { code: string; title: string; body: string };
type CorrectOption = { id: string; label: string };

type ResponseResult = {
  recorded: true;
  is_correct: boolean;
  misconception: Misconception | null;
  remediation: Remediation | null;
  correct_option: CorrectOption;
};

type Screen = "start" | "item" | "empty" | "closed";

async function errorDetail(res: Response): Promise<string | null> {
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

export default function Home() {
  const [screen, setScreen] = useState<Screen>("start");
  const [nodeName, setNodeName] = useState<string | null>(null);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [currentItem, setCurrentItem] = useState<NextItem | null>(null);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [answer, setAnswer] = useState<ResponseResult | null>(null);
  const [itemShownAt, setItemShownAt] = useState<number | null>(null);
  const [resultShownAt, setResultShownAt] = useState<number | null>(null);
  const [isStarting, setIsStarting] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    let cancelled = false;
    fetch(`${API_URL}/nodes/${NODE_CODE}`)
      .then((res) => (res.ok ? res.json() : null))
      .then((data) => {
        if (!cancelled && data) setNodeName(data.name);
      })
      .catch(() => {
        // stays null; render falls back to NODE_CODE
      });
    return () => {
      cancelled = true;
    };
  }, []);

  function resetToStart() {
    setScreen("start");
    setSessionId(null);
    setCurrentItem(null);
    setSelectedOptionId(null);
    setAnswer(null);
    setItemShownAt(null);
    setResultShownAt(null);
  }

  async function fetchNext(sid: string) {
    const res = await fetch(
      `${API_URL}/students/${STUDENT_ID}/nodes/${NODE_CODE}/next?session_id=${sid}`
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
    // session_not_found / session_not_in_progress / session_not_yours
    setScreen("closed");
  }

  async function handleEmpezar() {
    setIsStarting(true);
    try {
      const res = await fetch(`${API_URL}/sessions`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          student_id: STUDENT_ID,
          mode: "practice",
          node_code: NODE_CODE,
        }),
      });

      if (!res.ok) {
        // Covers 409 session_already_open, per product decision: same
        // screen as a session that closed mid-loop.
        setScreen("closed");
        return;
      }

      const session = await res.json();
      setSessionId(session.session_id);
      await fetchNext(session.session_id);
    } finally {
      setIsStarting(false);
    }
  }

  async function handleResponder() {
    if (!selectedOptionId || !currentItem || !sessionId || itemShownAt === null) {
      return;
    }

    setIsSubmitting(true);
    try {
      const response_time_ms = Math.round(Date.now() - itemShownAt);
      const res = await fetch(`${API_URL}/responses`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          student_id: STUDENT_ID,
          item_id: currentItem.id,
          option_id: selectedOptionId,
          session_id: sessionId,
          response_time_ms,
        }),
      });

      if (!res.ok) {
        setScreen("closed");
        return;
      }

      const result: ResponseResult = await res.json();
      setAnswer(result);
      setResultShownAt(Date.now());
    } finally {
      setIsSubmitting(false);
    }
  }

  function handleContinuar() {
    if (resultShownAt !== null) {
      // Not accepted by the backend today — kept as a log per product ask.
      console.log("result_block_open_ms", Math.round(Date.now() - resultShownAt));
    }
    if (sessionId) fetchNext(sessionId);
  }

  async function handleTerminarSesion() {
    if (sessionId) {
      await fetch(`${API_URL}/sessions/${sessionId}/end`, { method: "POST" });
    }
    resetToStart();
  }

  function handleEmpezarDeNuevo() {
    resetToStart();
  }

  if (screen === "start") {
    return (
      <main className="screen">
        <div className="card">
          <h1 className="node-name">{nodeName ?? NODE_CODE}</h1>
          <button className="primary" onClick={handleEmpezar} disabled={isStarting}>
            Empezar
          </button>
        </div>
      </main>
    );
  }

  if (screen === "empty") {
    return (
      <main className="screen">
        <div className="card">
          <p className="screen-message">No quedan ejercicios en este nodo por ahora.</p>
          <button className="primary" onClick={handleTerminarSesion}>
            Terminar sesión
          </button>
        </div>
      </main>
    );
  }

  if (screen === "closed") {
    return (
      <main className="screen">
        <div className="card">
          <p className="screen-message">Tu sesión se cerró.</p>
          <button className="primary" onClick={handleEmpezarDeNuevo}>
            Empezar de nuevo
          </button>
        </div>
      </main>
    );
  }

  if (!currentItem) return null;

  const showsLaneBanner = currentItem.source === "lane";
  const showsOriginNode =
    showsLaneBanner &&
    !!currentItem.item_node_code &&
    currentItem.item_node_code !== NODE_CODE;

  return (
    <main className="screen">
      <div className="card">
        {showsLaneBanner && (
          <div className="lane-block">
            <p>Ahora uno para ver si quedó claro.</p>
            {showsOriginNode && <p>Este viene de {currentItem.item_node_name}.</p>}
          </div>
        )}

        <MathText text={currentItem.stem} className="stem" />

        <div className="options">
          {currentItem.options.map((option) => {
            const isSelected = option.id === selectedOptionId;
            const isYourAnswer = answer !== null && isSelected;
            return (
              <label
                key={option.id}
                className={`option${isSelected ? " selected" : ""}${
                  answer !== null ? " disabled" : ""
                }`}
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
                  {isYourAnswer && (
                    <span className="option-your-answer">TU RESPUESTA</span>
                  )}
                </span>
              </label>
            );
          })}
        </div>

        {answer === null && (
          <button
            className="primary"
            onClick={handleResponder}
            disabled={!selectedOptionId || isSubmitting}
          >
            Responder
          </button>
        )}

        {answer !== null && answer.is_correct && (
          <div className="result-block">
            <p className="result-correct">Correcto</p>
            <button className="primary" onClick={handleContinuar}>
              Continuar
            </button>
          </div>
        )}

        {answer !== null && !answer.is_correct && (
          <div className="result-block">
            {answer.misconception && (
              <MathText
                text={answer.misconception.name}
                className="misconception-label"
              />
            )}
            {answer.remediation && (
              <>
                <MathText
                  text={answer.remediation.title}
                  className="remediation-title"
                />
                <MathText
                  text={answer.remediation.body}
                  className="remediation-body"
                />
              </>
            )}
            <p className="correct-answer-note">
              La alternativa correcta era la {answer.correct_option.label}.
            </p>
            <button className="primary" onClick={handleContinuar}>
              Continuar
            </button>
          </div>
        )}
      </div>
    </main>
  );
}
