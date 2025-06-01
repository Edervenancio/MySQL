
# DQL, DCL e TCL — Comandos SQL Avançados

Além dos comandos mais conhecidos de **definição** (DDL) e **manipulação de dados** (DML), o SQL também conta com outros três grupos importantes:

---

## 🔷 DQL – Data Query Language

A **DQL** é responsável por **consultar dados** no banco de dados. Seu foco é a recuperação de informações, **sem alterá-las**.

- 🔹 **Principal comando:**  
  `SELECT` — usado para buscar dados em uma ou mais tabelas.

### 🧪 Exemplo:
```sql
SELECT nome, idade FROM clientes WHERE ativo = 1;
```


---

## 🔷 DCL – Data Control Language

A **DCL** lida com **controle de permissões** e acessos de usuários ao banco de dados. Usada em sistemas que exigem segurança e controle de múltiplos usuários.

- 🔹 **Principais comandos:**
  - `GRANT` — concede permissões
  - `REVOKE` — revoga permissões

### 🧪 Exemplo:
```sql
GRANT SELECT, INSERT ON clientes TO joao;
REVOKE INSERT ON clientes FROM joao;
```


---

## 🔷 TCL – Transaction Control Language

A **TCL** controla **transações no banco de dados**, permitindo confirmar (`COMMIT`) ou desfazer (`ROLLBACK`) operações.

- 🔹 **Principais comandos:**
  - `COMMIT` — salva as alterações realizadas na transação
  - `ROLLBACK` — desfaz as alterações
  - `SAVEPOINT` — cria um ponto intermediário na transação

### 🧪 Exemplo:
```sql
BEGIN;

UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

COMMIT;
```


---




