-- =====================================================================
-- 030_one_response_per_session_item.sql
--
-- Un ítem se responde una vez POR SESIÓN, no una vez para siempre.
-- La distinción importa: en modo review el mismo ítem tiene que volver
-- en otra sesión, que es todo el sentido de la repetición espaciada.
-- Un índice sobre (student_id, item_id) mataría FSRS antes de
-- construirlo.
--
-- Lo que sí evita: el doble click y el reintento del frontend, que hoy
-- escriben dos filas y disparan el recompute dos veces, contando dos
-- fallos donde hubo uno.
--
-- Correr:  psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -1 -f ...
-- Sin begin/commit: psql -1 ya abre la transacción.
-- =====================================================================

create unique index responses_one_per_session_item
  on responses (session_id, item_id);

comment on index responses_one_per_session_item is
  'Un item, una respuesta, por sesion. No impide repetirlo en otra '
  'sesion: eso es lo que review necesita para que FSRS funcione.';
