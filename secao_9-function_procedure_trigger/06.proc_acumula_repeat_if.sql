/*
 * PROCEDURE - REPEAT e IF
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_acumula(valor_teto INT)
    main: BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE soma INT DEFAULT 0;

        -- Testando valor menor que 1
        IF valor_teto < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS ERRO;
            LEAVE main;
        END IF;

        REPEAT
            SET contador = contador + 1;
            SET soma = soma + contador;
            UNTIL contador = valor_teto;
        END REPEAT;

        SELECT SOMA;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_acumula(-2);
