"use client";

import DOMPurify from "dompurify";
import { useMemo, useSyncExternalStore } from "react";

// The one place an SVG figure gets drawn: the item's own figure and any
// ![](fig:CODE) inside a remediation body both end up here. The backend
// loader already rejects scripts, external hrefs and fixed colors, but
// the SVG goes in through innerHTML, so it's sanitized again here.
//
// No fixed colors in the SVG: everything is currentColor, so the figure
// takes the surrounding text color in any theme.
//
// DOMPurify needs a DOM, so nothing is drawn during server render; the
// client snapshot flips to true right after hydration.
const subscribe = () => () => {};

export default function Figure({ svg }: { svg: string | undefined }) {
  const isClient = useSyncExternalStore(
    subscribe,
    () => true,
    () => false,
  );

  const clean = useMemo(() => {
    if (!isClient || !svg || !DOMPurify.isSupported) return "";
    return DOMPurify.sanitize(svg, {
      USE_PROFILES: { svg: true },
      // role="img" on <svg> pairs with its aria-label (the alt text).
      ADD_ATTR: ["role"],
    });
  }, [isClient, svg]);

  if (!svg) return null;

  // A span, not a div: it can land inside the <p> that react-markdown
  // wraps around ![](fig:...).
  return <span className="figure" dangerouslySetInnerHTML={{ __html: clean }} />;
}
