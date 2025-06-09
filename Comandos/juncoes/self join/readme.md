
# SQL: SELF JOIN

Esta seção aborda o uso do **SELF JOIN** em SQL, utilizando um exemplo realista de estrutura hierárquica dentro de uma única tabela de funcionários. O `SELF JOIN` é especialmente útil quando **os dados se relacionam entre si na mesma tabela**, como é o caso de **funcionários que têm gerentes**.

---

## 🔹 O que é SELF JOIN?

O `SELF JOIN` é uma junção de uma tabela com ela mesma. Ele permite:

- Comparar registros dentro da mesma tabela.
- Criar relações hierárquicas ou auto-referenciais.

> É ideal para estruturas como organogramas, categorias aninhadas, árvores genealógicas, etc.
<img src="../../../images/self-join.png">

---

## 🔹 Estrutura da Tabela Usada

Neste exemplo, utilizamos uma única tabela chamada `funcionarios`, que possui:

- `id`: identificador único do funcionário.
- `nome`: nome completo.
- `cargo`: cargo ocupado na organização.
- `id_gerente`: referência ao `id` do gerente (pode ser `NULL` se for o topo da hierarquia).

### Diagrama Simplificado

```text
funcionarios
├── id
├── nome
├── cargo
└── id_gerente → relaciona com funcionarios.id
```

---

## 🔹 Exemplo – Funcionário e seu Gerente

```sql
SELECT 
    f_1.nome AS gerente,
    f_1.cargo,
    f_2.nome AS funcionario_gerenciado
FROM 
    funcionarios f_1
JOIN 
    funcionarios f_2 ON f_1.id = f_2.id_gerente;
```

✅ Essa consulta retorna todos os pares **[gerente → funcionário]**, conectando os IDs corretamente.

---

## 🔹 Interpretação

- `f_1` representa o gerente.
- `f_2` representa o funcionário gerenciado.
- A condição `f_1.id = f_2.id_gerente` define o vínculo hierárquico.

Exemplo de resultado:

| gerente         | cargo              | funcionario_gerenciado |
|-----------------|--------------------|-------------------------|
| Bruno Lima      | Gerente de TI      | Daniel Rocha           |
| Bruno Lima      | Gerente de TI      | Eduarda Silva          |

---

## 🔹 Quando usar SELF JOIN?

- Funcionários e seus gerentes (como neste exemplo).
- Categorias e subcategorias de produtos.
- Árvores organizacionais ou estruturas em "cascata".
- Relacionamentos cruzados dentro da mesma entidade.

---

## 🔹 Dica Final

> Sempre use **aliases** diferentes para cada "instância" da tabela.
>
> Isso ajuda a diferenciar claramente os papéis de cada linha no resultado do JOIN.

---
