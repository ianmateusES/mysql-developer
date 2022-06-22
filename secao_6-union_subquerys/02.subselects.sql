/*
 * SubSELECT de querys
 */
    -- Usando database sakila
    USE sakila;
    -- Verificando as tabelas
    SELECT * FROM sakila.actor;
    SELECT * FROM sakila.film_actor;
    SELECT * FROM sakila.film;

    -- Query 1 - todos atores que fizeram o filme de id 1 com titulo ACADEMY DINOSAUR
    SELECT *
    FROM sakila.actor
    WHERE actor_id IN (
        SELECT actor_id
        FROM sakila.film_actor
        WHERE film_id = '1'
    );

    -- Query 2 - Descobrir quais filmes actor Penelope Guiness (actor_id = 1)
    SELECT *
    FROM sakila.film
    WHERE film_id IN (
        SELECT film_id
        FROM sakila.film_actor
        WHERE actor_id = '1'
    );

    -- Query 3 - Descobrir quais filmes actor Penelope Guiness (actor_id = 1) fez e o rating='PG'
    SELECT *
    FROM sakila.film
    WHERE film_id IN (
        SELECT film_id
        FROM sakila.film_actor
        WHERE
            actor_id = '1'
            AND rating = 'PG'
    );


    -- Query 4 - Descobrir quais filmes actor Penelope Guiness (actor_id = 1) não fez e o rating='PG'
    SELECT *
    FROM sakila.film
    WHERE film_id NOT IN (
        SELECT film_id
        FROM sakila.film_actor
        WHERE
            actor_id = '1'
            AND rating = 'PG'
    );


    -- Query 5 - Descobrir quantas cidades tem em cada país
    SELECT
        country_id,
        country,
        (
            SELECT COUNT(*)
            FROM sakila.city
            WHERE country.country_id = city.country_id
        ) AS qtda
    FROM sakila.country;

    -- Usando database sakila
    USE world;

    -- Verificando as tabelas
    SELECT * FROM world.city;
    SELECT * FROM world.country;
    SELECT * FROM world.countrylanguage;

    -- Query 6 - Calcular total da população dos país com um subselec trazer o nome do pais e foltra por linguas
    SELECT
        countrycode,
        SUM(population) AS total_pop,
        (
            SELECT name
            FROM world.country
            WHERE city.countrycode = country.code
        ) AS pais
    FROM world.city
    WHERE countrycode IN (
        SELECT countrycode
        FROM world.countrylanguage
        WHERE language = 'Spanish'
    )
    GROUP BY 1;

    -- Query 7 - Outra solucão para mesmo problema
    SELECT
        city.countrycode,
        country.name,
        SUM(city.population) AS total_pop
    FROM world.city
    INNER JOIN world.country ON city.countrycode = country.code
    INNER JOIN world.countrylanguage ON city.countrycode = countrylanguage.countrycode
    WHERE countrylanguage.language = 'Spanish'
    GROUP BY 1, 2;
