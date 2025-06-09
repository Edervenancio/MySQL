--------------------------------------------------------------------------------
-- 🗂️ REMOÇÃO DAS TABELAS (caso existam)
--------------------------------------------------------------------------------
DROP TABLE dias_semana CASCADE CONSTRAINTS;
DROP TABLE turnos CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------
-- 🏗️ CRIAÇÃO DAS TABELAS
--------------------------------------------------------------------------------

-- Cria a tabela 'dias_semana' com os dias úteis
CREATE TABLE dias_semana (
    id NUMBER PRIMARY KEY,     -- Identificador do dia
    dia VARCHAR2(20)           -- Nome do dia da semana
);

-- Cria a tabela 'turnos' com os períodos do dia
CREATE TABLE turnos (
    id NUMBER PRIMARY KEY,     -- Identificador do turno
    turno VARCHAR2(20)         -- Nome do turno (Manhã, Tarde, Noite)
);

--------------------------------------------------------------------------------
-- 📥 INSERÇÃO DE DADOS
--------------------------------------------------------------------------------

-- Inserção dos dias úteis na tabela 'dias_semana'
INSERT INTO dias_semana VALUES (1, 'Segunda-feira');
INSERT INTO dias_semana VALUES (2, 'Terça-feira');
INSERT INTO dias_semana VALUES (3, 'Quarta-feira');
INSERT INTO dias_semana VALUES (4, 'Quinta-feira');
INSERT INTO dias_semana VALUES (5, 'Sexta-feira');

-- Inserção dos turnos disponíveis na tabela 'turnos'
INSERT INTO turnos VALUES (1, 'Manhã');
INSERT INTO turnos VALUES (2, 'Tarde');
INSERT INTO turnos VALUES (3, 'Noite');

--------------------------------------------------------------------------------
-- 🔄 CONSULTA COM CROSS JOIN
--------------------------------------------------------------------------------

-- Essa consulta realiza um CROSS JOIN entre 'dias_semana' e 'turnos'
-- O objetivo é gerar todas as combinações possíveis entre os dias e os turnos.

-- Resultado esperado:
-- Segunda-feira | Manhã
-- Segunda-feira | Tarde
-- Segunda-feira | Noite
-- Terça-feira   | Manhã
-- ...
-- (total de 5 dias × 3 turnos = 15 linhas)

SELECT 
    dia, turno
FROM 
    dias_semana
CROSS JOIN 
    turnos;
