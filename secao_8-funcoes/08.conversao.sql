/*
 * Funções de conversão
 */
    -- Query 1 - Covertendo encoding
	SET @palavra = BINARY 'São Paulo';
    SELECT
        LOWER(@palavra) AS retorno1,
        LOWER(CONVERT(@palavra USING latin1)) AS retorno2;

    -- Query 2 - Covertendo encoding
    SET @palavra = BINARY 'São Paulo';
    SELECT
        LOWER(@palavra) AS retorno1,
        LOWER(CONVERT(@palavra USING UTF8)) AS retorno2,
        LOWER(CONVERT(@palavra USING ASCII)) AS retorno3,
        CONVERT(@palavra USING UTF8) AS retorno4;

    -- Query 3 - Covertendo datas com CAST
    SET @datanow = NOW();
    SELECT
        @datanow,
        CAST(@datanow AS date),
        CAST(@datanow AS time),
        CAST(@datanow AS char),
        CAST(@datanow AS char(7)),
        CAST(@datanow AS char(10));

    -- Query 4 - Convertendo datas com CONVERT
    SET @datanow = NOW();
    SELECT
        @datanow,
        CONVERT(@datanow AS date),
        CONVERT(@datanow AS time),
        CONVERT(@datanow AS char),
        CONVERT(@datanow AS char(7)),
        CONVERT(@datanow AS char(10));

    -- Query 5 - Convertendo em binario com CAST e CONVERT
    SELECT
        'mysql' AS expressao,
        CAST('mysql' AS BINARY) AS cast1,
        CONVERT('mysql' USING BINARY) AS convert1;

    -- Query 6 - Convertendo INT em DECIMAL
    SELECT
        @expr1:=1 AS valor,
        CAST(@expr1 AS DECIMAL(10, 2)) AS cast1,
        CONVERT(@expr1, DECIMAL(10, 3)) AS convert1,
        CAST(CONVERT(@expr1, DECIMAL(10, 3)) AS SIGNED integer) AS convert2;

    -- Query 7 - CAST e CONVERT mais operação
    SELECT
        (CAST(10 AS DECIMAL)) + 10 AS resultado1, -- resulta em: 20
        CONVERT(10, DECIMAL(10, 2)) + 10 AS resultado; -- resulta em: 20
