/*
 * Operador +
 */
    -- Query 1
    SELECT 1 + 3 AS retorno;

/*
 * Operador *
 */
    -- Query 1
    SELECT 3 * 2 AS retorno;

/*
 * Operador -
 */
    -- Query 1
    SELECT 5 - 2 AS retorno;

    -- Query 2
    SELECT 2 - 5 AS retorno;

/*
 * Operador /
 */
    -- Query 1
    SELECT 15 / 3 AS retorno;

/*
 * Operador %
 */
    -- Query 1
    SELECT 12 % 5 AS retorno;

/*
 * Combinando operadores
 */
    -- Query 1
    SELECT ((1 + 4) * (3 * 3)) / 5 AS retorno;

/*
 * Script projetando acrescimo de 10% populacao
 */
    -- Query 1
    SELECT
        nome_mun,
        populacao,
        populacao * 1.10 AS pop_projecao
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2
    SELECT
        nome_mun,
        populacao,
        populacao * 0.10 AS acrescimo,
        populacao + (populacao * 0.10) AS projecao_pop
    FROM curso.senso
    WHERE ano = '2014';

/*
 * Script projetando decrescimo de 10% populacao
 */
    -- Query 1
    SELECT
        nome_mun,
        populacao,
        populacao * 0.10 AS descrescimo,
        populacao - (populacao * 0.10) AS projecao_pop
    FROM curso.senso
    WHERE ano = '2014';

/*
 * O exemplo a seguir divide o número 38 por 5.
 * Isto resulta em 7 como a parte inteira do resultado
 * e demonstra como o módulo retorna o resto de 3.
 */

    SELECT
        38 / 5 AS divisao,
        38 % 5 AS restante;
