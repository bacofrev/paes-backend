"""
plano_svg.py — plano cartesiano en SVG para las figuras de GEO-TRA.

No es un script: lo importan los generadores de cada clase
(generar_geo_tra_01.py, ...). Mismo espíritu que recta.py: la figura se
arma desde coordenadas exactas y se verifica releyendo el SVG que salió.

  p = Plano(-5, 5, -4, 4)                       # cuadrícula de 1 en 1
  p.punto("P", -3, 2)
  p.poligono([("A", 1, 1), ("B", 4, 1), ("C", 4, 3)])
  p.vector((0, 0), (3, 2), "u")
  svg = p.svg("Plano cartesiano con el punto P")

Verificaciones (assert) al generar:
  - todo punto, vértice o extremo de vector cae exactamente sobre un
    cruce de la cuadrícula (múltiplo de la escala) y dentro del plano;
  - al releer el SVG, cada elemento con data-x/data-y está en el píxel que
    le corresponde;
  - ningún rótulo se sale del viewBox ni se monta sobre otro rótulo o
    sobre un punto;
  - el aria-label no contiene ninguna de las cadenas prohibidas que pase
    el generador (por ejemplo, las coordenadas que el ítem pregunta).
  - el SVG pasa figuras.validar_svg, el mismo validador del cargador.

Rótulos de los ejes: por defecto se rotulan todas las marcas. Con
rotulos_x / rotulos_y se rotulan solo algunas, para que el estudiante
deduzca la escala (el mismo criterio que las rectas de ENT-REC).
"""

import sys
import xml.etree.ElementTree as ET
from fractions import Fraction
from pathlib import Path

AQUI = Path(__file__).resolve().parent
sys.path.insert(0, str(AQUI.parent.parent / "loaders"))
import figuras  # noqa: E402

FUENTE = "Manrope, Verdana, sans-serif"
TRAZO = 1.3
MARGEN = 26


def _num(v) -> str:
    v = Fraction(v)
    s = "−" if v < 0 else ""
    v = abs(v)
    return s + (str(v.numerator) if v.denominator == 1 else f"{float(v):g}".replace(".", ","))


def _f(x: float) -> str:
    return f"{x:.2f}".rstrip("0").rstrip(".")


