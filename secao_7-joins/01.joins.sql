/*
 * Join de querys
 */
    -- Criando e definido database
    CREATE DATABASE faculdade;
    USE faculdade;

    -- Query 1 - Criação das tabelas alunos, diciplinas e matriculas
    CREATE TABLE faculdade.alunos (
        id_aluno int NOT NULL AUTO_INCREMENT,
        nome varchar(20) NOT NULL,
        PRIMARY KEY (id_aluno)
    );

    CREATE TABLE faculdade.disciplina (
        id_disciplina int NOT NULL AUTO_INCREMENT,
        nome_disc varchar(20),
        PRIMARY KEY (id_disciplina)
    );

    CREATE TABLE faculdade.matricula (
        id_aluno INT NOT NULL,
        id_disciplina INT NOT NULL,
        periodo VARCHAR(10),
        PRIMARY KEY (id_aluno, id_disciplina),
        FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
        FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
    );

    -- Query 2 - Inserindo registros nas tabelas
    INSERT INTO faculdade.alunos (nome) VALUES
        ('Joao'), ('Maria'), ('Pedro'), ('Tiago'), ('Henrique');

    INSERT INTO faculdade.disciplina (nome_disc) VALUES
        ('Fisica'), ('Quimica'), ('Matematica'), ('Banco de Dados'), ('Programacao');

    INSERT INTO faculdade.matricula VALUES
        ('1', '1', 'Noturno'), ('1', '2', 'Vespertino'), ('1', '3', 'Matutino');
    INSERT INTO faculdade.matricula VALUES
        ('2', '3', 'Noturno'), ('2', '4', 'Noturno');
    INSERT INTO faculdade.matricula VALUES
        ('3', '1', 'Noturno'), ('3', '3', 'Noturno'), ('3', '4', 'Noturno');
    INSERT INTO faculdade.matricula VALUES
        ('5', '1', 'Matutino'), ('5', '2', 'Vespertino'), ('5', '4', 'Noturno');


    -- Verificando tabelas
    SELECT * FROM faculdade.alunos;
    SELECT * FROM faculdade.disciplina;
    SELECT * FROM faculdade.matricula;

    -- Aluno codigo 4 não tem matricula
    -- Disciplina 5 não possui alunos


    -- Query 3 - Junção das tabelas INNER JOIN
    SELECT
        alunos.nome,
        disciplina.nome_disc,
        matricula.periodo
    FROM faculdade.alunos
    INNER JOIN faculdade.matricula ON alunos.id_aluno = matricula.id_aluno
    INNER JOIN faculdade.disciplina ON matricula.id_disciplina = disciplina.id_disciplina;

    -- Query 4 - Junção das tabelas LEFT JOIN
    SELECT
        alunos.nome,
        disciplina.nome_disc,
        matricula.periodo
    FROM faculdade.alunos
    LEFT JOIN faculdade.matricula ON alunos.id_aluno = matricula.id_aluno
    LEFT JOIN faculdade.disciplina ON matricula.id_disciplina = disciplina.id_disciplina;

    -- Query 4 - Junção das tabelas RIGHT JOIN
    SELECT
        alunos.nome,
        disciplina.nome_disc,
        matricula.periodo
    FROM faculdade.alunos
    RIGHT JOIN faculdade.matricula ON alunos.id_aluno = matricula.id_aluno
    RIGHT JOIN faculdade.disciplina ON matricula.id_disciplina = disciplina.id_disciplina;

    -- Query 5 - Exemplo extra usando o database sakila
    USE sakila;

    -- INNER JOIN
    SELECT
        actor.first_name,
        actor.last_name,
        film.title
    FROM sakila.actor
    INNER JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN sakila.film ON film_actor.film_id = film.film_id;

    -- LEFT JOIN
    SELECT
        actor.first_name,
        actor.last_name,
        film.title
    FROM sakila.actor
    LEFT JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
    LEFT JOIN sakila.film ON film_actor.film_id = film.film_id;

    -- RIGHT JOIN
    SELECT
        actor.first_name,
        actor.last_name,
        film.title
    FROM sakila.actor
    RIGHT JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
    RIGHT JOIN sakila.film ON film_actor.film_id = film.film_id;
