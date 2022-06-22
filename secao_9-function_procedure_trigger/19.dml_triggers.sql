-- DROP TABLE cad_material;
-- DROP TABLE nf_itens;
CREATE TABLE cad_material (
    cod_mat	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_mat VARCHAR(50) UNIQUE,
    saldo INT NOT NULL DEFAULT 0
);

SELECT * FROM cad_material;

INSERT INTO cad_material(nome_mat, saldo) VALUES ('GAME', 10);
INSERT INTO cad_material(nome_mat, saldo) VALUES ('SMARTV 42', 5);
INSERT INTO cad_material(nome_mat, saldo) VALUES ('SMARTPHONE', 15);
INSERT INTO cad_material(nome_mat, saldo) VALUES ('NOTEBOOK', 32);
INSERT INTO cad_material(nome_mat, saldo) VALUES ('TABLET', 50);

-- Criando tabela itens nota fiscal
CREATE TABLE nf_itens (
    venda INT,
    cod_mat	INT,
    qtd	INT
);

-- TRIGGER ação depois de INSERT na tabela nf_itens
DELIMITER $
CREATE TRIGGER Tg_NF_ITENS_Insert AFTER INSERT ON nf_itens
FOR EACH ROW
BEGIN
    UPDATE cad_material SET saldo = saldo - NEW.qtd
    WHERE cod_mat = NEW.cod_mat;
END$

-- TRIGGER ação depois de DELETE na tabela nf_itens
CREATE TRIGGER Tg_NF_ITENS_Delete AFTER DELETE ON nf_itens
FOR EACH ROW
BEGIN
    UPDATE cad_material SET saldo = saldo + OLD.qtd
    WHERE cod_mat = OLD.cod_mat;
END$

-- TRIGGER ação depois de UPDATE na tabela nf_itens
CREATE TRIGGER Tg_NF_ITENS_update AFTER UPDATE ON nf_itens
FOR EACH ROW
BEGIN
    UPDATE cad_material SET saldo = saldo + (OLD.qtd - NEW.qtd)
    WHERE cod_mat = OLD.cod_mat;
END$


DELIMITER ;

SHOW TRIGGERS;

-- VERIFICANDO DADOS
SELECT * FROM cad_material;

-- INSERINDO VALORES
INSERT INTO nf_itens VALUES (1, 1, 3);
INSERT INTO nf_itens VALUES (1, 2, 1);
INSERT INTO nf_itens VALUES (1, 3, 5);

-- UPDATE
UPDATE nf_itens SET qtd = 4
WHERE
    venda = '1'
    AND cod_mat = '1';

-- DELETE teste TRIGGER
DELETE FROM nf_itens
WHERE
    venda = '1'
    AND cod_mat = '1';

-- Verificando dados
SELECT *
FROM nf_itens
WHERE
    venda = '1'
    AND cod_mat = '1';

/*
DROP TRIGGER Tg_NF_ITENS_Insert;
DROP TRIGGER Tg_NF_ITENS_Delete;
DROP TRIGGER Tg_NF_ITENS_uPDATE;
*/
