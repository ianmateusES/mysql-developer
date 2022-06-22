/*
 * PROCEDURE - SELECT
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER //
    CREATE PROCEDURE curso.proc_qtd_val (p_cod_mat INT)
    BEGIN
        SELECT
            material.nome,
            material.custo,
            estoque.qtd,
            material.custo * estoque.qtd AS total
        FROM curso.material
        INNER JOIN curso.estoque ON material.cod_mat = estoque.cod_mat
        WHERE material.cod_mat = p_cod_mat;

        SELECT 'CONSULTA REALIZADA COM SUCESSO' AS msg;
    END //
    DELIMITER ;

    -- Query 2 - Invocando PROCEDURE
    CALL curso.proc_qtd_val(1);
