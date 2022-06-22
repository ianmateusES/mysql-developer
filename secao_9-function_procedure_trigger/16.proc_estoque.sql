/*
 * PROCEDURE
 * Objetivo atualizar ou inserir dados nas tabelas ztok e ztok_lote e gravar dados na tabela
 * mov_ztok para gera razao de movimento as tabelas deve manter os saldo consistentes entre elas
 */
    -- Query 1 -
DELIMITER //
CREATE PROCEDURE proc_atualiza_estoque (
    tipo_mov VARCHAR(1),
    p_cod_mat VARCHAR(50),
    p_lote VARCHAR(15),
    p_qtd_mov DECIMAL(10, 2))
main: BEGIN
    DECLARE cod_erro CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    DECLARE rows INT;
    DECLARE result TEXT;
    DECLARE saldo_estoque decimal(10, 2) DEFAULT 0;
    DECLARE saldo_lote decimal(10, 2) DEFAULT 0;
    DECLARE reg_z int DEFAULT 0; -- variavel de registros em estoque
    DECLARE reg_zl int DEFAULT 0; -- variavel de registros em estoque lote

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
        cod_erro = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
    END;

    -- Verificando se operacao permitida e valor > 0
    IF tipo_mov NOT IN ('E', 'S') OR p_qtd_mov < 1 THEN
        SELECT 'Operacao invalida ou valor menor que 1' AS erro;
        LEAVE main;
    END IF;

    -- Verificando se o material existe cadastro
    IF (
        SELECT COUNT(*)
        FROM curso.material
        WHERE cod_mat = p_cod_mat
    ) = 0 THEN
        SELECT 'Material nao existe!' AS erro;
        LEAVE main;
    END IF;

    -- Atribuindo saldo de estoque do material na variavel saldo_estoque
    SELECT saldo INTO saldo_estoque
    FROM curso.ztok
    WHERE cod_mat = p_cod_mat;

    -- Atribuindo saldo de estoque lote do material na variavel saldo_lote
    SELECT saldo INTO saldo_lote
    FROM curso.ztok_lote
    WHERE
        cod_mat = p_cod_mat
        AND lote = p_lote;

    -- Verificando se estoque ficara negativo
    IF tipo_mov = 'S' AND saldo_estoque < p_qtd_mov THEN
        SELECT 'Estoque Negativo, operacao Cancelada' AS erro;
        LEAVE main;
    END IF;

    -- Verificando se estoque lote ficara negativo
    IF tipo_mov = 'S' AND saldo_lote < p_qtd_mov THEN
        SELECT 'Estoque Negativo, operacao Cancelada' AS erro;
        LEAVE main;
    END IF;

    START TRANSACTION;

    -- Verifcando se o material ja tem registro na tabela ztok
    SELECT SQL_CALC_FOUND_ROWS cod_mat
    FROM curso.ztok
    WHERE cod_mat = p_cod_mat;

    SELECT FOUND_ROWS() INTO reg_z;

    -- Verifcando se o material ja tem registro na tabela ztok_lote
    SELECT SQL_CALC_FOUND_ROWS cod_mat
    FROM curso.ztok_lote
    WHERE
        cod_mat = p_cod_mat
        AND lote=p_lote;

    SELECT FOUND_ROWS() INTO reg_zL;

    -- VERIFICACAOES
    IF tipo_mov = 'S' THEN
        -- ATUALIZAR
        UPDATE curso.ztok SET saldo = saldo - p_qtd_mov
        WHERE cod_mat = p_cod_mat;

        UPDATE curso.ztok_lote SET saldo = saldo - p_qtd_mov
        WHERE
            cod_mat = p_cod_mat
            AND lote = p_lote;

        INSERT INTO curso.mov_ztok (mov, cod_mat, lote, qtd, usuario, dt_hor_mov) VALUES
            (tipo_mov, p_cod_mat, p_lote, p_qtd_mov, user(), now());

        -- ENTRADA
    elseif tipo_mov = 'E' AND reg_z = 1 AND reg_zl = 1 THEN
        -- Atualiza saldo ztok
        UPDATE curso.ztok SET saldo = saldo + p_qtd_mov
        WHERE cod_mat = p_cod_mat;

        -- Atualiza saldo ztok_lote
        UPDATE curso.ztok_lote SET saldo = saldo + p_qtd_mov
        WHERE
            cod_mat = p_cod_mat
            AND lote=p_lote;

        -- Insere valores na mov ztok
        INSERT INTO curso.mov_ztok (mov, cod_mat, lote, qtd, usuario, dt_hor_mov) VALUES
            (tipo_mov, p_cod_mat, p_lote, p_qtd_mov, user(), now());

        -- Verifica entrada se existe na ztok e nao existe na ztok_lote
    elseif tipo_mov = 'E' AND reg_z = 1 AND reg_zl = 0 THEN
        UPDATE curso.ztok set saldo = saldo + p_qtd_mov
        WHERE cod_mat = p_cod_mat;

        -- NAO EXISTE NAO REALIZAR INSERT
        INSERT INTO curso.ztok_lote (cod_mat, lote, saldo) VALUES
            (p_cod_mat, p_lote, p_qtd_mov);

        -- INSERT MOV ZTOK
        INSERT INTO curso.mov_ztok (mov, cod_mat, lote, qtd, usuario, dt_hor_mov) VALUES
            (tipo_mov, p_cod_mat, p_lote, p_qtd_mov, user(), now());

        -- verifica mov entrada ,nao existe na ztok e nao existe na ztok_lote
    elseif tipo_mov = 'E' AND reg_z = 0 AND reg_zl = 0 THEN
        -- INSERT
        INSERT INTO curso.ztok (cod_mat, saldo) VALUES
            (p_cod_mat, p_qtd_mov);

        INSERT INTO curso.ztok_lote (cod_mat, lote, saldo) VALUES
            (p_cod_mat, p_lote, p_qtd_mov);

        -- INSERT MOVTO
        INSERT INTO mov_ztok (mov, cod_mat, lote, qtd, usuario, dt_hor_mov) VALUES
            (tipo_mov, p_cod_mat, p_lote, p_qtd_mov, user(), now());
    END if;

    IF cod_erro = '00000' THEN
        GET DIAGNOSTICS rows = ROW_COUNT;
        SET result = CONCAT('Atualizacao com Sucesso  = ', rows);
    ELSE
        SET result = CONCAT(
            'Erro na atualizacao, error = ',
            cod_erro,
            ', message = ',
            msg
        );
    END IF;

    -- Retorno do que aconteceu
    SELECT result;

    IF cod_erro='00000' then
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;


--param 1 mov - S saida E entrada
--param 2 cod_mat
--param 3 lote
--param 4 quantidade
CALL proc_atualiza_estoque('E', 2, 'XYZ', 9);

-- Consultando
SELECT * FROM curso.ztok;
SELECT * FROM curso.ztok_lote;
SELECT * FROM curso.mov_ztok;
SELECT * FROM curso.material;

/*
--EXEC Atualiza_estoque 'S', 2, 'QAZ', 3

SELECT * FROM curso.stok;
SELECT * FROM curso.stok_lote;
SELECT * FROM curso.mov_stok;
*/
