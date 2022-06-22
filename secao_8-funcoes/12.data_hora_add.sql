/*
 * Funções de data e hora Adição
 */
    -- Query 1 - Adicionando 2 anos e 4 meses.
    SELECT
        CURDATE() AS hoje,
        DATE_ADD(CURDATE(), INTERVAL "2-4" YEAR_MONTH) AS acrescimo;

    -- Query 2 - Adicionando 2 meses
    SELECT
        CURDATE() AS hoje,
        DATE_ADD(CURDATE(), INTERVAL "2" MONTH) AS acrescimo;

    -- Query 3 - Adicionando 3 anos
    SELECT
        CURDATE() AS hoje,
        DATE_ADD(CURDATE(), INTERVAL "3" YEAR) AS acrescimo;

    -- Query 4 - Adicionando 90 dias
    SELECT
        CURDATE() AS hoje,
        DATE_ADD(CURDATE(), INTERVAL "90" day) AS acrescimo;

    -- Query 5 - Adicionando 3 horas
    SELECT
        NOW() AS hoje,
        DATE_ADD(NOW(), INTERVAL "3" HOUR) AS acrescimo;

    -- Query 6 - Adicionando 15 minutos
    SELECT
        NOW() AS hoje,
        DATE_ADD(NOW(), INTERVAL "15" MINUTE) AS acrescimo;

