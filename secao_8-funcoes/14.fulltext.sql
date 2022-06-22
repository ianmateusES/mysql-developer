USE curso;

-- Criando tabela para teste
CREATE TABLE curso.artigo (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(200),
    corpo TEXT,
    FULLTEXT (titulo, corpo)
) ENGINE=InnoDB;

-- Inserindo dados
INSERT INTO curso.artigo (titulo, corpo) VALUES
    ('MySQL Tutorial','SGBD MYSQL do zero ...'),
    ('Como utilizar bem o MYSQL','Depois que analisamos muitos ...'),
    ('Otimizando MySQL','Neste tutorial vamos aprende...'),
    ('1001 Dicas no MYSQL','1. Nunca incie o mysqld como root. 2. ...'),
    ('MySQL vs. SQL Server','Nesta comparação vamos ...'),
    ('Segurança no MYSQL','Quando configurado corretamente,o MySQL ...');


/*
 * Funções FULLTEXT
 */
    -- Query 1
    SET @pesquisa:='Tutorial';
    SELECT *
    FROM curso.artigo
    WHERE
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE);

    -- Query 2
    SET @pesquisa:='Tutorial';
    SELECT COUNT(*)
    FROM curso.artigo
    WHERE
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE);

    -- Query 3
    SET @pesquisa:='Tutorial';
    SELECT COUNT(IF(
            MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE),
            1,
            NULL
        )) AS qtd
    FROM curso.artigo;

    -- Query 4
    SET @pesquisa:='Tutorial Otimizando';
    SELECT
        id,
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE) AS score
    FROM curso.artigo;

    -- Query 5
    SET @pesquisa:='MySQL';
    SELECT
        id,
        titulo,
        corpo,
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE) AS score
    FROM curso.artigo;

    -- Query 6
    SET @pesquisa:='Quando configurado corretamente,o MySQL';
    SELECT
        id,
        titulo,
        corpo,
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE) AS score
    FROM curso.artigo
    WHERE
        MATCH(titulo, corpo) AGAINST (@pesquisa IN NATURAL LANGUAGE MODE);
