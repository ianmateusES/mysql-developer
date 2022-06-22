/*
 * Funções de data e hora
 */
    -- Query 1 - Verificando a lingua padrão da instalação
    SELECT @@lc_time_names;

    -- Query 2 - Alternando a lingua padrão da instalação (default 'en_US')
    SET lc_time_names = 'PT_BR'; -- (PT_PT - Português de Portugal, PT_BR - Português do Brasil)
    SELECT @@lc_time_names;

    -- Query 3 - Verificando time_zone
    SELECT @@global.time_zone

    -- Query 4 - Alterando a time_zone
    SET @@global.time_zone = '+3:00';
    SELECT @@global.time_zone

    -- Query 5 - Alterando a time_zone para São Paulo
    SET time_zone='America/Sao_Paulo';
    SELECT @@time_zone;


/*
 * Funções de data e hora partes
 */
    -- Query 1 - O Dia/Mes/Ano/Hora/Minutos/Segundos
    SELECT
        DAY(NOW()) AS dia,
        MONTH(NOW()) AS mes,
        YEAR(NOW()) AS ano,
        HOUR(NOW()) AS horas,
        MINUTE(NOW()) AS minuto,
        SECOND(NOW()) AS segundo;

    -- Query 2 - Usando tabela film campo last_update
    USE sakila;
    SELECT
        title,
        last_update,
        YEAR(last_update) AS ano,
        MONTH(last_update) AS mes,
        DAY(last_update) AS dia,
        HOUR(last_update) AS horas,
        MINUTE(last_update) AS minuto,
        SECOND(last_update) AS segundo
    FROM sakila.film;
