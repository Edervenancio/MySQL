# <h1> MySQL: Seleções e Projeções </h1>

### <h3> Seleção de Dados </h3>

<p> A seleção de dados no MySQL é realizada por meio da instrução SQL <code>SELECT</code>. Essa instrução permite recuperar informações específicas de uma ou mais tabelas do banco de dados. Veja exemplos de seleção: </p>

<b>
-- Exemplo 1: Seleção de todas as colunas da tabela 'clientes'
<code>SELECT * FROM clientes;</code><br>
-- Exemplo 2: Seleção de colunas específicas da tabela 'produtos'
<code>SELECT nome, preco FROM produtos WHERE categoria = 'Eletrônicos';</code>
 
 -- Exemplo 3: Seleção com ordenação
<code>SELECT nome, idade FROM funcionarios ORDER BY idade DESC;</code>
</b>
<p> A cláusula <code>WHERE</code> é utilizada para filtrar os resultados com base em condições específicas. A cláusula <code>ORDER BY</code> é utilizada para ordenar os resultados de acordo com uma ou mais colunas. </p>

<h3> Projeção de Dados </h3>
<p> A projeção de dados refere-se à seleção de colunas específicas em vez de todas as colunas disponíveis em uma tabela. Veja exemplos de projeção: </p>

<b>
-- Exemplo 1: Projeção simples
<code>SELECT nome, email FROM clientes; </code><br>
-- Exemplo 2: Projeção com alias
<code>SELECT nome AS NomeCliente, idade AS IdadeCliente FROM clientes;</code>

-- Exemplo 3: Projeção de colunas calculadas
<code>SELECT nome, salario, salario * 1.1 AS SalarioComAumento FROM funcionarios;</code>
</b>
<p> O uso de alias (<code>AS</code>) permite renomear colunas na saída da consulta, facilitando a compreensão dos resultados. Além disso, é possível realizar cálculos ou operações nas colunas selecionadas. </p>

