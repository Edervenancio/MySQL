
# 🧩 Tipos de JOIN em SQL

Esta seção apresenta uma visão geral dos principais tipos de **JOINs** utilizados em SQL, fundamentais para o relacionamento entre tabelas em bancos de dados relacionais. JOINs são usados para **combinar registros** de duas ou mais tabelas com base em condições lógicas, permitindo consultas poderosas e relacionamentos complexos.

---

## 🔹 INNER JOIN

O `INNER JOIN` retorna apenas os registros que possuem **valores correspondentes em ambas as tabelas**.

- Foco em dados relacionados.
- Ignora registros "órfãos".

**Exemplo:** Listar pedidos que possuem cliente cadastrado.

---

## 🔹 LEFT JOIN (ou LEFT OUTER JOIN)

Retorna **todos os registros da tabela da esquerda**, mesmo que não haja correspondência na tabela da direita.

- Os dados da direita vêm como `NULL` quando não encontrados.
- Útil para encontrar registros "sem correspondência" na direita.

**Exemplo:** Listar clientes e seus pedidos (mesmo os que nunca compraram).

---

## 🔹 RIGHT JOIN (ou RIGHT OUTER JOIN)

Retorna **todos os registros da tabela da direita**, mesmo que não haja correspondência na tabela da esquerda.

- Os dados da esquerda vêm como `NULL` quando não encontrados.
- Útil para garantir a presença de todos os registros da direita.

**Exemplo:** Ver todos os eventos cadastrados, mesmo que ninguém tenha se inscrito.

---

## 🔹 FULL OUTER JOIN

Retorna **todos os registros de ambas as tabelas**, combinando onde houver correspondência e preenchendo com `NULL` onde não houver.

- Une os comportamentos do `LEFT JOIN` e `RIGHT JOIN`.
- Permite ver o que está **presente, ausente ou inconsistente** em ambos os lados.

**Exemplo:** Ver todos os alunos e todas as entregas de atividades, mesmo que não estejam conectados.

---

## 🔹 SELF JOIN

O `SELF JOIN` junta uma tabela **com ela mesma**, útil para estruturas hierárquicas ou auto-referenciais.

- Requer aliases para diferenciar os dois lados da tabela.
- Muito comum em organogramas, árvores genealógicas ou estruturas gerenciais.

**Exemplo:** Mostrar funcionários e seus respectivos gerentes na mesma tabela.

---

## 🔹 CROSS JOIN

O `CROSS JOIN` gera o **produto cartesiano** entre duas tabelas.

- Cada linha da Tabela A é combinada com **todas as linhas** da Tabela B.
- Usado para gerar todas as **combinações possíveis** entre dois conjuntos.

**Exemplo:** Criar uma grade de horário com todos os dias da semana e turnos.

---


## 🔎 Tabela Comparativa

| JOIN              | Retorna...                                                  |
|-------------------|-------------------------------------------------------------|
| INNER JOIN        | Apenas registros com correspondência                        |
| LEFT JOIN         | Todos da esquerda + correspondência da direita (ou NULL)    |
| RIGHT JOIN        | Todos da direita + correspondência da esquerda (ou NULL)    |
| FULL OUTER JOIN   | Todos os registros das duas tabelas, combinando onde possível |
| SELF JOIN         | Registros da mesma tabela relacionados entre si             |
| CROSS JOIN        | Todas as combinações possíveis entre os registros           |


---

