<h1> MySQL: DDL e DML </h1>

### <h3> DDL - Linguagem de Definição de Dados </h3>

<p> A Linguagem de Definição de Dados (DDL) é utilizada para definir a estrutura e a organização dos objetos do banco de dados. Exemplos de comandos DDL no MySQL: </p>

<b>
-- Criar uma tabela ->
<code>CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(100)
);</code>

-- Modificar uma tabela (adicionar uma coluna) ->
<code>ALTER TABLE clientes
ADD COLUMN idade INT;</code><br>
-- Excluir uma tabela ->
<code>DROP TABLE clientes;</code>
</b>
<p> Os comandos <code>CREATE</code>, <code>ALTER</code>, e <code>DROP</code> são exemplos de instruções DDL. Eles são usados para criar, modificar e excluir objetos do banco de dados, como tabelas, índices e procedimentos armazenados. </p>

<h3> DML - Linguagem de Manipulação de Dados </h3>
<p> A Linguagem de Manipulação de Dados (DML) é utilizada para manipular os dados armazenados nas tabelas do banco de dados. Exemplos de comandos DML no MySQL: </p>

<b>
-- Inserir dados em uma tabela ->
<code>INSERT INTO clientes (nome, email, idade) VALUES ('João Silva', 'joao@email.com', 30);</code>

-- Atualizar dados em uma tabela ->
<code>UPDATE clientes SET idade = 31 WHERE nome = 'João Silva';</code><br>
-- Excluir dados de uma tabela ->
<code>DELETE FROM clientes WHERE idade > 40;</code>
</b>

