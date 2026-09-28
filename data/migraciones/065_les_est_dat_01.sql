-- =====================================================================
-- LES-EST-DAT-01 — Variables y tablas de frecuencia
-- Generado por cargar_contenido.py desde LES-EST-DAT-01.yaml
-- NO EDITAR A MANO. Se edita el YAML y se vuelve a generar.
-- =====================================================================

-- Sin begin/commit: correr con psql -X -v ON_ERROR_STOP=1 -1 -f

-- 1. items -----------------------------------------------------------
insert into items (code, stem, author_difficulty, source, status, figure_id)
select v.code, v.stem, v.difficulty, v.source, 'draft', f.id
from (values
  ($c$M1-DAT-001$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-002$c$, $c$¿Cuál de las siguientes variables es cuantitativa discreta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-003$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-004$c$, $c$¿Qué tipo de variable es el nivel educacional de una persona (básica, media o superior)?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-005$c$, $c$¿Qué tipo de variable es el número de camiseta de un jugador de fútbol?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-006$c$, $c$Considera las siguientes afirmaciones:

I. La talla de polera (S, M, L) es una variable cualitativa.

II. El número de teléfono de una persona es una variable cuantitativa.

III. La cantidad de azúcar de un queque, en gramos, es una variable discreta.

¿Cuál o cuáles son correctas?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-007$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-008$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-009$c$, $c$En un colegio se midió la estatura de $40$ estudiantes y se anotó en centímetros, redondeada al entero. La estatura más repetida fue $165$ cm. ¿Cuál afirmación es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-010$c$, $c$En un estudio se registró, para cada uno de los $50$ árboles de una plaza, su especie y su altura. ¿Cuál afirmación es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-011$c$, $c$Considera las siguientes afirmaciones:

I. El número de recorrido de un bus (por ejemplo, $210$) es una variable cualitativa.

II. La temperatura máxima de un día, anotada en grados enteros, es una variable discreta.

III. La cantidad de harina de una receta, en gramos, es una variable continua.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-012$c$, $c$Se preguntó a los $28$ estudiantes de un curso por su deporte favorito, y $12$ respondieron fútbol. ¿Cuál es la variable y de qué tipo es?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-013$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-014$c$, $c$Considera las siguientes afirmaciones:

I. Una variable cualitativa puede tener categorías ordenadas.

II. Toda variable cuyos valores son números es cuantitativa.

III. Una variable cualitativa puede ser discreta o continua.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-015$c$, $c$¿En cuál de los siguientes pares las dos variables son del mismo tipo?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-016$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-017$c$, $c$Una nutricionista registra, para cada uno de sus $60$ pacientes, el sexo, la masa en kilogramos redondeada al entero y la cantidad de comidas que hace al día. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-018$c$, $c$De cada uno de los $30$ estudiantes de un curso se registró su
estatura (en centímetros enteros) y su número de lista. Considera
las siguientes afirmaciones:

I. La estatura es continua, aunque se haya anotado en centímetros enteros.

II. El número de lista es una variable cuantitativa discreta.

III. Los $30$ estudiantes no son una variable: son los individuos del estudio.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-019$c$, $c$Una estación meteorológica registra cada día la temperatura mínima (en °C, con un decimal), la cantidad de lluvia caída (en mm) y el estado del cielo (despejado, nublado o lluvioso). ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-020$c$, $c$Tomás clasificó cuatro variables y se equivocó en una sola. ¿En cuál se equivocó?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-021$c$, $c$Considera las siguientes afirmaciones:

I. La cantidad de agua de un estanque es una variable continua.

II. El color de ojos es una variable discreta.

III. Si se pregunta a $40$ personas en qué comuna viven, la variable es la comuna.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-022$c$, $c$Una profesora registró el tiempo que tardó cada estudiante en resolver un ejercicio, redondeado al segundo, y después contó cuántos estudiantes tardaron cada tiempo. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-023$c$, $c$En un estudio sobre transporte se pregunta a $200$ personas por su medio de transporte principal, el tiempo de viaje y la cantidad de transbordos que hacen. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-024$c$, $c$¿Cuál de las siguientes afirmaciones es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-025$c$, $c$La tabla muestra la cantidad de hermanos de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de hermanos} & \text{Cantidad de estudiantes} \\
\hline 0 & 6 \\ \hline 1 & 10 \\ \hline 2 & 8 \\ \hline 3 & 4 \\ \hline 4 & 2 \\ \hline
\end{array}
$$

¿Cuántos estudiantes respondieron?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-026$c$, $c$La tabla muestra la cantidad de hermanos de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de hermanos} & \text{Cantidad de estudiantes} \\
\hline 0 & 6 \\ \hline 1 & 10 \\ \hline 2 & 8 \\ \hline 3 & 4 \\ \hline 4 & 2 \\ \hline
\end{array}
$$

¿Qué indica el número $4$ que aparece en la fila del $3$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-027$c$, $c$La tabla muestra el deporte favorito de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Deporte favorito} & \text{Cantidad de estudiantes} \\
\hline \text{Fútbol} & 14 \\ \hline \text{Básquetbol} & 8 \\ \hline \text{Vóleibol} & 5 \\ \hline \text{Natación} & 3 \\ \hline
\end{array}
$$

¿Cuál es la variable y de qué tipo es?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-028$c$, $c$Los tiempos, en minutos, que tardaron $10$ estudiantes en llegar al colegio fueron: $8,\ 12,\ 20,\ 25,\ 19,\ 30,\ 20,\ 14,\ 35,\ 22$. Si se agrupan en intervalos de $10$ minutos, ¿cuál es la frecuencia del intervalo $[20, 30)$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-029$c$, $c$La tabla muestra la cantidad de mascotas de $30$ familias, pero se borró una frecuencia.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de mascotas} & \text{Cantidad de familias} \\
\hline 0 & 9 \\ \hline 1 & 12 \\ \hline 2 & ? \\ \hline 3 & 2 \\ \hline \text{Total} & 30 \\ \hline
\end{array}
$$

¿Cuántas familias tienen $2$ mascotas?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-030$c$, $c$La tabla muestra la talla de polera de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Talla de polera} & \text{Cantidad de estudiantes} \\
\hline \text{S} & 8 \\ \hline \text{M} & 12 \\ \hline \text{L} & 7 \\ \hline \text{XL} & 3 \\ \hline
\end{array}
$$

¿Qué tipo de variable es y cuántos datos hay?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-031$c$, $c$La tabla muestra los goles marcados en los partidos de un campeonato.

$$
\begin{array}{|c|c|}
\hline \text{Goles en el partido} & \text{Cantidad de partidos} \\
\hline 0 & 3 \\ \hline 1 & 7 \\ \hline 2 & 5 \\ \hline 3 & 2 \\ \hline 4 & 2 \\ \hline 5 & 1 \\ \hline
\end{array}
$$

¿Cuál es la variable estudiada?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-032$c$, $c$La tabla muestra el tiempo que tardaron los estudiantes de un curso en resolver una guía.

$$
\begin{array}{|c|c|}
\hline \text{Tiempo (minutos)} & \text{Cantidad de estudiantes} \\
\hline [0, 10) & 4 \\ \hline [10, 20) & 9 \\ \hline [20, 30) & 12 \\ \hline [30, 40) & 5 \\ \hline
\end{array}
$$

¿Qué tipo de variable es y en qué intervalo se cuenta a un estudiante que tardó exactamente $30$ minutos?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-033$c$, $c$La tabla muestra los goles marcados en los partidos de un campeonato.

$$
\begin{array}{|c|c|}
\hline \text{Goles en el partido} & \text{Cantidad de partidos} \\
\hline 0 & 3 \\ \hline 1 & 7 \\ \hline 2 & 5 \\ \hline 3 & 2 \\ \hline 4 & 2 \\ \hline 5 & 1 \\ \hline
\end{array}
$$

¿Cuántos goles se marcaron en total y por qué?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-034$c$, $c$La tabla muestra la cantidad de mascotas de las familias de un edificio.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de mascotas} & \text{Cantidad de familias} \\
\hline 0 & 9 \\ \hline 1 & 12 \\ \hline 2 & 7 \\ \hline 3 & 2 \\ \hline
\end{array}
$$

¿Cuántas familias tienen al menos una mascota?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-035$c$, $c$La tabla muestra la cantidad de hermanos de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de hermanos} & \text{Cantidad de estudiantes} \\
\hline 0 & 6 \\ \hline 1 & 10 \\ \hline 2 & 8 \\ \hline 3 & 4 \\ \hline 4 & 2 \\ \hline
\end{array}
$$

¿Cuántos hermanos tienen, en total, los estudiantes que tienen $3$ o $4$ hermanos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-036$c$, $c$Se preguntó a $10$ familias cuántos autos tienen y respondieron: $3,\ 1,\ 2,\ 3,\ 0,\ 1,\ 3,\ 2,\ 3,\ 1$. ¿Cuál afirmación sobre la tabla de frecuencias de estos datos es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-037$c$, $c$La tabla muestra el deporte favorito de los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Deporte favorito} & \text{Cantidad de estudiantes} \\
\hline \text{Fútbol} & 14 \\ \hline \text{Básquetbol} & 8 \\ \hline \text{Vóleibol} & 5 \\ \hline \text{Natación} & 3 \\ \hline
\end{array}
$$

¿Cuál afirmación es correcta?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-038$c$, $c$Las estaturas, en cm, de $10$ personas son: $148,\ 150,\ 155,\ 160,\ 152,\ 165,\ 160,\ 158,\ 149,\ 170$. Se agrupan en los intervalos $[145, 150)$, $[150, 155)$, $[155, 160)$, $[160, 165)$ y $[165, 170]$. ¿Cuál es la frecuencia del intervalo $[150, 155)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-039$c$, $c$La tabla muestra la cantidad de mascotas de las familias de un edificio.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de mascotas} & \text{Cantidad de familias} \\
\hline 0 & 9 \\ \hline 1 & 12 \\ \hline 2 & 7 \\ \hline 3 & 2 \\ \hline
\end{array}
$$

¿Qué representa el producto $2 \cdot 7 = 14$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-040$c$, $c$La tabla muestra la masa de los recién nacidos de una clínica durante una semana.

$$
\begin{array}{|c|c|}
\hline \text{Masa (kg)} & \text{Cantidad de recién nacidos} \\
\hline [2, 3) & 5 \\ \hline [3, 4) & 18 \\ \hline [4, 5) & 7 \\ \hline
\end{array}
$$

¿Cuántos recién nacidos tuvieron una masa de al menos $3$ kg y menos de $4$ kg, y qué tipo de variable es la masa?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-041$c$, $c$Considera las siguientes afirmaciones sobre una tabla de frecuencias:

I. El total de datos es la suma de la columna de frecuencias.

II. El número de filas indica cuántos datos hay.

III. Si un dato es igual al extremo derecho de un intervalo $[a, b)$, se cuenta en el intervalo siguiente.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-042$c$, $c$La tabla muestra la cantidad de mascotas de las familias de un edificio.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de mascotas} & \text{Cantidad de familias} \\
\hline 0 & 9 \\ \hline 1 & 12 \\ \hline 2 & 7 \\ \hline 3 & 2 \\ \hline
\end{array}
$$

Un vecino dice: «En el edificio hay $32$ mascotas». ¿Tiene razón?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-043$c$, $c$Los tiempos de un grupo se agruparon en los intervalos $[0, 10)$, $[10, 20)$, $[20, 30)$ y $[30, 40)$. Un estudiante tardó exactamente $10$ minutos y otro exactamente $30$ minutos. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-044$c$, $c$La tabla muestra la cantidad de mascotas de las familias de un edificio.

$$
\begin{array}{|c|c|}
\hline \text{Cantidad de mascotas} & \text{Cantidad de familias} \\
\hline 0 & 9 \\ \hline 1 & 12 \\ \hline 2 & 7 \\ \hline 3 & 2 \\ \hline
\end{array}
$$

Considera las siguientes afirmaciones:

I. $12$ familias tienen $1$ mascota.

II. En el edificio hay $4$ familias encuestadas.

III. En total hay $32$ mascotas.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-045$c$, $c$Una tienda registró cuántos productos lleva cada boleta.

$$
\begin{array}{|c|c|}
\hline \text{Productos en la boleta} & \text{Cantidad de boletas} \\
\hline 1 & 15 \\ \hline 2 & 20 \\ \hline 3 & 10 \\ \hline 4 & 5 \\ \hline
\end{array}
$$

Si cada producto cuesta $\$1.000$, ¿cuánto dinero recibió la tienda?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-046$c$, $c$La tabla muestra los goles de $20$ partidos, pero se borró una frecuencia.

$$
\begin{array}{|c|c|}
\hline \text{Goles en el partido} & \text{Cantidad de partidos} \\
\hline 0 & 3 \\ \hline 1 & 7 \\ \hline 2 & 5 \\ \hline 3 & ? \\ \hline 4 & 2 \\ \hline 5 & 1 \\ \hline
\end{array}
$$

¿En cuántos partidos se marcaron $3$ goles?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-047$c$, $c$Los goles de un equipo en sus últimos partidos fueron: $1,\ 3,\ 0,\ 2,\ 1,\ 1,\ 4,\ 2$. ¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-048$c$, $c$La tabla muestra en qué sala estudia cada estudiante de tercero medio.

