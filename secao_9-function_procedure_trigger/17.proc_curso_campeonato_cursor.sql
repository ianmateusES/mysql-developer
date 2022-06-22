-- drop PROCEDURE proc_campeonato

DELIMITER $$

CREATE PROCEDURE proc_campeonato (INOUT classificacao varchar(4000))
BEGIN
    DECLARE p_final INTEGER DEFAULT 0;
    DECLARE p_time varchar(100) DEFAULT "";
    DECLARE p_pontos varchar(100) DEFAULT "";
    DECLARE p_posicao varchar(100) DEFAULT 1;
    DECLARE p_acum INTEGER DEFAULT 0;
    declare p_situa varchar (100);

    -- declare cursor para time_cursor
    DECLARE time_cursor CURSOR FOR
        SELECT nometime, pontos FROM campeonato ORDER BY pontos DESC;

    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_final = 1;

    CREATE TEMPORARY TABLE lista_camp (
        posicao INT,
        time VARCHAR(150),
        pontos INT,
        p_acum INT,
        situacao VARCHAR(100)
    );

    OPEN time_cursor;

    loop_campeonato: LOOP
        FETCH time_cursor INTO p_time, p_pontos;

        IF p_final = 1 THEN
            LEAVE loop_campeonato;
        END IF;

        IF p_posicao <= 6 THEN
            SET p_situa = 'LIBERTADORES';
        ELSEIF p_posicao <= 8 THEN
            SET p_situa = 'PRE-LIBERTADORES';
        ELSEIF p_posicao <= 12 THEN
            SET p_situa = 'SUL-AMERICANA';
        ELSEIF p_posicao <= 16 THEN
            SET p_situa = '';
        ELSEIF p_posicao >= 17 THEN
            SET p_situa = 'Rebaixado';
        END IF;

        -- Acumluando pontos
        SET p_acum = p_acum + p_pontos;

        -- INSERT TEMP
        INSERT INTO lista_camp VALUES
            (p_posicao, p_time, p_pontos, p_acum, p_situa);

        -- Atribui valores
        SET p_posicao = p_posicao + 1;
    END LOOP loop_campeonato;

    CLOSE time_cursor;
    -- apresento valores
    SELECT * FROM lista_camp;
    -- elimino tabela temporaria
    DROP TEMPORARY TABLE lista_camp;
END$$
DELIMITER ;

SET @classificacao = "";
CALL proc_campeonato(@classificacao);
SELECT @classificacao;
