/*
 * PROCEDURE - LOOP
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_tabuada_l(tabuada int)
    BEGIN
        DECLARE contador INT DEFAULT 0;
        DECLARE resultado INT DEFAULT 0;

        loop_tabuada: LOOP
            SET contador = contador + 1;
            SET resultado = tabuada * contador;

            SELECT CONCAT(
                tabuada,
                ' x ',
                contador,
                ' = ',
                resultado
            );

            IF contador > 9 THEN
                LEAVE loop_tabuada;
            END IF;
        END LOOP loop_tabuada;
    END //
    DELIMITER;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_tabuada_l(5);
