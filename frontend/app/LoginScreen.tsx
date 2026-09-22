"use client";

import { useState } from "react";
import type { SupabaseClient } from "@supabase/supabase-js";

type Mode = "login" | "signup";

export default function LoginScreen({ supabase }: { supabase: SupabaseClient }) {
  const [mode, setMode] = useState<Mode>("login");
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);
    setError(null);
    try {
      if (mode === "login") {
        const { error } = await supabase.auth.signInWithPassword({ email, password });
        if (error) setError("Mail o contraseña incorrectos.");
      } else {
        // options.data.display_name termina en auth.users.raw_user_meta_data,
        // que es lo que lee el trigger de alta (migración 035) para poblar
        // students.display_name.
        const { error } = await supabase.auth.signUp({
          email,
          password,
          options: { data: { display_name: name } },
        });
        if (error) setError("No se pudo crear la cuenta.");
      }
    } finally {
      setIsSubmitting(false);
    }
  }

  function toggleMode() {
    setMode((m) => (m === "login" ? "signup" : "login"));
    setError(null);
  }

  return (
    <main className="screen">
      <div className="card">
        <h1 className="node-name">{mode === "login" ? "Ingresar" : "Crear cuenta"}</h1>
        <form className="button-stack" onSubmit={handleSubmit}>
          {mode === "signup" && (
            <input
              className="field"
              type="text"
              placeholder="Nombre"
              value={name}
              onChange={(e) => setName(e.target.value)}
              autoComplete="name"
              required
            />
          )}
          <input
            className="field"
            type="email"
            placeholder="Mail"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            autoComplete="email"
            required
          />
          <input
            className="field"
            type="password"
            placeholder="Contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            autoComplete={mode === "login" ? "current-password" : "new-password"}
            required
          />
          {error && <p className="field-error">{error}</p>}
          <button className="primary" type="submit" disabled={isSubmitting}>
            {mode === "login" ? "Ingresar" : "Crear cuenta"}
          </button>
          <button className="link-button" type="button" onClick={toggleMode}>
            {mode === "login" ? "¿No tenés cuenta? Creá una" : "¿Ya tenés cuenta? Ingresá"}
          </button>
        </form>
      </div>
    </main>
  );
}
