-- select * from senso

/*
 * Usando operador =
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf = '35'
        AND ano = '2014';

    -- Query 2
    SELECT *
    FROM curso.senso
    WHERE
        nome_mun = 'Dourado'
        AND cod_uf = '35'
        AND ano = '2014';

/*
 * Usando operador >
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        populacao > 100000
        AND ano = '2014';

    -- Query 2
	SELECT *
    FROM curso.senso
	WHERE
        populacao > 1000000
        AND cod_uf = '35'
        AND ano = '2014';

/*
 * Usando operador <
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        populacao < 10000
        AND ano = '2014';

    -- Query 2
	SELECT *
    FROM curso.senso
	WHERE
        populacao < 50000
        AND ano = '2014';

/*
 * Usando operador <=
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        populacao <= 10000
        AND ano = '2014';

    -- Query 2
    SELECT *
    FROM curso.senso
    WHERE
        populacao <= 50000
   	    AND ano = '2014';

/*
 * Usando operador <>
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        cod_uf <> '35'
        AND cod_uf <> '14'
        AND ano = '2014';

/*
 * Usando operador = com or
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        (cod_uf = '35'
        OR cod_uf = '14')
        AND ano = '2014';

/*
 * Combinando operadores
 */
    -- Query 1
    SELECT *
    FROM curso.senso
    WHERE
        populacao <= 100000
        AND populacao >= 50000
        AND cod_uf = '35'
        AND nome_mun <> 'Vinhedo'
        AND ano = '2014';

    -- Query 2
    SELECT *
    FROM curso.senso
    WHERE
        populacao <= 100000
        AND populacao >= 50000
        AND cod_uf = '35'
        AND nome_mun = 'Vinhedo'
        AND ano = '2014';
