"use client";

import Link from "next/link";
import { useShell } from "./AppShell";

// Inicio is a placeholder until its dashboard is defined.
export default function HomeScreen() {
  const { me } = useShell();
  return (
    <div className="page">
      <header className="page-header">
        <h1 className="page-title">
          {me?.display_name ? `Hola, ${me.display_name}` : "Hola"}
        </h1>
        <p className="page-subtitle">Aquí verás tu resumen muy pronto.</p>
      </header>
      <div className="empty-card">
        <p>Mientras tanto, sigue donde quedaste en tus cursos.</p>
        <Link href="/cursos" className="btn btn-primary">
          Ir a mis cursos
        </Link>
      </div>
    </div>
  );
}
