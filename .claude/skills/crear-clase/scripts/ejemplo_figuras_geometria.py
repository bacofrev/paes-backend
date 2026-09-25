"""Modelo para figuras de geometría: tres figuras PAES (fig. 21, 24 y 1)
recreadas desde sus condiciones geométricas, verificadas con asserts antes de
escribir el SVG. Copiar el patrón, no las figuras.

Cada SVG pasa, al final, por el mismo validador que usa el cargador
(data/loaders/figuras.py): si no lo pasa aquí, el cargador lo rechazará."""

import math
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(REPO / "data" / "loaders"))
from figuras import validar_svg  # noqa: E402

def fmt(v): return f"{v:.2f}"

class Fig:
    def __init__(s, xmin, xmax, ymin, ymax, scale=60, pad=22):
        s.x0, s.y1, s.k, s.pad = xmin, ymax, scale, pad
        s.w = (xmax - xmin) * scale + 2 * pad
        s.h = (ymax - ymin) * scale + 2 * pad
        s.el = []
    def P(s, p):  # math -> svg coords (y flipped)
        return (s.pad + (p[0] - s.x0) * s.k, s.pad + (s.y1 - p[1]) * s.k)
    def line(s, a, b, w=1.4):
        (x1, y1), (x2, y2) = s.P(a), s.P(b)
        s.el.append(f'<line x1="{fmt(x1)}" y1="{fmt(y1)}" x2="{fmt(x2)}" y2="{fmt(y2)}" stroke-width="{w}"/>')
    def poly(s, pts, w=1.4):
        d = " ".join(f"{fmt(x)},{fmt(y)}" for x, y in map(s.P, pts))
        s.el.append(f'<polyline points="{d}" stroke-width="{w}"/>')
    def circle(s, c, r, w=1.4):
        x, y = s.P(c)
        s.el.append(f'<circle cx="{fmt(x)}" cy="{fmt(y)}" r="{fmt(r*s.k)}" stroke-width="{w}"/>')
    def dot(s, c, r=2.6):
        x, y = s.P(c)
        s.el.append(f'<circle cx="{fmt(x)}" cy="{fmt(y)}" r="{r}" fill="currentColor" stroke="none"/>')
    def arc(s, c, r, a0, a1, w=1.1):
        """Arc centered at c, radius r (units), from angle a0 to a1 (deg, ccw)."""
        p0 = (c[0] + r*math.cos(math.radians(a0)), c[1] + r*math.sin(math.radians(a0)))
        p1 = (c[0] + r*math.cos(math.radians(a1)), c[1] + r*math.sin(math.radians(a1)))
        (x0, y0), (x1, y1) = s.P(p0), s.P(p1)
        large = 1 if (a1 - a0) % 360 > 180 else 0
        # ccw in math space = clockwise sweep flag 0 in svg (y flipped)
        s.el.append(f'<path d="M{fmt(x0)},{fmt(y0)} A{fmt(r*s.k)},{fmt(r*s.k)} 0 {large} 0 {fmt(x1)},{fmt(y1)}" stroke-width="{w}"/>')
    def text(s, p, t, dx=0, dy=0, size=15, anchor="middle", italic=False):
        x, y = s.P(p)
        st = ' font-style="italic"' if italic else ''
        s.el.append(f'<text x="{fmt(x+dx)}" y="{fmt(y+dy)}" font-size="{size}" text-anchor="{anchor}" dominant-baseline="central"{st}>{t}</text>')
    def svg(s, title):
        body = "\n  ".join(s.el)
        return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {fmt(s.w)} {fmt(s.h)}" '
                f'width="{fmt(s.w)}" height="{fmt(s.h)}" '
                # fill en la raíz: el default de SVG es negro y desaparece en
                # modo oscuro. El cargador lo exige.
                f'fill="none" role="img" aria-label="{title}">\n'
                f'<g fill="none" stroke="currentColor" stroke-linecap="round" '
                f'font-family="Manrope, Verdana, sans-serif" style="color: currentColor">\n  '
                + body.replace('<text', '<text fill="currentColor" stroke="none"') +
                '\n</g>\n</svg>\n')

