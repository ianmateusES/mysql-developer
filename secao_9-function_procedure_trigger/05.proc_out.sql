/*
 * PROCEDURE - Parametro OUT
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_ajusta_custo_2(
        IN p_cod_mat INT,
        taxa DECIMAL(10, 2),
        OUT antes DECIMAL(10, 2))
    BEGIN
        -- SELECT com atribuição de valores
        SELECT custo into antes
        FROM curso.material
        WHERE cod_mat = p_cod_mat;

        -- UPDATE
        UPDATE curso.material SET custo = custo + custo * taxa / 100
        WHERE cod_mat = p_cod_mat;

    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL proc_ajusta_custo_2(2, 7, @antes);
    SELECT @antes;

    -- Query 3 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_ajusta_custo_3(
        IN p_cod_mat INT,
        taxa DECIMAL(10, 2),
        OUT antes DECIMAL(10, 2),
        OUT depois DECIMAL(10, 2))
    BEGIN
        -- SELECT para atribuicao de valores
        SELECT
            custo,
            custo + ((custo * taxa) / 100) AS pos INTO antes,
            depois
        FROM curso.material
        WHERE cod_mat = p_cod_mat;

        -- UPDATE para efetivar a atualização
        UPDATE curso.material SET custo = custo + custo * taxa / 100
        WHERE cod_mat = p_cod_mat;
    END //
    DELIMITER ;

    -- Query 3 - Invocando PROCEDURE
    CALL proc_ajusta_custo_3(2, 7, @antes, @depois);
    SELECT
        @antes AS antes,
        @depois AS depois
