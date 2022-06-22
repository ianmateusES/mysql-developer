/*
 * Funções de agregações - AVG
 */

    USE curso;

    -- Verificando tabela
    SELECT * FROM curso.senso;

    -- Query 1 - Retorna a média dos valores em um grupo. Valores nulos são ignorados
    SELECT AVG(populacao) AS media
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - Média por estado
    SELECT
        estado,
        AVG(populacao) AS media_pop
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;

    -- Query 3 - Média por estado com sigla estadual
    SELECT
        senso.cod_UF,
        uf.sigla_uf,
        AVG(senso.populacao) AS media
    FROM curso.senso
    INNER JOIN curso.uf ON senso.cod_UF = uf.cod_uf
    WHERE senso.ano = '2014'
    GROUP BY 1, 2
    ORDER BY 3 DESC;

    -- Query 4 - Média por região
    SELECT
        regiao,
        AVG(populacao) AS media
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1;


/*
 * Funções de agregações - MIN
 */
    -- Query 1 - Retorna o valor mínimo na expressão. Pode ser seguido pela cláusula OVER
    SELECT MIN(populacao) AS valor_min
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - População minima por estado
    SELECT
        estado,
        MIN(populacao) AS populacao_min
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1;

    -- Query 3 - População mínima por região
    SELECT
        regiao,
        MIN(populacao) AS populacao_min
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 ASC;


/*
 * Funções de agregações - MAX
 */
    -- Query 1 - Retorna o valor máximo na expressão
    SELECT MAX(populacao) AS populacao_max
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - População maxima por estado
    SELECT
        estado,
        MAX(populacao) AS populacao_max
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;

    -- Query 3 - População maxima por sigla do estado
    SELECT
        uf.sigla_uf,
        MAX(senso.populacao) AS populacao_max
    FROM curso.senso
    INNER JOIN curso.uf ON senso.cod_uf = uf.cod_uf
    WHERE senso.ano = '2014'
    GROUP BY 1
    ORDER BY 2 ASC;


/*
 * Funções de agregações - SUM
 */
    -- Query 1 - Soma populacional por estado
    SELECT
        cod_uf,
        SUM(populacao) AS sum_populacao
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;

    -- Query 2 - Soma populacional por região
    SELECT
        uf.sigla_uf,
        SUM(senso.populacao) AS sum_populacao
    FROM curso.senso
    INNER JOIN curso.uf ON senso.cod_uf = uf.cod_uf
    WHERE senso.ano = '2014'
    GROUP BY 1
    ORDER BY 2 ASC;


/*
 * Funções de agregações - COUNT
 */
    -- Query 1 - Retorna o número de itens de um grupo
    SELECT COUNT(*) AS qtd
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - Retorna o número de cidades por ano
    SELECT
        ano,
        COUNT(*) AS qtd_cidades
    FROM curso.senso
    GROUP BY 1;

    -- Query 3 - Descobrindo qtd estados
    SELECT COUNT(DISTINCT cod_uf) AS qtd_uf
    FROM curso.senso;

    -- Ou
    SELECT
        estado,
        COUNT(*) AS qtd_cidades
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;

    -- Query 4 - Quantidade por região
    SELECT
        regiao,
        COUNT(*) AS qtd_regiao
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;


/*
 * Combinação de funções de agregação
 */
    -- Query 1 - Geral
    SELECT
        AVG(populacao) AS media_pop,
        MIN(populacao) AS minimo_pop,
        MAX(populacao) AS maximo_pop,
        SUM(populacao) AS total_pop,
        COUNT(*) AS qtd_cidades
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - Por estado
    SELECT
        estado,
        AVG(populacao) AS media_pop,
        MIN(populacao) AS minimo_pop,
        MAX(populacao) AS maximo_pop,
        SUM(populacao) AS total_pop,
        COUNT(*) AS qtd_cidades
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1
    ORDER BY 2 DESC;

    -- Query 3 - Apresentar nome da cidade com maior populacao de cada estados
    SELECT
        senso.estado,
        senso.nome_mun,
        senso.populacao
    FROM (
        SELECT
            estado,
            MAX(populacao) AS populacao
        FROM curso.senso
        WHERE ano = '2014'
        GROUP BY 1
    ) AS cidade_max
    INNER JOIN curso.senso ON
        cidade_max.estado = senso.estado
        AND cidade_max.populacao = senso.populacao
    WHERE senso.ano = '2014'
    ORDER BY senso.populacao DESC;

    -- Query 2 - Apresentar nome da cidade com minimo populacao de cada estados
    SELECT
        senso.estado,
        senso.nome_mun,
        senso.populacao
    FROM (
        SELECT
            estado,
            MIN(populacao) AS populacao
        FROM curso.senso
        WHERE ano = '2014'
        GROUP BY 1
    ) AS cidade_max
    INNER JOIN curso.senso ON
        cidade_max.estado = senso.estado
        AND cidade_max.populacao = senso.populacao
    WHERE senso.ano = '2014'
    ORDER BY senso.populacao DESC;