class Plano:
    def __init__(self, xmin, xmax, ymin, ymax, escala=1, px=26,
                 rotulos_x=None, rotulos_y=None, cuadricula=True,
                 nombres_ejes=True):
        self.e = Fraction(escala)
        for v in (xmin, xmax, ymin, ymax):
            assert Fraction(v) % self.e == 0, f"{v} no es múltiplo de la escala {escala}"
        assert xmin < 0 < xmax and ymin < 0 < ymax, "el origen tiene que quedar adentro"
        self.xmin, self.xmax = Fraction(xmin), Fraction(xmax)
        self.ymin, self.ymax = Fraction(ymin), Fraction(ymax)
        self.px = px                      # píxeles por unidad de cuadrícula
        self.cuadricula = cuadricula
        self.nombres_ejes = nombres_ejes
        pasos = lambda a, b: [a + self.e * k for k in range(int((b - a) / self.e) + 1)]
        self.marcas_x = [v for v in pasos(self.xmin, self.xmax)]
        self.marcas_y = [v for v in pasos(self.ymin, self.ymax)]
        self.rot_x = [Fraction(v) for v in (rotulos_x if rotulos_x is not None
                                            else [v for v in self.marcas_x if v != 0])]
        self.rot_y = [Fraction(v) for v in (rotulos_y if rotulos_y is not None
                                            else [v for v in self.marcas_y if v != 0])]
        for v in self.rot_x:
            assert v in self.marcas_x, f"rótulo x {v} fuera de las marcas"
        for v in self.rot_y:
            assert v in self.marcas_y, f"rótulo y {v} fuera de las marcas"
        self.w = float((self.xmax - self.xmin) / self.e) * px + 2 * MARGEN + 14
        self.h = float((self.ymax - self.ymin) / self.e) * px + 2 * MARGEN + 10
        self.el: list[str] = []           # elementos de dibujo
        self.txt: list[str] = []          # rótulos (van arriba de todo)
        self.cajas: list[tuple] = []      # (x0, y0, x1, y1, qué) de rótulos
        self.puntos_px: list[tuple] = []  # centros de puntos dibujados
        self._ejes()

    # --- coordenadas -----------------------------------------------------

    def X(self, x) -> float:
        return MARGEN + float((Fraction(x) - self.xmin) / self.e) * self.px

    def Y(self, y) -> float:
        return MARGEN + float((self.ymax - Fraction(y)) / self.e) * self.px

    def _en_cuadricula(self, x, y, que):
        x, y = Fraction(x), Fraction(y)
        assert x % self.e == 0 and y % self.e == 0, f"{que} ({x}, {y}) no cae en un cruce de la cuadrícula"
        assert self.xmin <= x <= self.xmax and self.ymin <= y <= self.ymax, f"{que} ({x}, {y}) fuera del plano"

    # --- rótulos con control de choques -------------------------------------

    def _rotulo(self, x, y, texto, size=14, anchor="middle", italic=False, que="rótulo"):
        ancho = 0.62 * size * max(1, len(texto))
        x0 = x - ancho / 2 if anchor == "middle" else (x - ancho if anchor == "end" else x)
        caja = (x0, y - size * 0.55, x0 + ancho, y + size * 0.55, f"{que} «{texto}»")
        assert caja[0] >= 1 and caja[1] >= 1 and caja[2] <= self.w - 1 and caja[3] <= self.h - 1, \
            f"{caja[4]} se sale del viewBox"
        for c in self.cajas:
            solapa = not (caja[2] <= c[0] or c[2] <= caja[0] or caja[3] <= c[1] or c[3] <= caja[1])
            assert not solapa, f"{caja[4]} se monta sobre {c[4]}"
        self.cajas.append(caja)
        st = ' font-style="italic"' if italic else ""
        self.txt.append(
            f'<text x="{_f(x)}" y="{_f(y)}" font-size="{size}" text-anchor="{anchor}" '
            f'dominant-baseline="central"{st}>{texto}</text>')

    # --- ejes y cuadrícula ---------------------------------------------------

    def _ejes(self):
        x0, x1 = self.X(self.xmin), self.X(self.xmax)
        y0, y1 = self.Y(self.ymax), self.Y(self.ymin)
        if self.cuadricula:
            for v in self.marcas_x:
                self.el.append(f'<line x1="{_f(self.X(v))}" y1="{_f(y0)}" x2="{_f(self.X(v))}" '
                               f'y2="{_f(y1)}" stroke-width="0.6" stroke-opacity="0.3"/>')
            for v in self.marcas_y:
                self.el.append(f'<line x1="{_f(x0)}" y1="{_f(self.Y(v))}" x2="{_f(x1)}" '
                               f'y2="{_f(self.Y(v))}" stroke-width="0.6" stroke-opacity="0.3"/>')
        ox, oy = self.X(0), self.Y(0)
        ext = 12
        self.el.append(f'<line class="eje-x" x1="{_f(x0 - 4)}" y1="{_f(oy)}" x2="{_f(x1 + ext)}" '
                       f'y2="{_f(oy)}" stroke-width="{TRAZO}"/>')
        self.el.append(f'<line class="eje-y" x1="{_f(ox)}" y1="{_f(y1 + 4)}" x2="{_f(ox)}" '
                       f'y2="{_f(y0 - ext)}" stroke-width="{TRAZO}"/>')
        ax, ay = x1 + ext, y0 - ext
        self.el.append(f'<polygon points="{_f(ax + 6)},{_f(oy)} {_f(ax - 3)},{_f(oy - 4.5)} '
                       f'{_f(ax - 3)},{_f(oy + 4.5)}" fill="currentColor" stroke="none"/>')
        self.el.append(f'<polygon points="{_f(ox)},{_f(ay - 6)} {_f(ox - 4.5)},{_f(ay + 3)} '
                       f'{_f(ox + 4.5)},{_f(ay + 3)}" fill="currentColor" stroke="none"/>')
        for v in self.marcas_x:
            if v != 0:
                self.el.append(f'<line x1="{_f(self.X(v))}" y1="{_f(oy - 3.5)}" x2="{_f(self.X(v))}" '
                               f'y2="{_f(oy + 3.5)}" stroke-width="{TRAZO}"/>')
        for v in self.marcas_y:
            if v != 0:
                self.el.append(f'<line x1="{_f(ox - 3.5)}" y1="{_f(self.Y(v))}" x2="{_f(ox + 3.5)}" '
                               f'y2="{_f(self.Y(v))}" stroke-width="{TRAZO}"/>')
        for v in self.rot_x:
            if v != 0:
                self._rotulo(self.X(v), oy + 13, _num(v), size=11, que="marca x")
        for v in self.rot_y:
            if v != 0:
                self._rotulo(ox - 7, self.Y(v), _num(v), size=11, anchor="end", que="marca y")
        self._rotulo(ox - 8, oy + 12, "0", size=11, que="origen")
        if self.nombres_ejes:
            self._rotulo(ax + 4, oy - 12, "x", size=14, italic=True, que="nombre eje")
            self._rotulo(ox + 12, ay, "y", size=14, italic=True, que="nombre eje")

    # --- objetos -------------------------------------------------------------

    OFF = {"ne": (10, -10), "nw": (-10, -10), "se": (10, 11), "sw": (-10, 11),
           "n": (0, -13), "s": (0, 14), "e": (13, 0), "w": (-13, 0)}

    def punto(self, nombre, x, y, pos="ne", marca=True):
        self._en_cuadricula(x, y, f"punto {nombre}")
        cx, cy = self.X(x), self.Y(y)
        if marca:
            self.el.append(f'<circle class="punto" data-nombre="{nombre}" data-x="{Fraction(x)}" '
                           f'data-y="{Fraction(y)}" cx="{_f(cx)}" cy="{_f(cy)}" r="3.2" '
                           f'fill="currentColor" stroke="none"/>')
            self.puntos_px.append((cx, cy, nombre))
            # el rótulo no puede tapar ningún punto ya dibujado
        if nombre:
            dx, dy = self.OFF[pos]
            self._rotulo(cx + dx, cy + dy, nombre, size=14, que=f"punto {nombre}")

    def poligono(self, vertices, pos=None, marcas=True):
        """vertices: [(nombre, x, y), ...]; pos: dict nombre -> posición del rótulo."""
        pos = pos or {}
        for n, x, y in vertices:
            self._en_cuadricula(x, y, f"vértice {n}")
        pts = " ".join(f"{_f(self.X(x))},{_f(self.Y(y))}" for _, x, y in vertices)
        datos = ";".join(f"{n}={Fraction(x)},{Fraction(y)}" for n, x, y in vertices)
        self.el.append(f'<polygon class="figura" data-vertices="{datos}" points="{pts}" '
                       f'fill="none" stroke-width="1.5" stroke-linejoin="round"/>')
        for n, x, y in vertices:
            self.punto(n, x, y, pos.get(n, "ne"), marca=marcas)

    def vector(self, desde, hasta, nombre=None, pos_nombre=None, clase="vector"):
        (x1, y1), (x2, y2) = desde, hasta
        self._en_cuadricula(x1, y1, "origen del vector")
        self._en_cuadricula(x2, y2, "extremo del vector")
        a, b = (self.X(x1), self.Y(y1)), (self.X(x2), self.Y(y2))
        dx, dy = b[0] - a[0], b[1] - a[1]
        L = (dx * dx + dy * dy) ** 0.5
        assert L > 0, "vector nulo"
        ux, uy = dx / L, dy / L
        cola = (b[0] - 9 * ux, b[1] - 9 * uy)
        self.el.append(f'<line class="{clase}" data-desde="{Fraction(x1)},{Fraction(y1)}" '
                       f'data-hasta="{Fraction(x2)},{Fraction(y2)}" x1="{_f(a[0])}" y1="{_f(a[1])}" '
                       f'x2="{_f(cola[0])}" y2="{_f(cola[1])}" stroke-width="1.6"/>')
        p1 = (b[0] - 10 * ux + 4.5 * uy, b[1] - 10 * uy - 4.5 * ux)
        p2 = (b[0] - 10 * ux - 4.5 * uy, b[1] - 10 * uy + 4.5 * ux)
        self.el.append(f'<polygon points="{_f(b[0])},{_f(b[1])} {_f(p1[0])},{_f(p1[1])} '
                       f'{_f(p2[0])},{_f(p2[1])}" fill="currentColor" stroke="none"/>')
        if nombre:
            mx, my = (a[0] + b[0]) / 2, (a[1] + b[1]) / 2
            if pos_nombre:
                ox, oy = self.OFF[pos_nombre]
            else:  # a un costado del vector
                ox, oy = -uy * 13, ux * 13
            self._rotulo(mx + ox, my + oy, nombre, size=15, italic=True, que=f"vector {nombre}")

    def recta_vertical(self, x, rotulo=None, lado=1):
        x = Fraction(x)
        assert x % self.e == 0 and self.xmin <= x <= self.xmax
        X = self.X(x)
        self.el.append(f'<line class="recta" data-x="{x}" x1="{_f(X)}" y1="{_f(self.Y(self.ymax) - 6)}" '
                       f'x2="{_f(X)}" y2="{_f(self.Y(self.ymin) + 6)}" stroke-width="1.4" '
                       f'stroke-dasharray="6 4"/>')
        if rotulo:
            self._rotulo(X + 24 * lado, self.Y(self.ymax) - 2, rotulo, size=13, italic=True, que="recta")

    def recta_horizontal(self, y, rotulo=None, arriba=True):
        y = Fraction(y)
        assert y % self.e == 0 and self.ymin <= y <= self.ymax
        Y = self.Y(y)
        self.el.append(f'<line class="recta" data-y="{y}" x1="{_f(self.X(self.xmin) - 6)}" y1="{_f(Y)}" '
                       f'x2="{_f(self.X(self.xmax) + 6)}" y2="{_f(Y)}" stroke-width="1.4" '
                       f'stroke-dasharray="6 4"/>')
        if rotulo:
            self._rotulo(self.X(self.xmax) - 4, Y + (-11 if arriba else 12), rotulo, size=13,
                         italic=True, anchor="end",
                         que="recta")

    def recta_diagonal(self, pendiente, rotulo=None):
        """y = x (pendiente 1) o y = −x (pendiente −1), por el origen."""
        assert pendiente in (1, -1)
        lo = max(self.xmin, self.ymin if pendiente == 1 else -self.ymax)
        hi = min(self.xmax, self.ymax if pendiente == 1 else -self.ymin)
        a = (self.X(lo), self.Y(pendiente * lo))
        b = (self.X(hi), self.Y(pendiente * hi))
        self.el.append(f'<line class="recta" data-m="{pendiente}" x1="{_f(a[0])}" y1="{_f(a[1])}" '
                       f'x2="{_f(b[0])}" y2="{_f(b[1])}" stroke-width="1.4" stroke-dasharray="6 4"/>')
        if rotulo:
            self._rotulo(b[0] - 26, b[1] + (10 if pendiente == 1 else -10), rotulo, size=13,
                         italic=True, que="recta")

    def guias(self, x, y):
        """Segmentos punteados desde (x, y) hasta cada eje (para leer
        coordenadas en la clase)."""
        self._en_cuadricula(x, y, "guía")
        X, Y, ox, oy = self.X(x), self.Y(y), self.X(0), self.Y(0)
        if y != 0:
            self.el.append(f'<line class="guia" x1="{_f(X)}" y1="{_f(Y)}" x2="{_f(X)}" y2="{_f(oy)}" '
                           f'stroke-width="1.1" stroke-dasharray="3 3"/>')
        if x != 0:
            self.el.append(f'<line class="guia" x1="{_f(X)}" y1="{_f(Y)}" x2="{_f(ox)}" y2="{_f(Y)}" '
                           f'stroke-width="1.1" stroke-dasharray="3 3"/>')

    def segmento(self, desde, hasta, punteado=True, grosor=1.2):
        (x1, y1), (x2, y2) = desde, hasta
        self._en_cuadricula(x1, y1, "segmento")
        self._en_cuadricula(x2, y2, "segmento")
        dash = ' stroke-dasharray="4 3"' if punteado else ""
        self.el.append(f'<line class="segmento" x1="{_f(self.X(x1))}" y1="{_f(self.Y(y1))}" '
                       f'x2="{_f(self.X(x2))}" y2="{_f(self.Y(y2))}" stroke-width="{grosor}"{dash}/>')

    def texto(self, x, y, texto, size=13, italic=False):
        """Texto libre en coordenadas del plano (no tiene que caer en la cuadrícula)."""
        self._rotulo(self.X(x), self.Y(y), texto, size=size, italic=italic, que="texto")

    # --- salida ----------------------------------------------------------------

    def svg(self, aria: str, prohibido=()) -> str:
        for p in prohibido:
            assert p not in aria, f"el aria-label delata «{p}»"
        # ningún rótulo tapa un punto
        for cx, cy, n in self.puntos_px:
            for c in self.cajas:
                dentro = c[0] - 2 <= cx <= c[2] + 2 and c[1] - 2 <= cy <= c[3] + 2
                assert not dentro, f"{c[4]} tapa el punto {n}"
        cuerpo = "\n  ".join(self.el + self.txt)
        W, H = _f(self.w), _f(self.h)
        out = (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {W} {H}" width="{W}" '
               f'height="{H}" role="img" aria-label="{aria}" fill="currentColor" '
               f'font-family="{FUENTE}" stroke="currentColor" stroke-linecap="round">\n  '
               f'{cuerpo}\n</svg>\n')
        fallas = figuras.validar_svg(out, "plano")
        assert not fallas, fallas
        self._releer(out)
        return out

    def _releer(self, svg: str):
        raiz = ET.fromstring(svg)
        for e in raiz.iter():
            if e.get("class") == "punto":
                x, y = Fraction(e.get("data-x")), Fraction(e.get("data-y"))
                assert abs(float(e.get("cx")) - self.X(x)) < 0.01 and abs(float(e.get("cy")) - self.Y(y)) < 0.01, \
                    f"punto {e.get('data-nombre')} no está en ({x}, {y})"
            if e.get("class") == "figura":
                pts = [tuple(map(float, p.split(","))) for p in e.get("points").split()]
                ver = [v.split("=")[1].split(",") for v in e.get("data-vertices").split(";")]
                for (px, py), (x, y) in zip(pts, ver):
                    assert abs(px - self.X(Fraction(x))) < 0.01 and abs(py - self.Y(Fraction(y))) < 0.01


def guardar(codigo: str, svg: str, directorio: Path = AQUI) -> None:
    assert figuras.FIG_RE.match(codigo), codigo
    (directorio / f"{codigo}.svg").write_text(svg, encoding="utf-8")
