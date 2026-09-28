"use client";

import { useShell } from "./AppShell";
import { useAuth } from "./AuthProvider";

// Perfil is a placeholder: who's signed in and how to leave.
export default function ProfileScreen() {
  const { me } = useShell();
  const { user, signOut } = useAuth();
  return (
    <div className="page">
      <header className="page-header">
        <h1 className="page-title">Perfil</h1>
        <p className="page-subtitle">Pronto podrás editar tus datos aquí.</p>
      </header>
      <div className="empty-card">
        {me?.display_name && <p className="profile-name">{me.display_name}</p>}
        <p>{user.email}</p>
        <button className="btn btn-secondary" onClick={signOut}>
          Cerrar sesión
        </button>
      </div>
    </div>
  );
}
