// A lesson body is Markdown whose "## " headings are its sections;
// lesson_nodes.anchor points a node at one of them by slug. The loader
// (data/loaders/cargar_contenido.py, slug() and secciones()) validates
// every anchor against exactly this rule, so the two must stay identical:
// NFKD, drop combining marks, lowercase, strip, keep [a-z0-9 whitespace -],
// whitespace runs -> "-".
export function slug(title: string): string {
  return title
    .normalize("NFKD")
    .replace(/\p{Mn}/gu, "")
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, "")
    .replace(/\s+/g, "-");
}

export type Section = { title: string; slug: string; body: string };

export function splitSections(body: string): { intro: string; sections: Section[] } {
  return splitByHeading(body, "##");
}

// Inside a section, each "### " subtitle is one slide of the lesson;
// what comes before the first one is the section's lead.
export function splitSubsections(body: string): { intro: string; sections: Section[] } {
  return splitByHeading(body, "###");
}

function splitByHeading(body: string, marker: "##" | "###"): { intro: string; sections: Section[] } {
  const intro: string[] = [];
  const sections: { title: string; slug: string; lines: string[] }[] = [];
  const pattern = marker === "##" ? /^##\s+(.+)$/ : /^###\s+(.+)$/;

  for (const line of body.split("\n")) {
    const heading = pattern.exec(line);
    if (heading) {
      const title = heading[1].trim();
      sections.push({ title, slug: slug(title), lines: [] });
    } else if (sections.length === 0) {
      intro.push(line);
    } else {
      sections[sections.length - 1].lines.push(line);
    }
  }

  return {
    intro: intro.join("\n").trim(),
    sections: sections.map((s) => ({
      title: s.title,
      slug: s.slug,
      body: s.lines.join("\n").trim(),
    })),
  };
}
