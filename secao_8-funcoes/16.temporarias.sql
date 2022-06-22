/*
 * Tabela temporaria
 */
    -- Query 1 - Criando as tabelas
    USE curso;
    CREATE TEMPORARY TABLE curso.tmp_senso1 (
        id INT PRIMARY KEY AUTO_INCREMENT,
        cod_mun char(7),
        nome_mun VARCHAR(80)
    )ENGINE=MEMORY;

    -- Query 2 - Inserindo dados tabela temp
    INSERT INTO curso.tmp_senso1 (cod_mun, nome_mun)
        SELECT cod_mun, nome_mun FROM curso.senso;

    -- Query 3 - Verificando os dados da tabela temp
    SELECT * FROM curso.tmp_senso1;

    -- Query 4 - Criando tabela temp através do SELECT
    CREATE TEMPORARY TABLE tmp_senso2
        SELECT * FROM senso;

    -- Query 5 - Explorando as tabelas
    EXPLAIN curso.tmp_senso1;
    EXPLAIN curso.tmp_senso2;
    EXPLAIN curso.senso;

    -- Query 6 - Dropando a tabela temporaria
    DROP TEMPORARY TABLE curso.tmp_senso1;
    DROP TEMPORARY TABLE curso.tmp_senso2;

    -- Query 7 - Verificando as tabelas
    SELECT * FROM curso.tmp_senso1;
    SELECT * FROM curso.tmp_senso2;