def norm(v):
    L = math.hypot(*v); return (v[0]/L, v[1]/L)
def sub(a, b): return (a[0]-b[0], a[1]-b[1])
def add(a, b): return (a[0]+b[0], a[1]+b[1])
def mul(a, k): return (a[0]*k, a[1]*k)
def dot(a, b): return a[0]*b[0] + a[1]*b[1]
def cross(a, b): return a[0]*b[1] - a[1]*b[0]
def dist(a, b): return math.hypot(*sub(a, b))
def ang(v): return math.degrees(math.atan2(v[1], v[0]))

def line_circle(p, d, c, r):
    """Intersections of line p + t d with circle (c, r); returns sorted by t."""
    f = sub(p, c); a = dot(d, d); b = 2*dot(f, d); cc = dot(f, f) - r*r
    disc = b*b - 4*a*cc; assert disc > 0
    ts = sorted([(-b - math.sqrt(disc))/(2*a), (-b + math.sqrt(disc))/(2*a)])
    return [add(p, mul(d, t)) for t in ts]

EPS = 1e-9

# ============ fig. 21: circle, diameter AB, D on circle, DE ⟂ AB, BC tangent, A-D-C collinear
def fig21():
    r = 1.6; O = (0, 0); A = (-r, 0); B = (r, 0)
    th = math.radians(76); D = (r*math.cos(th), r*math.sin(th)); E = (D[0], 0)
    # C: line AD meets tangent at B (x = r)
    t = (r - A[0]) / (D[0] - A[0]); C = add(A, mul(sub(D, A), t))
    assert abs(dist(D, O) - r) < EPS                       # D on circle
    assert abs(dot(sub(D, E), sub(B, A))) < EPS             # DE ⟂ AB
    assert abs(dot(sub(C, B), sub(B, O))) < EPS             # BC tangent (⟂ radius)
    assert abs(cross(sub(D, A), sub(C, A))) < 1e-9          # A, D, C collinear
    f = Fig(-r - .3, r + 1.3, -r - .1, C[1] + .3)
    f.circle(O, r); f.line(A, B); f.line(A, C); f.line(B, C); f.line(D, E)
    f.dot(O); f.dot(D)
    f.text(A, "A", dx=-11); f.text(B, "B", dx=11); f.text(C, "C", dx=9, dy=-9)
    f.text(D, "D", dx=-4, dy=-13); f.text(E, "E", dy=13, dx=2); f.text(O, "O", dy=13, dx=-4)
    f.text((r + .95, 0.9), "fig. 21", size=13)
    return f.svg("Figura 21: circunferencia de centro O y diámetro AB, con cuerda AD prolongada hasta C sobre la tangente en B, y DE perpendicular a AB")

# ============ fig. 24: two equal circles tangent at T, common tangent through T, secants RNW and RSX
def fig24():
    r = 1.0; O = (-r, 0); P = (r, 0); T = (0, 0); R = (0, 2.3)
    W = add(O, (r*math.cos(math.radians(228)), r*math.sin(math.radians(228))))
    N, W2 = line_circle(R, sub(W, R), O, r); assert dist(W2, W) < 1e-9
    # RW must NOT pass through O: the original makes no diameter claim
    assert abs(cross(norm(sub(W, R)), sub(O, R))) > 0.12
    X = add(P, (r*math.cos(math.radians(-35)), r*math.sin(math.radians(-35))))
    S, X2 = line_circle(R, sub(X, R), P, r); assert dist(X2, X) < 1e-9
    assert abs(dist(O, T) - r) < EPS and abs(dist(P, T) - r) < EPS   # tangent at T
    assert abs(dot(sub(R, T), sub(P, O))) < EPS                       # RT ⟂ OP: common tangent
    f = Fig(-2*r - .15, 2*r + .5, -r - .5, R[1] + .25)
    f.circle(O, r); f.circle(P, r)
    f.line(R, (0, -r - .35)); f.line(R, W); f.line(R, X)
    f.dot(O); f.dot(P); f.dot(T)
    f.text(R, "R", dy=-12); f.text(T, "T", dx=11, dy=2)
    f.text(N, "N", dx=-12, dy=-6); f.text(W, "W", dx=-6, dy=13)
    f.text(S, "S", dx=11, dy=-7); f.text(X, "X", dx=12, dy=2)
    f.text(O, "O", dx=3, dy=14); f.text(P, "P", dx=11, dy=2)
    f.text((2*r + .15, 1.8), "fig. 24", size=13)
    return f.svg("Figura 24: dos circunferencias iguales de centros O y P, tangentes en T, con la tangente común por T y dos secantes desde R")

