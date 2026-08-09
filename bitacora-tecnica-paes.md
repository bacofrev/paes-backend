# Plataforma PAES — Bitácora técnica

*Última actualización: 9 de agosto de 2026*

---

## 1. Dónde estamos

**Fase completada:** infraestructura del walking skeleton, desplegada de punta a punta en producción.

Un navegador de cualquier persona puede entrar a la URL pública, apretar un botón, y ese click viaja a un servidor Python en Estados Unidos y vuelve con una respuesta. Dos servicios, dos lenguajes, dos deploys automáticos desde Git.

**Lo que esto NO es todavía:** el walking skeleton completo. La rebanada definida era *"un estudiante responde una pregunta y queda guardada"*. Falta toda la capa de datos — no hay base de datos conectada, ni ítems, ni respuestas persistidas.

---

## 2. Stack definido

| Capa | Tecnología | Dónde corre |
|---|---|---|
| Frontend | Next.js 16 + TypeScript + Tailwind | Vercel |
| Backend | Python 3.14 + FastAPI | Railway (plan Hobby, US West) |
| Base de datos | Postgres vía Supabase | Supabase |
| Auth | Supabase Auth | Supabase |
| Repetición espaciada | py-fsrs (algoritmo FSRS, no SM-2) | Backend |
| Psicometría | IRT + BKT implementados a mano en Python | Backend |
| Testing | pytest | — |
| Control de versiones | Git + GitHub (`bacofrev`) | — |

**Por qué dos servicios y no uno:** IRT, BKT y PFA viven en el ecosistema Python. No hay equivalente serio en JavaScript. La separación entre capa de interacción (Next) y capa de medición (Python) es deliberada, y además es el principio arquitectónico que separa el LLM del motor psicométrico.

**El costo de esa decisión:** dos deploys, dos repos, y CORS. Ya se pagó.

---

## 3. Recursos y URLs

| Qué | Dónde |
|---|---|
| Frontend en producción | `https://paes-frontend.vercel.app` |
| Backend en producción | `https://web-production-2bc3e.up.railway.app` |
| Endpoint de salud | `https://web-production-2bc3e.up.railway.app/health` |
| Repo backend | `github.com/bacofrev/paes-backend` |
| Repo frontend | `github.com/bacofrev/paes-frontend` |
| Proyecto Railway | `paes` (workspace `bacofrev's Projects`) |
| Proyecto Vercel | `paes-frontend` (equipo `bacofrev-9708's projects`) |

**Carpetas locales:**

```
~/ben_projects/
├── paes-backend/     ← Python + FastAPI
└── paes-frontend/    ← Next.js + TypeScript
```

---

## 4. Estructura de los proyectos

### Backend (`paes-backend`)

```
paes-backend/
├── .venv/              ← entorno virtual, desechable, NO va a Git
├── .gitignore
├── Procfile            ← comando de arranque para Railway
├── requirements.txt    ← dependencias congeladas
├── README.md
└── main.py             ← la app entera, por ahora
```

**`main.py` actual:**

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://paes-frontend.vercel.app",
    ],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health")
def health():
    return {"status": "ok"}
```

**`Procfile`:**

```
web: uvicorn main:app --host 0.0.0.0 --port $PORT
```

- `main:app` → en el archivo `main.py`, la variable `app`
- `--host 0.0.0.0` → escuchar peticiones externas (por defecto uvicorn solo se escucha a sí mismo)
- `$PORT` → Railway asigna el puerto dinámicamente

### Frontend (`paes-frontend`)

```
paes-frontend/
├── node_modules/       ← equivalente al .venv, desechable, NO va a Git
├── app/
│   ├── page.tsx        ← la página raíz
│   ├── layout.tsx
│   └── globals.css
├── public/
├── .env.local          ← variables locales, NO va a Git
├── .gitignore
├── package.json        ← equivalente al requirements.txt
└── next.config.ts
```

**`app/page.tsx` actual:** componente cliente con un botón que hace `fetch` a `/health` del backend y muestra la respuesta.

**`.env.local`:**

```
NEXT_PUBLIC_API_URL=https://web-production-2bc3e.up.railway.app
```

---

## 5. Conceptos aprendidos en esta fase

### Entornos aislados

Cuatro principios invariantes, iguales en cualquier lenguaje:

1. Una carpeta por proyecto
2. Un entorno de dependencias aislado por proyecto
3. Un archivo que declare las dependencias, para reproducibilidad
4. Control de versiones desde el minuto cero

En Python eso es `.venv` + `requirements.txt`. En Node es `node_modules` + `package.json`. Mismo concepto, distinto mecanismo.

**El `.venv` tiene rutas absolutas escritas adentro.** Si movés la carpeta del proyecto, deja de funcionar. Se borra y se recrea:

```bash
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

