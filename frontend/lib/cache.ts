// Responses already seen in this tab, by API path. Screens paint from
// here at once and refresh in the background (useApi), so going back to
// a course or a lesson doesn't wait on the network. Per signed-in
// student: cleared on sign-out so the next account never sees them.
const responses = new Map<string, unknown>();

export function cached<T>(path: string): T | undefined {
  return responses.get(path) as T | undefined;
}

export function remember(path: string, data: unknown) {
  responses.set(path, data);
}

export function clearCache() {
  responses.clear();
}
