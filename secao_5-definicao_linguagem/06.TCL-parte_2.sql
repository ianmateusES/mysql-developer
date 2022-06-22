/*
 * TCL - Testando transações
 */
    -- Query 1 - Iniciando transações
    START TRANSACTION;

    -- Insert de registros
    INSERT INTO curso.cadastro VALUES ('Andre', '12341244');
    SAVEPOINT P1;
    INSERT INTO curso.cadastro VALUES ('Joao', '12341248');
    SAVEPOINT P2;
    INSERT INTO curso.cadastro VALUES ('Pedro', '12341246');
    SAVEPOINT P3;

    -- Retorna a tabela para o estado anterior do BEGIN TRANSACTION
    ROLLBACK TO SAVEPOINT P3;

    -- Efetivando as inforções na tabela do banco de dados
    COMMIT;

    -- Deletando e verificando a tabela cadastro
    -- DELETE FROM curso.cadastro
    -- SELECT * FROM curso.cadastro
