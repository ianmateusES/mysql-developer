/*
 * PROCEDURE - REPEAT
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_tabuada_r(tabuada INT)
    BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE resultado INT DEFAULT 0;

        REPEAT
            SET contador = contador + 1;
            SET resultado= tabuada * contador;

            SELECT CONCAT(
                tabuada,
                ' x ',
                contador,
                ' = ',
                resultado
            ) AS resultado;

            UNTIL contador > 9
        END REPEAT;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_tabuada_r(6);
