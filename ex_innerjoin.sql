DROP DATABASE IF EXISTS sistema_treinamentos;
CREATE DATABASE sistema_treinamentos;
USE sistema_treinamentos;
-- INSTRUTORES
CREATE TABLE instrutores (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 especialidade VARCHAR(100)
);
-- MATÉRIAS
CREATE TABLE materias (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100)
);
-- TURMAS
CREATE TABLE turmas (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 data_inicio DATE,
 data_fim DATE
);
-- ALUNOS (cada aluno pertence a uma turma)
CREATE TABLE alunos (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 email VARCHAR(100),
 turma_id INT,
 FOREIGN KEY (turma_id) REFERENCES turmas(id)
);
-- INSTRUTOR x MATÉRIA (N:N)
CREATE TABLE instrutor_materia (
 instrutor_id INT,
 materia_id INT,
 PRIMARY KEY (instrutor_id, materia_id),
 FOREIGN KEY (instrutor_id) REFERENCES instrutores(id),
 FOREIGN KEY (materia_id) REFERENCES materias(id)
);
-- ATIVIDADES: TURMA + MATÉRIA + INSTRUTOR
CREATE TABLE atividades (
 id INT PRIMARY KEY AUTO_INCREMENT,
 descricao VARCHAR(255),
 turma_id INT,
 materia_id INT,
 instrutor_id INT,
 FOREIGN KEY (turma_id) REFERENCES turmas(id),
 FOREIGN KEY (materia_id) REFERENCES materias(id),
 FOREIGN KEY (instrutor_id) REFERENCES instrutores(id)
);
-- INSTRUTORES
INSERT INTO instrutores (nome, especialidade) VALUES
('Ana Souza', 'Excel'),
('Carlos Lima', 'Segurança'),
('Marina Costa', 'Liderança'),
('Eduardo Ramos', 'Comunicação'),
('Juliana Martins', 'Empreendedorismo'),
('Bruno Teixeira', 'Inovação');
-- MATÉRIAS
INSERT INTO materias (nome) VALUES
('Excel Avançado'),
('Segurança no Ambiente Industrial'),
('Liderança e Trabalho em Equipe'),
('Comunicação Empresarial'),
('Empreendedorismo Digital'),
('Gestão da Inovação');
-- TURMAS
INSERT INTO turmas (nome, data_inicio, data_fim) VALUES
('Turma A', '2025-03-01', '2025-03-15'),
('Turma B', '2025-04-01', '2025-04-10'),
('Turma C', '2025-05-05', '2025-05-20'),
('Turma D', '2025-06-10', '2025-06-25'),
('Turma E', '2025-07-01', '2025-07-15'),
('Turma F', '2025-08-01', '2025-08-12');
-- ALUNOS
INSERT INTO alunos (nome, email, turma_id) VALUES
('Lucas Pereira', 'lucas.p@email.com', 1),
('Mariana Silva', 'mariana.s@email.com', 1),
('João Almeida', 'joao.a@email.com', 2),
('Beatriz Costa', 'beatriz.c@email.com', 3),
('Fernanda Rocha', 'fernanda.r@email.com', 3),
('Gabriel Nunes', 'gabriel.n@email.com', 4);
-- INSTRUTOR x MATÉRIA
INSERT INTO instrutor_materia (instrutor_id, materia_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);
-- ATIVIDADES
INSERT INTO atividades (descricao, turma_id, materia_id, instrutor_id) VALUES
('Oficina de Excel com dashboards', 1, 1, 1),
('Palestra sobre segurança no trabalho', 2, 2, 2),
('Workshop de liderança prática', 3, 3, 3),
('Atividade de simulação de atendimento', 4, 4, 4),
('Laboratório de inovação em startups', 5, 6, 6),
('Criação de plano de negócio digital', 6, 5, 5);

-- ----------------------------------------------------------------------------------------------------------

SELECT alunos.nome, turmas.nome
FROM alunos
INNER JOIN turmas ON turmas.id = alunos.turma_id;

-- Liste todas as atividades realizadas, mostrando a descrição da atividade, o nome da turma, o nome da matéria e o nome do instrutor responsáve
SELECT atividades.descricao, turmas.nome, materias.nome, instrutores.nome
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id
