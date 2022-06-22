-- DROP TABLE historico_setor;
CREATE TABLE historico_setor (
    transacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id INT NOT NULL,
    SETOR_ANT VARCHAR(50),
    SETOR_DEP VARCHAR(50) NOT NULL,
    user VARCHAR(50) NOT NULL,
    data DATETIME NOT NULL
);

-- SELECT * FROM funcionarios;
DELIMITER //
CREATE TRIGGER TG_HISTORICO_SETOR BEFORE UPDATE ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO historico_setor
        (id, setor_ant, setor_dep, user, data)
    VALUES
        (new.id, old.setor, new.setor, user(), now());
END//
DELIMITER ;

-- DROP TRIGGER TG_HISTORICO_SETOR

SELECT * FROM funcionarios;

UPDATE funcionarios SET setor = 'TI Desenvolvimento'
WHERE id = '5';

SELECT * FROM historico_setor;