**La activación no es permanente.** Dura lo que dura esa ventana de terminal. Cada vez que abrís una nueva, hay que hacer `source .venv/bin/activate` de nuevo.

### Deploy automático

Railway y Vercel quedaron observando la rama `main` de sus respectivos repos vía webhook. **El comando de deploy es `git push`.** No hay otro.

Consecuencias:

- **`main` es producción.** Lo que se commitea ahí sale al aire en minutos, sin etapa intermedia de revisión.
- **El build corre en el servidor, no en tu Mac.** Si instalás una librería local y no actualizás `requirements.txt`, funciona local y falla en producción con `ModuleNotFoundError`.
- **Los cambios que no son código no viajan.** Variables de entorno, credenciales y configuración del servicio se cargan a mano en cada panel.

### Variables de entorno

Dos lugares, siempre: un archivo local (ignorado por Git) y el panel del servicio en la nube. No hay forma elegante de evitarlo — es a propósito, para que las credenciales nunca lleguen al repo.

**En Next.js, el prefijo `NEXT_PUBLIC_` es una advertencia:** hace que la variable llegue al navegador, lo que significa que queda visible en el código que descarga el usuario. **Ahí nunca va una clave secreta.** Las credenciales que deben permanecer ocultas viven en el backend, sin ese prefijo.

Las variables se leen al arrancar el servidor, no en caliente. Si cambiás una, hay que reiniciar.

### CORS

El navegador aplica la *same-origin policy*: JavaScript de un origen no puede leer respuestas de otro origen. "Origen" = protocolo + dominio + puerto.

**El bloqueo es del navegador, no del servidor.** El backend recibe la petición y responde bien; el navegador recibe esa respuesta y se niega a entregarla al JavaScript porque no viene con el header `Access-Control-Allow-Origin`. Por eso `curl` funciona y el navegador no. Por eso escribir la URL en la barra de direcciones tampoco falla — no es una llamada cross-origin.

Se resuelve en el backend, declarando explícitamente qué orígenes se autorizan.

**No usar `allow_origins=["*"]`.** Funciona y aparece en todos los tutoriales, pero significa "cualquier sitio del mundo puede llamar a mi API desde el navegador de un usuario". Hoy da lo mismo porque no hay nada que proteger; cuando haya sesiones de estudiantes, no.

**Vercel genera una URL distinta por cada deploy** (`paes-frontend-git-...`). Esas no están en la lista y van a fallar con CORS. Probar siempre contra el dominio principal.

---

## 6. Comandos frecuentes

### Backend

```bash
cd ~/ben_projects/paes-backend
source .venv/bin/activate      # imprescindible en cada terminal nueva
fastapi dev main.py            # levanta en localhost:8000
```

Después de instalar cualquier librería:

```bash
pip install <libreria>
pip freeze > requirements.txt   # NO OLVIDAR — sin esto, el deploy falla
```

### Frontend

```bash
cd ~/ben_projects/paes-frontend
npm run dev                     # levanta en localhost:3000
```

### Terminal

| Comando | Qué hace |
|---|---|
| `pwd` | imprime dónde estás parado |
| `ls -a` | lista archivos, incluidos los que empiezan con punto |
| `cd ~` | vuelve a la carpeta de usuario |
| `Ctrl + C` | mata el proceso que tiene tomada la terminal |
| `Cmd + T` | abre pestaña nueva |
| `Cmd + Shift + .` | en Finder, muestra/oculta archivos con punto |

**`rm -rf` borra sin preguntar y sin papelera.** Leer la ruta dos veces antes de apretar enter.

---

## 7. Decisiones tomadas y por qué

