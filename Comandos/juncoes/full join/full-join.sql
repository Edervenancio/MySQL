--------------------------------------------------------------------------------
-- 🗂️ DROP DAS TABELAS (caso já existam)
--------------------------------------------------------------------------------
DROP TABLE atividades CASCADE CONSTRAINTS;
DROP TABLE alunos CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------
-- 🏗️ CRIAÇÃO DAS TABELAS
--------------------------------------------------------------------------------

-- Tabela de alunos cadastrados oficialmente
CREATE TABLE alunos (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);

-- Tabela de entregas de atividades feitas por alunos
CREATE TABLE atividades (
    id NUMBER PRIMARY KEY,
    aluno_id NUMBER,        -- Referência ao aluno que fez a entrega
    titulo VARCHAR2(100)    -- Nome ou tipo da atividade entregue
);

--------------------------------------------------------------------------------
-- 📥 INSERÇÃO DE DADOS
--------------------------------------------------------------------------------

-- Alunos cadastrados (alguns não entregaram nenhuma atividade)
INSERT INTO alunos VALUES (1, 'Ana');
INSERT INTO alunos VALUES (2, 'Bruno');
INSERT INTO alunos VALUES (3, 'Carla');
INSERT INTO alunos VALUES (4, 'Daniel');

-- Atividades entregues (algumas por alunos inexistentes)
INSERT INTO atividades VALUES (1, 1, 'Redação 1');
INSERT INTO atividades VALUES (2, 1, 'Redação 2');
INSERT INTO atividades VALUES (3, 2, 'Trabalho de História');
INSERT INTO atividades VALUES (4, 99, 'Atividade Fantasma'); -- aluno não cadastrado

--------------------------------------------------------------------------------
-- 🔄 CONSULTA COM FULL OUTER JOIN
--------------------------------------------------------------------------------

-- A consulta abaixo une as tabelas 'alunos' e 'atividades', trazendo:
-- - Todos os alunos, mesmo os que não entregaram nada (LEFT JOIN)
-- - Todas as atividades, mesmo as feitas por alunos não cadastrados (RIGHT JOIN)
-- O FULL OUTER JOIN combina ambos os comportamentos.

SELECT *
FROM alunos
FULL OUTER JOIN atividades ON alunos.id = atividades.aluno_id;
