/*
 * FUNCTION
 */
    -- Query 1 - Criando função simples para retornar o valor da variavel a x b;
    USE curso;
    DELIMITER //
    CREATE FUNCTION curso.fn_teste (a DECIMAL(10, 2), b INT) RETURNS INT
        RETURN a * b;
    //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 2 - Invocando a função
    SELECT curso.fn_teste(12.5, 3);

    -- Query 3 - Criando table
    CREATE TABLE curso.produtos (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome_prod VARCHAR(50) NOT NULL,
        preco_unit DECIMAL(10, 2)
    );

    -- Query 4 - Inserindo valores
    INSERT INTO curso.produtos (nome_prod, preco_unit) VALUES
        ('XBOX', '1500.99'), ('SMART TV 49', '3199.99'), ('NOTEBOOK', '4200.99');

    -- Query 5 - Criando função para calcular total do preço x qtd
    DELIMITER //
    CREATE FUNCTION curso.fn_total (preco DECIMAL(10, 2), qtd INT) RETURNS DECIMAL(10, 2)
        RETURN CAST(qtd * preco AS DECIMAL(10, 2));
    //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 6 - Invocando função
    SET @qtd:=3;
    SET @id:=1;
    SELECT
        nome_prod,
        @qtd AS qtd,
        preco_unit AS val_uni,
        curso.fn_total(preco_unit, @qtd) AS total_compras
    FROM curso.produtos
    WHERE id = @id;

    -- Query 7 - Criando função para trazer primeira letra maiscula, demais minuscula
    DELIMITER //
    CREATE FUNCTION curso.fn_initcap (nome VARCHAR(50)) RETURNS VARCHAR(50)
        RETURN CONCAT(
            UPPER(SUBSTRING(nome, 1, 1)),
            LOWER(SUBSTRING(nome, 2, 50))
        );
    //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 8 - Invocando função
    SELECT
        nome_prod,
        curso.fn_initcap(nome_prod)
    FROM curso.produtos;

    -- Query 9 - Criando função de boas vindas
    DELIMITER //
    CREATE FUNCTION curso.fn_boas_vindas (usuario VARCHAR(50)) RETURNS VARCHAR(50)
        RETURN CONCAT(
            'Ola ',
            usuario,
            ' Seja Bem vindo'
        );
    //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 10 - Invocando função
    SELECT curso.fn_boas_vindas(USER());

    -- Query 11 -- Criando função de quantos filmes o ator fez
    USE sakila;
    DELIMITER //
    CREATE FUNCTION sakila.fn_filmes_ator (id_ator INT) RETURNS INT
    BEGIN
        DECLARE qtd INT;

        SELECT COUNT(*) INTO qtd
        FROM sakila.film_actor
        WHERE film_actor.actor_id = id_ator;

        RETURN qtd;
    END //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 11 - Invocando função;
    SELECT sakila.fn_filmes_ator(1);

    -- Query 12 - Criando tabelas teste
    USE curso;
    CREATE TABLE curso.avaliacao (
        aluno VARCHAR(10),
        nota1 INT,
        nota2 INT,
        nota3 INT,
        nota4 INT
    );

    -- Query 13 - Inserindo valores
    INSERT INTO curso.avaliacao VALUES
        ('Paul', 10, 9, 10, 10), ('Mary', 5, 2, 3, 4);

    -- Query 13 - Criando a função calcula media aluno
    DELIMITER //
    CREATE FUNCTION curso.fn_media (nome VARCHAR(10)) RETURNS FLOAT
    BEGIN
        DECLARE n1, n2, n3, n4 INT;
        DECLARE media FLOAT;

        SELECT
            avaliacao.nota1,
            avaliacao.nota2,
            avaliacao.nota3,
            avaliacao.nota4 INTO n1, n2, n3, n4
        FROM curso.avaliacao
        WHERE avaliacao.aluno = nome;

        SET media = (n1 + n2 + n3 + n4) / 4;

        RETURN media;
    END //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 14 - Invocando função
    SELECT curso.fn_media('Mary');

    -- Query 15 - Criando função simula aumento de salario;
    DELIMITER //
    CREATE FUNCTION curso.fn_simula_aumento(salario DECIMAL(10, 2), pct DECIMAL(10, 2)) RETURNS DECIMAL(10, 2)
    BEGIN
        RETURN salario + salario * pct /100;
    END //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 14 - Invocando a função
    SELECT curso.fn_simula_aumento(1550.50, 7.8);

    -- Query 15 - Criando INDEX para melhorar performance do SELECT
    CREATE INDEX ix_senso1 ON curso.senso(cod_uf, ano);

    -- Query 16 - Criando função quantidade de cidades do UF no ano
    USE curso;
    DELIMITER //
    CREATE FUNCTION curso.fn_cidades(p_uf VARCHAR(2), p_ano INT)
    RETURNS INT
    BEGIN
        DECLARE qtd INT;

        SELECT COUNT(*) INTO qtd
        FROM curso.senso
        WHERE
            senso.cod_uf = p_uf
            AND senso.ano = p_ano;

        RETURN qtd;
    END //
    DELIMITER ; -- Forçando o delimiter padrão

    -- Query 17 - Invocando funções
    SELECT DISTINCT
        estado,
        curso.fn_cidades(cod_uf, 2014)
    FROM curso.senso
    WHERE ano = '2014';
