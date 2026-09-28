"""
figura_svg.py — figuras geométricas (polígonos, segmentos, marcas) en SVG
para GEO-FIG. No es un script: lo importan los generadores de cada clase.

Mismo criterio que plano_svg.py y que el modelo de la skill
(.claude/skills/crear-clase/scripts/ejemplo_figuras_geometria.py): la
figura se arma desde coordenadas en unidades, las condiciones geométricas
se verifican con assert en el generador (con las funciones de acá), y el
SVG pasa por figuras.validar_svg antes de escribirse.

Además, al rotular se verifica que ningún rótulo se salga del viewBox ni
se monte sobre otro.
"""

import math
import sys
from pathlib import Path

AQUI = Path(__file__).resolve().parent
sys.path.insert(0, str(AQUI.parent.parent / "loaders"))
import figuras  # noqa: E402

FUENTE = "Manrope, Verdana, sans-serif"
EPS = 1e-9


# --- geometría ------------------------------------------------------------------

def sub(a, b): return (a[0] - b[0], a[1] - b[1])
def add(a, b): return (a[0] + b[0], a[1] + b[1])
def mul(a, k): return (a[0] * k, a[1] * k)
def dot(a, b): return a[0] * b[0] + a[1] * b[1]
def cross(a, b): return a[0] * b[1] - a[1] * b[0]
def dist(a, b): return math.hypot(*sub(a, b))
def medio(a, b): return ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)


def norm(v):
    L = math.hypot(*v)
    return (v[0] / L, v[1] / L)


def pie_perpendicular(p, a, b):
    """Pie de la perpendicular desde p a la recta ab."""
    d = sub(b, a)
    t = dot(sub(p, a), d) / dot(d, d)
    return add(a, mul(d, t)), t


def perpendicular(u, v):
    return abs(dot(u, v)) < 1e-7


def paralelos(u, v):
    return abs(cross(u, v)) < 1e-7


def rotar(p, ang, c=(0, 0)):
    s, co = math.sin(math.radians(ang)), math.cos(math.radians(ang))
    x, y = p[0] - c[0], p[1] - c[1]
    return (c[0] + x * co - y * s, c[1] + x * s + y * co)


def regular(n, r, c=(0, 0), ang0=90):
    return [(c[0] + r * math.cos(math.radians(ang0 + 360 * k / n)),
             c[1] + r * math.sin(math.radians(ang0 + 360 * k / n))) for k in range(n)]


# --- dibujo -----------------------------------------------------------------------

def _f(x):
    return f"{x:.2f}".rstrip("0").rstrip(".")


