/*
 * DCL - NEGA-REVOKE
 */
    -- Query 1 - Negando acesso de atualização para aluno na tabela funcionarios
    REVOKE UPDATE ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 2 - Recarregando privilerios
    FLUSH PRIVILEGES;

    -- Query 3 - Removendo acesso de UPDATE para aluno em todas as tabelas
    REVOKE UPDATE ON *.* FROM 'aluno'@'localhost';

    -- Query 4 - Removendo acesso de DELETE para aluno na tabela funcionarios
    REVOKE DELETE ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 5 - Removendo acesso de DELETE para aluno em todas as tabelas
    REVOKE DELETE ON *.* FROM 'aluno'@'localhost';

    -- Query 6 - Removendo acesso de INSERT para aluno na tabela funcionarios
    REVOKE INSERT ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 7 - Removendo acesso de INSERT para aluno em todas as tabelas
    REVOKE INSERT ON *.* FROM 'aluno'@'localhost';

    -- Query 8 - Removendo acesso de SELECT para aluno na tabela funcionarios
    REVOKE SELECT ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 9 - Removendo acesso de SELECT para aluno em todas as tabelas
    REVOKE SELECT ON *.* FROM 'aluno'@'localhost';

    -- Query 10 - Removendo acesso de SELECT e INSERT para aluno na tabela funcionarios
    REVOKE SELECT, INSERT ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 11 - Removando acesso de campos do SELECT para alunos na tabela funcionarios
    REVOKE SELECT (nome, setor) ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 12 - Removendo acesso de EXCUTAR PROCEDURE para aluno
    REVOKE EXECUTE ON PROCEDURE curso.proc_quadrado FROM 'aluno'@'localhost';

    -- Query 13 - Removendo todos os acessos para aluno da tabela funcionarios
    REVOKE ALL PRIVILEGES ON curso.funcionarios FROM 'aluno'@'localhost';

    -- Query 14 - Removendo todos os acessos para aluno de todas as tabelas
    REVOKE ALL PRIVILEGES ON *.* FROM  'aluno'@'localhost';

    -- Query 15 - Recarregando privilegios
    FLUSH PRIVILEGES;

    -- Query 16 - Verificando os privilegios
    SELECT *
    FROM mysql.user
    WHERE User = 'aluno';
