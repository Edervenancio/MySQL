--------------------------------------------------------------------------------
-- 📘 EXEMPLOS DE LEFT JOIN EM ORACLE SQL
-- Este script demonstra como o LEFT JOIN funciona com base nas tabelas 
-- 'pessoas' e 'compras', permitindo identificar registros com ou sem correspondência.
--------------------------------------------------------------------------------

CREATE TABLE compras (
    id NUMBER PRIMARY KEY,
    pessoa_id NUMBER,
    produto VARCHAR2(100),
    valor NUMBER(10, 2)
);


CREATE TABLE pessoas (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    cidade VARCHAR2(50)
);

INSERT INTO pessoas VALUES (1, 'Ana Souza', 'São Paulo');
INSERT INTO pessoas VALUES (2, 'Bruno Lima', 'Rio de Janeiro');
INSERT INTO pessoas VALUES (3, 'Carlos Pereira', 'Belo Horizonte');
INSERT INTO pessoas VALUES (4, 'Daniela Torres', 'São Paulo');
INSERT INTO pessoas VALUES (5, 'Eduardo Silva', 'Salvador');
INSERT INTO pessoas VALUES (6, 'Fernanda Costa', 'São Paulo');
INSERT INTO pessoas VALUES (7, 'Gabriel Rocha', 'Curitiba');
INSERT INTO pessoas VALUES (8, 'Helena Castro', 'Porto Alegre');
INSERT INTO pessoas VALUES (9, 'Igor Mendes', 'Fortaleza');
INSERT INTO pessoas VALUES (10, 'Juliana Dias', 'Recife');

-- Pessoas válidas
INSERT INTO compras VALUES (1, 1, 'Notebook', 3500.00);
INSERT INTO compras VALUES (2, 1, 'Mouse', 80.00);
INSERT INTO compras VALUES (3, 2, 'Impressora', 600.00);
INSERT INTO compras VALUES (4, 4, 'Monitor', 850.00);
INSERT INTO compras VALUES (5, 5, 'Webcam', 250.00);

-- Pessoas inexistentes (para simular RIGHT/FULL OUTER JOIN)
INSERT INTO compras VALUES (6, 100, 'Fone Bluetooth', 150.00);
INSERT INTO compras VALUES (7, 999, 'HD Externo', 300.00);

-- 🎯 Objetivo: Identificar todas as compras, mesmo aquelas que não têm
-- uma pessoa associada (ex: registros com pessoa_id inválido).
-- A tabela de COMPRAS está à esquerda → todas as compras serão listadas.
SELECT 
    compras.id AS id_compra,
    compras.produto,
    compras.valor,
    pessoas.id AS id_pessoa,
    pessoas.nome,
    pessoas.cidade
FROM 
    compras
LEFT JOIN 
    ppessoas ON compras.pessoa_id = pessoas.id;

-- 🔎 Interpretação:
-- - Mostra todas as compras.
-- - Se uma compra tiver pessoa_id que não existe na tabela 'pessoas',
--   os campos relacionados à pessoa virão como NULL.
-- - Útil para identificar registros "órfãos", inconsistências ou problemas de integridade.

--------------------------------------------------------------------------------

-- 🎯 Objetivo: Identificar todas as pessoas, mesmo aquelas que não realizaram
-- nenhuma compra.
-- A tabela de PESSOAS está à esquerda → todas as pessoas serão listadas.
SELECT 
    pessoas.id AS id_pessoa,
    pessoas.nome,
    pessoas.cidade,
    compras.id AS id_compra,
    compras.produto,
    compras.valor
FROM 
    pessoas
LEFT JOIN 
    ccompras ON pessoas.id = compras.pessoa_id;

-- 🔎 Interpretação:
-- - Mostra todas as pessoas.
-- - Se uma pessoa não realizou nenhuma compra, os campos de 'compras' virão como NULL.
-- - Útil para localizar clientes inativos, campanhas de reengajamento, etc.

--------------------------------------------------------------------------------
-- ✅ DICA:
-- A regra é simples: o que está à ESQUERDA do LEFT JOIN sempre aparece.
-- Os campos da tabela da DIREITA podem vir como NULL se não houver correspondência.
--------------------------------------------------------------------------------
