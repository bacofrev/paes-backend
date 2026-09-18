import { createBrowserClient } from "@supabase/ssr";

// One client for the app: holds the session in memory + localStorage
// and refreshes it in the background. Never import the service_role
// key here — this file ships to the browser.
export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}
