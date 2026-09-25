#!/usr/bin/env python3
"""
Self-review report for a lesson YAML (checkpoint 2 of the crear-clase skill).

It does NOT replace the real loader: the loader validates the format; this
script flags the pedagogical problems the loader cannot see.

Usage:
    python3 revisar_clase.py contenido/clases/LES-XXX-YYY-NN.yaml \
        [--catalogo contenido/misconceptions/XXX-YYY.yaml]

Lines starting with ERROR must be fixed before showing the lesson to Ben.
AVISO lines must be explained in the checkpoint-2 report.
"""
import argparse
import collections
import re
import sys

import yaml

NUM = re.compile(r"(?<![\w.])[-−]?\d+(?:[.,]\d+)?")
FIG = re.compile(r"fig:([A-Z0-9-]+)")
VOSEO = re.compile(
    r"\b(fijate|mirá|pensá|sabés|tenés|podés|querés|hacé|decí|contá|elegí|"
    r"calculá|ordená|compará|ubicá|probá|revisá|acordate|andá)\b", re.I)


def nums(text):
    """Signed numbers in a text, normalized ('−5' -> '-5', '2,5' -> '2.5')."""
    return {m.replace("−", "-").replace(",", ".") for m in NUM.findall(text or "")}


def paragraphs(text):
    return [p for p in re.split(r"\n\s*\n", text or "") if p.strip()]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("clase")
    ap.add_argument("--catalogo")
    a = ap.parse_args()

    d = yaml.safe_load(open(a.clase, encoding="utf-8"))
    items = d.get("items") or []
    rems = d.get("remediations") or []
    body = d.get("lesson_body") or ""
    errors, warns = [], []

    catalog = {}
    if a.catalogo:
        c = yaml.safe_load(open(a.catalogo, encoding="utf-8"))
        catalog = {m["code"]: m for m in c.get("misconceptions", [])}

    print(f"# Reporte de autorrevisión — {d.get('lesson', {}).get('code', a.clase)}\n")

    # ---------- items: minimal structure
    by_code, item_mcs, correct_letters = {}, {}, []
    levels = collections.Counter()
    for it in items:
        code = it.get("code")
        by_code[code] = it
        levels[(it.get("node"), it.get("difficulty"))] += 1
        opts = it.get("options") or []
        if len(opts) != 4:
            errors.append(f"{code}: tiene {len(opts)} alternativas (deben ser 4)")
        corr = [o for o in opts if o.get("correct")]
        if len(corr) != 1:
            errors.append(f"{code}: {len(corr)} correctas (debe ser 1)")
        else:
            correct_letters.append((code, corr[0].get("label")))
        mcs = [o.get("misconception") for o in opts if not o.get("correct")]
        if None in mcs:
            errors.append(f"{code}: distractor sin misconception")
        if len(set(mcs)) != len(mcs):
            errors.append(f"{code}: dos distractores con la misma misconception")
        if catalog:
            for m in mcs:
                if m and m not in catalog:
                    errors.append(f"{code}: misconception {m} no está en el catálogo")
        bodies = [o.get("body", "") for o in opts]
        if len(set(bodies)) != len(bodies):
            errors.append(f"{code}: alternativas con texto repetido")
        item_mcs[code] = {m for m in mcs if m}
        for t in [it.get("stem", "")] + bodies:
            if VOSEO.search(t):
                warns.append(f"{code}: posible voseo: '{VOSEO.search(t).group(0)}'")

    # ---------- distribution by level
    print("## Ítems por nodo y nivel\n")
    nodes = sorted({n for n, _ in levels})
    for n in nodes:
        row = {lv: levels[(n, lv)] for lv in (1, 2, 3)}
        total = sum(row.values())
        print(f"- {n}: total {total} | nivel 1: {row[1]} | nivel 2: {row[2]} | nivel 3: {row[3]}")
        if total < 24:
            warns.append(f"{n}: {total} ítems (el estándar es 24, 8 por nivel)")
        if len(set(row.values())) > 1:
            warns.append(f"{n}: niveles desbalanceados {row}")
    print()

    # ---------- misconception usage (wildcards and orphans)
    print("## Uso de cada misconception como distractor\n")
    use = collections.Counter(m for s in item_mcs.values() for m in s)
    n_items = max(len(items), 1)
    for m, k in use.most_common():
        pct = 100 * k / n_items
        flag = ""
        if pct > 50:
            flag = "  <- posible COMODÍN: revisar que cada distractor sea genuino"
            warns.append(f"{m}: aparece en {k}/{n_items} ítems ({pct:.0f}%)")
        if k < 4:
            flag = "  <- POCOS ítems para sostener su remediación"
            warns.append(f"{m}: solo {k} ítems")
        print(f"- {m}: {k} ítems ({pct:.0f}%){flag}")
    if catalog:
        for code_m, m in catalog.items():
            if m.get("nodo") in set(nodes) and code_m not in use:
                warns.append(f"{code_m}: está en el catálogo para este nodo pero ningún ítem la usa")
    print()

    # ---------- position of the correct option
    print("## Posición de la correcta\n")
    lc = collections.Counter(l for _, l in correct_letters)
    print("- " + " | ".join(f"{L}: {lc.get(L, 0)}" for L in "ABCD"))
    seq = [l for _, l in correct_letters]
    runs = [i for i in range(len(seq) - 2) if seq[i] == seq[i + 1] == seq[i + 2]]
    if runs:
        warns.append(f"correcta en la misma letra 3 veces seguidas desde {correct_letters[runs[0]][0]}")
    if seq and max(lc.values()) > (len(seq) / 4) * 1.5:
        errors.append(f"posición de la correcta desbalanceada: {dict(lc)}")
    print()

    # ---------- remediations
    print("## Remediaciones\n")
    rem_mcs = set()
    for r in rems:
        m = r.get("misconception")
        rem_mcs.add(m)
        its = r.get("items") or []
        bad = [x for x in its if x not in by_code or m not in item_mcs.get(x, set())]
        print(f"- {r.get('code')}: {len(its)} ítems de práctica")
        if bad:
            errors.append(f"{r.get('code')}: ítems que no tienen {m} como distractor: {bad}")
        if len(its) < 6:
            warns.append(f"{r.get('code')}: {len(its)} ítems (estándar 6)")
        rb = r.get("body", "")
        if VOSEO.search(rb):
            warns.append(f"{r.get('code')}: posible voseo")
        if re.search(r"\brepas[ae]\b", rb, re.I):
            warns.append(f"{r.get('code')}: dice 'repasa': la remediación debe sostenerse sola")
    for m in use:
        node_of = catalog.get(m, {}).get("nodo")
        if m not in rem_mcs and (not catalog or node_of in set(nodes)):
            errors.append(f"{m}: se usa como distractor y no tiene remediación en esta clase")
    print()

    # ---------- examples that leak items
    print("## Ejemplos de la clase o de remediaciones que coinciden con ítems\n")
    texts = [("lesson_body", p) for p in paragraphs(body)]
    for r in rems:
        texts += [(r.get("code"), p) for p in paragraphs(r.get("body", ""))]
    leaks = 0
    seen = set()
    trivial = {"0", "1", "-1"}
    for code, it in by_code.items():
        stem_n = nums(it.get("stem", ""))
        corr = [o for o in it.get("options", []) if o.get("correct")]
        corr_n = nums(corr[0].get("body", "")) if corr else set()
        key = (stem_n | corr_n) - trivial
        if len(key) < 2:
            continue
        for where, p in texts:
            pn = nums(p)
            # Dense paragraphs are number lines or tables: they contain every
            # small integer and would match everything.
            if len(pn) > 6 or (code, where) in seen:
                continue
            if key <= pn:
                seen.add((code, where))
                leaks += 1
                warns.append(f"{code}: sus números {sorted(key)} aparecen juntos en {where}")
                print(f"- {code} <-> {where}: {sorted(key)}")
    if not leaks:
        print("- ninguno detectado (la detección es por números: revisa a mano los ejemplos sin números)")
    print()

    # ---------- figures
    item_figs = {it.get("figure") for it in items if it.get("figure")}
    text_bodies = [body] + [r.get("body", "") for r in rems]
    body_figs = set()
    for t in text_bodies:
        body_figs |= set(FIG.findall(t))
    for f in item_figs & body_figs:
        errors.append(f"figura {f} usada en un ítem y en la clase o remediación: filtra la respuesta")
    for t in text_bodies:
        for m in re.finditer(r"!\[[^\]]*\]\(([^)]+)\)", t):
            if not m.group(1).startswith("fig:"):
                errors.append(f"imagen no permitida en el markdown: {m.group(1)}")
    if VOSEO.search(body):
        warns.append(f"lesson_body: posible voseo: '{VOSEO.search(body).group(0)}'")

    # ---------- summary
    print("## Resultado\n")
    for e in errors:
        print(f"ERROR  {e}")
    for w in warns:
        print(f"AVISO  {w}")
    if not errors and not warns:
        print("Sin errores ni avisos.")
    print(f"\n{len(errors)} errores, {len(warns)} avisos.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
