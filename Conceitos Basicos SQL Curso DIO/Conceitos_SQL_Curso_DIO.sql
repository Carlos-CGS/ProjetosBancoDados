// Criação de uma tabela utilizando o SQL
CREATE TABLE pessoas(
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE
)

// Adicionar uma nova coluna na tabela
ALTER TABLE pessoas ADD 'genero' VARCHAR 1 NOT NULL AFTER 'nascimento';
ALTER TABLE pessoas ADD 'genero' VARCHAR 1 NOT NULL BEFORE 'nascimento';

// Inserção de dados
INSERT INTO pessoas (nome, nascimento) VALUES ('Carlos', '1990-05-23');
INSERT INTO pessoas (nome, nascimento) VALUES ('Jose', '1991-06-26');
INSERT INTO pessoas (nome, nascimento) VALUES ('Pedro', '1994-02-30');

// Selecionar o que deseja visualizar
SELECT * FROM pessoas;
SELECT nome FROM pessoas;
SELECT nome, nascimento FROM pessoas;

// Atualizar uma informação
UPDATE pessoas SET nome='Carlos Garcia' WHERE id=1;

// Deletar informações, Boa Prática - sempre vrf antes de Deletar
SELECT * FROM pessoas WHERE id=2;
DELETE * FROM pessoas WHERE id=2;

// Organizar a apresentação das informações solicitadas 
SELECT * FROM pessoas ORDER BY nome
SELECT * FROM pessoas ORDER BY nome DESC

// Agrupar informações em uma tabela e vrf quantidade
SELECT COUNT(id) genero FROM pessoas GROUP BY genero;

// SHOW DATABASES; = Apresenta todos os DATABASES
// SHOW TABLES; = Apresenta as tabelas
// DROP TABLE usuarios; = Deleta uma tabela
// DROP DATABASE teste; = Deleta um banco de dados

// Informação de tabelas multiplas
// Ou seja, selcecionar na tabela videos junto da tabela autor, as colunas onde fk_vidos é igual a id_author
SELECT * FROM videos JOIN author ON videos.fk_arthor = author.id_author

// Relacionamento de um para muitos
SELECT playlist.name_pl, videos.title, author.name FROM playlist
JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_videos
JOIN videos ON videos.id_videos = videos_playlist.fk_videos
JOIN author ON videos.fk_author = author.id_author

// "Apelidar" tabelas para facilitar a escrita/busca (videos_canais AS vc / videos AS v)
SELECT * FROM videos_canais AS vc JOIN videos AS v ON vc.fk_videos = v.id_videos

// INNER JOIN ou JOIN = Retorna todos os campos da tabela que não contenham valores nulos
// OUTER JOIN = Retorna todos os valores das tabelas

// Exemplo do (RIGHT / LEFT) OUTER JOIN - (Right = a direita sem valor)(Left = a esquerda sem valor)
SELECT * FROM videos_canais AS RIGHT OUTER JOIN videos AS v ON vc.fk_videos = v.id_videos

// UNION - União de duas tabelas (Obs. Deve ter a mesma quantidade de colunas)
SELECT v.id_video, v.nome_video FROM videos AS v LEFT OUTER JOIN videos_canais AS vc ON v.id_videos = vc.fk_videos
UNION
SELECT c.id_canal , c.nome_canal FROM videos_canais AS vc RIGHT OUTER JOIN canais AS c ON vc.fk_canal = c.id_canal

// Utilização da Clausula WHERE
SELECT * FROM videos_canal JOIN videos ON videos_canal.fk_video = videos.id_video
JOIN canais ON videos_canais.fk_canal = canais.id_canal
WHERE canais.id_video = 2