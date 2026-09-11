"use client";

import { useState } from "react";

const API_URL = process.env.NEXT_PUBLIC_API_URL;

export default function Home() {
  const [resultado, setResultado] = useState("—");

  async function probar() {
    setResultado("consultando...");
    try {
      const res = await fetch(`${API_URL}/health`);
      const data = await res.json();
      setResultado(JSON.stringify(data));
    } catch (e) {
      setResultado("ERROR: " + String(e));
    }
  }

  return (
    <main style={{ padding: 40, fontFamily: "monospace" }}>
      <h1>paes — walking skeleton</h1>
      <button onClick={probar}>Probar backend</button>
      <p>{resultado}</p>
    </main>
  );
}