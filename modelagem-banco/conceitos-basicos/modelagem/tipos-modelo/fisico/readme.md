# Modelo Físico

Este diretório reúne os materiais relacionados ao **Modelo Físico de Dados**, a etapa final da modelagem de banco de dados. É aqui que o modelo lógico é transformado em um **conjunto real de instruções SQL**, com definições precisas de **tipos de dados**, **restrições**, **índices**, e outros elementos específicos do **SGBD (Sistema Gerenciador de Banco de Dados)** utilizado.

---

## 🔹 Do Negócio ao Sistema

O desenvolvimento de um sistema de banco de dados segue uma **sequência de abstrações**, que parte da visão do usuário e culmina na implementação técnica. A imagem a seguir ilustra esse fluxo:

<img src="../../../../images/fisico.jpg" alt="Fluxo dos Modelos de Dados">

### 🟡 Modelo de Tarefa do Usuário
- Descreve as **atividades realizadas pelo usuário**, focando em seu ponto de vista.
- Documento narrativo que orienta o levantamento de requisitos funcionais.

### 🟢 Modelo Conceitual
- Traduz as tarefas em **regras de negócio**, representando entidades, atributos e relacionamentos.
- Utiliza diagramas como DER, sendo **independente de tecnologia ou banco**.

### 🔵 Modelo Lógico
- Converte o modelo conceitual em **estrutura relacional** com tabelas, chaves primárias e estrangeiras.
- Aplica **normalização**, define restrições e **prepara o terreno para a implementação**.

### 🔴 Modelo Físico
- Implementa o modelo lógico diretamente no SGBD, com comandos reais em SQL.
- Define tipos de dados específicos, **cria tabelas, índices, constraints** e relacionamentos com base na engine escolhida.
- Pode representar tanto o **projeto físico do banco** quanto parte da infraestrutura de sistemas.

---

## 🔹 O que é o Modelo Físico?

O **modelo físico** é a representação concreta do banco de dados no ambiente real. Ele reflete todas as decisões estruturais e de integridade feitas nas etapas anteriores, mas agora com os detalhes técnicos necessários para **executar e operar o banco** de forma funcional e eficiente.

- Utiliza comandos SQL como `CREATE TABLE`, `ALTER`, `INSERT`, `DROP`.
- Define tipos de dados reais: `VARCHAR(100)`, `INT`, `FLOAT`, `DATE`, `BOOLEAN`, entre outros.
- Cria **restrições** como `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`, `PRIMARY KEY` e `FOREIGN KEY`.
- Pode incluir **índices**, **triggers**, **procedures**, **views**, entre outras estruturas avançadas.

---

## 🔹 Exemplo de Implementação Física (MySQL)

Abaixo está um exemplo básico de criação de uma tabela no modelo físico, usando SQL:

```sql
CREATE TABLE exemplo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  data_criacao DATE,
  status BOOLEAN
);
