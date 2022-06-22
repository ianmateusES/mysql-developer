/*
 * PROCEDURE - WHILE e IF
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_acumula_w(valor_teto INT)
    main: BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE soma INT DEFAULT 0;

        IF valor_teto < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS erro;
            LEAVE main;
        END IF;

        WHILE contador < valor_teto DO
            SET contador = contador + 1;
            SET soma = soma + contador;
        END WHILE;

        SELECT SOMA;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_acumula_w(5);

    -- Query 3 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_acumula_wt(valor_teto INT)
    main: BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE soma INT DEFAULT 0;

        IF valor_teto < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS erro;
            LEAVE main;
        END IF;

        WHILE contador < valor_teto do
            SET contador = contador + 1;
            SET soma = soma + contador;
        END WHILE;

        SELECT SOMA;
    END //
    DELIMITER ;

    -- Query 4 - Invocando PROCEDURE
    CALL curso.proc_acumula_wt(-2);
