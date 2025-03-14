DROP DATABASE Biblioteca;
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- CRIAÇÃO DAS TABELAS


CREATE TABLE livros(
	id_livro INT AUTO_INCREMENT PRIMARY KEY, 
    isbn VARCHAR(20), 
    titulo VARCHAR(100), 
    descricao VARCHAR(500)
);
    
CREATE TABLE categorias(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
    nome_categoria VARCHAR(50)
);

-- TABELA DE RELACIONAMENTO DE CATEGORIAS E LIVROS
CREATE TABLE categorias_livros(
	id_categorias_livros INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT, 
    id_livro INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria), 
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
CREATE TABLE associacao(
	id_associacao INT AUTO_INCREMENT PRIMARY KEY, 
    nivel_associacao ENUM('básico', 'médio', 'premium')
);

CREATE TABLE usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(200), 
    email VARCHAR(100), 
    data_registro DATE,
    id_associacao int, 
    FOREIGN KEY (id_associacao) REFERENCES associacao(id_associacao)
);

CREATE TABLE emprestimos(
	id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_usuario INT,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro), 
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE autores(
	id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200), 
    data_nascimento DATE, 
    biografia VARCHAR(255)
);

-- TABELA DE RELACIONAMENTO DE AUTORES E LIVROS
CREATE TABLE autores_livros(
	id_autor_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT, 
    id_autor INT, 
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro), 
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- INSERÇÃO DE DADOS NAS TABELAS 

INSERT INTO livros(ISBN, titulo, descricao)
VALUES
	('8542225856', 'Quarta asa', 'Em Quarta Asa, best-seller #1 do The New York Times, uma jovem precisa sobreviver ao treinamento em uma escola de elite para poderosos cavaleiros de dragões, onde a única regra é se formar... ou morrer tentando.'), 
    ('B013H9AV5Y', 'Ainda estou aqui', 'Trinta e cinco anos depois de Feliz ano velho,  Marcelo Rubens Paiva traça uma história dramática da luta de sua família pela verdade. O livro que deu origem ao filme estrelado pela vencedora do Globo de Ouro Fernanda Torres e indicado a 3 categorias do Oscar 2025, incluindo Melhor filme.'),
    ('6555655062', 'A empregada', 'Uma história que vai surpreender até os leitores de suspense mais calejados.'), 
    ('6555871784', 'Tudo é rio', 'Com uma narrativa madura, precisa e ao mesmo tempo delicada e poética, o romance narra a história do casal Dalva e Venâncio, que tem a vida transformada após uma perda trágica, resultado do ciúme doentio do marido, e de Lucy, a prostituta mais depravada e cobiçada da cidade, que entra no caminho deles, formando um triângulo amoroso.'),
    ('6558380544', 'A Biblioteca da Meia-Noite', 'A Biblioteca da Meia-Noite é um romance incrível que fala dos infinitos rumos que a vida pode tomar e da busca incessante pelo rumo certo.'),
    ('‎655838244X', 'A inconveniente loja de conveniência', 'Best-seller na Coreia do Sul, A inconveniente loja de conveniência, de Kim Ho-yeon, é um romance sobre segundas chances e sobre como a solução de problemas aparentemente insolúveis pode estar mais perto do que se imagina.');
    
INSERT INTO categorias(nome_categoria)
VALUES
    ('Romance'),
    ('Suspense'),
    ('Ficção Científica'),
    ('Biografia'),
    ('Drama'), 
    ('Comédia');

INSERT INTO categorias_livros(id_livro, id_categoria)
VALUES
	(1, 3),
    (2, 4), 
    (3, 2), 
    (4, 5), 
    (5, 1),
    (6, 5);
 
INSERT INTO associacao(nivel_associacao)
VALUES
    ('básico'),
    ('premium'),
    ('médio'), 
    ('premium'), 
    ('médio'), 
    ('básico');

INSERT INTO usuarios(nome, email, data_registro, id_associacao)
VALUES
	('Gabriela', 'gabi@gmail.com', '2025-03-14', 1), 
    ('Luana', 'luana@gmail.com', '2025-03-14', 2),
    ('Ana', 'ana@gmail.com', '2025-03-14', 3), 
	('Fran', 'fran@gmail.com', '2025-03-14', 4), 
	('Kamila', 'kamila@gmail.com', '2025-03-14', 5), 
	('Adrian', 'adrian@gmail.com', '2025-03-14', 6);
    

INSERT INTO emprestimos(id_livro, id_usuario)
VALUES
    (3, 5),
    (6, 2), 
    (3, 4),
    (1, 3),
    (4, 1), 
    (2, 6);
    
INSERT INTO autores(nome, data_nascimento, biografia)
VALUES
	('Rebecca Yarros', '1981-04-14', 'Rebecca Yarros é uma escritora norte-americana. Ela é mais conhecida pela série de livros de fantasia Empyrean. Ela formou-se na Universidade de Troy, onde ela estudou história europeia e inglês.'), 
    ('Marcelo Rubens Paiva', '1959-05-01', 'Marcelo Rubens Beyrodt Paiva é um escritor, dramaturgo e jornalista brasileiro, amplamente reconhecido por sua obra literária. Seu pai, o deputado federal Rubens Paiva, foi uma vítima da ditadura militar brasileira'), 
    ('Freida McFadden', '1980-05-01', 'Freida McFadden é uma escritora norte-americana e médica especialista em lesões no cérebro em Nova Iorque. Freida McFadden é um pseudônimo para diferenciar do seu trabalho como médica.'),
    ('Carla Madeira', '1964-10-18', 'Carla Madeira é uma escritora brasileira conhecida pelas obras Tudo é Rio, A Natureza da Mordida e Véspera. Carla Madeira também é jornalista e publicitária.'), 
    ('Matt Haig', '1975-07-03', 'Matt Haig é um romancista e jornalista inglês. Ele escreveu livros de ficção e não-ficção para crianças e adultos, muitas vezes no gênero de ficção especulativa. É um autor best-seller internacional com livros publicados em mais de 30 idiomas. '),
	('Kim Ho-yeon', '1974-02-20', 'Kim Ho-yeon nasceu em 1974, na Coreia do Sul, e é escritor, roteirista e ilustrador. Desde seu romance de estreia, Mangwon-dong Brothers, ele coleciona prêmios e conquistas, dentre eles o World Literary Award, em 2013');
    
INSERT INTO autores_livros(id_livro, id_autor)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);
  
  
SELECT * FROM categorias;
SELECT * FROM livros;
SELECT * FROM autores;
SELECT * FROM categorias;
SELECT * FROM emprestimos;
SELECT * FROM usuarios;
SELECT * FROM associacao;
    