/*
 * Funções de agregações - Desvio padrão
 */
    -- Query 1 - Retorna o desvio padrão (STDDEV) estatístico de todos os valores da expressão especificada
    SELECT STDDEV(populacao) AS std
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - Retorna o desvio padrão estatístico para a população (STDDEV_POP) de todos os valores na expressão especificada
    SELECT STDDEV_POP(populacao) AS std FROM curso.senso;


/*
 * Funções de agregações - VAR_POP
 */
    -- Query 1 - Retorna a variância estatística de todos os valores da expressão especificada
    SELECT VAR_POP(populacao) AS var_populacao
    FROM curso.senso
    WHERE ano = '2014';

    -- Query 2 - Variância populacional por estado
    SELECT
        estado,
        VAR_POP(populacao) AS var_populacao
    FROM curso.senso
    GROUP BY 1;


/*
 * Funções de agregações - VAR_SAMP
 */
    -- Query 1 - Retorna a variância estatística para o preenchimento de todos os valores da expressão especificada
    SELECT VAR_SAMP(populacao) FROM curso.senso;

    -- Query 2 - Variância amostral por estado
    SELECT
        estado,
        VAR_SAMP(populacao) AS var_populacao
    FROM curso.senso
    GROUP BY 1;


/*
 * Consultas gerais
 */
    -- Query 1 - Comparando crescimento pop da cidades referente aos anos 2010 a 2014
    SELECT
        senso1.nome_mun,
        senso1.populacao AS curso.senso_2010,
        senso2.populacao AS curso.senso_2014,
        (100 / senso1.populacao) * (senso2.populacao) - 100 AS percentual
    FROM curso.senso AS senso1
    INNER JOIN curso.senso AS senso2 ON senso1.cod_mun = senso2.cod_mun
    WHERE
        senso1.ano = '2010'
        AND senso2.ano = '2014';

    -- Query 2 - Comparando crescimento pop por estado referente aos anos 2010 a 2014
    SELECT
        senso1.estado,
        SUM(senso1.populacao) AS curso.senso_2010,
        SUM(senso2.populacao) AS curso.senso_2014,
        (100 / SUM(senso1.populacao)) * SUM(senso2.populacao) - 100 AS percentual
    FROM curso.senso AS senso1
    INNER JOIN curso.senso AS senso2 ON senso1.cod_mun = senso2.cod_mun
    WHERE
        senso1.ano = '2010'
        AND senso2.ano = '2014'
    GROUP BY 1;


/*
 * Funções de agregações - GROUP_CONCAT
 */

    USE world;

    -- Query 1 - Junção populacional por continente
    SELECT
        continent,
        GROUP_CONCAT(DISTINCT population ORDER BY population DESC SEPARATOR ';') AS grupo
    FROM world.country
    GROUP BY 1;

    -- Query 2 - Junção regional por continente
    SELECT
        continent,
        GROUP_CONCAT(DISTINCT region ORDER BY region DESC SEPARATOR ';') AS regiao
    FROM world.country
    GROUP BY 1;


/*
 * Funções de agregações - WITH ROLLUP
 */

    USE curso;

    -- Query 1 - Quantidade por estado com seu somatorio final
    SELECT
        estado,
        COUNT(*) AS qtd
    FROM curso.senso
    WHERE ano = '2014'
    GROUP BY 1 DESC WITH ROLLUP;
