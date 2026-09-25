import Markdown, { defaultUrlTransform, type Components } from "react-markdown";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import Figure from "./Figure";

// Content from the backend (stem, option bodies, misconception names,
// remediation title/body) mixes Markdown (**bold**) with LaTeX ($...$,
// $$...$$). Rendered in place, tagged as `as` so it can sit inline
// (options, next to the "A. " prefix) or as its own block (stem,
// remediation paragraphs) without producing invalid nested <p>s.
//
// The only image the content may carry is ![](fig:CODE), and only in a
// remediation body; `figures` (code -> svg) comes with that body from
// the backend. Any other image — or a fig: with no figures passed —
// renders nothing.
export default function MathText({
  text,
  as = "p",
  className,
  figures,
}: {
  text: string;
  as?: "p" | "span";
  className?: string;
  figures?: Record<string, string>;
}) {
  const components: Components = {
    p: ({ children }) =>
      as === "span" ? (
        <span className={className}>{children}</span>
      ) : (
        <p className={className}>{children}</p>
      ),
    img: ({ src }) =>
      typeof src === "string" && src.startsWith("fig:") && figures ? (
        <Figure svg={figures[src.slice("fig:".length)]} />
      ) : null,
  };

  return (
    <Markdown
      remarkPlugins={[remarkMath]}
      rehypePlugins={[rehypeKatex]}
      components={components}
      // react-markdown drops unknown schemes by default, fig: included.
      urlTransform={(url) =>
        url.startsWith("fig:") ? url : defaultUrlTransform(url)
      }
    >
      {text}
    </Markdown>
  );
}
