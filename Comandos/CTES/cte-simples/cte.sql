-- DROP prévio: remove as tabelas se já existirem, para evitar erro de duplicidade
DROP TABLE vendas CASCADE CONSTRAINTS;
DROP TABLE produtos CASCADE CONSTRAINTS;

-- Criação da tabela de produtos
CREATE TABLE produtos (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    preco_unitario NUMBER(10,2)
);

-- Criação da tabela de vendas com chave estrangeira para produtos
CREATE TABLE vendas (
    id NUMBER PRIMARY KEY,
    produto_id NUMBER,
    quantidade NUMBER,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de produtos com preços variados
INSERT INTO produtos VALUES (1, 'Notebook', 3500.00);
INSERT INTO produtos VALUES (2, 'Mouse', 80.00);
INSERT INTO produtos VALUES (3, 'Teclado', 150.00);
INSERT INTO produtos VALUES (4, 'Monitor', 900.00);

-- Inserção de vendas para os três primeiros produtos
INSERT INTO vendas VALUES (1, 1, 3); -- 3 notebooks vendidos
INSERT INTO vendas VALUES (2, 2, 10); -- 10 mouses vendidos
INSERT INTO vendas VALUES (3, 3, 5); -- 5 teclados vendidos
-- Monitor não teve vendas

----------------------------------------------------
-- CTE: calcula a média de faturamento por produto
----------------------------------------------------
WITH media_faturamento_produto AS (
    SELECT 
        produtos.nome, 
        AVG(produtos.preco_unitario * vendas.quantidade) AS media
    FROM 
        produtos 
    INNER JOIN 
        vendas ON produtos.id = vendas.produto_id
    GROUP BY 
        nome
)

------------------------------------------------------
-- Consulta final: mostra os produtos cujo preço unitário
-- é maior do que a média de faturamento dos produtos vendidos
------------------------------------------------------
SELECT 
    produtos.nome, 
    media
FROM 
    produtos,
    media_faturamento_produto
WHERE 
    produtos.preco_unitario > media;
