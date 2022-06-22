/*
 * PROCEDURE - Parametro IN
 */
    -- Query 1
    DELIMITER //
    CREATE PROCEDURE curso.proc_cidades_uf (IN p_uf VARCHAR(2))
    BEGIN
        SELECT DISTINCT
            nome_mun,
            populacao,
            cod_uf
        FROM senso
        WHERE cod_uf = p_uf;
    END //
    DELIMITER ;

    -- Query 2 - Invocando a procedure
    CALL curso.proc_cidades_uf(35);


    -- Query 3 - Invocando a procedure com variavel
    SET @var_uf = '13';
    CALL curso.proc_cidades_uf(@var_uf);

    -- Query 4 - Criando base para procedure
    CREATE TABLE curso.material (
        cod_mat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(50) NOT NULL,
        custo DECIMAL(10, 2) NOT NULL
    );

    CREATE TABLE curso.estoque (
        cod_mat INT NOT NULL,
        qtd int NOT NULL,
        FOREIGN KEY (cod_mat) REFERENCES curso.material(cod_mat)
    );

    -- Query 5 - Inserindo valores
    INSERT INTO curso.material (nome, custo) VALUES
        ('XBOX', '1500'),
        ('SMART TV 42', '2200'),
        ('NOTEBOOK', '3900'),
        ('SMARTPHONE', '2350');

    INSERT INTO curso.estoque (cod_mat, qtd) VALUES
        (1, 12),
        (2, 29),
        (3, 33),
        (4, 54);

    -- Query 6 - Testando FK
    INSERT INTO curso.estoque (cod_mat, qtd) VALUES (5, 54);

    -- Query 7 - PROCEDURE atualiza preco custo em pct
    DELIMITER //
    CREATE PROCEDURE curso.proc_ajusta_custo(IN p_cod_mat INT, taxa DECIMAL(10, 2))
    BEGIN
        UPDATE material SET custo = custo + custo * taxa / 100
        WHERE cod_mat = p_cod_mat;
    END //
    DELIMITER ;

    -- Query 8 - Invocando PROCEDURE
    CALL curso.proc_ajusta_custo(2, 7);

    -- Query 9 - Verificando tabela
    SELECT * FROM curso.material;
