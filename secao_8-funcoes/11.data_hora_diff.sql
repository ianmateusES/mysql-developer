/*
 * Funções de data e hora diferença
 */
    -- Query 1 - Diferença em dias
    USE sakila;
    SELECT
        title,
        last_update,
        DATEDIFF(last_update, NOW()) AS diff
    FROM sakila.film;

    -- Query 2 - Diferença em horas
    SELECT TIMEDIFF('2017-12-08 10:00:00', NOW()) AS diferenca

    -- Query 3 - Diferenças no geral
    USE sakila;
    SELECT
        title,
        last_update,
        TIMESTAMPDIFF(YEAR, last_update, NOW()) AS ano_dif,
        TIMESTAMPDIFF(MONTH, last_update, NOW()) AS mes_dif,
        TIMESTAMPDIFF(DAY, last_update, NOW()) AS dia_dif,
        TIMESTAMPDIFF(HOUR, last_update, NOW()) AS horas_dif,
        TIMESTAMPDIFF(MINUTE, last_update, NOW()) AS minutos_dif,
        TIMESTAMPDIFF(WEEK, last_update, NOW()) AS semana_dif
    FROM sakila.film
    LIMIT 5;
