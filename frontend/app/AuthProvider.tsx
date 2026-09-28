"use client";

import { createContext, useContext, useEffect, useState } from "react";
import type { Session, User } from "@supabase/supabase-js";
import LoginScreen from "./LoginScreen";
import { createClient } from "../lib/supabase/client";
import { clearCache } from "../lib/cache";

const supabase = createClient();

type Auth = { token: string; user: User; signOut: () => Promise<void> };

const AuthContext = createContext<Auth | null>(null);

// Everything below this provider can assume a signed-in student: without
// a session it renders the login screen instead of its children.
export default function AuthProvider({ children }: { children: React.ReactNode }) {
  const [session, setSession] = useState<Session | null | undefined>(undefined);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, newSession) => {
      // Another student may sign in next on this tab: nothing of the
      // previous one's stays around.
      if (event === "SIGNED_OUT") clearCache();
      setSession(newSession);
    });
    return () => subscription.unsubscribe();
  }, []);

  if (session === undefined) return null;
  if (session === null) return <LoginScreen supabase={supabase} />;

  const auth: Auth = {
    token: session.access_token,
    user: session.user,
    signOut: async () => {
      await supabase.auth.signOut();
    },
  };

  return <AuthContext.Provider value={auth}>{children}</AuthContext.Provider>;
}

export function useAuth(): Auth {
  const auth = useContext(AuthContext);
  if (!auth) throw new Error("useAuth outside AuthProvider");
  return auth;
}