$$
\begin{array}{|c|c|}
\hline \text{Número de sala} & \text{Cantidad de estudiantes} \\
\hline 101 & 32 \\ \hline 102 & 30 \\ \hline 103 & 28 \\ \hline
\end{array}
$$

¿Cuál afirmación es correcta?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-049$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Libros leídos} & \text{Cantidad de estudiantes} \\
\hline 0 & 5 \\ \hline 1 & 9 \\ \hline 2 & 8 \\ \hline 3 & 5 \\ \hline 4 & 3 \\ \hline
\end{array}
$$

¿Cuántos estudiantes leyeron a lo sumo $2$ libros?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-050$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|c|}
\hline \text{Libros leídos} & f & F \\
\hline 0 & 5 & 5 \\ \hline 1 & 9 & 14 \\ \hline 2 & 8 & 22 \\ \hline 3 & 5 & 27 \\ \hline 4 & 3 & 30 \\ \hline
\end{array}
$$

¿Cuántos estudiantes leyeron más de $2$ libros?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-051$c$, $c$La tabla muestra la frecuencia acumulada de las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & F \\
\hline 15 & 5 \\ \hline 16 & 13 \\ \hline 17 & 19 \\ \hline 18 & 22 \\ \hline
\end{array}
$$

¿Cuántos integrantes tienen exactamente $17$ años?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-052$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|c|}
\hline \text{Libros leídos} & f & F \\
\hline 0 & 5 & 5 \\ \hline 1 & 9 & 14 \\ \hline 2 & 8 & 22 \\ \hline 3 & 5 & 27 \\ \hline 4 & 3 & 30 \\ \hline
\end{array}
$$

¿Qué indica el número $22$ de la columna $F$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-053$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Libros leídos} & \text{Cantidad de estudiantes} \\
\hline 0 & 5 \\ \hline 1 & 9 \\ \hline 2 & 8 \\ \hline 3 & 5 \\ \hline 4 & 3 \\ \hline
\end{array}
$$

¿Cuál es la frecuencia acumulada del valor $3$?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-054$c$, $c$La tabla muestra la frecuencia acumulada de los libros leídos por los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Libros leídos} & F \\
\hline 0 & 5 \\ \hline 1 & 14 \\ \hline 2 & 22 \\ \hline 3 & 27 \\ \hline 4 & 30 \\ \hline
\end{array}
$$

¿Cuántos estudiantes respondieron?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-055$c$, $c$La tabla muestra el tiempo que tardaron los estudiantes de un curso en resolver una guía.

$$
\begin{array}{|c|c|}
\hline \text{Tiempo (minutos)} & \text{Cantidad de estudiantes} \\
\hline [0, 10) & 4 \\ \hline [10, 20) & 9 \\ \hline [20, 30) & 12 \\ \hline [30, 40) & 5 \\ \hline
\end{array}
$$

¿Cuántos estudiantes tardaron menos de $20$ minutos?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-056$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|c|}
\hline \text{Libros leídos} & f & F \\
\hline 0 & 5 & 5 \\ \hline 1 & 9 & 14 \\ \hline 2 & 8 & 22 \\ \hline 3 & 5 & 27 \\ \hline 4 & 3 & 30 \\ \hline
\end{array}
$$

¿Cuántos estudiantes leyeron al menos $1$ libro?$c$, 1, $c$propio$c$::text, null::text),
  ($c$M1-DAT-057$c$, $c$La tabla muestra las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & \text{Cantidad de personas} \\
\hline 15 & 5 \\ \hline 16 & 8 \\ \hline 17 & 6 \\ \hline 18 & 3 \\ \hline
\end{array}
$$

¿Cuántos integrantes tienen menos de $17$ años?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-058$c$, $c$La tabla muestra las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & \text{Cantidad de personas} \\
\hline 15 & 5 \\ \hline 16 & 8 \\ \hline 17 & 6 \\ \hline 18 & 3 \\ \hline
\end{array}
$$

¿Cuál es la columna de frecuencias acumuladas, de $15$ a $18$ años?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-059$c$, $c$La tabla muestra el tiempo que tardaron los estudiantes de un curso en resolver una guía.

$$
\begin{array}{|c|c|c|}
\hline \text{Tiempo (minutos)} & f & F \\
\hline [0, 10) & 4 & 4 \\ \hline [10, 20) & 9 & 13 \\ \hline [20, 30) & 12 & 25 \\ \hline [30, 40) & 5 & 30 \\ \hline
\end{array}
$$

¿Cuántos estudiantes tardaron $20$ minutos o más?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-060$c$, $c$La tabla muestra la frecuencia acumulada de los atrasos de los estudiantes de un curso durante un mes.

$$
\begin{array}{|c|c|}
\hline \text{Atrasos en el mes} & F \\
\hline 0 & 12 \\ \hline 1 & 20 \\ \hline 2 & 26 \\ \hline 3 & 30 \\ \hline
\end{array}
$$

¿Cuántos estudiantes llegaron atrasados exactamente $2$ veces?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-061$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|c|}
\hline \text{Libros leídos} & f & F \\
\hline 0 & 5 & 5 \\ \hline 1 & 9 & 14 \\ \hline 2 & 8 & 22 \\ \hline 3 & 5 & 27 \\ \hline 4 & 3 & 30 \\ \hline
\end{array}
$$

Considera las siguientes afirmaciones:

I. $22$ estudiantes leyeron a lo sumo $2$ libros.

II. $22$ estudiantes leyeron menos de $2$ libros.

III. $8$ estudiantes leyeron más de $2$ libros.

¿Cuál o cuáles son correctas?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-062$c$, $c$La tabla muestra la frecuencia acumulada de las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & F \\
\hline 15 & 5 \\ \hline 16 & 13 \\ \hline 17 & 19 \\ \hline 18 & 22 \\ \hline
\end{array}
$$

¿Cuántos integrantes tienen entre $16$ y $18$ años, ambos incluidos?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-063$c$, $c$La tabla muestra el tiempo que tardaron los estudiantes de un curso en resolver una guía.

$$
\begin{array}{|c|c|}
\hline \text{Tiempo (minutos)} & \text{Cantidad de estudiantes} \\
\hline [0, 10) & 4 \\ \hline [10, 20) & 9 \\ \hline [20, 30) & 12 \\ \hline [30, 40) & 5 \\ \hline
\end{array}
$$

¿Cuál es la frecuencia acumulada del intervalo $[20, 30)$?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-064$c$, $c$La tabla muestra la frecuencia acumulada de las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & F \\
\hline 15 & 5 \\ \hline 16 & 13 \\ \hline 17 & 19 \\ \hline 18 & 22 \\ \hline
\end{array}
$$

¿Cuántos integrantes tienen más de $15$ años?$c$, 2, $c$propio$c$::text, null::text),
  ($c$M1-DAT-065$c$, $c$La tabla muestra las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & \text{Cantidad de personas} \\
\hline 15 & 5 \\ \hline 16 & 8 \\ \hline 17 & 6 \\ \hline 18 & 3 \\ \hline
\end{array}
$$

Considera las siguientes afirmaciones:

I. La frecuencia acumulada de $18$ años es igual al total de integrantes.

II. La frecuencia acumulada de $17$ años es $f(17) + f(16)$.

III. $19$ integrantes tienen menos de $17$ años.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-066$c$, $c$La tabla muestra la frecuencia acumulada de las notas, enteras de $4$ a $7$, de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Nota} & F \\
\hline 4 & 8 \\ \hline 5 & 20 \\ \hline 6 & 33 \\ \hline 7 & 40 \\ \hline
\end{array}
$$

¿Cuántos estudiantes obtuvieron nota $5$ o $6$?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-067$c$, $c$Un consultorio registró cuánto esperaron sus pacientes en un día.

$$
\begin{array}{|c|c|}
\hline \text{Espera (minutos)} & \text{Cantidad de pacientes} \\
\hline [0, 15) & 8 \\ \hline [15, 30) & 14 \\ \hline [30, 45) & 10 \\ \hline [45, 60) & 3 \\ \hline
\end{array}
$$

Un paciente puede presentar un reclamo si esperó $30$ minutos o más. ¿Cuántos pacientes pueden reclamar?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-068$c$, $c$La tabla muestra cuántos libros leyeron en el verano los estudiantes de un curso.

$$
\begin{array}{|c|c|}
\hline \text{Libros leídos} & \text{Cantidad de estudiantes} \\
\hline 0 & 5 \\ \hline 1 & 9 \\ \hline 2 & 8 \\ \hline 3 & 5 \\ \hline 4 & 3 \\ \hline
\end{array}
$$

Tomás construyó la columna de frecuencias acumuladas así: $5,\ 14,\ 17,\ 13,\ 8$. ¿Qué error cometió?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-069$c$, $c$La tabla muestra el tiempo que tardaron los estudiantes de un curso en resolver una guía.

$$
\begin{array}{|c|c|c|}
\hline \text{Tiempo (minutos)} & f & F \\
\hline [0, 10) & 4 & 4 \\ \hline [10, 20) & 9 & 13 \\ \hline [20, 30) & 12 & 25 \\ \hline [30, 40) & 5 & 30 \\ \hline
\end{array}
$$

Considera las siguientes afirmaciones:

I. $13$ estudiantes tardaron menos de $20$ minutos.

II. $25$ estudiantes tardaron $20$ minutos o más.

III. $12$ estudiantes tardaron menos de $30$ minutos.

¿Cuál o cuáles son correctas?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-070$c$, $c$En una biblioteca se registró cuántos libros pidió cada uno de sus $50$ socios en un mes. En la fila de $2$ libros, la frecuencia es $12$ y la frecuencia acumulada es $32$. ¿Cuántos socios pidieron menos de $2$ libros?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-071$c$, $c$La tabla muestra las edades de los integrantes de un taller.

$$
\begin{array}{|c|c|}
\hline \text{Edad (años)} & \text{Cantidad de personas} \\
\hline 15 & 5 \\ \hline 16 & 8 \\ \hline 17 & 6 \\ \hline 18 & 3 \\ \hline
\end{array}
$$

Para un campeonato solo pueden inscribirse quienes tengan menos de $17$ años. ¿Cuántos integrantes del taller **no** pueden inscribirse?$c$, 3, $c$propio$c$::text, null::text),
  ($c$M1-DAT-072$c$, $c$En cualquier tabla de frecuencias ordenada de menor a mayor, ¿a qué corresponde la frecuencia acumulada del último valor?$c$, 3, $c$propio$c$::text, null::text)
) as v(code, stem, difficulty, source, fig_code)
left join figures f on f.code = v.fig_code
on conflict (code) do update
  set stem = excluded.stem,
      author_difficulty = excluded.author_difficulty,
      source = excluded.source,
      figure_id = excluded.figure_id;

