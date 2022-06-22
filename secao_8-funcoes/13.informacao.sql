/*
 * Funções de informação
 */
    -- Query 1 - Descobrindo o tipo
    SELECT
        CHARSET('123') AS retorno1,
        CHARSET('ABC') AS retorno2;

    -- Query 2
    USE world;
    SELECT
        name,
        CHARSET(name) AS nome,
        continent,
        CHARSET(continent) AS continent,
        population,
        CHARSET(population) AS populacao
    FROM world.country;

    -- Query 2 - CHARSET de converoes
    SELECT
        CHARSET(CONVERT(name USING UTF8)) AS nome,
        CONVERT(name USING UTF8) AS nome,
        CHARSET(name) AS continent,
        name AS nome2,
        CHARSET(continent) AS continent,
        CHARSET(population) AS populacao
    FROM world.country;

    -- Query 3 - COLLATION
    SELECT COLLATION('abc');

    -- Query 4 - COLLATION curso
    USE curso;
    SELECT COLLATION(nome)
    FROM curso.alunos;

    -- Query 4 - COLLATION world
    USE world;
    SELECT COLLATION(name)
    FROM world.country;

    -- Query 5 - Descobrindo id da conexao
    SELECT CONNECTION_ID();

    -- Query 6 - Trazendo informação do usuario logado
    SELECT
        current_user(),
        current_user,
        USER(),
        session_user(),
        system_user();

    -- Query 7 - Verficando database selecionado
    USE sakila;
    SELECT database();

    -- Query 8 - Verificando usuários
    SELECT * FROM mysql.user;

    -- Query 9 - Retornando ultimo id inserido
    USE curso;
    INSERT INTO curso.alunos (nome) VALUES
        ('Catarina'), ('Greg'), ('Marla'), ('Jack');
    SELECT LAST_INSERT_ID();

    -- Query 10 - Retorna quantidade de registro inseridos, atualizado, deletados
    UPDATE funcionarios SET salario = salario * 1.055;
    SELECT row_count();

    -- Query 11 - verifcando schema db ativo
    USE curso;
    SELECT SCHEMA();

    -- Query 12 - verifcando schema db ativo
    USE sakila;
    SELECT SCHEMA();

    -- Query 13 - verifcando schema db ativo
    USE world;
    SELECT SCHEMA();

    -- Query 14 - Verificando versao mysql
    SELECT VERSION();
