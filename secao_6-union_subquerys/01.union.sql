/*
 * Union de querys
 */
    -- Query 1 - Simulando erro UNION
    SELECT
        '1' AS v1,
        '1' AS v2,
        'ABC' AS v3

    UNION

    SELECT
        'A' AS v1,
        2 AS v2;

    -- Query 2 - Exemplo UNION ALL
    SELECT
        'A' AS campo1,
        'B' AS campo2

    UNION ALL

    SELECT
        'A' AS campo3,
        'B' AS campo4;

    -- Query 3 - Exemplo UNION
    SELECT
        'A' AS campo1,
        'B'AS campo2

    UNION

    SELECT
        'A' AS campo3,
        'B' AS campo4;

    -- Query 4 - Exemplo usando UNION
    SELECT
        ano,
        estado
    FROM curso.senso
    WHERE ano = '2014'

    UNION

    SELECT
        ano,
        estado
    FROM curos.senso
    WHERE ano = '2013';

    -- Query 5 - Exemplo de UNION ALL
    SELECT
        ano,
        estado
    FROM curso.senso
    WHERE ano = '2014'

    UNION ALL

    SELECT
        ano,
        estado
    FROM curso.senso
    WHERE ano = '2013';

    -- Query 6 - Exemplo usando UNION
    SELECT estado
    FROM curso.senso
    WHERE ano = '2014'

    UNION

    SELECT estado
    FROM curso.senso
    WHERE ano = '2013';

    -- Query 7 - Exemplo usando UNION ALL
    SELECT
        ano,
        estado
    FROM curso.senso
    WHERE ano = '2014'

    UNION ALL

    SELECT
        ano,
        estado
    FROM curso.senso
    WHERE ano = '2013';

    -- Query 8 - Exemplo usando UNION
    SELECT
        nome_mun,
        ano,
        estado,
        populacao
    FROM curso.senso
    WHERE
        ano = '2014'
        AND cod_uf = '11'

    UNION

    SELECT
        nome_mun,
        ano,
        estado,
        populacao
    FROM curso.senso
    WHERE
        ano = '2013'
        AND cod_uf = '11'
    ORDER BY 1, 2;

    -- Query 9 - Exemplo usando UNION ALL
    SELECT
        nome_mun,
        ano,
        estado,
        populacao
    FROM curso.senso
    WHERE
        ano = '2014'
        AND cod_uf = '11'

    UNION ALL

    SELECT
        nome_mun,
        ano,
        estado,
        populacao
    FROM curso.senso
    WHERE
        ano = '2013'
        AND cod_uf = '11'
    ORDER BY 1, 2;