class Figura:
    def __init__(self, xmin, xmax, ymin, ymax, escala=40, margen=24):
        self.x0, self.y1, self.k, self.m = xmin, ymax, escala, margen
        self.w = (xmax - xmin) * escala + 2 * margen
        self.h = (ymax - ymin) * escala + 2 * margen
        self.el, self.txt, self.cajas = [], [], []

    def P(self, p):
        return (self.m + (p[0] - self.x0) * self.k, self.m + (self.y1 - p[1]) * self.k)

    def poligono(self, pts, w=1.5):
        d = " ".join(f"{_f(x)},{_f(y)}" for x, y in map(self.P, pts))
        self.el.append(f'<polygon points="{d}" fill="none" stroke-width="{w}" stroke-linejoin="round"/>')

    def segmento(self, a, b, punteado=False, w=1.3):
        (x1, y1), (x2, y2) = self.P(a), self.P(b)
        dash = ' stroke-dasharray="5 4"' if punteado else ""
        self.el.append(f'<line x1="{_f(x1)}" y1="{_f(y1)}" x2="{_f(x2)}" y2="{_f(y2)}" '
                       f'stroke-width="{w}"{dash}/>')

    def punto(self, p, r=2.8):
        x, y = self.P(p)
        self.el.append(f'<circle cx="{_f(x)}" cy="{_f(y)}" r="{r}" fill="currentColor" stroke="none"/>')

    def angulo_recto(self, v, a, b, t=0.28):
        """Cuadradito en el vértice v entre las direcciones va y vb (deben ser ⟂)."""
        u1, u2 = norm(sub(a, v)), norm(sub(b, v))
        assert perpendicular(u1, u2), "la marca de ángulo recto va en un ángulo que no es recto"
        p1, p3 = add(v, mul(u1, t)), add(v, mul(u2, t))
        p2 = add(p1, mul(u2, t))
        d = " ".join(f"{_f(x)},{_f(y)}" for x, y in map(self.P, [p1, p2, p3]))
        self.el.append(f'<polyline points="{d}" fill="none" stroke-width="1.1"/>')

    def marca_igual(self, a, b, n=1, largo=0.16, sep=0.09):
        """n rayitas en el punto medio del segmento ab (lados iguales)."""
        m, u = medio(a, b), norm(sub(b, a))
        nrm = (-u[1], u[0])
        for i in range(n):
            c = add(m, mul(u, (i - (n - 1) / 2) * sep))
            self.segmento(add(c, mul(nrm, largo)), add(c, mul(nrm, -largo)), w=1.2)

    def arco(self, v, a, b, r=0.45):
        """Arco de ángulo en v, de la dirección va a la vb (sentido antihorario)."""
        a0 = math.degrees(math.atan2(*reversed(sub(a, v))))
        a1 = math.degrees(math.atan2(*reversed(sub(b, v))))
        if a1 < a0:
            a1 += 360
        p0 = add(v, (r * math.cos(math.radians(a0)), r * math.sin(math.radians(a0))))
        p1 = add(v, (r * math.cos(math.radians(a1)), r * math.sin(math.radians(a1))))
        (x0, y0), (x1, y1) = self.P(p0), self.P(p1)
        grande = 1 if (a1 - a0) > 180 else 0
        R = r * self.k
        self.el.append(f'<path d="M{_f(x0)},{_f(y0)} A{_f(R)},{_f(R)} 0 {grande} 0 {_f(x1)},{_f(y1)}" '
                       f'fill="none" stroke-width="1.1"/>')

    def rotulo(self, p, texto, dx=0, dy=0, size=14, italic=False, que="rótulo"):
        x, y = self.P(p)
        x, y = x + dx, y + dy
        ancho = 0.6 * size * max(1, len(texto))
        caja = (x - ancho / 2, y - size * 0.55, x + ancho / 2, y + size * 0.55, f"{que} «{texto}»")
        assert caja[0] >= 1 and caja[1] >= 1 and caja[2] <= self.w - 1 and caja[3] <= self.h - 1, \
            f"{caja[4]} se sale del viewBox"
        for c in self.cajas:
            solapa = not (caja[2] <= c[0] or c[2] <= caja[0] or caja[3] <= c[1] or c[3] <= caja[1])
            assert not solapa, f"{caja[4]} se monta sobre {c[4]}"
        self.cajas.append(caja)
        st = ' font-style="italic"' if italic else ""
        self.txt.append(f'<text x="{_f(x)}" y="{_f(y)}" font-size="{size}" text-anchor="middle" '
                        f'dominant-baseline="central"{st}>{texto}</text>')

    def medida(self, a, b, texto, lado=1, d=0.32, size=13):
        """Rótulo de longitud al costado del segmento ab. lado=1 a la izquierda
        de a→b, lado=−1 a la derecha (usa el sentido de recorrido)."""
        m, u = medio(a, b), norm(sub(b, a))
        nrm = (-u[1] * lado, u[0] * lado)
        self.rotulo(add(m, mul(nrm, d)), texto, size=size, que="medida")

    def vertice(self, p, nombre, hacia, d=0.32):
        """Rótulo de vértice, desplazado en la dirección `hacia` (vector)."""
        u = norm(hacia)
        self.rotulo(add(p, mul(u, d)), nombre, size=14, que="vértice")

    def svg(self, aria, prohibido=()):
        for p in prohibido:
            assert p not in aria, f"el aria-label delata «{p}»"
        cuerpo = "\n  ".join(self.el + self.txt)
        W, H = _f(self.w), _f(self.h)
        out = (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {W} {H}" width="{W}" '
               f'height="{H}" role="img" aria-label="{aria}" fill="currentColor" '
               f'font-family="{FUENTE}" stroke="currentColor" stroke-linecap="round">\n  '
               f'{cuerpo}\n</svg>\n')
        fallas = figuras.validar_svg(out, "figura")
        assert not fallas, fallas
        return out


def fuera_de(pol, p):
    """Centro geométrico de pol para empujar rótulos de vértice hacia afuera."""
    c = (sum(x for x, _ in pol) / len(pol), sum(y for _, y in pol) / len(pol))
    return sub(p, c)


def guardar(codigo, svg, directorio=AQUI):
    assert figuras.FIG_RE.match(codigo), codigo
    (directorio / f"{codigo}.svg").write_text(svg, encoding="utf-8")
