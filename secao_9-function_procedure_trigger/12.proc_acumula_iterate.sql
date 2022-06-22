/*
 * PROCEDURE - ITERATE
 * ITERATE significa: dentro de uma estrutura de repetição inicie o loop novamente
 * A declaração ITERATE aparece apenas dentro de estruturas LOOP, REPEAT E WHILE
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_mod_par (teto INT)
    main: BEGIN
        DECLARE contador INT DEFAULT 0;

        enquanto_par: WHILE contador < teto DO
            SET contador = contador + 1;

            -- Resultado sera 0 ou 1, zero imprimi, 1 retorna ao inicio
            IF MOD(contador, 2) THEN
                ITERATE enquanto_par;
            END IF;

            SELECT CONCAT(
                contador,
                ' é um numero par, resultado mod ',
                MOD(contador, 2)
            ) AS valor;
        END WHILE;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_mod_par(15);

