/*
 * Funções de casos - CASE
 */
    -- Query 1 - Usando a função CASE para saber o dia
    SET @data:=sysdate() + 1;
    SELECT
        @data,
        CASE
            WHEN @data=sysdate() THEN 'Hoje'
            WHEN @data=sysdate()+1 THEN 'Amanha'
            WHEN @data=sysdate()-1 THEN 'Ontem'
        END AS dia;

    -- Query 2
    USE world;
    SELECT
        name,
        population,
        CASE
            WHEN population < 1000000 THEN 'Pop < 1 M'
            WHEN
                population >= 1000000
                AND population < 50000000
                THEN 'Pop >=1 M e <50 M '
            WHEN
                population >= 50000000
                AND population < 100000000
                THEN 'Pop >=50 M e <100 M '
            WHEN population >= 100000000 THEN 'Pop >=100 M'
        END AS demograf
    FROM world.country
    ORDER BY continent ASC, 2 DESC;

    -- Query 3 - Agrupando com CASE
    SELECT
        CASE
            WHEN population < 1000000 THEN 'Pop < 1 M'
            WHEN
                population >= 1000000
                AND population < 50000000
                THEN 'Pop >=1 M e <50 M'
            WHEN
                population >= 50000000
                AND population < 100000000
                THEN 'Pop >=50 M e <100 M'
            WHEN population >= 100000000 THEN 'Pop >=100 M'
        END AS demograf,
        COUNT(*) AS qtd_paises
    FROM world.country
    GROUP BY 1;

    -- Query 4
    USE sakila;
    SELECT
        title,
        length,
        CASE
            WHEN length < 60 THEN 'Curta Metragem'
            WHEN length < 90 THEN 'Media Metragem'
            WHEN length >= 90 THEN 'Longa Metragem'
        END AS metragem
    FROM sakila.film;

    -- Query 5 - Agrupando resultados com CASE
    SELECT
        CASE
            WHEN length < 60 THEN 'Curta Metragem'
            WHEN length < 90 THEN 'Media Metragem'
            WHEN length >= 90 THEN 'Longa Metragem'
        END AS metragem,
        COUNT(*) AS qtd_metragem
    FROM sakila.film
    GROUP BY 1;
