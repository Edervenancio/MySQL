
# Terceira Forma Normal (3NF)

A **Terceira Forma Normal (3NF)** é a terceira etapa do processo de normalização em bancos de dados relacionais. Ela se aplica a tabelas que **já estão na Segunda Forma Normal (2NF)** e trata de eliminar **dependências transitivas** — ou seja, quando um atributo **depende de outro atributo não-chave**, que por sua vez depende da **chave primária**.

---

## 🔹 Critérios da 3NF

Uma tabela está na Terceira Forma Normal quando:

1. **Está na Segunda Forma Normal (2NF)**
2. **Todos os atributos não-chave dependem apenas da chave primária**, e **não de outros atributos não-chave**

⚠️ A 3NF evita que informações estejam **fora de seu contexto lógico**, o que pode gerar **redundância** e **anomalias de atualização**.

---

## 🔹 Benefícios da 3NF

✔️ Elimina redundâncias transitivas  
✔️ Evita inconsistências e anomalias complexas de atualização  
✔️ Garante que cada atributo esteja armazenado corretamente  
✔️ Melhora a integridade e organização do banco

---

## 🔹 Exemplo 1: Dependência Transitiva

Considere a tabela `funcionario`:

| id_funcionario | nome_funcionario | id_departamento | nome_departamento |
|----------------|------------------|------------------|-------------------|
| 1              | Ana              | 10               | RH                |
| 2              | Bruno            | 20               | Financeiro        |
| 3              | Carla            | 10               | RH                |

### 🔍 Problema

- `nome_departamento` **não depende diretamente da chave primária** `id_funcionario`
- Ele depende de `id_departamento`, que por sua vez depende da chave

➡️ Isso caracteriza uma **dependência transitiva**, e **viola a 3NF**

---

### ✅ Solução

Separar os dados do departamento em uma tabela específica:

```sql
CREATE TABLE departamento (
  id_departamento INT PRIMARY KEY,
  nome_departamento VARCHAR(100)
);

CREATE TABLE funcionario (
  id_funcionario INT PRIMARY KEY,
  nome_funcionario VARCHAR(100),
  id_departamento INT,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);
```

Agora, `nome_departamento` está diretamente ligado a `id_departamento`, e a tabela `funcionario` está apenas com os dados que dependem de `id_funcionario`.

---

## 🔹 Exemplo 2: Atributo no Lugar Errado 

Considere a seguinte tabela `aluno`:

| id_aluno | nome_aluno | id_curso | nome_curso |
|----------|------------|----------|------------|
| 1        | Lucas      | 101      | Engenharia |
| 2        | Maria      | 102      | Medicina   |

### 🔍 Análise

- `nome_curso` depende de `id_curso`, que depende da chave primária `id_aluno`
- Portanto, há uma **dependência transitiva** (chave → id_curso → nome_curso)

➡️ Isso **viola a 3NF**, pois `nome_curso` está no lugar errado

---

### ✅ Solução

Criar uma tabela `curso` para armazenar corretamente o nome do curso:

```sql
CREATE TABLE curso (
  id_curso INT PRIMARY KEY,
  nome_curso VARCHAR(100)
);

CREATE TABLE aluno (
  id_aluno INT PRIMARY KEY,
  nome_aluno VARCHAR(100),
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);
```

---

## 🔹 Resumo

| Situação                                                        | Está em 3NF? |
|-----------------------------------------------------------------|--------------|
| Todos os atributos não-chave dependem apenas da chave primária | ✅ Sim       |
| Algum atributo depende de outro atributo não-chave              | ❌ Não       |

---

## 🔹 Quando aplicar a 3NF?

- Sempre que sua tabela **já estiver em 2NF**
- Sempre que identificar **atributos que derivam de outros atributos não-chave**
- Quando quiser evitar **dados duplicados ou mal posicionados**

---