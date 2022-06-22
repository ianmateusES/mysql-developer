/*
 * PROCEDURE
 */
    -- Query 1 - Valor passado na variavel ira refletir no valor da variavel externa
    USE curso;
    DELIMITER //
    CREATE PROCEDURE curso.proc_aumento(INOUT valor DECIMAL(10, 2), taxa DECIMAL(10, 2))
    BEGIN
        SET valor = valor + valor * taxa / 100;
    END //
    DELIMITER ;

    -- Query 2 - Executando procedure
    SET @valor = 50.00;
    CALL curso.proc_aumento(@valor, 25.00);

    -- Query 3 - Verificando o valor da variavel
    SELECT @valor;
