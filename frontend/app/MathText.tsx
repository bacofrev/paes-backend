import Markdown, { type Components } from "react-markdown";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";

// Content from the backend (stem, option bodies, misconception names,
// remediation title/body) mixes Markdown (**bold**) with LaTeX ($...$,
// $$...$$). Rendered in place, tagged as `as` so it can sit inline
// (options, next to the "A. " prefix) or as its own block (stem,
// remediation paragraphs) without producing invalid nested <p>s.
export default function MathText({
  text,
  as = "p",
  className,
}: {
  text: string;
  as?: "p" | "span";
  className?: string;
}) {
  const components: Components = {
    p: ({ children }) =>
      as === "span" ? (
        <span className={className}>{children}</span>
      ) : (
        <p className={className}>{children}</p>
      ),
  };

  return (
    <Markdown
      remarkPlugins={[remarkMath]}
      rehypePlugins={[rehypeKatex]}
      components={components}
    >
      {text}
    </Markdown>
  );
}
