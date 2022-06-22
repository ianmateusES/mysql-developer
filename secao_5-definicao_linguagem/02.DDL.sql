/*
 * DDL - Criando tabela
 */
    -- Query 1
    CREATE TABLE curso.funcionario (
        matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(50) NOT NULL,
        sobrenome VARCHAR(50) NOT NULL,
        endereco VARCHAR(50),
        cidade VARCHAR(50),
        pais VARCHAR(25),
        data_nasc DATETIME
    );

    -- Query 2 - Chave estrangeira
    CREATE TABLE curso.salario (
        matricula INT NOT NULL,
        salario DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (matricula) REFERENCES curso.funcionario (matricula)
    );

    -- Query 3 - Chave primaria
    CREATE TABLE curso.audit_salario (
        transacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        matricula INT NOT NULL,
        data_trans DATETIME NOT NULL,
        sal_antigo DECIMAL(10, 2),
        sal_novo DECIMAL(10, 2),
        Usuario varchar(20) NOT NULL,
        PRIMARY KEY (transacao),
        FOREIGN KEY (matricula) REFERENCES curso.funcionario (matricula)
    );

/*
 * DDL - Criando de index
 */
    -- Query 1
    CREATE INDEX ix_func1 ON curso.funcionario(data_nasc);

    -- Query 2
    CREATE INDEX ix_func2 ON curso.funcionario (cidade, pais);

/*
 * DDL - Adicionando novo campo na tabela
 */
    -- Query 1 - Adicionando coluna
    ALTER TABLE curso.funcionario ADD genero CHAR(1);

    -- Query 2 - Renomeando campo/colunas da tabela
    ALTER TABLE curso.funcionario change genero sexo char(1);

    -- Query 3 - Retornando situacao anterior
    ALTER TABLE curso.funcionario change sexo genero char(1);

    -- Query 4 - Renomeando tabela
    RENAME TABLE curso.funcionario TO pessoa;

    -- Query 5 - Retornando situacao anterior
    RENAME TABLE pessoa TO curso.funcionario;

/*
 * DDL - Para adicionar coluna na tabela senso
 */
    -- Query 1 - Adicionar coluna
    ALTER TABLE curso.senso ADD id INT;

    -- Query 2 - adicionar chave primaria na tabela senso AUTO_INCREMENT
    ALTER TABLE curso.senso MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

    -- Query 3 - Alterando tipo da coluna
    ALTER TABLE curso.funcionario MODIFY COLUMN endereco VARCHAR(30);

    -- Query 4 - Excluindo campo da coluna
    ALTER TABLE curso.funcionario DROP COLUMN genero;

    -- Query 5 - Alterar Engine da tabela
    ALTER TABLE curso.funcionario ENGINE = MyIsam;

/*
 * DDL - Database
 */
    -- Query 1 - Criando database
    CREATE DATABASE teste;

    -- Query 2 - Excluindo database
    DROP DATABASE teste;

    -- Query 3 - Excluindo table
    DROP TABLE salario;

/*
 * DDL - VIEW
 */
    -- Query 1 - Criação de VIEW
    CREATE VIEW curso.v_funcionario AS
        SELECT * FROM curso.funcionarios;

    -- Query 2 - Modificando VIEW
	ALTER VIEW curso.v_funcionario AS
	    SELECT id, nome FROM curso.funcionarios;

    -- Query 3 - Excluindo VIEW
    DROP VIEW curso.v_funcionario;

    -- Query 4 - Excluindo INDEX
    DROP INDEX ix_func1 ON curso.funcionario;

    -- Query 5 - Criando INDEX
    CREATE INDEX ix_func1 ON curso.funcionarios (nome);

/*
 * DDL - PROCEDURE
 */
    -- Query 1 - Criando PROCEDURE
    DELIMITER $$
    CREATE PROCEDURE curso.proc_quadrado(INOUT numero INT)
    BEGIN
        SET numero = numero * numero;
    END $$
    DELIMITER ;

    -- Query 2 - Executando PROCEDURE
    SET @valor = 5;
    CALL curso.proc_quadrado(@valor);
    SELECT @valor;

    -- Query 3 - Execluindo PROCEDURE
    DROP PROCEDURE curso.proc_quadrado;

    -- Query 4 - Excluindo FUNCTION
    DROP FUNCTION curso.func_salario;

    -- Query 5 - Excluindo TRIGGER
    DROP TRIGGER curso.trig_func_salario;

/*
 * DDL - TRUNCATE
 */
    -- Query 1
    TRUNCATE TABLE curso.senso;


/*
 * DDL - Tabela temporaria
 */
    -- Query 1 - Criando tabela temporaria
    CREATE TEMPORARY TABLE curso.tmp_funcionarios (
        id INT,
        nome VARCHAR(50),
        salario DECIMAL(10, 2),
        setor VARCHAR(30)
    );

    -- Query 2 - Inseriando valores na tabela temporaria
    INSERT INTO curso.tmp_funcionarios
        SELECT * FROM curso.funcionarios;

    -- Query 3 - Verificando tabela temporaria
    SELECT * FROM curso.tmp_funcionarios;

    -- Query 4 - Apagando registros da tabela
    TRUNCATE curso.funcionarios;

    -- Query 5 - Desativar AUTO_INCREMENT da tabela funcionarios
    ALTER TABLE curso.funcionarios CHANGE id id INT UNSIGNED NOT NULL;

    -- Query 6 - Recuperando dados da tabela temporaria
    INSERT INTO curso.funcionarios
        SELECT * FROM curso.tmp_funcionarios;

    -- Query 7 - Retornando AUTO_INCREMENT
    ALTER TABLE curso.funcionarios MODIFY COLUMN id INT AUTO_INCREMENT;

    -- Query 8 - Testando AUTO_INCREMENT
    INSERT INTO curso.funcionarios (nome, salario) VALUES ('Leopoldo', 1000);

    -- Query 9 - Evidenciando
    SELECT * FROM curso.funcionarios;
