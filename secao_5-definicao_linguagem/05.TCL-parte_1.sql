/*
 * TCL - Testando transações
 */
    -- Query 1 - Criando tabela de teste
    CREATE TABLE curso.cadastro (
        nome VARCHAR(50) NOT NULL,
        docto VARCHAR(20) NOT NULL
    );

    -- Query 2 - Iniciando transações
    START TRANSACTION;

    -- Insert dos elementos
    INSERT INTO curso.cadastro VALUES ('Andre', '12341244');
    INSERT INTO curso.cadastro VALUES ('Joao', '12341248');
    INSERT INTO curso.cadastro VALUES ('Pedro', '12341246');

    -- Retorna a tabela para estado anterior do BEGIN TRANSACTION
    -- ROLLBACK;

    -- Efetiva as informações na tabelas do banco de dados
    COMMIT;

    -- Deletando e verificando a tabela cadastro
    -- DELETE FROM curso.cadastro;
    -- SELECT * FROM curso.cadastro;
