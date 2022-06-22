-- Criando tabela para teste
USE curso;
CREATE TABLE curso.campeonato (
    nometime VARCHAR(30) NOT NULL,
    pontos INT NOT NULL
);

-- Populando a tabela
INSERT INTO curso.campeonato VALUES ('Corinthians', '53');
INSERT INTO curso.campeonato VALUES ('Grêmio', '43');
INSERT INTO curso.campeonato VALUES ('Santos', '41');
INSERT INTO curso.campeonato VALUES ('Palmeiras', '40');
INSERT INTO curso.campeonato VALUES ('Flamengo', '38');
INSERT INTO curso.campeonato VALUES ('Cruzeiro', '37');
INSERT INTO curso.campeonato VALUES ('Botafogo', '37');
INSERT INTO curso.campeonato VALUES ('Atlético-PR', '34');
INSERT INTO curso.campeonato VALUES ('Vasco', '31');
INSERT INTO curso.campeonato VALUES ('Atlético-MG', '31');
INSERT INTO curso.campeonato VALUES ('Fluminense', '31');
INSERT INTO curso.campeonato VALUES ('Sport', '29');
INSERT INTO curso.campeonato VALUES ('Avaí', '29');
INSERT INTO curso.campeonato VALUES ('Chapecoense', '28');
INSERT INTO curso.campeonato VALUES ('Ponte Preta', '28');
INSERT INTO curso.campeonato VALUES ('Bahia', '27');
INSERT INTO curso.campeonato VALUES ('São Paulo', '27');
INSERT INTO curso.campeonato VALUES ('Coritiba', '27');
INSERT INTO curso.campeonato VALUES ('Vitória', '26');
INSERT INTO curso.campeonato VALUES ('Atlético-GO', '22');

-- Criando classificao de campeonato
SET @posicao = 0;
SELECT
    @posicao := @posicao+1 AS posicao,
    nometime,
    pontos
FROM curso.campeonato
ORDER BY 3 DESC;

-- Trazendo o rank
SELECT
    @posicao := @posicao +1 AS posicao,
    prequery.estado,
    prequery.qtd_cidades
FROM (
        SELECT @posicao := 0
    ) AS variavel,
    (
        SELECT
            estado,
            COUNT(cod_mun) AS qtd_cidades
        FROM curso.senso
        WHERE ano = '2014'
        GROUP BY 1
        ORDER BY 2 DESC
    ) AS prequery;

-- Rank geral e por estado
SET @prev := null;
SET @pos_geral := 0;
SET @pos_estado := 0;

SELECT
    @pos_geral := @pos_geral + 1 AS posicao_geral,
    IF(
        @prev <> estado,
        @pos_estado := 1,
        @pos_estado := @pos_estado + 1
    ) AS posicao_estado,
    @prev := estado,
    nome_mun,
    populacao
FROM curso.senso
ORDER BY estado, populacao DESC;
