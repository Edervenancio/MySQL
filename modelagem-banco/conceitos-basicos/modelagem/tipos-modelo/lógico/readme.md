# Modelo Lógico

Este diretório contém materiais relacionados ao **Modelo Lógico de Dados**, a segunda etapa da modelagem de banco de dados. Aqui, o modelo conceitual é traduzido em uma estrutura **relacional**, com tabelas, colunas, chaves primárias e estrangeiras, ainda de forma **independente de um SGBD específico**.

---

## 🔹 O que é o Modelo Lógico?

O **modelo lógico** organiza os dados de forma relacional, permitindo que o banco de dados seja implementado futuramente em qualquer SGBD. Ele define **entidades como tabelas**, **relacionamentos como chaves estrangeiras**, e garante que a estrutura obedeça às regras de negócio levantadas na etapa conceitual.

- Traduz entidades e relacionamentos do modelo conceitual para **tabelas e colunas**.
- Estabelece **chaves primárias e estrangeiras**.
- Permite aplicar **normalização** (1FN, 2FN, 3FN).
- Ainda não define tipos específicos do SGBD (como VARCHAR(255), INT UNSIGNED).

---

## 🔹 Estrutura do Modelo Lógico

A imagem abaixo representa o modelo lógico de um sistema de **monitoramento de consumo de hardware por usuário**:

<img src="../../../../images/logico.png">

---

## 🔹 Tabelas e Relacionamentos

### 👤 Tabela: `usuario`
| Campo         | Observação                |
|---------------|---------------------------|
| id            | PK                        |
| nome          |                           |
| sobrenome     |                           |
| email         |                           |
| senha         |                           |

---

### ⚙️ Tabela: `hardware`
| Campo              | Observação                |
|--------------------|---------------------------|
| id                 | PK                        |
| hora               |                           |
| consumo_agora      |                           |
| consumo_dia        |                           |
| conta_pulso_litro  |                           |
| nome               |                           |

---

### 🔌 Tabela: `usuario_hardware`
Tabela de associação entre usuários e hardwares.

| Campo           | Observação                |
|-----------------|---------------------------|
| id              | PK                        |
| data_cadastro   |                           |
| numero_acesso   |                           |
| usuario_id      | FK → usuario(id)          |
| hardware_id     | FK → hardware(id)         |

---

### 📈 Tabela: `consumo_dia`
| Campo            | Observação                |
|------------------|---------------------------|
| id               | PK                        |
| data             |                           |
| valor            |                           |
| dia_da_semana    |                           |
| hardware_id      | FK → hardware(id)         |

---

### 🧪 Tabela: `hardware_flag`
| Campo                   | Observação                |
|-------------------------|---------------------------|
| id                      | PK                        |
| consumo_ultima_hora_valida |                      |
| zerou                   |                           |
| data                    |                           |
| volume_armazenado       |                           |
| hardware_id             | FK → hardware(id)         |
| flag_id                 | FK → flag(id)             |

---

### 🚩 Tabela: `flag`
| Campo       | Observação |
|-------------|------------|
| id          | PK         |
| hora        |            |

---

## 🔗 Relacionamentos

- **usuario_hardware** conecta usuários e hardwares (N:N).
- **hardware** é referenciado por:
  - `usuario_hardware`
  - `consumo_dia`
  - `hardware_flag`
- **hardware_flag** também referencia `flag`, indicando o estado ou sinal associado ao hardware em determinado momento.

---

## 🔹 Quando utilizar o Modelo Lógico?

- Após validar o modelo conceitual com os stakeholders.
- Para definir a **estrutura relacional** do banco de dados.
- Antes de implementar no SGBD, servindo como **base para o modelo físico**.

---

O modelo lógico é crucial para assegurar que o banco de dados esteja bem estruturado, relacionalmente coeso e pronto para a etapa de implementação física. Ele proporciona uma visão clara dos relacionamentos entre as tabelas e garante integridade referencial desde a concepção do sistema.
