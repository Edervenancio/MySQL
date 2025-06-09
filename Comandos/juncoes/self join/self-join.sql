--------------------------------------------------------------------------------
-- 🗂️ DROP DA TABELA (SE EXISTIR)
--------------------------------------------------------------------------------
DROP TABLE funcionarios CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------
-- 🏗️ CRIAÇÃO DA TABELA DE FUNCIONÁRIOS
--------------------------------------------------------------------------------

-- A tabela 'funcionarios' representa uma estrutura hierárquica de colaboradores.
-- Alguns funcionários têm um gerente (referenciado pelo campo 'id_gerente').
CREATE TABLE funcionarios (
    id NUMBER PRIMARY KEY,               -- Identificador único do funcionário
    nome VARCHAR2(100),                  -- Nome completo
    cargo VARCHAR2(100),                 -- Cargo ou função no organograma
    id_gerente NUMBER                    -- ID do gerente (auto-relacionamento)
);

--------------------------------------------------------------------------------
-- 📥 INSERÇÃO DE FUNCIONÁRIOS (com e sem gerentes)
--------------------------------------------------------------------------------

-- Ana Souza é a diretora geral e não tem gerente (id_gerente = NULL)
INSERT INTO funcionarios VALUES (1, 'Ana Souza', 'Diretora Geral', NULL);

-- Bruno e Carla são gerentes e respondem à Ana
INSERT INTO funcionarios VALUES (2, 'Bruno Lima', 'Gerente de TI', 1);
INSERT INTO funcionarios VALUES (3, 'Carla Torres', 'Gerente Financeiro', 1);

-- Daniel e Eduarda são da equipe de Bruno
INSERT INTO funcionarios VALUES (4, 'Daniel Rocha', 'Analista de Sistemas', 2);
INSERT INTO funcionarios VALUES (5, 'Eduarda Silva', 'Desenvolvedora', 2);

-- Fernando e Gabriela são da equipe de Carla
INSERT INTO funcionarios VALUES (6, 'Fernando Gomes', 'Contador', 3);
INSERT INTO funcionarios VALUES (7, 'Gabriela Castro', 'Assistente Financeiro', 3);

-- Henrique é estagiário e responde à Eduarda
INSERT INTO funcionarios VALUES (8, 'Henrique Dias', 'Estagiário', 5);

--------------------------------------------------------------------------------
-- 🔄 SELF JOIN: GERENTES E FUNCIONÁRIOS
--------------------------------------------------------------------------------

/*
  Esta consulta utiliza um SELF JOIN para identificar 
  quem são os gerentes e quem são os funcionários sob sua gestão.

  - f_1 representa o gerente
  - f_2 representa o funcionário que está sendo gerenciado

  O JOIN é feito onde o id do gerente (f_1.id) corresponde ao id_gerente do funcionário (f_2.id_gerente).
*/
SELECT 
    f_1.nome AS gerente,
    f_1.cargo,
    f_2.nome AS funcionario_gerenciado
FROM 
    funcionarios f_1
JOIN 
    funcionarios f_2 ON f_1.id = f_2.id_gerente;