-- 2. item_options — la señal diagnóstica -----------------------------
-- Upsert sobre (item_id, label), que ya tiene índice único.
-- No se borra: responses.option_id apunta acá con on delete restrict,
-- y el delete rompería la publicación apenas exista una respuesta.
insert into item_options (item_id, label, body, is_correct, misconception_id)
select i.id, v.label, v.body, v.is_correct, m.id
from (values
  ($c$M1-DAT-001$c$, $c$A$c$, $c$La cantidad de mascotas de una familia es una variable cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-001$c$, $c$B$c$, $c$El número de RUT de una persona es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-001$c$, $c$C$c$, $c$El nivel de inglés de una persona (básico, intermedio o avanzado) es una variable cuantitativa.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-001$c$, $c$D$c$, $c$El color de un auto es una variable discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-002$c$, $c$A$c$, $c$La talla de polera (S, M, L o XL).$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-002$c$, $c$B$c$, $c$La estatura de una persona, anotada en centímetros enteros.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-002$c$, $c$C$c$, $c$La cantidad de hermanos de una persona.$c$, true, null),
  ($c$M1-DAT-002$c$, $c$D$c$, $c$El número de camiseta de un jugador.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-003$c$, $c$A$c$, $c$El código postal de una casa es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-003$c$, $c$B$c$, $c$El tiempo que tarda un corredor en recorrer $100$ metros es una variable continua.$c$, true, null),
  ($c$M1-DAT-003$c$, $c$C$c$, $c$La cantidad de lluvia caída en un día es una variable discreta.$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-003$c$, $c$D$c$, $c$La masa de una persona, anotada en kilogramos enteros, es una variable discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-004$c$, $c$A$c$, $c$Discreta, porque tiene categorías separadas.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-004$c$, $c$B$c$, $c$Cuantitativa, porque sus categorías se pueden ordenar.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-004$c$, $c$C$c$, $c$Cuantitativa, porque se puede codificar como $1$, $2$ y $3$.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-004$c$, $c$D$c$, $c$Cualitativa, aunque sus categorías tengan un orden.$c$, true, null),
  ($c$M1-DAT-005$c$, $c$A$c$, $c$Cuantitativa discreta, porque sus valores son números enteros.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-005$c$, $c$B$c$, $c$Cualitativa, porque el número solo identifica al jugador.$c$, true, null),
  ($c$M1-DAT-005$c$, $c$C$c$, $c$Cuantitativa, porque los números se pueden ordenar.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-005$c$, $c$D$c$, $c$Cualitativa y discreta, porque cada jugador tiene un número distinto.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-006$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-DAT-006$c$, $c$B$c$, $c$Ninguna de ellas$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-006$c$, $c$C$c$, $c$Solo I y III$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-006$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-007$c$, $c$A$c$, $c$El número de la sala donde estudia un curso es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-007$c$, $c$B$c$, $c$La marca de celular que usa una persona es una variable discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-007$c$, $c$C$c$, $c$La marca de celular que usa una persona es una variable cualitativa.$c$, true, null),
  ($c$M1-DAT-007$c$, $c$D$c$, $c$La duración de una canción, en segundos enteros, es una variable discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-008$c$, $c$A$c$, $c$El número de serie de un computador es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-008$c$, $c$B$c$, $c$El nivel de picante de una salsa (suave, medio o fuerte) es una variable cuantitativa.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-008$c$, $c$C$c$, $c$La cantidad de leche que produce una vaca en un día es una variable discreta.$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-008$c$, $c$D$c$, $c$El tiempo que demora un bus entre dos paraderos es una variable continua.$c$, true, null),
  ($c$M1-DAT-009$c$, $c$A$c$, $c$La variable es la estatura, y es cuantitativa discreta, porque se anotó en centímetros enteros.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-009$c$, $c$B$c$, $c$La variable es $165$ cm, la estatura más repetida.$c$, false, $c$DAT-VAR-VALOR$c$),
  ($c$M1-DAT-009$c$, $c$C$c$, $c$La variable son los $40$ estudiantes.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-009$c$, $c$D$c$, $c$La variable es la estatura, y es cuantitativa continua.$c$, true, null),
  ($c$M1-DAT-010$c$, $c$A$c$, $c$Las variables son «pino» y «$15$ metros».$c$, false, $c$DAT-VAR-VALOR$c$),
  ($c$M1-DAT-010$c$, $c$B$c$, $c$Las variables son los $50$ árboles de la plaza.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-010$c$, $c$C$c$, $c$La especie es cualitativa y la altura es cuantitativa continua.$c$, true, null),
  ($c$M1-DAT-010$c$, $c$D$c$, $c$La especie es cualitativa discreta y la altura es cuantitativa continua.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-011$c$, $c$A$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-011$c$, $c$B$c$, $c$I, II y III$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-011$c$, $c$C$c$, $c$Solo III$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-011$c$, $c$D$c$, $c$Solo I$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-012$c$, $c$A$c$, $c$El fútbol, que es una variable cualitativa.$c$, false, $c$DAT-VAR-VALOR$c$),
  ($c$M1-DAT-012$c$, $c$B$c$, $c$El deporte favorito de cada estudiante, que es una variable cualitativa.$c$, true, null),
  ($c$M1-DAT-012$c$, $c$C$c$, $c$Los $28$ estudiantes, que son una variable cuantitativa discreta.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-012$c$, $c$D$c$, $c$El deporte favorito de cada estudiante, que es una variable cualitativa discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-013$c$, $c$A$c$, $c$El género literario favorito de una persona es una variable discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-013$c$, $c$B$c$, $c$Si $12$ estudiantes leyeron $3$ libros, la variable es «$3$ libros».$c$, false, $c$DAT-VAR-VALOR$c$),
  ($c$M1-DAT-013$c$, $c$C$c$, $c$Si se registra cuántos libros leyó cada estudiante de un curso, la variable son los estudiantes.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-013$c$, $c$D$c$, $c$Si se registra cuántos libros leyó cada estudiante de un curso, la variable es cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-014$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-DAT-014$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-014$c$, $c$C$c$, $c$Solo I y II$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-014$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-015$c$, $c$A$c$, $c$Número de camiseta y cantidad de goles en un partido.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-015$c$, $c$B$c$, $c$Nivel de inglés y cantidad de idiomas que habla una persona.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-015$c$, $c$C$c$, $c$Cantidad de hermanos y cantidad de goles en un partido.$c$, true, null),
  ($c$M1-DAT-015$c$, $c$D$c$, $c$Cantidad de lluvia caída y cantidad de hermanos.$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-016$c$, $c$A$c$, $c$El número de pasaporte de una persona es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-016$c$, $c$B$c$, $c$El puntaje obtenido en una prueba de $60$ preguntas es una variable cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-016$c$, $c$C$c$, $c$El sabor de helado favorito de una persona es una variable discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-016$c$, $c$D$c$, $c$La duración de una llamada, anotada en minutos enteros, es una variable discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-017$c$, $c$A$c$, $c$La masa es cuantitativa continua y la cantidad de comidas es cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-017$c$, $c$B$c$, $c$El sexo es discreto, la masa es continua y la cantidad de comidas es discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-017$c$, $c$C$c$, $c$Las variables del estudio son los $60$ pacientes.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-017$c$, $c$D$c$, $c$La masa y la cantidad de comidas son cuantitativas discretas.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-018$c$, $c$A$c$, $c$Solo III$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-018$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-018$c$, $c$C$c$, $c$Solo I$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-018$c$, $c$D$c$, $c$I, II y III$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-019$c$, $c$A$c$, $c$Hay dos variables continuas y una discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-019$c$, $c$B$c$, $c$Las variables son los días del año en que se midió.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-019$c$, $c$C$c$, $c$Hay una variable continua, una discreta y una cualitativa.$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-019$c$, $c$D$c$, $c$Hay dos variables cuantitativas continuas y una cualitativa.$c$, true, null),
  ($c$M1-DAT-020$c$, $c$A$c$, $c$Estatura, anotada en centímetros enteros: cuantitativa continua.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-020$c$, $c$B$c$, $c$Nivel educacional de una persona: cualitativa.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-020$c$, $c$C$c$, $c$Código postal de una casa: cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-020$c$, $c$D$c$, $c$Cantidad de lluvia caída en un día: cuantitativa continua.$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-021$c$, $c$A$c$, $c$Solo III$c$, false, $c$DAT-VAR-CANTIDAD$c$),
  ($c$M1-DAT-021$c$, $c$B$c$, $c$I, II y III$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-021$c$, $c$C$c$, $c$Solo I$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-021$c$, $c$D$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-022$c$, $c$A$c$, $c$La variable es cuántos estudiantes tardaron cada tiempo.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-022$c$, $c$B$c$, $c$La variable es el tiempo, y es cuantitativa discreta, porque se anotó en segundos enteros.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-022$c$, $c$C$c$, $c$La variable es el tiempo, y es cuantitativa continua.$c$, true, null),
  ($c$M1-DAT-022$c$, $c$D$c$, $c$La variable son los estudiantes del curso.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-023$c$, $c$A$c$, $c$Hay una variable cualitativa, una cuantitativa continua y una cuantitativa discreta.$c$, true, null),
  ($c$M1-DAT-023$c$, $c$B$c$, $c$La variable es cuántas personas usan cada medio de transporte.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-023$c$, $c$C$c$, $c$Hay dos variables discretas y una continua.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-023$c$, $c$D$c$, $c$Hay $200$ variables, una por cada persona.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-024$c$, $c$A$c$, $c$La distancia de la casa al colegio, anotada en kilómetros enteros, es una variable discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-024$c$, $c$B$c$, $c$La cantidad de estudiantes presentes en una clase es una variable discreta.$c$, true, null),
  ($c$M1-DAT-024$c$, $c$C$c$, $c$El número de la línea de metro que usa una persona es una variable cuantitativa.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-024$c$, $c$D$c$, $c$Si $8$ estudiantes llegan en bus al colegio, la variable del estudio es $8$.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-025$c$, $c$A$c$, $c$$5$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-025$c$, $c$B$c$, $c$$46$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-025$c$, $c$C$c$, $c$$10$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-025$c$, $c$D$c$, $c$$30$$c$, true, null),
  ($c$M1-DAT-026$c$, $c$A$c$, $c$Que $4$ estudiantes tienen $3$ hermanos.$c$, true, null),
  ($c$M1-DAT-026$c$, $c$B$c$, $c$Que la variable del estudio vale $4$ en esa fila.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-026$c$, $c$C$c$, $c$Que los estudiantes con $3$ hermanos suman $4$ hermanos entre todos.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-026$c$, $c$D$c$, $c$Que $3$ estudiantes tienen $4$ hermanos.$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-027$c$, $c$A$c$, $c$El deporte favorito, que es una variable cualitativa discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-027$c$, $c$B$c$, $c$Los $30$ estudiantes, que son una variable cuantitativa discreta.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-027$c$, $c$C$c$, $c$El deporte favorito, que es una variable cualitativa.$c$, true, null),
  ($c$M1-DAT-027$c$, $c$D$c$, $c$La cantidad de estudiantes por deporte, que es cuantitativa discreta.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-028$c$, $c$A$c$, $c$$3$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-028$c$, $c$B$c$, $c$$4$$c$, true, null),
  ($c$M1-DAT-028$c$, $c$C$c$, $c$$2$$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-028$c$, $c$D$c$, $c$$87$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-029$c$, $c$A$c$, $c$$2$$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-029$c$, $c$B$c$, $c$$12$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-029$c$, $c$C$c$, $c$$26$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-029$c$, $c$D$c$, $c$$7$$c$, true, null),
  ($c$M1-DAT-030$c$, $c$A$c$, $c$Cualitativa; hay $30$ datos.$c$, true, null),
  ($c$M1-DAT-030$c$, $c$B$c$, $c$Cualitativa; hay $4$ datos.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-030$c$, $c$C$c$, $c$Cualitativa discreta; hay $30$ datos.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-030$c$, $c$D$c$, $c$Cuantitativa; hay $30$ datos.$c$, false, $c$DAT-VAR-ORDINAL$c$),
  ($c$M1-DAT-031$c$, $c$A$c$, $c$$1$ gol, el resultado más frecuente.$c$, false, $c$DAT-VAR-VALOR$c$),
  ($c$M1-DAT-031$c$, $c$B$c$, $c$La cantidad de partidos.$c$, false, $c$DAT-VAR-FRECUENCIA$c$),
  ($c$M1-DAT-031$c$, $c$C$c$, $c$La cantidad de goles marcados en cada partido.$c$, true, null),
  ($c$M1-DAT-031$c$, $c$D$c$, $c$Los $20$ partidos del campeonato.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-032$c$, $c$A$c$, $c$Cuantitativa continua; en $[20, 30)$.$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-032$c$, $c$B$c$, $c$Cuantitativa continua; en $[30, 40)$.$c$, true, null),
  ($c$M1-DAT-032$c$, $c$C$c$, $c$Cualitativa discreta, porque está agrupada en intervalos; en $[30, 40)$.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-032$c$, $c$D$c$, $c$Cuantitativa discreta; en $[30, 40)$.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-033$c$, $c$A$c$, $c$$6$, porque hay seis cantidades distintas de goles.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-033$c$, $c$B$c$, $c$$20$, porque se suman las cantidades de partidos.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-033$c$, $c$C$c$, $c$$36$, porque cada cantidad de goles se multiplica por su cantidad de partidos y se suma.$c$, true, null),
  ($c$M1-DAT-033$c$, $c$D$c$, $c$$15$, porque se suman las cantidades de goles.$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-034$c$, $c$A$c$, $c$$21$$c$, true, null),
  ($c$M1-DAT-034$c$, $c$B$c$, $c$$32$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-034$c$, $c$C$c$, $c$$6$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-034$c$, $c$D$c$, $c$$3$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-035$c$, $c$A$c$, $c$$2$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-035$c$, $c$B$c$, $c$$7$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-035$c$, $c$C$c$, $c$$6$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-035$c$, $c$D$c$, $c$$20$$c$, true, null),
  ($c$M1-DAT-036$c$, $c$A$c$, $c$La tabla muestra $4$ datos.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-036$c$, $c$B$c$, $c$El valor $3$ tiene frecuencia $4$.$c$, true, null),
  ($c$M1-DAT-036$c$, $c$C$c$, $c$El valor $3$ tiene frecuencia $12$.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-036$c$, $c$D$c$, $c$El valor $4$ tiene frecuencia $3$.$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-037$c$, $c$A$c$, $c$Respondieron $30$ estudiantes y la variable son esos estudiantes.$c$, false, $c$DAT-VAR-POBLACION$c$),
  ($c$M1-DAT-037$c$, $c$B$c$, $c$Respondieron $4$ estudiantes y la variable es cualitativa.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-037$c$, $c$C$c$, $c$Respondieron $30$ estudiantes y la variable es discreta.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-037$c$, $c$D$c$, $c$Respondieron $30$ estudiantes y la variable es cualitativa.$c$, true, null),
  ($c$M1-DAT-038$c$, $c$A$c$, $c$$150$$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-038$c$, $c$B$c$, $c$$2$$c$, true, null),
  ($c$M1-DAT-038$c$, $c$C$c$, $c$$3$$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-038$c$, $c$D$c$, $c$$302$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-039$c$, $c$A$c$, $c$La cantidad de valores distintos que tiene la tabla.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-039$c$, $c$B$c$, $c$La cantidad de familias que tienen $2$ mascotas.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-039$c$, $c$C$c$, $c$La cantidad total de mascotas de las familias que tienen $2$ mascotas.$c$, true, null),
  ($c$M1-DAT-039$c$, $c$D$c$, $c$Que $14$ familias tienen $2$ mascotas.$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-040$c$, $c$A$c$, $c$$18$; cuantitativa continua.$c$, true, null),
  ($c$M1-DAT-040$c$, $c$B$c$, $c$$5$; cuantitativa continua.$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-040$c$, $c$C$c$, $c$$18$; cuantitativa discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-040$c$, $c$D$c$, $c$$3$; cuantitativa continua.$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-041$c$, $c$A$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-041$c$, $c$B$c$, $c$Solo II y III$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-041$c$, $c$C$c$, $c$Solo I$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-041$c$, $c$D$c$, $c$Solo III$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-042$c$, $c$A$c$, $c$No: hay $6$, que es $0 + 1 + 2 + 3$.$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-042$c$, $c$B$c$, $c$No: hay $4$, uno por cada fila.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-042$c$, $c$C$c$, $c$No: hay $30$, que es la suma de las familias.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-042$c$, $c$D$c$, $c$Sí: $0 \cdot 9 + 1 \cdot 12 + 2 \cdot 7 + 3 \cdot 2 = 32$.$c$, true, null),
  ($c$M1-DAT-043$c$, $c$A$c$, $c$El primero se cuenta en $[10, 20)$, el segundo en $[30, 40)$, y la variable es discreta.$c$, false, $c$DAT-VAR-ENTERO$c$),
  ($c$M1-DAT-043$c$, $c$B$c$, $c$El primero se cuenta en $[10, 20)$, el segundo en $[30, 40)$, y la variable es cualitativa, porque quedó en categorías.$c$, false, $c$DAT-VAR-DISCATEG$c$),
  ($c$M1-DAT-043$c$, $c$C$c$, $c$El primero se cuenta en $[10, 20)$, el segundo en $[30, 40)$, y la variable es continua.$c$, true, null),
  ($c$M1-DAT-043$c$, $c$D$c$, $c$El primero se cuenta en $[0, 10)$, el segundo en $[20, 30)$, y la variable es continua.$c$, false, $c$TAB-ABS-LIMITE$c$),
  ($c$M1-DAT-044$c$, $c$A$c$, $c$Solo I$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-044$c$, $c$B$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-044$c$, $c$C$c$, $c$I, II y III$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-044$c$, $c$D$c$, $c$Solo III$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-045$c$, $c$A$c$, $c$$\$10.000$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-045$c$, $c$B$c$, $c$$\$105.000$$c$, true, null),
  ($c$M1-DAT-045$c$, $c$C$c$, $c$$\$50.000$$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-045$c$, $c$D$c$, $c$$\$4.000$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-046$c$, $c$A$c$, $c$$2$$c$, true, null),
  ($c$M1-DAT-046$c$, $c$B$c$, $c$$15$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-046$c$, $c$C$c$, $c$$3$$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-046$c$, $c$D$c$, $c$$8$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-047$c$, $c$A$c$, $c$Marcó $10$ goles en $8$ partidos.$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-047$c$, $c$B$c$, $c$Marcó $14$ goles en $5$ partidos.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-047$c$, $c$C$c$, $c$Marcó $14$ goles en $8$ partidos.$c$, true, null),
  ($c$M1-DAT-047$c$, $c$D$c$, $c$Marcó $8$ goles en $14$ partidos.$c$, false, $c$TAB-ABS-SUMAF$c$),
  ($c$M1-DAT-048$c$, $c$A$c$, $c$La variable es cualitativa y hay $3$ estudiantes.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-048$c$, $c$B$c$, $c$La variable es cuantitativa discreta y hay $90$ estudiantes.$c$, false, $c$DAT-VAR-NUMERO$c$),
  ($c$M1-DAT-048$c$, $c$C$c$, $c$La variable es cualitativa y hay $306$ estudiantes.$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-048$c$, $c$D$c$, $c$La variable es cualitativa y hay $90$ estudiantes.$c$, true, null),
  ($c$M1-DAT-049$c$, $c$A$c$, $c$$22$$c$, true, null),
  ($c$M1-DAT-049$c$, $c$B$c$, $c$$8$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-049$c$, $c$C$c$, $c$$14$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-049$c$, $c$D$c$, $c$$17$$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-050$c$, $c$A$c$, $c$$5$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-050$c$, $c$B$c$, $c$$22$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-050$c$, $c$C$c$, $c$$16$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-050$c$, $c$D$c$, $c$$8$$c$, true, null),
  ($c$M1-DAT-051$c$, $c$A$c$, $c$$19$$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-051$c$, $c$B$c$, $c$$13$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-051$c$, $c$C$c$, $c$$6$$c$, true, null),
  ($c$M1-DAT-051$c$, $c$D$c$, $c$$17$$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-052$c$, $c$A$c$, $c$Que $22$ estudiantes leyeron más de $2$ libros.$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-052$c$, $c$B$c$, $c$Que $22$ estudiantes leyeron $2$ libros o menos.$c$, true, null),
  ($c$M1-DAT-052$c$, $c$C$c$, $c$Que $22$ estudiantes leyeron exactamente $2$ libros.$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-052$c$, $c$D$c$, $c$Que $22$ estudiantes leyeron menos de $2$ libros.$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-053$c$, $c$A$c$, $c$$27$$c$, true, null),
  ($c$M1-DAT-053$c$, $c$B$c$, $c$$22$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-053$c$, $c$C$c$, $c$$13$$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-053$c$, $c$D$c$, $c$$5$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-054$c$, $c$A$c$, $c$$5$$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-054$c$, $c$B$c$, $c$$10$$c$, false, $c$TAB-ABS-SUMAX$c$),
  ($c$M1-DAT-054$c$, $c$C$c$, $c$$30$$c$, true, null),
  ($c$M1-DAT-054$c$, $c$D$c$, $c$$98$$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-055$c$, $c$A$c$, $c$$25$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-055$c$, $c$B$c$, $c$$9$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-055$c$, $c$C$c$, $c$$17$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-055$c$, $c$D$c$, $c$$13$$c$, true, null),
  ($c$M1-DAT-056$c$, $c$A$c$, $c$$14$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-056$c$, $c$B$c$, $c$$25$$c$, true, null),
  ($c$M1-DAT-056$c$, $c$C$c$, $c$$16$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-056$c$, $c$D$c$, $c$$9$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-057$c$, $c$A$c$, $c$$9$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-057$c$, $c$B$c$, $c$$8$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-057$c$, $c$C$c$, $c$$13$$c$, true, null),
  ($c$M1-DAT-057$c$, $c$D$c$, $c$$19$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-058$c$, $c$A$c$, $c$$5,\ 13,\ 14,\ 9$$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-058$c$, $c$B$c$, $c$$5,\ 8,\ 6,\ 3$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-058$c$, $c$C$c$, $c$$22,\ 17,\ 9,\ 3$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-058$c$, $c$D$c$, $c$$5,\ 13,\ 19,\ 22$$c$, true, null),
  ($c$M1-DAT-059$c$, $c$A$c$, $c$$17$$c$, true, null),
  ($c$M1-DAT-059$c$, $c$B$c$, $c$$5$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-059$c$, $c$C$c$, $c$$13$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-059$c$, $c$D$c$, $c$$12$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-060$c$, $c$A$c$, $c$$26$$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-060$c$, $c$B$c$, $c$$6$$c$, true, null),
  ($c$M1-DAT-060$c$, $c$C$c$, $c$$20$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-060$c$, $c$D$c$, $c$$2$$c$, false, $c$TAB-ABS-COLUMNA$c$),
  ($c$M1-DAT-061$c$, $c$A$c$, $c$I, II y III$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-061$c$, $c$B$c$, $c$Solo I$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-061$c$, $c$C$c$, $c$Solo I y III$c$, true, null),
  ($c$M1-DAT-061$c$, $c$D$c$, $c$Solo III$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-062$c$, $c$A$c$, $c$$17$$c$, true, null),
  ($c$M1-DAT-062$c$, $c$B$c$, $c$$9$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-062$c$, $c$C$c$, $c$$54$$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-062$c$, $c$D$c$, $c$$22$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-063$c$, $c$A$c$, $c$$12$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-063$c$, $c$B$c$, $c$$25$$c$, true, null),
  ($c$M1-DAT-063$c$, $c$C$c$, $c$$21$$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-063$c$, $c$D$c$, $c$$13$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-064$c$, $c$A$c$, $c$$5$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-064$c$, $c$B$c$, $c$$8$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-064$c$, $c$C$c$, $c$$22$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-064$c$, $c$D$c$, $c$$17$$c$, true, null),
  ($c$M1-DAT-065$c$, $c$A$c$, $c$Solo I$c$, true, null),
  ($c$M1-DAT-065$c$, $c$B$c$, $c$Solo I y III$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-065$c$, $c$C$c$, $c$Ninguna de ellas$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-065$c$, $c$D$c$, $c$Solo I y II$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-066$c$, $c$A$c$, $c$$33$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-066$c$, $c$B$c$, $c$$25$$c$, true, null),
  ($c$M1-DAT-066$c$, $c$C$c$, $c$$13$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-066$c$, $c$D$c$, $c$$53$$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-067$c$, $c$A$c$, $c$$10$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-067$c$, $c$B$c$, $c$$3$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-067$c$, $c$C$c$, $c$$13$$c$, true, null),
  ($c$M1-DAT-067$c$, $c$D$c$, $c$$22$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-068$c$, $c$A$c$, $c$No cometió ningún error.$c$, false, $c$TAB-ACUM-PAR$c$),
  ($c$M1-DAT-068$c$, $c$B$c$, $c$Debió copiar la columna de frecuencias, sin sumar.$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-068$c$, $c$C$c$, $c$Debió sumar solo las filas anteriores, sin incluir la propia.$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-068$c$, $c$D$c$, $c$Sumó a cada frecuencia solo la de la fila anterior, en vez de todas las anteriores.$c$, true, null),
  ($c$M1-DAT-069$c$, $c$A$c$, $c$Solo I y II$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-069$c$, $c$B$c$, $c$Solo III$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-069$c$, $c$C$c$, $c$Solo I$c$, true, null),
  ($c$M1-DAT-069$c$, $c$D$c$, $c$Ninguna de ellas$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-070$c$, $c$A$c$, $c$$12$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-070$c$, $c$B$c$, $c$$20$$c$, true, null),
  ($c$M1-DAT-070$c$, $c$C$c$, $c$$18$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-070$c$, $c$D$c$, $c$$32$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-071$c$, $c$A$c$, $c$$9$$c$, true, null),
  ($c$M1-DAT-071$c$, $c$B$c$, $c$$13$$c$, false, $c$TAB-ACUM-COMPLEMENTO$c$),
  ($c$M1-DAT-071$c$, $c$C$c$, $c$$6$$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-071$c$, $c$D$c$, $c$$3$$c$, false, $c$TAB-ACUM-BORDE$c$),
  ($c$M1-DAT-072$c$, $c$A$c$, $c$A la cantidad de valores distintos.$c$, false, $c$TAB-ABS-FILAS$c$),
  ($c$M1-DAT-072$c$, $c$B$c$, $c$A la suma de todas las frecuencias acumuladas.$c$, false, $c$TAB-ACUM-FCOMOF$c$),
  ($c$M1-DAT-072$c$, $c$C$c$, $c$A la frecuencia del último valor.$c$, false, $c$TAB-ACUM-SOLOF$c$),
  ($c$M1-DAT-072$c$, $c$D$c$, $c$Al total de datos.$c$, true, null)
) as v(item_code, label, body, is_correct, mc_code)
join items i on i.code = v.item_code
left join misconceptions m on m.code = v.mc_code
on conflict (item_id, label) do update
  set body = excluded.body,
      is_correct = excluded.is_correct,
      misconception_id = excluded.misconception_id;

