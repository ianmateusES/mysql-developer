-- Criando tabela para trigger
CREATE TABLE auditoria_salario (
    id INT NOT NULL PRIMARY KEY auto_increment,
    id_func INT,
    salario_antes DECIMAL(10, 2) NOT NULL,
    salario_depois DECIMAL(10, 2) NOT NULL,
    usuario varchar(30) NOT NULL,
    data DATETIME NOT NULL
);

-- Analisando dados
SELECT * FROM funcionarios;

-- Criando trigger com evento apos update na tabela funcionario
CREATE TRIGGER tg_audit_sal AFTER UPDATE ON funcionarios
FOR EACH ROW
    INSERT INTO auditoria_salario
        (id_func, salario_antes, salario_depois, usuario, data)
    VALUES
        (new.id, old.salario, new.salario, User(), Now());

-- Testando a trigger
UPDATE funcionarios SET salario = salario * 1.10;

SELECT * FROM auditoria_salario;

SHOW TRIGGERS;

-- DROP TRIGGER tg_audit_sal;
-- DROP TABLE auditoria_salario;
