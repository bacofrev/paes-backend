"use client";

import { useState } from "react";
import type { SupabaseClient } from "@supabase/supabase-js";

export default function LoginScreen({ supabase }: { supabase: SupabaseClient }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);
    setError(null);
    try {
      const { error } = await supabase.auth.signInWithPassword({ email, password });
      if (error) setError("Mail o contraseña incorrectos.");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <main className="screen">
      <div className="card">
        <h1 className="node-name">Ingresar</h1>
        <form className="button-stack" onSubmit={handleSubmit}>
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
            autoComplete="current-password"
            required
          />
          {error && <p className="field-error">{error}</p>}
          <button className="primary" type="submit" disabled={isSubmitting}>
            Ingresar
          </button>
        </form>
      </div>
    </main>
  );
}
