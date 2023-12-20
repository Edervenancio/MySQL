 <h1> MySQL: Inserts e Updates </h1>

### <h3> Inserções no Banco de Dados </h3>

<p> A inserção de dados em um banco de dados MySQL é realizada utilizando a instrução SQL <code>INSERT INTO</code>. Essa instrução permite adicionar novas linhas a uma tabela específica. Um exemplo simples de inserção seria: </p>


<b>-- Exemplo 1: Inserção básica
<code>INSERT INTO clientes (nome, email, idade) VALUES ('João Silva', 'joao@email.com', 30);</code>

-- Exemplo 2: Inserção com valores nulos
<code>INSERT INTO clientes (nome, email) VALUES ('Maria Oliveira', NULL);</code>

-- Exemplo 3: Inserção de múltiplos registros
<code>INSERT INTO produtos (nome, preco) VALUES ('Produto A', 50), ('Produto B', 75), ('Produto C', 100);</code></b>
<p> Certifique-se de fornecer os valores corretos nas posições apropriadas, correspondendo às colunas especificadas. </p>

<h3> Atualizações no Banco de Dados </h3>
<p> Para atualizar registros existentes em uma tabela do MySQL, utiliza-se a instrução SQL <code>UPDATE</code>. Esta instrução permite modificar os valores das colunas de uma ou mais linhas com base em uma condição específica. Exemplos: </p>

<b>-- Exemplo 1: Atualização simples ->
<code>UPDATE clientes SET idade = 31 WHERE nome = 'João Silva';</code>

-- Exemplo 2: Atualização condicional ->
<code>UPDATE produtos SET preco = preco * 1.1 WHERE categoria = 'Eletrônicos';</code>

</b>
<p> Certifique-se de fornecer uma condição apropriada para garantir que apenas os registros desejados sejam atualizados. </p>