| Decisión | Razón |
|---|---|
| Deploy antes que lógica | El 80% del dolor de infraestructura (variables, CORS, build, puertos) aparece acá. Descubrirlo en el mes 3 con features encima es carísimo. |
| Auth fuera del esqueleto | Es el asesino silencioso de esqueletos. `student_id` va hardcodeado hasta que el circuito completo funcione. |
| Sin importador de ensayos | Es un proyecto propio y no atraviesa las capas. Diez inserts a mano. |
| Pagar Railway (~US$5/mes) | Decisión de cinco dólares, no de arquitectura. La alternativa (Render free) tiene cold starts de 30-60s. |
| Región US West, no Singapur | Chile está conectado directo a California por cable submarino. Cientos de milisegundos por petición, gratis. |
| `venv` + `pip` en vez de `uv` | Camino pedagógico, no el más eficiente. El mecanismo explícito enseña; `uv` lo automatiza y automatizado significa invisible. Migrar cuando el mecanismo aburra. |
| Python 3.14 pese al riesgo | El riesgo de compatibilidad aparece con numpy/scipy/py-fsrs, meses después. Un venv se borra y se recrea en dos minutos. No vale la pena resolver hoy un problema hipotético. |

---

## 8. Lo que falta para cerrar el walking skeleton

1. **Supabase conectado desde FastAPI.** Primera variable de entorno secreta — sin `NEXT_PUBLIC_`, cargada en Railway, nunca en el repo.
2. **Tres tablas:** `students`, `items`, `responses`. Nada más. Sin mapa de prerrequisitos, sin nodos, sin parámetros IRT.
3. **Diez ítems insertados a mano** desde el editor SQL de Supabase.
4. **Dos endpoints:** `GET /items/next` (sin lógica, en orden) y `POST /responses`.
5. **Pantalla fea:** enunciado, cuatro alternativas, botón. Cero CSS.
6. **Test de integración con pytest** que recorra el circuito completo.

**Criterio de terminado:** desde el teléfono, en la URL pública, responder un ítem y que el dato quede en Postgres.

### Decisión de modelo de datos que no se puede postergar

La tabla `responses` es la única dolorosa de migrar después, porque IRT, BKT y el scheduler de repaso van a leer todos de ahí. Desde el día uno necesita:

- `student_id`
- `item_id`
- **`selected_option`** — no `is_correct`. En PAES, *cuál* distractor eligió el estudiante es la señal diagnóstica más rica. Guardar solo el binario correcto/incorrecto es tirar información.
- `timestamp`
- `response_time_ms`

Preguntas que el esquema debería poder responder: ¿el ítem se presentó en diagnóstico o en práctica? ¿los omitidos están separados de los incorrectos? ¿se versiona el ítem cuando se corrige un enunciado? ¿se puede saber si el estudiante ya lo vio antes?

---

## 9. Riesgos abiertos

### El banco de ítems es el camino crítico, y no ha avanzado

Hay materia prima (material de estudio, ensayos), no banco de ítems. Un ensayo es un PDF lineal; un banco de ítems es cada pregunta atomizada, con ID propio, etiquetada contra un nodo del mapa de prerrequisitos, con distractores identificados y metadata de exposición.

Ese trabajo es lento, manual, y no lo acelera el código. **La calibración tiene un lead time que ningún commit comprime:** necesita respuestas de estudiantes reales, en volumen, por ítem. Si el motor está listo en el mes 3 y los ítems no, el motor está ciego.

Tres cosas por resolver antes de etiquetar nada:

- **Derechos del material.** Ensayos DEMRE liberados están bien. Material de preuniversitario o editorial es un problema de propiedad intelectual que conviene descubrir ahora y no con usuarios pagando.
- **La taxonomía antes del etiquetado.** Si se etiquetan 500 ítems y después cambia el mapa de prerrequisitos, se reetiquetan 500 ítems.
- **Los distractores son datos, no ruido.**

### La capa psicométrica falla en silencio

Si un update de BKT tiene el signo invertido o el estimador IRT converge mal, nada se cae. La app anda perfecta y le manda contenido equivocado a estudiantes reales durante meses, con el dashboard en verde.

En un CRUD normal el bug grita. Acá no. Eso significa que hace falta **capacidad de auditar la capa psicométrica**, no solo código generado que funcione. No es opcional.

Es también la razón por la que, cuando llegue esa etapa, conviene dejar de trabajar directo sobre `main`: rama aparte, Pull Request, y `main` solo recibe lo aprobado.

### Deuda técnica menor, consciente

- `pip freeze` vuelca todas las dependencias transitivas, así que `requirements.txt` no sirve para saber qué se instaló deliberadamente. Cuando moleste: `uv` y `pyproject.toml`.
- La actualización de `requirements.txt` es manual y se olvida. Disciplina: `pip freeze` inmediatamente después de cada `pip install`, en el mismo commit.
- Todo el backend vive en `main.py`. Está bien mientras sean 15 líneas; hay que partirlo antes de que sean 300.
