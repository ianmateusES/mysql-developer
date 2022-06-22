/*
 * PROCEDURE - SELECT
 */
    -- Query 1 - Criando tabela para teste
    CREATE TABLE curso.cad_cli (
        cod_cli INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
        nome_cli VARCHAR(20) NOT NULL,
        PRIMARY KEY (cod_cli)
    );

    -- Query 2 - Criando exemplo de PROCEDURE para tratar erro
    DELIMITER //
    CREATE PROCEDURE curso.proc_trata_exc(IN var_nome_cli VARCHAR(100), OUT resposta VARCHAR(50))
    salvar: BEGIN
        -- setando variavel com zero default
        DECLARE excecao SMALLINT DEFAULT 0;
        -- caso ocorra erro setar a variavel excessao = 1
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excecao = 1;

        -- inicia transacao
        START TRANSACTION;
        -- insert de valores
        INSERT INTO cad_cli (cod_cli, nome_cli) VALUES (NULL, var_nome_cli);

        -- checando excessao com IF
        IF excecao = 1 THEN
            SET resposta = 'Erro ao gravar dados';
            ROLLBACK;
            LEAVE salvar;
        ELSE
            SET resposta = 'Salvo com sucesso!';
            COMMIT;
        END IF;
    END //
    DELIMITER ;

    -- Query 3 - Teste OK
    CALL curso.proc_trata_exc ('Jose', @resposta);
    SELECT @resposta;

    -- Query 4 - Teste para dar erro
    CALL curso.proc_trata_exc ('Pedro de Alcantara Machado neto Rodrigues', @resposta);
    SELECT @resposta;

    -- Query 5 - Verificando dados
    SELECT * FROM curso.cad_cli;
