/*
 * PROCEDURE - REPEAT
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_tabuada_r_t (tabuada INT)
    BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE resultado INT DEFAULT 0;

        REPEAT
            SET contador = contador + 1;
            SET resultado= tabuada * contador;
            CREATE TEMPORARY TABLE curso.temp_tab (res VARCHAR(50));

            SELECT CONCAT(
                tabuada,
                ' x ',
                contador,
                ' = ',
                resultado
            ) AS resultado;

            UNTIL contador > 9
        END REPEAT;

        -- select para apresentar o valores
        SELECT * FROM curso.temp_tab;

        -- Dropar a tabela temp tab
        DROP TEMPORARY TABLE curso.temp_tab;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_tabuada_r_t(7);
