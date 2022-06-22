/*
 * Funções lógicas - IF
 * Retorna um de dois valores, dependendo de a expressão booliana ser avaliada como true ou false
 */
    -- Query 1
    SET @a:=45;
    SET @b:=40;
    SELECT IF(
        @a > @b,
        'TRUE',
        'FALSE'
    ) AS resultado;

    -- Query 2
    SET @a:=45;
    SET @b:=40;
    SELECT IF(
        @a > @b,
        'Maior',
        'Menor'
    ) AS resultado;

    -- Query 3
    SET @a:=45;
    SET @b:=40;
    SELECT IF(
        @a < @b,
        'Sim',
        'Não'
    ) AS resultado;


/*
 * Funções lógicas - IFNULL
 */
    -- Query 1
    SELECT IFNULL(1, 0) AS retorno;

    -- Query 2
    SELECT IFNULL(NULL, 0) AS retorno;

    -- Query 3
    SELECT IFNULL('', 0) AS retorno;

    -- Query 4
    USE world;
    SELECT
        name,
        indepyear,
        IFNULL(indepyear, 'sem indep')
    FROM world.country;


/*
 * Funções lógicas - NULLIF
 */
    -- Query 1
    SELECT NULLIF(100, 100) AS retorno;

    -- Query 2
    SELECT NULLIF(100, 10) AS retorno;

    -- Query 3
    SELECT NULLIF('A', 10) AS retorno;

    -- Query 4
    SELECT NULLIF('A', 'B') AS retorno;

    -- Query 5
    SELECT NULLIF('A', 'A') AS retorno;