-- 3. node_items — un ítem, un nodo ----------------------------------
-- do nothing a propósito: si el ítem ya vive en otro nodo, NO se mueve.
-- Moverlo reescribe a qué nodo cuentan sus respuestas históricas.
-- La verificación del final revienta si el nodo no coincide.
insert into node_items (node_id, item_id)
select n.id, i.id
from (values
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-001$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-002$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-003$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-004$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-005$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-006$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-007$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-008$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-009$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-010$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-011$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-012$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-013$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-014$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-015$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-016$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-017$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-018$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-019$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-020$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-021$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-022$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-023$c$),
  ($c$EST-DAT-VAR$c$, $c$M1-DAT-024$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-025$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-026$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-027$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-028$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-029$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-030$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-031$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-032$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-033$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-034$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-035$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-036$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-037$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-038$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-039$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-040$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-041$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-042$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-043$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-044$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-045$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-046$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-047$c$),
  ($c$EST-TAB-ABS$c$, $c$M1-DAT-048$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-049$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-050$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-051$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-052$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-053$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-054$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-055$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-056$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-057$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-058$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-059$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-060$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-061$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-062$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-063$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-064$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-065$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-066$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-067$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-068$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-069$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-070$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-071$c$),
  ($c$EST-TAB-ACUM$c$, $c$M1-DAT-072$c$)
) as v(node_code, item_code)
join nodes n on n.code = v.node_code
join items i on i.code = v.item_code
on conflict do nothing;