# ============ fig. 1: right triangle ABC (right angle at C), altitude CD, angle marks, bracket c
def fig1():
    c = 6.0; al = math.radians(62); A = (0, 0); B = (c, 0)
    b = c*math.cos(al); C = (b*math.cos(al), b*math.sin(al)); D = (C[0], 0)
    assert abs(dot(sub(A, C), sub(B, C))) < 1e-9        # right angle at C
    assert abs(dot(sub(C, D), sub(B, A))) < 1e-9        # CD ⟂ AB
    be = math.degrees(math.atan2(C[1], c - C[0]))
    assert abs(be - (90 - math.degrees(al))) < 1e-9     # β = 90° − α
    f = Fig(-.4, c + .4, -.95, C[1] + .3, scale=46)
    f.poly([A, B, C, A]); f.line(C, D)
    # right-angle square at D
    q = .22; f.poly([(D[0], q), (D[0] + q, q), (D[0] + q, 0)], w=1.1)
    # angle arcs: α at A, β at B, and at C: β between CA and CD, α between CD and CB
    a_deg = math.degrees(al)
    f.arc(A, .45, 0, a_deg); f.arc(B, .7, 180 - be, 180)
    f.arc(C, .42, ang(sub(A, C)), -90)          # between CA and CD  -> β
    f.arc(C, .36, -90, ang(sub(B, C)))          # between CD and CB  -> α
    # labels
    f.text(A, "A", dx=-10, dy=6); f.text(B, "B", dx=11, dy=6); f.text(C, "C", dy=-11)
    f.text(D, "D", dx=-1, dy=13)
    f.text(add(A, (.72, .42)), "α", size=14, italic=True)
    f.text(add(B, (-1.05, .22)), "β", size=14, italic=True)
    f.text(add(C, (-.2, -.72)), "β", size=13, italic=True)
    f.text(add(C, (.38, -.5)), "α", size=13, italic=True)
    f.text(mul(add(A, C), .5), "b", dx=-11, italic=True)
    f.text(mul(add(B, C), .5), "a", dx=6, dy=-10, italic=True)
    f.text(add(D, (0, C[1]*.45)), "h", dx=-10, italic=True)
    f.text(mul(add(A, D), .5), "q", dy=12, italic=True)
    f.text(mul(add(D, B), .5), "p", dy=12, italic=True)
    # dimension bracket for c
    y = -.62; f.line((0, y), (c/2 - .25, y), w=1.1); f.line((c/2 + .25, y), (c, y), w=1.1)
    f.line((0, y - .12), (0, y + .12), w=1.1); f.line((c, y - .12), (c, y + .12), w=1.1)
    f.text((c/2, y), "c", dy=-1, italic=True)
    f.text((c*.83, C[1] - .2), "fig. 1", size=13)
    return f.svg("Figura 1: triángulo ABC rectángulo en C con altura h = CD, que divide la hipotenusa c en q y p")

for name, fn in [("fig21", fig21), ("fig24", fig24), ("fig1", fig1)]:
    svg = fn()
    fallas = validar_svg(svg, name)
    assert not fallas, fallas
    open(f"{name}.svg", "w").write(svg)
print("ok")
