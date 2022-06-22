/*
 * Operador WHERE
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun = 'Jundiai'
        AND ano = '2014';

/*
 * Operador AND
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf = '35'
        AND populacao > 50000
        AND ano = '2014';

/*
 * Operador BETWEEN
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf = '35'
        AND populacao BETWEEN 5000 AND 10000
        AND ano = '2014'
    ORDER BY populacao DESC;

/*
 * Operador IN
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf IN ('35', '12')
        AND ano = '2014';

/*
 * Operador NOT IN
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf NOT IN ('35', '12')
        AND ano = '2014';

/*
 * Operador LIKE
 */
    -- Query 1 - Localiza valores que contenham "OR" em qualquer lugar
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE '%or%'
        AND ano = '2014';

    -- Query 2 - Encontra quaisquer valores que tenham "r" na segunda posição
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE '_r%'
        AND ano = '2014';

    -- Query 3 - Localiza valores que começam com "a" e possuem pelo menos 3 caracteres de comprimento
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE 'a_%_%'
        AND ano = '2014';

    -- Query 3 - Localiza valores que começam com "a" e termINa com "o"
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE 'a%o'
        AND ano = '2014';

    -- Query 3 - Localiza valores que começam com "a"
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE 'a%'
        AND ano = '2014';

    -- Query 3 - Coringa _
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE '_ra%'
        AND ano = '2014';

/*
 * Operador NOT
 */
    -- Query 1
    SELECT
        ano,
        cod_uf,
        estado,
        nome_mun,
        populacao
    FROM curso.senso
    WHERE
        nome_mun NOT LIKE 'A%'
        AND cod_uf = '35'
        AND NOT populacao < 40000
        AND ano = '2014';

    -- Query 2
    SELECT
        ano,
        cod_uf,
        estado,
        nome_mun,
        populacao
    FROM curso.senso
    WHERE
        nome_mun NOT LIKE 'A%'
        AND cod_uf = '35'
        AND NOT populacao > 40000
        AND ano = '2014';

/*
 * Operador OR
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun LIKE 'A%'
        AND (
            cod_uf = '35'
            OR cod_uf = '15'
        );

/*
 * Operador IS NOT NULL
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE regiao IS NOT NULL;

/*
 * Operador IS NULL
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE regiao IS NULL;

    -- Query 2 - Preparando cenario IS NULL
    SELECT *
    FROM curso.senso
    WHERE regiao = '';

    UPDATE curso.senso SET regiao = NULL
    WHERE regiao = '';

    UPDATE curso.senso SET regiao = ''
    WHERE regiao IS NULL;

/*
 * Operador HAVING
 */
    -- Query 1
    SELECT
        cod_uf,
        estado,
        COUNT(*) AS qtd
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1, 2
    HAVING COUNT(cod_mun) > 500;

    -- Query 2
    SELECT
        cod_uf,
        estado,
        COUNT(*) AS qtd
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1, 2
    HAVING COUNT(cod_mun) < 500;

    -- Query 3
    SELECT
        cod_uf,
        estado,
        COUNT(cod_mun) AS qtd,
        SUM(populacao) AS qtd_populacao
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1, 2
    HAVING SUM(populacao) > 5000000;

    -- Query 4
    SELECT
        cod_uf,
        estado,
        COUNT(cod_mun) AS qtd,
        SUM(populacao) AS qtd_populacao
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1, 2
    HAVING SUM(populacao) < 5000000;
