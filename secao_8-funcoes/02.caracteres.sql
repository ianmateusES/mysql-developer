-- https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_ascii

-- ASCII Exemplo
SELECT ASCII('SQL') AS retorno;
SELECT ASCII('S') AS retorno;
SELECT ASCII('Q') AS retorno;
SELECT ASCII('L') AS retorno;


-- LTRIM - Retorna uma expressão de caractere depois de remover espaços em branco à esquerda
SET @frase_para_ltrim:='     Cinco espaços no inicio.';
SELECT CONCAT('Texto sem espaço:', LTRIM(@frase_para_ltrim)) AS retorno
UNION ALL
SELECT CONCAT('Texto Com espaço:', @frase_para_ltrim);


-- RTRIM
SET @frase_para_rtrim:='Cinco espaços no inicio.     ';
SELECT CONCAT(RTRIM(@frase_para_rtrim), 'Texto sem espaço:') AS retorno
UNION ALL
SELECT CONCAT(@frase_para_rtrim,'Texto Com espaço:');


-- TRIM
SET @frase_para_trim:='     Cinco espaços no inicio.     ';
SELECT CONCAT('Antes sem espaço:', TRIM(@frase_para_trim), 'Depois sem espaço:') AS retorno
UNION ALL
SELECT CONCAT('Antes sem espaço:', @frase_para_trim, 'Depois sem espaço:');


-- STRCMP - Retorna 0 para igual, -1 se o primeiro argumento menor que segundo 1 contrario
SELECT STRCMP('SQL', 'SQL2') AS retorno;
SELECT STRCMP('MYSQL', 'MY') AS retorno;
SELECT STRCMP('SQL', 'SQL') AS retorno;


-- CONCAT - Concatena valores
SELECT CONCAT('My', 'S', 'QL') AS retorno;

SELECT CONCAT(
        'Ola ',
        CURRENT_USER(),
        ' Seu Saldo é R$',
        11.00,
        ' em ',
        DAY(NOW()),
        '/',
        MONTH(NOW()),
        '/',
        YEAR(NOW())
    ) AS resultado;

SELECT CONCAT(
        'Bem-vindo! ',
        CONCAT_WS(',', 'Rosa', 'Andre')
    ) AS retorno;

SELECT CONCAT(
        'Bem-vindo! ',
        CONCAT_WS('|', 'Rosa', 'Andre')
    ) AS retorno;

USE sakila;
SELECT CONCAT_WS(
        '|',
        actor_id,
        first_name,
        last_name
    ) AS retorno
FROM sakila.actor;


-- REPLACE - Substitui todas as ocorrências de um valor da cadeia de caracteres especificado por outro valor de cadeia de caracteres
SET @palavra:='bala';
SELECT
    @palavra AS de,
    REPLACE(@palavra, 'ba', 'mo') AS para;

SELECT
    'Isto é teste' AS de,
    REPLACE('Isto é teste', 'teste', 'producao') AS para;

USE world;
SELECT
    name,
    continent,
    REPLACE(continent, 'South America', 'America do Sul') AS trocado
FROM world.country;

USE curso;
CREATE TABLE curso.pessoas (
    nome VARCHAR(30)
);
INSERT INTO curso.pessoas VALUES('José');
INSERT INTO curso.pessoas VALUES('André');
INSERT INTO curso.pessoas VALUES('Helem');
SELECT * FROM curso.pessoas;
UPDATE curso.pessoas SET nome = REPLACE(nome, 'é', 'e');
SELECT * FROM curso.pessoas;


-- LPAD - Repete um valor da cadeia de caracteres um número especificado de vezes A ESQUERDA
USE curso;
CREATE TABLE curso.tst (
    c1 VARCHAR(3),
    c2 CHAR(3)
);
INSERT INTO curso.tst VALUES ('2', '2');
INSERT INTO curso.tst VALUES ('37', '37');
INSERT INTO curso.tst VALUES ('597', '597');
SELECT * FROM curso.tst;
SELECT
    c1,
    c2,
    LPAD(c1, 5, '0') AS lpad_c1,
    LPAD(c2, 10, '0') AS lpad_c2
FROM curso.tst;


-- RPAD
SELECT
    c1,
    c2,
    RPAD(c1, 5, '0') AS rpad_c1,
    RPAD(c2, 10, '0') AS rpad_c2
FROM curso.tst;


-- LEFT - Retorna a parte da esquerda de uma cadeia de caracteres com o número de caracteres especificado
USE sakila;
SELECT
    first_name,
    LEFT(first_name, 5) AS retorno
FROM sakila.actor;


-- RIGHT - Retorna a parte da esquerda de uma cadeia de caracteres com o número de caracteres especificado
USE sakila;
SELECT
    first_name,
    RIGHT(first_name, 5) AS retorno
FROM sakila.actor;


-- UPPER
USE world;
SELECT
    name,
    UPPER(name, 5) AS retorno
FROM world.country;


-- LOWER
USE world;
SELECT
    name,
    LOWER(name) AS retorno
FROM world.country;


-- REVERSE
USE world;
SELECT
    name,
    REVERSE(name) AS retorno
FROM world.country;


-- CHAR_LENGHT - conta caracteres
USE curso;
SELECT
    c1,
    c2,
    CHAR_LENGHT(c1) AS len_c1,
    CHAR_LENGHT(c2) AS len_c2
FROM curso.tst;


-- LENGTH
SELECT
    c1,
    c2,
    LENGTH(c1) AS len_c1,
    LENGTH(c2) AS len_c2
FROM curso.tst;


-- BIT_LENGTH
SELECT
    c1,
    c2,
    BIT_LENGTH(c1) AS len_c1,
    BIT_LENGTH(c2) AS len_c2
FROM curso.tst;


-- FIELD - Retorna inteiro da posicao
SELECT FIELD('QUI', 'SEG', 'TER', 'QUA', 'QUI', 'SEX') AS retorno;


-- FIND_IN_SET - Retorna inteiro da posicao no array
SELECT FIND_IN_SET('b', 'a,b,c,d') AS retorno;


-- MAKE_SET
SELECT MAKE_SET(1, 'a', 'b', 'c') AS retorno;
SELECT MAKE_SET(1 | 4, 'Ola', 'OI', 'Mundo') AS retorno;


-- SUBSTRING - Retorna uma substring de caractere com dados de caractere dento do parâmetro informado
USE world;
SELECT
    name,
    SUBSTRING(name, 1, 3) AS nome1,
    SUBSTRING(name, 4, 3) AS nome2,
    SUBSTRING(name, 7, 20) AS nome3
FROM world.country;

SELECT SUBSTRING(now(), 1, 4) AS ano;
SELECT SUBSTRING(now(), 6, 2) AS mes;
SELECT SUBSTRING(now(), 9, 2) AS dia;
