/*
 * DCL - Cria um login "ALUNO' e dar permissões no banco e tabelas
 */
    -- Query 1 - Concedendo acesso de UPDATE para aluno na tabela funcionarios
    GRANT UPDATE ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 2 - Concedendo acesso de UPDATE para aluno em todas as tabelas
    GRANT UPDATE ON *.* TO 'aluno'@'localhost';

    -- Query 3 - Concedendo acesso de DELETE para aluno na tabela funcionarios
    GRANT DELETE ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 4 - Concedendo acesso de DELETE para aluno em todas as tabelas
    GRANT DELETE ON *.* TO 'aluno'@'localhost';

    -- Query 5 - Concedendo acesso de INSERT para aluno na tabela funcionarios
    GRANT INSERT ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 6 - Concedendo acesso de SELECT para aluno na tabela funcionarios
    GRANT SELECT ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 7 - Concedendo acesso de SELECT e INSERT para aluno
    GRANT SELECT, INSERT ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 8 - Concedendo acesso com limitação de SELECT de campos para aluno na tabela funcionarios
    GRANT SELECT (nome, setor) ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 9 - Concedendo acesso para EXCUTAR PROCEDURE proc_quadrado para aluno
    GRANT EXECUTE ON PROCEDURE teste.proc_quadrado TO 'aluno'@'localhost';

    -- Query 10 - Concedendo todos os acessos a tabela funcionarios
    GRANT ALL PRIVILEGES ON curso.funcionarios TO 'aluno'@'localhost';

    -- Query 11 - Concedendo todos os acessos a todas tabelas
    GRANT ALL PRIVILEGES ON *.* TO 'aluno'@'localhost';

    -- Query 12 - Recarregando privilegios
    FLUSH PRIVILEGES;

    -- Query 13 - Verificando permisões de acesso do usuário aluno
    SELECT *
    FROM mysql.user
    WHERE User = 'aluno';
