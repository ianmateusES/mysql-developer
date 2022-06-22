/*
 * Funções matemáticas - ABS
 * Uma função matemática que retorna o valor absoluto (positivo) da expressão numérica especificada.
 */
    -- Query 1
    SELECT
        ABS(-1.0) AS val1,
        ABS(0.0) AS val2,
        ABS(1.0) AS val3,
        ABS(-9.0) AS val4,
        ABS(-5.4) AS val5,
        ABS(5.4) AS val6;


/*
 * Funções matemáticas - RAND
 * Retorna um valor float pseudoaleatório de 0 a 1, exclusivo.
 */
    -- Query 1
    SELECT RAND()
    UNION
    SELECT RAND()
    UNION
    SELECT RAND()
    UNION
    SELECT RAND();


/*
 * Funções matemáticas - ROUND
 * Retorna um valor numérico, arredondado, para o comprimento ou precisão especificados.
 */
    -- Query 1
    SELECT
        ROUND(123.9994, 3), -- 0,1,2,3,4 < arredonda pra baixo
        ROUND(123.9995, 3); -- 5,6,7,8,9 > arredonda pra cima

    -- Query 2
    SELECT ROUND(123.4545, 2) AS retorno
    UNION ALL
    SELECT ROUND(123.45, -2) AS retorno
    UNION ALL
    SELECT ROUND(193.45, -2) AS retorno
    UNION ALL
    SELECT ROUND(249.45, -2) AS retorno
    UNION ALL
    SELECT ROUND(251.45, -2) AS retorno;

    -- Query 2
    SELECT ROUND(150.75, 0)
    UNION ALL
    SELECT ROUND(150.75, 1);


/*
 * Funções matemáticas - TRUNCATE
 */
    -- Query 1
    SELECT TRUNCATE(1.223, 2) AS resultado;

    -- Query 2
    SELECT TRUNCATE(122, -2) AS resultado;

    -- Query 3
    SELECT TRUNCATE(10.28 * 100, 0) AS resultado;

    -- Query 4
    SELECT TRUNCATE(10.28 * 100, 3) AS resultado;


/*
 * Funções matemáticas - SQRT
 */
    -- Query 1
    SELECT SQRT(4) AS resultado;

    -- Query 2
    SELECT SQRT(20) AS resultado;

    -- Query 3
    SELECT SQRT(-16) AS resultado;


/*
 * Funções matemáticas - SIGN
 */
    -- Query 1
    SELECT SIGN(-234) AS resultado;

    -- Query 2
    SELECT SIGN(0) AS resultado;

    -- Query 3
    SELECT SIGN(234) AS resultado;


/*
 * Funções matemáticas - POW
 */
    -- Query 1
    SELECT POW(2, 2) AS resultado;

    -- Query 2
    SELECT POW(3, 2) AS resultado;

    -- Query 3
    SELECT POW(2, -2) AS resultado;


/*
 * Funções matemáticas - MOD
 */
    -- Query 1
    SELECT MOD(5, 2) AS resultado;

    -- Query 2
    SELECT MOD(27, 3) AS resultado;

    -- Query 3
    SELECT MOD(20, 3) AS resultado;
