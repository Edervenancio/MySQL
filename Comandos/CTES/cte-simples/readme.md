
# 💡 CTE Simples em SQL (Common Table Expression)

A **CTE (Common Table Expression)** é uma subconsulta nomeada que você define com `WITH` e usa logo em seguida.  
Ela melhora a **legibilidade**, evita **repetição de código** e permite organizar consultas complexas de forma modular.

---

## 🧠 Quando usar CTE?

- Quando você tem uma **subquery repetida** ou de difícil leitura.
- Para **quebrar etapas** de uma consulta complexa em partes nomeadas.
- Como preparação para **CTEs recursivas** (ex: hierarquias, árvores).

---

## 📌 Estrutura Geral:

```sql
WITH nome_cte AS (
    SELECT ...
    FROM ...
)
SELECT ...
FROM nome_cte;
```

---

## 🧪 Exemplo prático

### Objetivo:
> Listar os produtos cujo preço unitário é **maior que a média do faturamento gerado** por produto.

### Estrutura usada:

```sql
-- DROP prévio
DROP TABLE vendas CASCADE CONSTRAINTS;
DROP TABLE produtos CASCADE CONSTRAINTS;

-- Criação das tabelas
CREATE TABLE produtos (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    preco_unitario NUMBER(10,2)
);

CREATE TABLE vendas (
    id NUMBER PRIMARY KEY,
    produto_id NUMBER,
    quantidade NUMBER,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de dados
INSERT INTO produtos VALUES (1, 'Notebook', 3500.00);
INSERT INTO produtos VALUES (2, 'Mouse', 80.00);
INSERT INTO produtos VALUES (3, 'Teclado', 150.00);
INSERT INTO produtos VALUES (4, 'Monitor', 900.00);

INSERT INTO vendas VALUES (1, 1, 3);   -- 3 notebooks vendidos
INSERT INTO vendas VALUES (2, 2, 10);  -- 10 mouses vendidos
INSERT INTO vendas VALUES (3, 3, 5);   -- 5 teclados vendidos

-- Consulta com CTE
WITH media_faturamento_produto AS (
   SELECT 
     produtos.nome, 
     AVG(produtos.preco_unitario * vendas.quantidade) AS media
   FROM produtos 
   INNER JOIN vendas ON produtos.id = vendas.produto_id 
   GROUP BY nome
)
SELECT 
  produtos.nome, 
  media
FROM 
  produtos, media_faturamento_produto 
WHERE 
  produtos.preco_unitario > media;
```

---

## 📈 Resultado Esperado

Mostra os produtos cujo **preço unitário** é superior à **média do faturamento total** entre os produtos vendidos.  
Como o `Monitor` não foi vendido, ele **não participa** da CTE (`INNER JOIN` filtra ele).

---

## 🔎 Dica Final

- A CTE precisa estar **acompanhada de um SELECT principal**.
- Você pode **encadear várias CTEs** separadas por vírgulas.
- Use CTEs para facilitar a **leitura e manutenção** de queries longas.

---
