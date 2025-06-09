--------------------------------------------------------------------------------
-- 🗂️ DROP TABELAS (CASO EXISTAM)
--------------------------------------------------------------------------------
DROP TABLE inscricoes CASCADE CONSTRAINTS;
DROP TABLE eventos CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------
-- 🏗️ CRIAÇÃO DAS TABELAS
--------------------------------------------------------------------------------

-- Tabela de eventos disponíveis no sistema
CREATE TABLE eventos (
    id NUMBER PRIMARY KEY,
    titulo VARCHAR2(100),
    local VARCHAR2(100)
);

-- Tabela de inscrições realizadas por participantes em eventos
CREATE TABLE inscricoes (
    id NUMBER PRIMARY KEY,
    nome_participante VARCHAR2(100),
    id_evento NUMBER
);

--------------------------------------------------------------------------------
-- 📥 INSERÇÃO DE DADOS
--------------------------------------------------------------------------------

-- Eventos cadastrados (alguns com inscrições, outros não)
INSERT INTO eventos VALUES (1, 'Palestra sobre IA', 'Auditório Central');
INSERT INTO eventos VALUES (2, 'Workshop de SQL', 'Sala 3');
INSERT INTO eventos VALUES (3, 'Seminário de Cibersegurança', 'Sala 7');
INSERT INTO eventos VALUES (4, 'Encontro de Devs', 'Sala 2');

-- Inscrições realizadas (com evento válido, inválido e nulo)
INSERT INTO inscricoes VALUES (1, 'Alice Santos', 1);
INSERT INTO inscricoes VALUES (2, 'Bruno Oliveira', 1);
INSERT INTO inscricoes VALUES (3, 'Carlos Mendes', 2);
INSERT INTO inscricoes VALUES (4, 'Diana Lopes', 5);   -- Evento inexistente
INSERT INTO inscricoes VALUES (5, 'Eduardo Lima', NULL); -- Sem evento vinculado

--------------------------------------------------------------------------------
-- 🔎 CONSULTAS EXEMPLO COM RIGHT JOIN
--------------------------------------------------------------------------------

-- Consulta 1: Lista todos os eventos cadastrados, mesmo sem inscrições.
-- RIGHT JOIN garante que todos os eventos (tabela da direita) apareçam no resultado.
SELECT DISTINCT 
    eventos.id, 
    eventos.titulo, 
    eventos.local
FROM 
    inscricoes
RIGHT JOIN 
    eventos ON inscricoes.id_evento = eventos.id
ORDER BY eventos.id;

-- Consulta 2: Lista todas as inscrições realizadas, mesmo com eventos inválidos ou inexistentes.
-- RIGHT JOIN garante que todas as inscrições (tabela da direita) sejam exibidas.
SELECT 
    inscricoes.id, 
    inscricoes.nome_participante, 
    inscricoes.id_evento
FROM 
    eventos
RIGHT JOIN 
    inscricoes ON eventos.id = inscricoes.id_evento;
