DROP DATABASE IF EXISTS Eventos;
CREATE DATABASE IF NOT EXISTS Eventos; 
USE Eventos; 

-- CRIAÇÃO DAS TABELAS

CREATE TABLE funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    setor VARCHAR(255), 
    cargo VARCHAR(255)
);

CREATE TABLE sala( 
	id_sala INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    capacidade INT, 
    recursos TEXT
);

CREATE TABLE evento(
	id_evento INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(255), 
    descricao TEXT, 
    data DATE,
    horario TIME, 
    id_sala INT, 
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala)
);

CREATE TABLE funcionario_evento(
	id_funcionario_evento INT AUTO_INCREMENT PRIMARY KEY, 
    id_funcionario INT, 
    id_evento INT, 
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario), 
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE instrutor(
	id_instrutor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255), 
    email VARCHAR(255)
);

CREATE TABLE instrutor_evento(
	id_instrutor_evento INT AUTO_INCREMENT PRIMARY KEY, 
    id_instrutor INT, 
    id_evento INT, 
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor), 
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE cracha(
	id_cracha INT AUTO_INCREMENT PRIMARY KEY, 
    qrcode VARCHAR(255), 
    data_emissao datetime, 
    id_funcionario INT, 
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);


-- INSERÇÃO DE DADOS

INSERT INTO funcionario(nome, setor, cargo)
VALUES 
	('Luana', 'TI', 'Desenvolvedora Front-End'), 
    ('Gabriela', 'TI', 'Desenvolvedora Back-End'), 
    ('Francisca', 'RH', 'Analista de Recurso Humanos'), 
    ('Kamila', 'Administração', 'Auxiliar administradtivo'), 
    ('Letícia', 'Compras', 'Gerente de Compras'); 
    
INSERT INTO sala(nome, capacidade, recursos)
VALUES 
	('sala 1', 20, 'cadeira, ventilador, marcia, mouse'), 
    ('sala 2', 25, 'projetor, mesa, notebooks, headsets'), 
    ('sala 3', 35, 'lousa, mesas, cadeiras, computador');
    
INSERT INTO evento(titulo, descricao, data, horario, id_sala)
VALUES 
	('Palestra Back-end', 'Palestra sobre desenvolvimento Back-End', '2025-05-03', '14:00', 2), 
    ('Workshop', 'Workshop de Tecnologia', '2025-06-15', '10:30', 1), 
    ('Roda de Conversa', 'Roda de conversa com os profissionais do time de TI da empresa', '2025-04-30', '15:30', 3);
    
INSERT INTO funcionario_evento(id_funcionario, id_evento)
VALUES 
	(2, 1), 
    (1, 1), 
    (5, 1), 
    (4, 1), 
    (3, 1), 
    (2, 2), 
    (1, 2), 
    (5, 2), 
    (4, 2), 
    (3, 2), 
    (5, 3), 
    (4, 3), 
    (3, 3);
    

INSERT INTO instrutor(nome, email)
VALUES 
	('Luana', 'luaninha@gmail.com'), 
    ('Gabriela', 'gabi@gmail.com'), 
    ('Fran', 'fran@gmail.com');

INSERT INTO instrutor_evento(id_instrutor, id_evento)
VALUES 
	(1, 2), 
    (2, 1), 
    (3, 3);
    
INSERT INTO cracha(qrcode, data_emissao, id_funcionario)
VALUES 
	('3245ashgh', '2024-03-05', 2), 
    ('4464ayyg', '2022-11-09', 3), 
    ('sbahghsb74', '2020-05-16', 1), 
    ('aafygu51', '2024-10-30', 4), 
    ('7878qhqygu', '2025-02-21', 5); 

-- Consultas

-- Consultas para testes das tabelas
SELECT * FROM funcionario; 
SELECT * FROM evento;
SELECT * FROM funcionario_evento;
SELECT * FROM cracha;
SELECT * FROM instrutor;
SELECT * FROM instrutor_evento;
SELECT * FROM sala;

-- Listar funcionários participantes de um evento específico (nome, setor, cargo, evento). Escolha o evento.
SELECT 
	funcionario.nome AS Nome, 
    funcionario.setor AS Setor, 
    funcionario.cargo AS Cargo, 
    evento.titulo AS Evento_Nome 
FROM 
	evento
INNER JOIN funcionario_evento ON evento.id_evento = funcionario_evento.id_evento
INNER JOIN funcionario ON funcionario_evento.id_funcionario = funcionario.id_funcionario
WHERE funcionario_evento.id_evento = 2;


-- Mostrar eventos ministrados por um instrutor específico (nome, e-mail, eventos). Escolha o instrutor.
SELECT 
	instrutor.nome AS nome_instrutor,
    instrutor.email AS email_instrutor, 
    evento.titulo AS nome_evento
FROM instrutor 
INNER JOIN instrutor_evento ON instrutor.id_instrutor = instrutor_evento.id_instrutor
INNER JOIN evento ON instrutor_evento.id_evento = evento.id_evento
WHERE instrutor_evento.id_instrutor = 2;

-- Apresentar os eventos realizados e em quais salas foram realizados (título, data, horário, sala).
SELECT 
	evento.titulo AS titulo_evento, 
    evento.data AS data_evento,
    evento.horario AS horario_evento, 
    sala.nome AS sala_evento
FROM evento
INNER JOIN sala ON evento.id_sala = sala.id_sala;


    

