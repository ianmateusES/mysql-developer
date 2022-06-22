/*
 * Criando tabela de ESTOQUES
 */
    -- Query 1 - Criando tabelas para procedure atualiza estoque
    USE curso;
    CREATE TABLE curso.ztok (
        cod_mat VARCHAR (20) NOT NULL,
        saldo DECIMAL (10, 2) NOT NULL
    );

    CREATE TABLE curso.ztok_lote (
        cod_mat INT,
        lote VARCHAR (15) NOT NULL,
        saldo DECIMAL (10, 2) NULL,
        FOREIGN KEY (cod_mat) REFERENCES material(cod_mat),
        PRIMARY KEY (cod_mat, lote)
    );

    CREATE TABLE curso.mov_ztok (
        transacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        mov VARCHAR (1) NOT NULL,
        cod_mat int NOT NULL,
        lote VARCHAR (15) NOT NULL,
        qtd DECIMAL (10, 2) NOT NULL,
        usuario VARCHAR (30) NOT NULL,
        dt_hor_mov DATETIME NOT NULL
    );

    CREATE UNIQUE INDEX ix_ztok1 ON curso.ztok(cod_mat);

    ALTER TABLE curso.mov_ztok
        ADD FOREIGN KEY (cod_mat) REFERENCES curso.material(cod_mat);