-- 4. remediations ----------------------------------------------------
insert into remediations (code, misconception_id, title, body, status)
select v.code, m.id, v.title, v.body, 'draft'
from (values
  ($c$REM-DAT-VAR-NUMERO$c$, $c$DAT-VAR-NUMERO$c$, $c$Un número que solo identifica no es una cantidad$c$, $c$Clasificaste como cuantitativa una variable solo porque sus valores
se escriben con números. Por ejemplo, dijiste que el número de
pasaporte es cuantitativo.

**Una variable es cuantitativa si sus valores miden o cuentan algo.
Si el número solo sirve para identificar, la variable es
cualitativa.**

La prueba: ¿tiene sentido sumar o promediar esos valores? La suma de
dos números de pasaporte no significa nada, como tampoco el promedio
de los números de las micros. En cambio, la suma de dos cantidades de
hijos sí tiene sentido.

Lo mismo si una categoría se codifica: anotar «1 = sí, 2 = no» no
convierte la respuesta en una cantidad.

Un control rápido: reemplaza el número por un nombre. Si la variable
sigue funcionando igual, era una etiqueta.$c$),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$DAT-VAR-ORDINAL$c$, $c$Tener orden no es ser una cantidad$c$, $c$Clasificaste como cuantitativa una variable porque sus categorías
tienen un orden. Por ejemplo, dijiste que el nivel de picante de una
salsa (suave, medio, fuerte) es cuantitativo.

**Si los valores son categorías, la variable es cualitativa, aunque
esas categorías se puedan ordenar.**

Suave, medio y fuerte van de menos a más, pero no son cantidades: no
se puede decir cuánto más picante es «fuerte» que «medio», ni sumar
un «suave» con un «medio».

Lo mismo pasa con las tallas S, M y L o con «insuficiente, suficiente,
bueno». Ordenadas, sí. Medidas, no.

Un control rápido: pregúntate si podrías calcular un promedio. Si la
respuesta sería una palabra y no un número, es cualitativa.$c$),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$DAT-VAR-ENTERO$c$, $c$Continua depende de qué se mide, no de cómo se anota$c$, $c$Decidiste que una variable era discreta porque sus datos se anotaron
sin decimales. Por ejemplo, dijiste que el tiempo en segundos enteros
es discreto.

**Una variable es continua si lo que mide puede tomar cualquier valor
dentro de un intervalo, aunque al anotarlo se redondee.**

El tiempo corre de manera continua: entre $12$ y $13$ segundos hay
$12{,}5$, $12{,}51$ y muchos más. Que alguien lo haya anotado como
$12$ es una decisión de quien mide, no una propiedad del tiempo.

Discreta es la que se obtiene contando: goles, personas, pasajeros.
Ahí entre $12$ y $13$ no hay nada.

Un control rápido: pregúntate si se obtiene contando o midiendo con
un instrumento. Si se mide, es continua.$c$),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$DAT-VAR-CANTIDAD$c$, $c$Contar es discreto; medir es continuo$c$, $c$Decidiste que una variable era discreta porque su nombre empieza con
«cantidad de». Por ejemplo, dijiste que la cantidad de combustible de
un estanque es discreta.

**La palabra «cantidad» no decide. Lo que decide es si el valor se
obtiene contando (discreta) o midiendo (continua).**

- Cantidad de hijos: se cuentan. Discreta.
- Cantidad de combustible: se mide en litros y puede ser $31{,}7$ L.
  Continua.

Muchas magnitudes que se miden se nombran como «cantidad»: de agua, de
lluvia, de azúcar. Todas son continuas.

Un control rápido: piensa si puede haber un valor entre dos valores
seguidos. Si puede haber $31{,}7$ entre $31$ y $32$, es continua.$c$),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$DAT-VAR-DISCATEG$c$, $c$Discreta y continua son solo para cantidades$c$, $c$Llamaste discreta a una variable cualitativa. Por ejemplo, dijiste
que la marca de un auto es una variable discreta porque tiene
categorías separadas.

**Primero se decide si la variable es cualitativa o cuantitativa. Solo
las cuantitativas se dividen en discretas y continuas.**

- Cualitativa: sus valores son categorías (marca, color, comuna). No
  es discreta ni continua.
- Cuantitativa discreta: se cuenta (cantidad de autos de una familia).
- Cuantitativa continua: se mide (velocidad de un auto).

Que las categorías estén separadas no las vuelve «discretas»: esa
palabra habla de números.

Un control rápido: si la variable es cualitativa, ya terminaste de
clasificarla.$c$),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$DAT-VAR-POBLACION$c$, $c$La variable es lo que se pregunta, no a quién$c$, $c$Respondiste con los individuos del estudio en vez de con la variable.
Por ejemplo, para una encuesta a $50$ vecinos sobre su color favorito,
dijiste que la variable eran los $50$ vecinos.

**Los individuos son a quienes se estudia. La variable es la
característica que se registra de cada uno.**

En esa encuesta:

- individuos: los $50$ vecinos;
- variable: el color favorito;
- valores: rojo, azul, verde...

Una pista: la variable siempre se puede escribir como «el/la ___ de
cada vecino». «Los vecinos de cada vecino» no tiene sentido; «el color
favorito de cada vecino» sí.

Un control rápido: si tu respuesta es un grupo de personas u objetos,
eso es a quién se estudió, no qué se midió.$c$),
  ($c$REM-DAT-VAR-VALOR$c$, $c$DAT-VAR-VALOR$c$, $c$Una respuesta no es la variable$c$, $c$Nombraste un valor de la variable como si fuera la variable. Por
ejemplo, en una encuesta sobre el color favorito, dijiste que la
variable es «azul».

**La variable es la característica completa; cada respuesta es solo
uno de sus valores.**

«Azul» es lo que respondió alguien. La variable es lo que se le
preguntó a todos: el color favorito. Otros respondieron rojo o verde,
y todas esas respuestas son valores de la misma variable.

Aunque «azul» sea la respuesta más repetida, sigue siendo un valor.

Un control rápido: la variable tiene que servir para todos los
individuos. Si tu respuesta solo describe a algunos, es un valor.$c$),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$DAT-VAR-FRECUENCIA$c$, $c$Cuántos responden algo no es la variable$c$, $c$Confundiste la variable con cuántos individuos tienen cada valor. Por
ejemplo, dijiste que la variable es «cuántos vecinos prefieren cada
color».

**La variable es lo que se registra de cada individuo. Contar cuántos
tienen cada valor es un paso posterior: la frecuencia.**

A cada vecino se le pregunta su color favorito. Eso es la variable.
Después, al ordenar los datos, cuentas: $12$ eligieron azul, $8$ rojo.
Esos conteos son frecuencias, y van en la tabla, no en la definición de
la variable.

Un control rápido: la variable se puede preguntar a una sola persona.
«¿Cuántos prefieren azul?» no se le puede preguntar a un individuo.$c$),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$TAB-ABS-COLUMNA$c$, $c$A la izquierda el valor, a la derecha cuántos$c$, $c$Leíste la columna equivocada. Por ejemplo, en una tabla donde la fila
«$2$ | $9$» indica que $9$ personas tienen $2$ bicicletas, dijiste que
$2$ personas tienen $9$.

**En una tabla de frecuencias, la primera columna tiene los valores de
la variable y la segunda cuántas veces aparece cada valor.**

Lee cada fila completa, como una frase: «$9$ personas tienen $2$
bicicletas». El valor es lo que tienen; la frecuencia es cuántos lo
tienen.

Si te preguntan «¿cuántas personas...?», la respuesta está en la
columna de frecuencias. Si te preguntan «¿qué cantidad de
bicicletas...?», está en la columna de valores.

Un control rápido: pon las unidades. «$9$ personas» y «$2$ bicicletas»
no se pueden intercambiar.$c$),
  ($c$REM-TAB-ABS-FILAS$c$, $c$TAB-ABS-FILAS$c$, $c$Los datos se cuentan sumando frecuencias, no filas$c$, $c$Contaste las filas de la tabla como si fueran los datos. Por ejemplo,
en una tabla con $3$ valores distintos dijiste que había $3$ datos.

**El total de datos es la suma de las frecuencias. Cada fila agrupa a
todos los que tienen el mismo valor.**

Si una tabla dice:

$$1 \to 6 \qquad 2 \to 9 \qquad 3 \to 5$$

hay tres valores distintos, pero $6 + 9 + 5 = 20$ datos: $20$
personas respondieron. Las filas indican cuántas respuestas
**distintas** hubo, no cuántas personas respondieron.

Un control rápido: el total de datos tiene que ser al menos tan grande
como la mayor frecuencia de la tabla.$c$),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$TAB-ABS-SUMAX$c$, $c$Cada valor cuenta tantas veces como su frecuencia$c$, $c$Sumaste los valores de la variable sin mirar sus frecuencias. Por
ejemplo, en una tabla de bicicletas por hogar con valores $0, 1, 2$ y
$3$, dijiste que el total era $0 + 1 + 2 + 3 = 6$.

**Para saber cuántos datos hay, se suman las frecuencias. Para saber
cuánto suma la variable, cada valor se multiplica por su frecuencia.**

Si $7$ hogares tienen $2$ bicicletas, esos hogares aportan
$2 \cdot 7 = 14$ bicicletas, no $2$. El valor $2$ se repite $7$
veces.

Sumar solo la columna de valores trata cada valor como si lo tuviera
un solo individuo.

Un control rápido: si en tu cálculo no aparece ninguna frecuencia, te
faltó la mitad de la tabla.$c$),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$TAB-ABS-SUMAF$c$, $c$Cuántos datos hay no es cuánto suman$c$, $c$Confundiste la cantidad de datos con la suma de sus valores. Por
ejemplo, a «¿cuántas bicicletas hay en total?» respondiste con la
cantidad de hogares.

**Sumar las frecuencias da cuántos individuos hay. Sumar valor por
frecuencia da el total de la variable.**

Con la tabla

$$0 \to 4 \qquad 1 \to 8 \qquad 2 \to 6$$

hay $4 + 8 + 6 = 18$ hogares, y
$0 \cdot 4 + 1 \cdot 8 + 2 \cdot 6 = 20$ bicicletas. Son dos
preguntas distintas con dos respuestas distintas.

Un control rápido: fíjate en qué cuenta la pregunta. Si pregunta por
personas u hogares, suma frecuencias. Si pregunta por lo que tienen,
multiplica y suma.$c$),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$TAB-ABS-LIMITE$c$, $c$El intervalo [a, b) incluye a y deja fuera b$c$, $c$Ubicaste un dato del borde en el intervalo equivocado. Por ejemplo,
pusiste una carrera de $50$ minutos en el intervalo $[40, 50)$.

**En un intervalo $[a, b)$ el corchete incluye al $a$ y el paréntesis
deja fuera al $b$.**

$[40, 50)$ son los tiempos desde $40$ minutos hasta **antes** de $50$.
Una carrera de exactamente $50$ minutos va en el intervalo siguiente,
$[50, 60)$.

Así, cada dato cae en un solo intervalo. Si el $50$ fuera en los dos,
se contaría dos veces.

Un control rápido: el número del borde siempre pertenece al intervalo
que **empieza** con él.$c$),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$TAB-ACUM-BORDE$c$, $c$Decide primero si el valor del borde entra$c$, $c$Contaste el valor del borde cuando no correspondía, o lo dejaste fuera
cuando sí. Por ejemplo, para «menos de $3$ hijos» usaste $F(3)$.

**«Menos de» y «más de» dejan fuera el borde. «A lo sumo» y «al
menos» lo incluyen.**

Con $k = 3$:

- menos de $3$: $0$, $1$ o $2$ hijos. Es $F(2)$.
- a lo sumo $3$: $0$, $1$, $2$ o $3$. Es $F(3)$.
- más de $3$: $4$ o más. Es $n - F(3)$.
- al menos $3$: $3$ o más. Es $n - F(2)$.

Un control rápido: antes de mirar la tabla, escribe la lista de
valores que entran. Así no dependes de la palabra.$c$),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$TAB-ACUM-SOLOF$c$, $c$A lo sumo es acumular, no leer una fila$c$, $c$Respondiste con la frecuencia de un solo valor cuando la pregunta
incluía varios. Por ejemplo, para «a lo sumo $2$ hijos» diste solo los
que tienen exactamente $2$.

**«A lo sumo $2$» incluye a los que tienen $0$, $1$ y $2$. Hay que
sumar todas esas frecuencias, que es justamente la acumulada $F(2)$.**

Si $f(0) = 4$, $f(1) = 10$ y $f(2) = 7$, entonces a lo sumo $2$ hijos
tienen

$$4 + 10 + 7 = 21$$

familias, no $7$.

Un control rápido: si la pregunta usa «a lo sumo», «menos de», «más
de» o «al menos», la respuesta casi nunca es una sola frecuencia.$c$),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$TAB-ACUM-COMPLEMENTO$c$, $c$La acumulada cuenta hacia abajo$c$, $c$Usaste la frecuencia acumulada para una pregunta sobre los valores
mayores. Por ejemplo, para «más de $2$ hijos» respondiste $F(2)$.

**$F(k)$ cuenta los datos menores o iguales a $k$. Para los mayores,
se resta del total: más de $k$ es $n - F(k)$.**

Si hay $35$ familias y $F(2) = 21$, entonces $21$ familias tienen $2$
hijos o menos. Las que tienen más de $2$ son las demás:

$$35 - 21 = 14$$

