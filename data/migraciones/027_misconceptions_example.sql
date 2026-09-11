-- =====================================================================
-- 027_misconceptions_example.sql
--
-- Carga el campo example de las 42 misconceptions de NUM-POT.
-- La columna se agregó a mano en el editor de Supabase el 2026-09-08:
--   alter table misconceptions add column example text;
-- Se deja registrada acá para que el archivo describa el estado real.
--
-- Fuente: contenido/misconceptions/NUM-POT.yaml
-- El YAML es la fuente de verdad. Esta migración lo copia a la base,
-- nunca al revés.
--
-- Idempotente: son updates por code, se pueden re-correr.
-- =====================================================================

alter table misconceptions add column if not exists example text;

update misconceptions set example = '3 · 2^3 = 6^3 = 216' where code = 'POT-CONC-ORDEN';
update misconceptions set example = '7^0 = 7' where code = 'POT-CERO-BASE';
update misconceptions set example = '7^0 = 0' where code = 'POT-CERO-NULO';
update misconceptions set example = '-3^0 = 1' where code = 'POT-CERO-SIGNO';
update misconceptions set example = '8^1 = 1' where code = 'POT-UNO-UNO';
update misconceptions set example = '6,5 · 10^-5 = 650 000' where code = 'POT-CIENT-DIR';
update misconceptions set example = '45 000 = 4,5 · 10^3' where code = 'POT-CIENT-LUGAR';
update misconceptions set example = '45 000 = 45 · 10^3' where code = 'POT-CIENT-MANT';
update misconceptions set example = '2^3 = 2·2·2·2 = 16' where code = 'POT-CONC-FACTOR';
update misconceptions set example = '2^3 = 3^2 = 9' where code = 'POT-CONC-INV';
update misconceptions set example = '2^3 = 6' where code = 'POT-CONC-MULT';
update misconceptions set example = '2^3 = 5' where code = 'POT-CONC-SUMA';
update misconceptions set example = '(2/3)^2 = 4/3' where code = 'POT-DIST-NUM';
update misconceptions set example = '(x + y)^2 = x^2 + y^2' where code = 'POT-DIST-SUMA';
update misconceptions set example = '(3x)^2 = 3x^2' where code = 'POT-DIST-UNO';
update misconceptions set example = '(1/2)^4 > 1/2' where code = 'POT-FRA-CREC';
update misconceptions set example = '(2/3)^2 = 2/9' where code = 'POT-FRA-DEN';
update misconceptions set example = '(2/3)^2 = 9/4' where code = 'POT-FRA-INV';
update misconceptions set example = '(2/5)^0 = 5/2' where code = 'POT-CERO-INV';
update misconceptions set example = '2^-3 = 1/6' where code = 'POT-NEG-INVMULT';
update misconceptions set example = '(2/5)^-3 = (5/2)^-3' where code = 'POT-NEG-MANTIENE';
update misconceptions set example = '8^-3 = raíz cúbica de 8' where code = 'POT-NEG-RAIZ';
update misconceptions set example = '2^-3 = -8' where code = 'POT-NEG-SIGNO';
update misconceptions set example = '(3^2)^4 = 6^8' where code = 'POT-POT-BASE';
update misconceptions set example = '(2^3)^2 = 2^5' where code = 'POT-POT-SUMA';
update misconceptions set example = '(2^3)^2 = 2^9' where code = 'POT-POT-TORRE';
update misconceptions set example = '2^3 · 3^2 = 6^5' where code = 'POT-BASE-DIST';
update misconceptions set example = '2^3 · 2^2 = 4^5' where code = 'POT-BASE-OPERA';
update misconceptions set example = '5^6 : 5^2 = 5^3' where code = 'POT-COC-DIV';
update misconceptions set example = '3^2 : 3^5 = 3^3' where code = 'POT-COC-ORDEN';
update misconceptions set example = '5^6 : 5^2 = 5^8' where code = 'POT-COC-SUMA';
update misconceptions set example = '6^4 : 6 = 6^4' where code = 'POT-EXP-UNO';
update misconceptions set example = '2^3 · 2^2 = 2^6' where code = 'POT-PROD-MULT';
update misconceptions set example = '2^3 · 2^2 = 2^1' where code = 'POT-PROD-RESTA';
update misconceptions set example = '2^3 + 2^2 = 2^5' where code = 'POT-SUMA-PROD';
update misconceptions set example = '8^(2/3) = 64' where code = 'POT-RAC-ENTERO';
update misconceptions set example = '8^(1/3) = 1/8' where code = 'POT-RAC-INV';
update misconceptions set example = '8^(2/3) = raíz cuadrada de 8^3' where code = 'POT-RAC-INVERSO';
update misconceptions set example = '(-2)^3 = 1/8' where code = 'POT-SIG-EXP';
update misconceptions set example = '(-3)^2 = -9' where code = 'POT-SIG-NEG';
update misconceptions set example = '-2^4 = 16' where code = 'POT-SIG-PAREN';
update misconceptions set example = '(-2)^3 = 8' where code = 'POT-SIG-POS';


-- ---------------------------------------------------------------------
-- verificación (select, no raise notice)
-- ---------------------------------------------------------------------
select 'misconceptions POT-* totales' as que, count(*)::text as valor, '42' as esperado
from misconceptions where code like 'POT-%'
union all
select 'con example cargado', count(*)::text, '42'
from misconceptions where code like 'POT-%' and example is not null and example <> ''
union all
select 'sin example', count(*)::text, '0'
from misconceptions where code like 'POT-%' and (example is null or example = '');
