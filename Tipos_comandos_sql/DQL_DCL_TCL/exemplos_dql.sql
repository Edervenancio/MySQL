
-- Seleciona todos os registros da tabela clientes
SELECT * FROM clientes;

-- Seleciona apenas nome e cidade de clientes ativos
SELECT nome, cidade FROM clientes WHERE ativo = 1;

-- Agrupamento por cidade
SELECT cidade, COUNT(*) AS total_clientes
FROM clientes
GROUP BY cidade;

-- Junção entre duas tabelas
SELECT p.nome, c.nome AS categoria
FROM produtos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