Un control rápido: si la pregunta es por los que tienen más, y tu
respuesta es una $F$ sin restar, estás contando a los que tienen menos.$c$),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$TAB-ACUM-FCOMOF$c$, $c$Para un solo valor, se resta la acumulada anterior$c$, $c$Leíste una frecuencia acumulada como si fuera la de un solo valor. Por
ejemplo, con $F(2) = 21$ dijiste que $21$ familias tienen exactamente
$2$ hijos.

**$F(2)$ incluye a todos los que tienen $2$ o menos. Los que tienen
exactamente $2$ son $F(2) - F(1)$.**

Si $F(1) = 14$ y $F(2) = 21$, las que tienen exactamente $2$ hijos son

$$21 - 14 = 7$$

Por la misma razón, sumar la columna $F$ no da el total: cada familia
quedaría contada varias veces. El total es la última $F$.

Un control rápido: si la tabla solo tiene $F$, cualquier pregunta por
un valor exacto se responde con una resta.$c$),
  ($c$REM-TAB-ACUM-PAR$c$, $c$TAB-ACUM-PAR$c$, $c$La acumulada suma todas las filas anteriores$c$, $c$Para construir $F$ sumaste solo la frecuencia de la fila con la de la
fila anterior. Por ejemplo, con $f = 4, 10, 7, 3$ escribiste
$F = 4, 14, 17, 10$.

**Cada $F$ es la suma de todas las frecuencias desde la primera fila
hasta la suya. Dicho de otra forma: el $F$ anterior más el $f$ de la
fila.**

$$F = 4, \quad 4 + 10 = 14, \quad 14 + 7 = 21, \quad 21 + 3 = 24$$

La acumulada nunca baja: cada fila agrega gente, no la quita. Si tu
columna $F$ baja en algún momento, sumaste solo un par de filas.

Un control rápido: la última $F$ tiene que ser igual al total de
datos.$c$)
) as v(code, mc_code, title, body)
join misconceptions m on m.code = v.mc_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      -- solo sube versión si el texto cambió de verdad
      version = remediations.version
                + (excluded.body is distinct from remediations.body)::int;

delete from remediation_items where remediation_id in (
  select id from remediations where code in ($c$REM-DAT-VAR-NUMERO$c$, $c$REM-DAT-VAR-ORDINAL$c$, $c$REM-DAT-VAR-ENTERO$c$, $c$REM-DAT-VAR-CANTIDAD$c$, $c$REM-DAT-VAR-DISCATEG$c$, $c$REM-DAT-VAR-POBLACION$c$, $c$REM-DAT-VAR-VALOR$c$, $c$REM-DAT-VAR-FRECUENCIA$c$, $c$REM-TAB-ABS-COLUMNA$c$, $c$REM-TAB-ABS-FILAS$c$, $c$REM-TAB-ABS-SUMAX$c$, $c$REM-TAB-ABS-SUMAF$c$, $c$REM-TAB-ABS-LIMITE$c$, $c$REM-TAB-ACUM-BORDE$c$, $c$REM-TAB-ACUM-SOLOF$c$, $c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$REM-TAB-ACUM-FCOMOF$c$, $c$REM-TAB-ACUM-PAR$c$)
);
insert into remediation_items (remediation_id, item_id, position)
select r.id, i.id, v.position
from (values
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-004$c$, 1::smallint),
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-005$c$, 2::smallint),
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-014$c$, 3::smallint),
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-015$c$, 4::smallint),
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-024$c$, 5::smallint),
  ($c$REM-DAT-VAR-NUMERO$c$, $c$M1-DAT-048$c$, 6::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-004$c$, 1::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-005$c$, 2::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-006$c$, 3::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-014$c$, 4::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-015$c$, 5::smallint),
  ($c$REM-DAT-VAR-ORDINAL$c$, $c$M1-DAT-020$c$, 6::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-003$c$, 1::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-007$c$, 2::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-011$c$, 3::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-016$c$, 4::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-020$c$, 5::smallint),
  ($c$REM-DAT-VAR-ENTERO$c$, $c$M1-DAT-022$c$, 6::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-006$c$, 1::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-008$c$, 2::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-011$c$, 3::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-015$c$, 4::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-020$c$, 5::smallint),
  ($c$REM-DAT-VAR-CANTIDAD$c$, $c$M1-DAT-021$c$, 6::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-007$c$, 1::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-013$c$, 2::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-014$c$, 3::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-021$c$, 4::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-023$c$, 5::smallint),
  ($c$REM-DAT-VAR-DISCATEG$c$, $c$M1-DAT-027$c$, 6::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-012$c$, 1::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-013$c$, 2::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-019$c$, 3::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-021$c$, 4::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-027$c$, 5::smallint),
  ($c$REM-DAT-VAR-POBLACION$c$, $c$M1-DAT-031$c$, 6::smallint),
  ($c$REM-DAT-VAR-VALOR$c$, $c$M1-DAT-009$c$, 1::smallint),
  ($c$REM-DAT-VAR-VALOR$c$, $c$M1-DAT-010$c$, 2::smallint),
  ($c$REM-DAT-VAR-VALOR$c$, $c$M1-DAT-012$c$, 3::smallint),
  ($c$REM-DAT-VAR-VALOR$c$, $c$M1-DAT-013$c$, 4::smallint),
  ($c$REM-DAT-VAR-VALOR$c$, $c$M1-DAT-031$c$, 5::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-022$c$, 1::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-023$c$, 2::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-024$c$, 3::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-026$c$, 4::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-027$c$, 5::smallint),
  ($c$REM-DAT-VAR-FRECUENCIA$c$, $c$M1-DAT-031$c$, 6::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-029$c$, 1::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-039$c$, 2::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-040$c$, 3::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-044$c$, 4::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-046$c$, 5::smallint),
  ($c$REM-TAB-ABS-COLUMNA$c$, $c$M1-DAT-051$c$, 6::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-028$c$, 1::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-030$c$, 2::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-035$c$, 3::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-036$c$, 4::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-045$c$, 5::smallint),
  ($c$REM-TAB-ABS-FILAS$c$, $c$M1-DAT-046$c$, 6::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-029$c$, 1::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-034$c$, 2::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-035$c$, 3::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-045$c$, 4::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-046$c$, 5::smallint),
  ($c$REM-TAB-ABS-SUMAX$c$, $c$M1-DAT-054$c$, 6::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-026$c$, 1::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-028$c$, 2::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-035$c$, 3::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-036$c$, 4::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-044$c$, 5::smallint),
  ($c$REM-TAB-ABS-SUMAF$c$, $c$M1-DAT-045$c$, 6::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-028$c$, 1::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-032$c$, 2::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-038$c$, 3::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-040$c$, 4::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-041$c$, 5::smallint),
  ($c$REM-TAB-ABS-LIMITE$c$, $c$M1-DAT-043$c$, 6::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-052$c$, 1::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-053$c$, 2::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-061$c$, 3::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-062$c$, 4::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-068$c$, 5::smallint),
  ($c$REM-TAB-ACUM-BORDE$c$, $c$M1-DAT-069$c$, 6::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-053$c$, 1::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-055$c$, 2::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-059$c$, 3::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-061$c$, 4::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-069$c$, 5::smallint),
  ($c$REM-TAB-ACUM-SOLOF$c$, $c$M1-DAT-070$c$, 6::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-052$c$, 1::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-055$c$, 2::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-059$c$, 3::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-061$c$, 4::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-069$c$, 5::smallint),
  ($c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$M1-DAT-070$c$, 6::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-052$c$, 1::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-054$c$, 2::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-060$c$, 3::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-062$c$, 4::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-066$c$, 5::smallint),
  ($c$REM-TAB-ACUM-FCOMOF$c$, $c$M1-DAT-072$c$, 6::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-049$c$, 1::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-053$c$, 2::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-058$c$, 3::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-063$c$, 4::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-065$c$, 5::smallint),
  ($c$REM-TAB-ACUM-PAR$c$, $c$M1-DAT-068$c$, 6::smallint)
) as v(rem_code, item_code, position)
join remediations r on r.code = v.rem_code
join items i on i.code = v.item_code;

-- 5. lesson ----------------------------------------------------------
insert into lessons (code, unit_id, title, body, position, status)
select v.code, u.id, v.title, v.body, v.position, 'draft'
from (values
  ($c$LES-EST-DAT-01$c$, $c$EST-DAT$c$, $c$Variables y tablas de frecuencia$c$, $c$Antes de calcular cualquier cosa con datos hay que saber qué se midió y
ordenarlo. Esta clase es ese primer paso: reconocer el tipo de variable
y armar y leer tablas de frecuencia, que es de donde salen los gráficos,
los promedios y la mediana.

## Tipos de variables

### Individuos y variable

En un estudio se observa a un grupo de **individuos** (personas,
árboles, días, partidos) y de cada uno se registra una característica:
esa característica es la **variable**. Lo que se anota de cada individuo
es un **valor** de la variable.

Si se pregunta a los $40$ trabajadores de una empresa qué fruta
prefieren, los individuos son los trabajadores, la variable es la fruta
preferida, y «manzana» o «plátano» son valores. La variable no son los
$40$ trabajadores, ni «manzana», ni cuántos eligieron manzana.

### Cualitativa o cuantitativa

**Una variable es cuantitativa si sus valores son cantidades: tiene
sentido sumarlos o sacar su promedio. Si sus valores son categorías, es
cualitativa.**

- Cualitativas: fruta preferida, signo zodiacal, país de nacimiento.
- Cuantitativas: cantidad de primos, tiempo de espera, largo de un pez.

Cuidado con dos trampas:

- **Un número que solo identifica es cualitativo.** El número de un
  carnet de biblioteca o el de un departamento son etiquetas: sumar dos
  de ellos no mide nada.
- **Tener orden no convierte en cantidad.** El tamaño de un café (chico,
  mediano, grande) está ordenado, pero sigue siendo una categoría: la
  variable es cualitativa.

### Discreta o continua

Esta división es **solo para variables cuantitativas**. Una variable
cualitativa no es discreta ni continua.

- **Discreta**: se obtiene contando. Entre dos valores seguidos no hay
  otros posibles: cantidad de primos, goles, pasajeros.
- **Continua**: se obtiene midiendo. Puede tomar cualquier valor dentro
  de un intervalo: tiempo, largo, masa, temperatura.

Lo que decide es qué se mide, no cómo se anotó. El largo de un pez sigue
siendo continuo aunque lo anotes en milímetros enteros: el pez puede
medir $212{,}4$ mm, solo que redondeaste. Y la palabra «cantidad» no
decide nada: la cantidad de jugo de un vaso se mide, así que es
continua.

## Frecuencia absoluta

### De los datos a la tabla

La **frecuencia absoluta** de un valor es cuántas veces aparece. Se
anota $f$. Si se pregunta a $25$ familias cuántos celulares hay en su
casa, la tabla queda así:

$$
\begin{array}{|c|c|}
\hline \text{Celulares en la casa} & \text{Cantidad de familias } (f) \\
\hline 1 & 3 \\ \hline 2 & 7 \\ \hline 3 & 11 \\ \hline 4 & 4 \\ \hline
\end{array}
$$

**La columna de la izquierda son los valores; la de la derecha, cuántas
veces aparece cada uno.** La fila «$3$ | $11$» dice que $11$ familias
tienen $3$ celulares, no al revés.

### Cuántos datos hay y cuánto suman

Son dos preguntas distintas:

- **Cuántos datos hay** ($n$): se suman las frecuencias.
  $3 + 7 + 11 + 4 = 25$ familias. No es el número de filas ($4$) ni la
  suma de los valores ($1 + 2 + 3 + 4$).
- **Cuánto suma la variable**: cada valor se multiplica por su
  frecuencia y se suma. En total hay
  $1 \cdot 3 + 2 \cdot 7 + 3 \cdot 11 + 4 \cdot 4 = 66$ celulares.

Si falta una frecuencia y conoces $n$, réstale a $n$ las frecuencias
conocidas.

### Datos agrupados en intervalos

Cuando la variable es continua o tiene muchos valores, se agrupa en
intervalos. **$[a, b)$ incluye al $a$ y no incluye al $b$**. En una
tabla de distancias con intervalos $[0, 2)$, $[2, 4)$, $[4, 6)$, una
distancia de exactamente $4$ km va en $[4, 6)$, no en $[2, 4)$.

## Frecuencia acumulada

### Qué es

La **frecuencia acumulada** $F$ de un valor es cuántos datos son
**menores o iguales** a ese valor. Se obtiene sumando las frecuencias
desde la primera fila hasta esa:

$$
\begin{array}{|c|c|c|}
\hline \text{Celulares} & f & F \\
\hline 1 & 3 & 3 \\ \hline 2 & 7 & 10 \\ \hline 3 & 11 & 21 \\ \hline 4 & 4 & 25 \\ \hline
\end{array}
$$

**Cada $F$ es el $F$ anterior más el $f$ de su fila.** No es la suma de
las dos últimas frecuencias: $F(3) = 3 + 7 + 11$, no $7 + 11$. La última
$F$ siempre es el total de datos.

El $21$ de la tabla se lee: $21$ familias tienen $3$ celulares **o
menos**. No «exactamente $3$».

### Traducir la pregunta

Este es el paso donde más se equivoca. Antes de mirar la tabla, decide si
el valor del borde entra:

- «a lo sumo $2$», «como máximo $2$», «$2$ o menos»: entra el $2$. Es
  $F(2) = 10$.
- «menos de $2$»: no entra el $2$. Es $F(1) = 3$.
- «más de $2$»: no entra el $2$. Es $n - F(2) = 25 - 10 = 15$.
- «al menos $2$», «$2$ o más»: entra el $2$. Es $n - F(1) = 25 - 3 = 22$.

La acumulada cuenta **hacia abajo** (los valores menores). Si la pregunta
es por los mayores, hay que restar del total.

### Volver a la frecuencia absoluta

Si solo tienes $F$, la frecuencia de un valor es su $F$ menos el $F$
anterior: los que tienen exactamente $3$ celulares son
$F(3) - F(2) = 21 - 10 = 11$.$c$, 1::smallint)
) as v(code, unit_code, title, body, position)
join units u on u.code = v.unit_code
on conflict (code) do update
  set title = excluded.title,
      body  = excluded.body,
      version = lessons.version
                + (excluded.body is distinct from lessons.body)::int;

