
# SQL: RIGHT JOIN

Esta seção explora o uso do **RIGHT JOIN** no Oracle SQL por meio de um exemplo prático com eventos e inscrições. O `RIGHT JOIN` é utilizado para retornar todos os registros da tabela da direita, com dados correspondentes da esquerda quando existirem.

---

## 🔹 O que é o RIGHT JOIN?

O `RIGHT JOIN` retorna:

- Todos os registros da **tabela da direita**.
- Os dados da tabela da esquerda **apenas quando houver correspondência**.
- Quando não houver correspondência, os campos da tabela da esquerda aparecerão como `NULL`.

> Ideal para detectar registros "órfãos" ou garantir que a tabela da direita seja completamente representada.

---

## 🔹 Estrutura das Tabelas

Neste exemplo, utilizamos:

- `eventos`: tabela com eventos disponíveis no sistema.
- `inscricoes`: tabela com as inscrições realizadas para esses eventos.

Relacionamento entre elas:

```sql
inscricoes.id_evento = eventos.id
```

---

## 🔹 Exemplo 1 – Todos os eventos (mesmo sem inscrições)

```sql
SELECT DISTINCT 
    eventos.id, 
    eventos.titulo, 
    eventos.local
FROM 
    inscricoes
RIGHT JOIN 
    eventos ON inscricoes.id_evento = eventos.id
ORDER BY eventos.id;
```

✅ Lista todos os eventos, mesmo os que não possuem nenhuma inscrição associada.

---

## 🔹 Exemplo 2 – Todas as inscrições (mesmo inválidas)

```sql
SELECT 
    inscricoes.id, 
    inscricoes.nome_participante, 
    inscricoes.id_evento
FROM 
    eventos
RIGHT JOIN 
    inscricoes ON eventos.id = inscricoes.id_evento;
```

✅ Garante que todas as inscrições serão listadas, mesmo que:

- Sejam associadas a um evento inexistente (id inválido).
- Estejam com o campo `id_evento` em branco (NULL).

---

## 🔹 Representação Visual

A imagem a seguir representa o comportamento do RIGHT JOIN. Todos os registros da **tabela da direita (eventos ou inscrições)** são mantidos no resultado final.

<img src="../../../images/right-join.png" alt="Representação Visual do RIGHT JOIN">

---

## 🔹 Quando usar RIGHT JOIN?

- Garantir visualização completa da tabela da direita.
- Encontrar registros que não possuem vínculo na tabela da esquerda.
- Fazer auditorias ou verificações de integridade.

---

## 🔹 Comparativo com outros JOINs

| JOIN Type       | Retorno                                                      |
|-----------------|--------------------------------------------------------------|
| INNER JOIN      | Somente registros com correspondência nas duas tabelas       |
| LEFT JOIN       | Todos da esquerda + correspondência da direita (ou NULL)     |
| RIGHT JOIN      | Todos da direita + correspondência da esquerda (ou NULL)     |
| FULL OUTER JOIN | Todos os registros de ambas, combinando onde possível        |

---
