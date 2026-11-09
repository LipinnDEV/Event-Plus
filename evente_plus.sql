DROP DATABASE IF EXISTS eventplus;

CREATE DATABASE eventplus
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE eventplus;

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE organizador (
    id_organizador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    descricao TEXT
);

CREATE TABLE participante (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(80)
);

CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME NOT NULL,
    valor DECIMAL(10,2) DEFAULT 0,
    id_categoria INT NOT NULL,
    id_organizador INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_organizador) REFERENCES organizador(id_organizador),
    CHECK (data_fim >= data_inicio),
    CHECK (valor >= 0)
);

CREATE TABLE inscricao (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
    presenca BOOLEAN DEFAULT FALSE,
    id_participante INT NOT NULL,
    id_evento INT NOT NULL,
    UNIQUE (id_participante, id_evento),
    FOREIGN KEY (id_participante) REFERENCES participante(id_participante),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

INSERT INTO categoria (nome) VALUES
('Tecnologia'),('Música'),('Negócios'),('Esportes');

INSERT INTO organizador (nome,email,telefone,descricao) VALUES
('Marina Costa','marina@techbr.com.br','(47) 99111-1111','Eventos de tecnologia'),
('Carlos Menezes','carlos@culturaeesporte.com','(47) 99222-2222','Eventos culturais e esportivos'),
('Aline Rocha','aline@negociosvivos.com','(47) 99333-3333','Eventos de negócios');

INSERT INTO participante (nome,email,telefone,cidade) VALUES
('Lucas Silva','lucas.silva@email.com','(47) 98801-0001','Blumenau'),
('Ana Souza','ana.souza@email.com','(47) 98801-0002','Blumenau'),
('Pedro Rocha','pedro.rocha@email.com','(47) 98801-0003','Blumenau'),
('Julia Martins','julia.martins@email.com','(47) 98801-0004','Joinville'),
('Rafael Lima','rafael.lima@email.com','(48) 98801-0005','Florianópolis'),
('Beatriz Alves','beatriz.alves@email.com','(47) 98801-0006','Itajaí'),
('Thiago Nunes','thiago.nunes@email.com','(47) 98801-0007','Joinville'),
('Camila Ferreira','camila.ferreira@email.com','(48) 98801-0008','Florianópolis');

INSERT INTO evento (titulo,descricao,data_inicio,data_fim,valor,id_categoria,id_organizador) VALUES
('Workshop de Banco de Dados com MySQL','Oficina de SQL','2026-10-10 09:00:00','2026-10-10 18:00:00',120,1,1),
('Festival de Jazz na Praça','Show ao ar livre','2026-08-15 19:00:00','2026-08-15 23:00:00',80,2,2),
('Meetup de Startups','Networking entre empreendedores','2026-09-05 14:00:00','2026-09-05 18:00:00',0,3,3),
('Corrida Solidária 5K','Corrida beneficente','2026-11-08 07:00:00','2026-11-08 11:00:00',50,4,2),
('Hackathon EventPlus','Maratona de programação','2026-09-19 08:00:00','2026-09-20 20:00:00',30,1,1),
('Palestra de Empreendedorismo Digital','Palestra sobre negócios digitais','2026-12-01 19:00:00','2026-12-01 21:00:00',25,3,3);

INSERT INTO inscricao (data_inscricao,presenca,id_participante,id_evento) VALUES
('2026-09-01 10:00:00',FALSE,1,1),
('2026-09-02 11:30:00',FALSE,2,1),
('2026-09-03 09:15:00',FALSE,4,1),
('2026-09-05 16:40:00',FALSE,5,1),
('2026-07-20 12:00:00',TRUE,1,2),
('2026-07-22 14:20:00',TRUE,3,2),
('2026-07-25 18:05:00',FALSE,6,2),
('2026-08-01 20:10:00',TRUE,8,2),
('2026-08-20 08:45:00',TRUE,2,3),
('2026-08-25 13:00:00',TRUE,5,3),
('2026-08-28 17:30:00',FALSE,7,3),
('2026-09-10 07:30:00',FALSE,3,4),
('2026-09-11 19:00:00',FALSE,4,4),
('2026-09-12 21:15:00',FALSE,6,4),
('2026-09-15 10:10:00',FALSE,7,4),
('2026-09-18 15:50:00',FALSE,8,4),
('2026-08-30 09:00:00',TRUE,1,5),
('2026-09-01 22:00:00',TRUE,2,5),
('2026-09-04 11:11:00',TRUE,5,5),
('2026-09-10 16:00:00',FALSE,7,5);

SELECT id_evento,titulo,data_inicio,data_fim,valor
FROM evento
ORDER BY data_inicio;

SELECT e.titulo,c.nome AS categoria
FROM evento e
JOIN categoria c ON c.id_categoria=e.id_categoria;

SELECT e.titulo,e.data_inicio,e.valor
FROM evento e
JOIN categoria c ON c.id_categoria=e.id_categoria
WHERE c.nome='Tecnologia';

SELECT e.titulo,o.nome AS organizador,o.email
FROM evento e
JOIN organizador o ON o.id_organizador=e.id_organizador;

SELECT p.nome,p.email,p.cidade
FROM inscricao i
JOIN participante p ON p.id_participante=i.id_participante
JOIN evento e ON e.id_evento=i.id_evento
WHERE e.titulo='Hackathon EventPlus';

SELECT e.titulo,COUNT(i.id_inscricao) AS inscricoes
FROM evento e
LEFT JOIN inscricao i ON i.id_evento=e.id_evento
GROUP BY e.id_evento,e.titulo
ORDER BY inscricoes DESC;

SELECT e.titulo,e.valor,
       COUNT(i.id_inscricao) AS inscricoes,
       e.valor*COUNT(i.id_inscricao) AS arrecadacao
FROM evento e
LEFT JOIN inscricao i ON i.id_evento=e.id_evento
GROUP BY e.id_evento,e.titulo,e.valor;

SELECT cidade,COUNT(*) AS participantes
FROM participante
GROUP BY cidade;

SELECT e.titulo,e.data_inicio
FROM evento e
LEFT JOIN inscricao i ON i.id_evento=e.id_evento
WHERE i.id_inscricao IS NULL;

SELECT p.nome,COUNT(i.id_evento) AS eventos
FROM participante p
JOIN inscricao i ON i.id_participante=p.id_participante
GROUP BY p.id_participante,p.nome
HAVING COUNT(i.id_evento)>1;

SELECT o.nome AS organizador,COUNT(e.id_evento) AS eventos
FROM organizador o
LEFT JOIN evento e ON e.id_organizador=o.id_organizador
GROUP BY o.id_organizador,o.nome;