insert into lesson_nodes (lesson_id, node_id, position, anchor)
select l.id, n.id, v.position, v.anchor
from (values
  ($c$LES-EST-DAT-01$c$, $c$EST-DAT-VAR$c$, 1::smallint, $c$tipos-de-variables$c$),
  ($c$LES-EST-DAT-01$c$, $c$EST-TAB-ABS$c$, 2::smallint, $c$frecuencia-absoluta$c$),
  ($c$LES-EST-DAT-01$c$, $c$EST-TAB-ACUM$c$, 3::smallint, $c$frecuencia-acumulada$c$)
) as v(lesson_code, node_code, position, anchor)
join lessons l on l.code = v.lesson_code
join nodes n on n.code = v.node_code
on conflict (lesson_id, node_id) do update
  set position = excluded.position, anchor = excluded.anchor;

-- 6. Verificación. Si algo no cuadra, revienta y no commitea. -------
do $verif$
declare c integer; t text;
begin
  select count(*) into c from items where code in ($c$M1-DAT-001$c$, $c$M1-DAT-002$c$, $c$M1-DAT-003$c$, $c$M1-DAT-004$c$, $c$M1-DAT-005$c$, $c$M1-DAT-006$c$, $c$M1-DAT-007$c$, $c$M1-DAT-008$c$, $c$M1-DAT-009$c$, $c$M1-DAT-010$c$, $c$M1-DAT-011$c$, $c$M1-DAT-012$c$, $c$M1-DAT-013$c$, $c$M1-DAT-014$c$, $c$M1-DAT-015$c$, $c$M1-DAT-016$c$, $c$M1-DAT-017$c$, $c$M1-DAT-018$c$, $c$M1-DAT-019$c$, $c$M1-DAT-020$c$, $c$M1-DAT-021$c$, $c$M1-DAT-022$c$, $c$M1-DAT-023$c$, $c$M1-DAT-024$c$, $c$M1-DAT-025$c$, $c$M1-DAT-026$c$, $c$M1-DAT-027$c$, $c$M1-DAT-028$c$, $c$M1-DAT-029$c$, $c$M1-DAT-030$c$, $c$M1-DAT-031$c$, $c$M1-DAT-032$c$, $c$M1-DAT-033$c$, $c$M1-DAT-034$c$, $c$M1-DAT-035$c$, $c$M1-DAT-036$c$, $c$M1-DAT-037$c$, $c$M1-DAT-038$c$, $c$M1-DAT-039$c$, $c$M1-DAT-040$c$, $c$M1-DAT-041$c$, $c$M1-DAT-042$c$, $c$M1-DAT-043$c$, $c$M1-DAT-044$c$, $c$M1-DAT-045$c$, $c$M1-DAT-046$c$, $c$M1-DAT-047$c$, $c$M1-DAT-048$c$, $c$M1-DAT-049$c$, $c$M1-DAT-050$c$, $c$M1-DAT-051$c$, $c$M1-DAT-052$c$, $c$M1-DAT-053$c$, $c$M1-DAT-054$c$, $c$M1-DAT-055$c$, $c$M1-DAT-056$c$, $c$M1-DAT-057$c$, $c$M1-DAT-058$c$, $c$M1-DAT-059$c$, $c$M1-DAT-060$c$, $c$M1-DAT-061$c$, $c$M1-DAT-062$c$, $c$M1-DAT-063$c$, $c$M1-DAT-064$c$, $c$M1-DAT-065$c$, $c$M1-DAT-066$c$, $c$M1-DAT-067$c$, $c$M1-DAT-068$c$, $c$M1-DAT-069$c$, $c$M1-DAT-070$c$, $c$M1-DAT-071$c$, $c$M1-DAT-072$c$);
  if c <> 72 then
    raise exception 'items: se esperaban 72, hay %', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-DAT-001$c$, $c$M1-DAT-002$c$, $c$M1-DAT-003$c$, $c$M1-DAT-004$c$, $c$M1-DAT-005$c$, $c$M1-DAT-006$c$, $c$M1-DAT-007$c$, $c$M1-DAT-008$c$, $c$M1-DAT-009$c$, $c$M1-DAT-010$c$, $c$M1-DAT-011$c$, $c$M1-DAT-012$c$, $c$M1-DAT-013$c$, $c$M1-DAT-014$c$, $c$M1-DAT-015$c$, $c$M1-DAT-016$c$, $c$M1-DAT-017$c$, $c$M1-DAT-018$c$, $c$M1-DAT-019$c$, $c$M1-DAT-020$c$, $c$M1-DAT-021$c$, $c$M1-DAT-022$c$, $c$M1-DAT-023$c$, $c$M1-DAT-024$c$, $c$M1-DAT-025$c$, $c$M1-DAT-026$c$, $c$M1-DAT-027$c$, $c$M1-DAT-028$c$, $c$M1-DAT-029$c$, $c$M1-DAT-030$c$, $c$M1-DAT-031$c$, $c$M1-DAT-032$c$, $c$M1-DAT-033$c$, $c$M1-DAT-034$c$, $c$M1-DAT-035$c$, $c$M1-DAT-036$c$, $c$M1-DAT-037$c$, $c$M1-DAT-038$c$, $c$M1-DAT-039$c$, $c$M1-DAT-040$c$, $c$M1-DAT-041$c$, $c$M1-DAT-042$c$, $c$M1-DAT-043$c$, $c$M1-DAT-044$c$, $c$M1-DAT-045$c$, $c$M1-DAT-046$c$, $c$M1-DAT-047$c$, $c$M1-DAT-048$c$, $c$M1-DAT-049$c$, $c$M1-DAT-050$c$, $c$M1-DAT-051$c$, $c$M1-DAT-052$c$, $c$M1-DAT-053$c$, $c$M1-DAT-054$c$, $c$M1-DAT-055$c$, $c$M1-DAT-056$c$, $c$M1-DAT-057$c$, $c$M1-DAT-058$c$, $c$M1-DAT-059$c$, $c$M1-DAT-060$c$, $c$M1-DAT-061$c$, $c$M1-DAT-062$c$, $c$M1-DAT-063$c$, $c$M1-DAT-064$c$, $c$M1-DAT-065$c$, $c$M1-DAT-066$c$, $c$M1-DAT-067$c$, $c$M1-DAT-068$c$, $c$M1-DAT-069$c$, $c$M1-DAT-070$c$, $c$M1-DAT-071$c$, $c$M1-DAT-072$c$);
  if c <> 288 then
    raise exception 'item_options: se esperaban 288, hay %', c; end if;

  select count(*) into c
    from (values
      ($c$M1-DAT-001$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-002$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-003$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-004$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-005$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-006$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-007$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-008$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-009$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-010$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-011$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-012$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-013$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-014$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-015$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-016$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-017$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-018$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-019$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-020$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-021$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-022$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-023$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-024$c$, $c$EST-DAT-VAR$c$),
      ($c$M1-DAT-025$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-026$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-027$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-028$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-029$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-030$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-031$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-032$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-033$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-034$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-035$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-036$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-037$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-038$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-039$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-040$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-041$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-042$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-043$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-044$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-045$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-046$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-047$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-048$c$, $c$EST-TAB-ABS$c$),
      ($c$M1-DAT-049$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-050$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-051$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-052$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-053$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-054$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-055$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-056$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-057$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-058$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-059$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-060$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-061$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-062$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-063$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-064$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-065$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-066$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-067$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-068$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-069$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-070$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-071$c$, $c$EST-TAB-ACUM$c$),
      ($c$M1-DAT-072$c$, $c$EST-TAB-ACUM$c$)
    ) as v(item_code, node_code)
    join items i        on i.code = v.item_code
    join node_items ni  on ni.item_id = i.id
    join nodes n        on n.id = ni.node_id and n.code = v.node_code;
  if c <> 72 then
    raise exception 'node_items: 72 ítems, solo % en el nodo que declara el YAML. O el nodo no existe, o el ítem ya vivía en otro nodo (moverlo es una migración a mano)', c; end if;

  select count(*) into c from item_options io
    join items i on i.id = io.item_id
   where i.code in ($c$M1-DAT-001$c$, $c$M1-DAT-002$c$, $c$M1-DAT-003$c$, $c$M1-DAT-004$c$, $c$M1-DAT-005$c$, $c$M1-DAT-006$c$, $c$M1-DAT-007$c$, $c$M1-DAT-008$c$, $c$M1-DAT-009$c$, $c$M1-DAT-010$c$, $c$M1-DAT-011$c$, $c$M1-DAT-012$c$, $c$M1-DAT-013$c$, $c$M1-DAT-014$c$, $c$M1-DAT-015$c$, $c$M1-DAT-016$c$, $c$M1-DAT-017$c$, $c$M1-DAT-018$c$, $c$M1-DAT-019$c$, $c$M1-DAT-020$c$, $c$M1-DAT-021$c$, $c$M1-DAT-022$c$, $c$M1-DAT-023$c$, $c$M1-DAT-024$c$, $c$M1-DAT-025$c$, $c$M1-DAT-026$c$, $c$M1-DAT-027$c$, $c$M1-DAT-028$c$, $c$M1-DAT-029$c$, $c$M1-DAT-030$c$, $c$M1-DAT-031$c$, $c$M1-DAT-032$c$, $c$M1-DAT-033$c$, $c$M1-DAT-034$c$, $c$M1-DAT-035$c$, $c$M1-DAT-036$c$, $c$M1-DAT-037$c$, $c$M1-DAT-038$c$, $c$M1-DAT-039$c$, $c$M1-DAT-040$c$, $c$M1-DAT-041$c$, $c$M1-DAT-042$c$, $c$M1-DAT-043$c$, $c$M1-DAT-044$c$, $c$M1-DAT-045$c$, $c$M1-DAT-046$c$, $c$M1-DAT-047$c$, $c$M1-DAT-048$c$, $c$M1-DAT-049$c$, $c$M1-DAT-050$c$, $c$M1-DAT-051$c$, $c$M1-DAT-052$c$, $c$M1-DAT-053$c$, $c$M1-DAT-054$c$, $c$M1-DAT-055$c$, $c$M1-DAT-056$c$, $c$M1-DAT-057$c$, $c$M1-DAT-058$c$, $c$M1-DAT-059$c$, $c$M1-DAT-060$c$, $c$M1-DAT-061$c$, $c$M1-DAT-062$c$, $c$M1-DAT-063$c$, $c$M1-DAT-064$c$, $c$M1-DAT-065$c$, $c$M1-DAT-066$c$, $c$M1-DAT-067$c$, $c$M1-DAT-068$c$, $c$M1-DAT-069$c$, $c$M1-DAT-070$c$, $c$M1-DAT-071$c$, $c$M1-DAT-072$c$)
     and not io.is_correct and io.misconception_id is null;
  if c <> 0 then
    raise exception '% distractores sin misconception', c; end if;

  select count(*) into c from misconceptions
   where code in ($c$DAT-VAR-CANTIDAD$c$, $c$DAT-VAR-DISCATEG$c$, $c$DAT-VAR-ENTERO$c$, $c$DAT-VAR-FRECUENCIA$c$, $c$DAT-VAR-NUMERO$c$, $c$DAT-VAR-ORDINAL$c$, $c$DAT-VAR-POBLACION$c$, $c$DAT-VAR-VALOR$c$, $c$TAB-ABS-COLUMNA$c$, $c$TAB-ABS-FILAS$c$, $c$TAB-ABS-LIMITE$c$, $c$TAB-ABS-SUMAF$c$, $c$TAB-ABS-SUMAX$c$, $c$TAB-ACUM-BORDE$c$, $c$TAB-ACUM-COMPLEMENTO$c$, $c$TAB-ACUM-FCOMOF$c$, $c$TAB-ACUM-PAR$c$, $c$TAB-ACUM-SOLOF$c$)
     and node_id is null;
  if c <> 0 then
    raise exception '% errores sin nodo donde se ensenan', c; end if;

  -- Toda figura referenciada en la base (ítems, clases, remediaciones)
  -- tiene que existir en figures y seguir en contenido/figuras/.
  -- Si alguien borró el .svg, el contenido deja de poder regenerarse.
  with refs as (
    select f.code::text as code from items i join figures f on f.id = i.figure_id
    union
    select m[1] from lessons l, regexp_matches(l.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
    union
    select m[1] from remediations r, regexp_matches(r.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
  )
  select string_agg(code, ', ' order by code) into t from refs
   where code not in (select code from figures)
      or not (code = any (array[$c$FIG-ENT-ABS-01$c$, $c$FIG-ENT-ABS-02$c$, $c$FIG-ENT-ABS-03$c$, $c$FIG-ENT-ABS-04$c$, $c$FIG-ENT-ABS-05$c$, $c$FIG-ENT-ADI-01$c$, $c$FIG-ENT-ADI-02$c$, $c$FIG-ENT-ADI-03$c$, $c$FIG-ENT-ADI-04$c$, $c$FIG-ENT-ADI-05$c$, $c$FIG-ENT-ADI-06$c$, $c$FIG-ENT-ADI-07$c$, $c$FIG-ENT-REC-01$c$, $c$FIG-ENT-REC-02$c$, $c$FIG-ENT-REC-03$c$, $c$FIG-ENT-REC-04$c$, $c$FIG-ENT-REC-05$c$, $c$FIG-FIG-CLAS-01$c$, $c$FIG-FIG-CLAS-02$c$, $c$FIG-FIG-CLAS-03$c$, $c$FIG-FIG-CLAS-04$c$, $c$FIG-FIG-CLAS-05$c$, $c$FIG-FIG-CLAS-06$c$, $c$FIG-FIG-CLAS-07$c$, $c$FIG-FIG-ELEM-01$c$, $c$FIG-FIG-ELEM-02$c$, $c$FIG-FIG-ELEM-03$c$, $c$FIG-FIG-ELEM-04$c$, $c$FIG-FIG-ELEM-05$c$, $c$FIG-FIG-ELEM-06$c$, $c$FIG-FIG-ELEM-07$c$, $c$FIG-FIG-ELEM-08$c$, $c$FIG-FIG-ELEM-09$c$, $c$FIG-FIG-ELEM-10$c$, $c$FIG-FIG-ELEM-11$c$, $c$FIG-FIG-ELEM-12$c$, $c$FIG-FIG-ELEM-13$c$, $c$FIG-PER-POL-01$c$, $c$FIG-PER-POL-02$c$, $c$FIG-PER-POL-03$c$, $c$FIG-PER-POL-04$c$, $c$FIG-PER-POL-05$c$, $c$FIG-PER-POL-06$c$, $c$FIG-PER-POL-07$c$, $c$FIG-PER-POL-08$c$, $c$FIG-PER-POL-09$c$, $c$FIG-PER-POL-10$c$, $c$FIG-PER-POL-11$c$, $c$FIG-PER-POL-12$c$, $c$FIG-PER-POL-13$c$, $c$FIG-PER-POL-14$c$, $c$FIG-PLA-COORD-01$c$, $c$FIG-PLA-COORD-02$c$, $c$FIG-PLA-COORD-03$c$, $c$FIG-PLA-COORD-04$c$, $c$FIG-PLA-COORD-05$c$, $c$FIG-PLA-COORD-06$c$, $c$FIG-PLA-COORD-07$c$, $c$FIG-PLA-COORD-08$c$, $c$FIG-PLA-COORD-09$c$, $c$FIG-PLA-COORD-10$c$, $c$FIG-PLA-COORD-11$c$, $c$FIG-PLA-COORD-12$c$, $c$FIG-PLA-COORD-13$c$, $c$FIG-PLA-COORD-14$c$, $c$FIG-PLA-VEC-01$c$, $c$FIG-PLA-VEC-02$c$, $c$FIG-PLA-VEC-03$c$, $c$FIG-PLA-VEC-04$c$, $c$FIG-PLA-VEC-05$c$, $c$FIG-PLA-VEC-06$c$, $c$FIG-PLA-VEC-07$c$, $c$FIG-PLA-VEC-08$c$, $c$FIG-REF-EJE-01$c$, $c$FIG-REF-EJE-02$c$, $c$FIG-REF-EJE-03$c$, $c$FIG-REF-EJE-04$c$, $c$FIG-REF-EJE-05$c$, $c$FIG-REF-REC-01$c$, $c$FIG-REF-REC-02$c$, $c$FIG-REF-REC-03$c$, $c$FIG-REF-REC-04$c$, $c$FIG-REF-REC-05$c$, $c$FIG-ROT-90-01$c$, $c$FIG-ROT-90-02$c$, $c$FIG-ROT-90-03$c$, $c$FIG-ROT-90-04$c$, $c$FIG-ROT-90-05$c$, $c$FIG-ROT-CEN-01$c$, $c$FIG-ROT-CEN-02$c$, $c$FIG-ROT-CEN-03$c$, $c$FIG-ROT-CEN-04$c$, $c$FIG-SIM-CEN-01$c$, $c$FIG-SIM-CEN-02$c$, $c$FIG-SIM-CEN-03$c$, $c$FIG-TRA-TRAS-01$c$, $c$FIG-TRA-TRAS-02$c$, $c$FIG-TRA-TRAS-03$c$, $c$FIG-TRA-TRAS-04$c$, $c$FIG-TRA-TRAS-05$c$, $c$FIG-TRA-TRAS-06$c$, $c$FIG-TRA-TRAS-07$c$, $c$FIG-VEC-OP-01$c$, $c$FIG-VEC-OP-02$c$, $c$FIG-VEC-OP-03$c$, $c$FIG-VEC-OP-04$c$, $c$FIG-VEC-OP-05$c$, $c$FIG-VEC-OP-06$c$, $c$FIG-VEC-OP-07$c$, $c$FIG-VEC-OP-08$c$]::text[]));
  if t is not null then
    raise exception 'figuras referenciadas en la base que ya no están en contenido/figuras/ (o no están en figures): %', t; end if;

  -- La figura de un ítem no puede aparecer en ninguna clase ni
  -- remediación: filtraría la respuesta.
  select string_agg(distinct f.code, ', ') into t
    from items i join figures f on f.id = i.figure_id
   where f.code in (
     select m[1] from lessons l, regexp_matches(l.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m
     union
     select m[1] from remediations r, regexp_matches(r.body, $c$!\[\]\(fig:([A-Z0-9-]+)\)$c$, 'g') m);
  if t is not null then
    raise exception 'figuras de ítem que aparecen en una clase o remediación: %', t; end if;
end
$verif$;

-- 72 ítems (72 curated), 288 alternativas, 18 misconceptions referenciadas,
-- 18 remediaciones, 0 figuras, 1 clase sobre 3 nodos.

-- =====================================================================
-- PUBLICACIÓN — no corre con la carga. Descomentar cuando decidas.
-- =====================================================================
-- Todo lo de arriba entra como 'draft'. NEXT_ITEM solo sirve 'active',
-- así que hasta que corras esto el estudiante no ve nada de esta clase.
-- Cargar no es publicar: publicar es una decisión y queda registrada
-- en el archivo que corriste.

-- 72 ítems curated -> active:
-- update items set status = 'active'
--  where code in ($c$M1-DAT-001$c$, $c$M1-DAT-002$c$, $c$M1-DAT-003$c$, $c$M1-DAT-004$c$, $c$M1-DAT-005$c$, $c$M1-DAT-006$c$, $c$M1-DAT-007$c$, $c$M1-DAT-008$c$, $c$M1-DAT-009$c$, $c$M1-DAT-010$c$, $c$M1-DAT-011$c$, $c$M1-DAT-012$c$, $c$M1-DAT-013$c$, $c$M1-DAT-014$c$, $c$M1-DAT-015$c$, $c$M1-DAT-016$c$, $c$M1-DAT-017$c$, $c$M1-DAT-018$c$, $c$M1-DAT-019$c$, $c$M1-DAT-020$c$, $c$M1-DAT-021$c$, $c$M1-DAT-022$c$, $c$M1-DAT-023$c$, $c$M1-DAT-024$c$, $c$M1-DAT-025$c$, $c$M1-DAT-026$c$, $c$M1-DAT-027$c$, $c$M1-DAT-028$c$, $c$M1-DAT-029$c$, $c$M1-DAT-030$c$, $c$M1-DAT-031$c$, $c$M1-DAT-032$c$, $c$M1-DAT-033$c$, $c$M1-DAT-034$c$, $c$M1-DAT-035$c$, $c$M1-DAT-036$c$, $c$M1-DAT-037$c$, $c$M1-DAT-038$c$, $c$M1-DAT-039$c$, $c$M1-DAT-040$c$, $c$M1-DAT-041$c$, $c$M1-DAT-042$c$, $c$M1-DAT-043$c$, $c$M1-DAT-044$c$, $c$M1-DAT-045$c$, $c$M1-DAT-046$c$, $c$M1-DAT-047$c$, $c$M1-DAT-048$c$, $c$M1-DAT-049$c$, $c$M1-DAT-050$c$, $c$M1-DAT-051$c$, $c$M1-DAT-052$c$, $c$M1-DAT-053$c$, $c$M1-DAT-054$c$, $c$M1-DAT-055$c$, $c$M1-DAT-056$c$, $c$M1-DAT-057$c$, $c$M1-DAT-058$c$, $c$M1-DAT-059$c$, $c$M1-DAT-060$c$, $c$M1-DAT-061$c$, $c$M1-DAT-062$c$, $c$M1-DAT-063$c$, $c$M1-DAT-064$c$, $c$M1-DAT-065$c$, $c$M1-DAT-066$c$, $c$M1-DAT-067$c$, $c$M1-DAT-068$c$, $c$M1-DAT-069$c$, $c$M1-DAT-070$c$, $c$M1-DAT-071$c$, $c$M1-DAT-072$c$);

-- update remediations set status = 'active'
--  where code in ($c$REM-DAT-VAR-NUMERO$c$, $c$REM-DAT-VAR-ORDINAL$c$, $c$REM-DAT-VAR-ENTERO$c$, $c$REM-DAT-VAR-CANTIDAD$c$, $c$REM-DAT-VAR-DISCATEG$c$, $c$REM-DAT-VAR-POBLACION$c$, $c$REM-DAT-VAR-VALOR$c$, $c$REM-DAT-VAR-FRECUENCIA$c$, $c$REM-TAB-ABS-COLUMNA$c$, $c$REM-TAB-ABS-FILAS$c$, $c$REM-TAB-ABS-SUMAX$c$, $c$REM-TAB-ABS-SUMAF$c$, $c$REM-TAB-ABS-LIMITE$c$, $c$REM-TAB-ACUM-BORDE$c$, $c$REM-TAB-ACUM-SOLOF$c$, $c$REM-TAB-ACUM-COMPLEMENTO$c$, $c$REM-TAB-ACUM-FCOMOF$c$, $c$REM-TAB-ACUM-PAR$c$);

-- update lessons set status = 'active'
--  where code = $c$LES-EST-DAT-01$c$;

-- Verificar después de publicar:
--   select status, count(*) from items
--    where code in ($c$M1-DAT-001$c$, $c$M1-DAT-002$c$, $c$M1-DAT-003$c$, $c$M1-DAT-004$c$, $c$M1-DAT-005$c$, $c$M1-DAT-006$c$, $c$M1-DAT-007$c$, $c$M1-DAT-008$c$, $c$M1-DAT-009$c$, $c$M1-DAT-010$c$, $c$M1-DAT-011$c$, $c$M1-DAT-012$c$, $c$M1-DAT-013$c$, $c$M1-DAT-014$c$, $c$M1-DAT-015$c$, $c$M1-DAT-016$c$, $c$M1-DAT-017$c$, $c$M1-DAT-018$c$, $c$M1-DAT-019$c$, $c$M1-DAT-020$c$, $c$M1-DAT-021$c$, $c$M1-DAT-022$c$, $c$M1-DAT-023$c$, $c$M1-DAT-024$c$, $c$M1-DAT-025$c$, $c$M1-DAT-026$c$, $c$M1-DAT-027$c$, $c$M1-DAT-028$c$, $c$M1-DAT-029$c$, $c$M1-DAT-030$c$, $c$M1-DAT-031$c$, $c$M1-DAT-032$c$, $c$M1-DAT-033$c$, $c$M1-DAT-034$c$, $c$M1-DAT-035$c$, $c$M1-DAT-036$c$, $c$M1-DAT-037$c$, $c$M1-DAT-038$c$, $c$M1-DAT-039$c$, $c$M1-DAT-040$c$, $c$M1-DAT-041$c$, $c$M1-DAT-042$c$, $c$M1-DAT-043$c$, $c$M1-DAT-044$c$, $c$M1-DAT-045$c$, $c$M1-DAT-046$c$, $c$M1-DAT-047$c$, $c$M1-DAT-048$c$, $c$M1-DAT-049$c$, $c$M1-DAT-050$c$, $c$M1-DAT-051$c$, $c$M1-DAT-052$c$, $c$M1-DAT-053$c$, $c$M1-DAT-054$c$, $c$M1-DAT-055$c$, $c$M1-DAT-056$c$, $c$M1-DAT-057$c$, $c$M1-DAT-058$c$, $c$M1-DAT-059$c$, $c$M1-DAT-060$c$, $c$M1-DAT-061$c$, $c$M1-DAT-062$c$, $c$M1-DAT-063$c$, $c$M1-DAT-064$c$, $c$M1-DAT-065$c$, $c$M1-DAT-066$c$, $c$M1-DAT-067$c$, $c$M1-DAT-068$c$, $c$M1-DAT-069$c$, $c$M1-DAT-070$c$, $c$M1-DAT-071$c$, $c$M1-DAT-072$c$) group by 1;
