
# 🔁 CTE Encadeada em SQL (Common Table Expressions)

Neste exemplo, exploramos o uso de **CTEs encadeadas**, ou seja, múltiplas subconsultas nomeadas dentro de um mesmo `WITH`, onde uma ou mais podem ser usadas na consulta final.

---

## 🧠 O que é uma CTE Encadeada?

> Uma CTE encadeada permite que você defina **várias subconsultas temporárias** (CTEs), que podem ser **encadeadas ou independentes**, e usadas logo após no `SELECT` principal.

### Sintaxe:

```sql
WITH primeira_cte AS (...),
     segunda_cte AS (...),
     terceira_cte AS (...)
SELECT ...
FROM segunda_cte;
```

---

## 🎯 Objetivo do Exemplo

- Calcular o total de compras por **cliente**.
- Calcular o total de compras por **cidade**.
- Exibir apenas as **cidades cujo total de compras foi maior que R$ 500,00**.

---

## 🧱 Estrutura das Tabelas

- `clientes`: contém nome e cidade dos clientes.
- `compras`: contém os valores das compras feitas por cada cliente.

---

## 🛠️ Script Utilizado

```sql
-- Tabelas
CREATE TABLE clientes (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    cidade VARCHAR2(100)
);

CREATE TABLE compras (
    id NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    valor NUMBER(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Dados
INSERT INTO clientes VALUES (1, 'Alice', 'São Paulo');
INSERT INTO clientes VALUES (2, 'Bruno', 'Rio de Janeiro');
INSERT INTO clientes VALUES (3, 'Carla', 'São Paulo');
INSERT INTO clientes VALUES (4, 'Daniel', 'Curitiba');

INSERT INTO compras VALUES (1, 1, 300.00);
INSERT INTO compras VALUES (2, 1, 200.00);
INSERT INTO compras VALUES (3, 2, 150.00);
INSERT INTO compras VALUES (4, 3, 100.00);
INSERT INTO compras VALUES (5, 3, 200.00);
INSERT INTO compras VALUES (6, 4, 400.00);

-- CTE encadeada
WITH calcular_total_compra_cliente AS (
    SELECT clientes.nome, SUM(compras.valor) AS total_cliente
    FROM clientes
    INNER JOIN compras ON clientes.id = compras.cliente_id
    GROUP BY nome
),
calcular_total_compra_cidade AS (
    SELECT clientes.cidade AS cidade, SUM(compras.valor) AS total_cidade
    FROM clientes
    INNER JOIN compras ON clientes.id = compras.cliente_id
    GROUP BY cidade
)
SELECT cidade, total_cidade
FROM calcular_total_compra_cidade
WHERE total_cidade > 500;
```

---

## ✅ O que é possível fazer com uma CTE Encadeada?



- Podemos definir **múltiplas CTEs** em um único `WITH`, mesmo que nem todas sejam usadas no SELECT final.
- As CTEs tornam a consulta **modular e mais legível**, especialmente quando há agregações ou etapas intermediárias.
- A query final foi feita sobre a CTE `calcular_total_compra_cidade`, ignorando a anterior (`calcular_total_compra_cliente`), que mesmo não usada, serve como exemplo de encadeamento.

---

📌 Esse tipo de CTE é muito útil em sistemas de relatórios, dashboards ou pipelines de dados.

