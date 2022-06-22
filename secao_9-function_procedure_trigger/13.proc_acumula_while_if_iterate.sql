/*
 * PROCEDURE - SELECT
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_acumula_iterate(valor_teto int)
    main: BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE soma INT DEFAULT 0;

        IF valor_teto < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS ERRO;
            LEAVE main;
        END IF;

        teste: LOOP
            SET contador = contador + 1;
            SET soma = soma + contador;

            IF contador < valor_teto THEN
                ITERATE teste;
            END IF;

            LEAVE teste;
        END LOOP teste;

        -- Imprimindo resultado
        SELECT SOMA;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_acumula_iterate(7);
