/*
 * DML - Criação da tabela para exercicios
 */
    -- Query 1
    CREATE TABLE curso.funcionarios (
        id INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(50) NOT NULL,
        salario DECIMAL(10, 2),
        setor VARCHAR(30),
        PRIMARY KEY (id)
    );

/*
 * DML - SELECT
 */
    -- Query 1
    SELECT * FROM curso.funcionarios;

    -- Query 2
    SELECT
        nome,
        setor AS depto
    FROM curso.funcionarios;

/*
 * DML - INSERT
 */
    -- Query 1
    INSERT INTO curso.funcionarios (nome, salario, setor) VALUES
        ('Joao', 1000, ''),
        ('Jose', 2000, ''),
        ('Alexandre', 3000, '');

    -- Query 2
    INSERT INTO curso.funcionarios (nome, salario) VALUES ('Pedro', 1000);

    -- Query 3 - Simulando erro
    INSERT INTO curso.funcionarios (nome, salario) VALUES ('Pedro', 'asasa');

/*
 * DML - UPDATE
 */
    -- Query 1
    UPDATE curso.funcionarios SET salario = 1500
    WHERE id = 1;

    -- Query 2 - Aumento de 50% sobre Salário atual
    UPDATE curso.funcionarios SET salario = salario * 1.5
    WHERE id = '1';

    -- Query 3 - Exemplo update com mais de um campo
    UPDATE curso.funcionarios SET salario = salario * 1.5, setor = 'TI'
    WHERE id <> '1';

/*
 * DML - DELETE
 */
    -- Query 1
    DELETE FROM curso.funcionarios
    WHERE id = '1';

/*
 * DML - SELECT com evidencia da exclusão
 */
    -- Query 1
    SELECT *
    FROM curso.funcionarios
    WHERE id = '1';
