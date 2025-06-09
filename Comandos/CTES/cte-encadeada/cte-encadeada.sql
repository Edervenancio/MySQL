--------------------------------------------------------------------------------
-- 🗂️ REMOÇÃO DAS TABELAS (caso já existam)
--------------------------------------------------------------------------------
DROP TABLE compras CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------
-- 🏗️ CRIAÇÃO DAS TABELAS
--------------------------------------------------------------------------------

-- Tabela de clientes, com campos: id, nome e cidade
CREATE TABLE clientes (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    cidade VARCHAR2(100)
);

-- Tabela de compras realizadas pelos clientes
CREATE TABLE compras (
    id NUMBER PRIMARY KEY,
    cliente_id NUMBER,                  -- Chave estrangeira para a tabela clientes
    valor NUMBER(10,2),                 -- Valor da compra
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

--------------------------------------------------------------------------------
-- 📥 INSERÇÃO DE DADOS
--------------------------------------------------------------------------------

-- Clientes cadastrados, com cidades distintas
INSERT INTO clientes VALUES (1, 'Alice', 'São Paulo');
INSERT INTO clientes VALUES (2, 'Bruno', 'Rio de Janeiro');
INSERT INTO clientes VALUES (3, 'Carla', 'São Paulo');
INSERT INTO clientes VALUES (4, 'Daniel', 'Curitiba');

-- Compras feitas por diferentes clientes
INSERT INTO compras VALUES (1, 1, 300.00);  -- Alice
INSERT INTO compras VALUES (2, 1, 200.00);  -- Alice
INSERT INTO compras VALUES (3, 2, 150.00);  -- Bruno
INSERT INTO compras VALUES (4, 3, 100.00);  -- Carla
INSERT INTO compras VALUES (5, 3, 200.00);  -- Carla
INSERT INTO compras VALUES (6, 4, 400.00);  -- Daniel

--------------------------------------------------------------------------------
-- 🔄 CTE ENCADEADA: ETAPAS DE PROCESSAMENTO
--------------------------------------------------------------------------------

-- CTE 1: calcula o total de compras por cliente
WITH calcular_total_compra_cliente AS (
    SELECT 
        clientes.nome, 
        SUM(compras.valor) AS total_cliente
    FROM 
        clientes 
    INNER JOIN 
        compras ON clientes.id = compras.cliente_id
    GROUP BY 
        nome
),

-- CTE 2: calcula o total de compras por cidade
calcular_total_compra_cidade AS (
    SELECT 
        clientes.cidade AS cidade, 
        SUM(compras.valor) AS total_cidade
    FROM 
        clientes 
    INNER JOIN 
        compras ON clientes.id = compras.cliente_id
    GROUP BY 
        cidade
)

--------------------------------------------------------------------------------
-- 🎯 CONSULTA FINAL: cidades com mais de R$ 500,00 em compras
--------------------------------------------------------------------------------

SELECT 
    cidade, 
    total_cidade
FROM 
    calcular_total_compra_cidade
WHERE 
    total_cidade > 500;
