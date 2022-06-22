/*
 * VIEW
 */
    -- Query 1 - Criando a view 'v_ator_film'
    USE sakila;
    CREATE VIEW sakila.v_ator_film AS (
        SELECT
            actor.first_name,
            film.title,
            film.length AS duracao
        FROM sakila.actor
        INNER JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN sakila.film ON film_actor.film_id = film.film_id
    );

    -- Query 2 - Verificando
    SELECT *
    FROM sakila.v_ator_film
    WHERE title = 'GOODFELLAS SALUTE';

    -- Query 3 - Verificando
    SELECT
        first_name,
        title
    FROM sakila.v_ator_film
    WHERE title = 'GOODFELLAS SALUTE';

    -- Query 4 - Criando um view de outra view
    CREATE VIEW sakila.v_ator_film_horas AS (
        SELECT
            first_name,
            SUM(duracao) AS minutos,
            SUM(duracao) / 60 AS horas
        FROM sakila.v_ator_film
        GROUP BY 1
        ORDER BY 2 DESC
    );

    -- Query 5 - Verificando
    SELECT * FROM sakila.v_ator_film_horas;

    -- Query 6 - Criando a view 'v_v_ator_film_concat'
    CREATE VIEW sakila.v_v_ator_film_concat AS (
        SELECT
            first_name,
            GROUP_CONCAT(title SEPARATOR ', ') AS filmes
        FROM sakila.v_ator_film
        GROUP BY first_name;
    );

    -- Query 5 - Verificando
    SELECT * FROM sakila.v_v_ator_film_concat

/*
 * VIEW com dados Particionados.
 */
    -- Query 1 - Criando tabelas com os dados
    CREATE TABLE sakila.fornec1 (
        id_fornec INT NOT NULL PRIMARY KEY,
        fornec VARCHAR(50) NOT NULL,
        CONSTRAINT chk_f1 CHECK (id_fornec BETWEEN 1 AND 150)
    );

    CREATE TABLE sakila.fornec2 (
    id_fornec INT NOT NULL PRIMARY KEY,
        fornec VARCHAR(50) NOT NULL,
        CONSTRAINT chk_f2 CHECK (id_fornec BETWEEN 151 AND 300)
    );

    CREATE TABLE sakila.fornec3 (
        id_fornec INT NOT NULL PRIMARY KEY,
        fornec VARCHAR(50) NOT NULL,
        CONSTRAINT chk_f3 CHECK (id_fornec BETWEEN 301 AND 450)
    );


    CREATE TABLE sakila.fornec4 (
        id_fornec INT NOT NULL PRIMARY KEY,
        fornec VARCHAR(50) NOT NULL,
        CONSTRAINT chk_f4 CHECK (id_fornec BETWEEN 451 AND 600)
    );

    -- Query 2 - Inserindo os dados na tabelas
    INSERT sakila.fornec1 VALUES
        ('150', 'CaliforniaCorp'), ('5', 'BraziliaLtd');

    INSERT sakila.fornec2 VALUES
        ('231', 'FarEast'), ('280', 'NZ');

    INSERT sakila.fornec3 VALUES
        ('321', 'EuroGroup'), ('442', 'UKArchip');

    INSERT sakila.fornec4 VALUES
        ('475', 'India'), ('521', 'Afrique');

    -- Query 3 - Criação de view com dados de varias tabelas usando UNION ALL
    CREATE VIEW sakila.v_fornec_geral AS (
        SELECT
            id_fornec,
            fornec
        FROM sakila.fornec1

        UNION ALL

        SELECT
            id_fornec,
            fornec
        FROM sakila.fornec2

        UNION ALL

        SELECT
            id_fornec,
            fornec
        FROM sakila.fornec3

        UNION ALL

        SELECT
            id_fornec,
            fornec
        FROM sakila.fornec4
    );

    -- Query 4 - Verificando view
    SELECT * FROM sakila.v_fornec_geral

    -- Query 5 - Alterando view
    ALTER VIEW sakila.v_fornec_geral AS (
        SELECT
            'f1' AS origem,
            id_fornec,
            fornec
        FROM sakila.fornec1

        UNION ALL

        SELECT
            'f2' AS origem,
            id_fornec,
            fornec
        FROM sakila.fornec2

        UNION ALL

        SELECT
            'f3' AS origem,
            id_fornec,
            fornec
        FROM sakila.fornec3

        UNION ALL

        SELECT
            'f4' AS origem,
            id_fornec,
            fornec
        FROM sakila.fornec4
    );

    -- Query 6 - Verificando view alterada
    SELECT * FROM sakila.v_fornec_geral;

    -- Query 7 - Inserindo mais registros
    INSERT sakila.fornec4 VALUES
        ('476', 'Norway'), ('522', 'Netherlands');

    -- Query 8 - Verificando view com novos valores
    SELECT * FROM sakila.v_fornec_geral;
