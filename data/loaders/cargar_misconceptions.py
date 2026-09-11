#!/usr/bin/env python3
"""
cargar_misconceptions.py — catálogo de una unidad  ->  migración SQL.

  python3 cargar_misconceptions.py contenido/misconceptions/NUM-POT.yaml \
      > 014_mc_num_pot.sql

Fuente única de los errores de una unidad. Las clases no los declaran:
solo los referencian por código, y cargar_contenido.py falla si el código
no está acá.

Corre una vez por unidad, antes que cualquier clase de esa unidad.
No toca la base: emite SQL a stdout para revisar.
"""

import re
import sys
from pathlib import Path

import yaml

CODE_RE = re.compile(r"^[A-Z0-9]{2,6}(-[A-Z0-9]+){0,3}$")
ORIGENES_OK = ("demre", "docente", "hipotesis")


def validar(doc: dict) -> list[str]:
    fallas: list[str] = []

    for campo in ("unit", "misconceptions"):
        if campo not in doc:
            fallas.append(f"falta la clave raíz '{campo}'")
    if fallas:
        return fallas

    if not CODE_RE.match(doc["unit"] or ""):
        fallas.append(f"unit: '{doc['unit']}' no cumple code_text")

    vistos: set[str] = set()
    for mc in doc["misconceptions"]:
        code = mc.get("code")
        if not CODE_RE.match(code or ""):
            fallas.append(f"misconception: '{code}' no cumple code_text")
        if code in vistos:
            fallas.append(f"misconception duplicada en el catálogo: {code}")
        vistos.add(code)

        for campo in ("name", "description", "nodo"):
            if not mc.get(campo):
                fallas.append(f"misconception {code}: falta '{campo}'")

        if not CODE_RE.match(mc.get("nodo") or ""):
            fallas.append(f"misconception {code}: nodo '{mc.get('nodo')}' "
                          f"no cumple code_text")

        origin = mc.get("origin")
        if origin not in ORIGENES_OK:
            fallas.append(f"misconception {code}: origin '{origin}', se "
                          f"espera uno de {ORIGENES_OK}. Sin procedencia no "
                          f"se sabe qué podar cuando lleguen las respuestas")

    return fallas


def q(texto) -> str:
    """Literal SQL con dollar-quoting: el contenido trae LaTeX y comillas."""
    if texto is None:
        return "null"
    tag, n = "$c$", 0
    while tag in str(texto):
        n += 1
        tag = f"$c{n}$"
    return f"{tag}{texto}{tag}"


def emitir(doc: dict, origen: str) -> str:
    o: list[str] = []
    w = o.append
    mcs = doc["misconceptions"]
    unidad = doc["unit"]

    w("-- =====================================================================")
    w(f"-- Catálogo de misconceptions — unidad {unidad}")
    w(f"-- Generado por cargar_misconceptions.py desde {origen}")
    w("-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.")
    w("-- La transaccion la pone quien ejecuta:")
    w("--   psql -X -v ON_ERROR_STOP=1 -1 -f este_archivo.sql \"$DATABASE_URL\"")
    w("-- Este archivo NO trae begin/commit a proposito: anidarlos rompe")
    w("-- la atomicidad del -1.")
    w("-- =====================================================================")
    w("")
    w("insert into misconceptions "
      "(code, name, description, example, area_id, node_id, origin)")
    w("select v.code, v.name, v.description, v.example, a.id, n.id,")
    w("       v.origin::misconception_origin")
    w("from (values")
    w(",\n".join(
        f"  ({q(m['code'])}, {q(m['name'])}, {q(m['description'].strip())}, "
        f"{q(m.get('example'))}, {q(m.get('area'))}, {q(m['nodo'])}, "
        f"{q(m['origin'])})"
        for m in mcs))
    w(") as v(code, name, description, example, area_code, node_code, origin)")
    w("left join areas a on a.code = v.area_code")
    w("join nodes n      on n.code = v.node_code")
    w("on conflict (code) do update")
    w("  set name        = excluded.name,")
    w("      description = excluded.description,")
    w("      example     = excluded.example,")
    w("      node_id     = excluded.node_id,")
    w("      origin      = excluded.origin;")
    w("")

    codes = ", ".join(q(m["code"]) for m in mcs)

    w("-- Verificación. Si algo no cuadra, revienta y no commitea. ----------")
    w("do $verif$")
    w("declare c integer;")
    w("begin")
    w(f"  select count(*) into c from misconceptions where code in ({codes});")
    w(f"  if c <> {len(mcs)} then")
    w(f"    raise exception 'catalogo {unidad}: se esperaban {len(mcs)}, "
      f"hay %', c; end if;")
    w("")
    w(f"  select count(*) into c from misconceptions")
    w(f"   where code in ({codes}) and node_id is null;")
    w("  if c <> 0 then")
    w("    raise exception '% errores sin nodo donde se ensenan', c; end if;")
    w("")
    w(f"  select count(*) into c from misconceptions")
    w(f"   where code in ({codes}) and (example is null or example = '');")
    w("  if c <> 0 then")
    w("    raise exception '% errores sin example', c; end if;")
    w("end")
    w("$verif$;")
    w("")

    por_origen: dict[str, int] = {}
    for m in mcs:
        por_origen[m["origin"]] = por_origen.get(m["origin"], 0) + 1
    detalle = ", ".join(f"{n} {o}" for o, n in sorted(por_origen.items()))
    w(f"-- {len(mcs)} misconceptions en {unidad} ({detalle}).")

    return "\n".join(o)


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2

    ruta = Path(sys.argv[1])
    doc = yaml.safe_load(ruta.read_text(encoding="utf-8"))

    fallas = validar(doc)
    if fallas:
        print(f"\n{len(fallas)} problema(s). No se generó SQL:\n",
              file=sys.stderr)
        for f in fallas:
            print(f"  - {f}", file=sys.stderr)
        return 1

    print(emitir(doc, ruta.name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
