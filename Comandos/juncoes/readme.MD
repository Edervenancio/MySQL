# <h1> MySQL: Inner Joins </h1>

### <h3> Introdução ao Inner Join </h3>

<p> O Inner Join é uma cláusula SQL utilizada para combinar linhas de duas ou mais tabelas com base em uma condição de associação. Ele retorna apenas as linhas que possuem valores correspondentes em ambas as tabelas. Veja um exemplo básico: </p>


<p>Exemplo: Inner Join entre tabelas 'pedidos' e 'clientes' usando a coluna 'id_cliente'</p>
<code>SELECT pedidos.id, pedidos.data, clientes.nome
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id;</code>

<p> Neste exemplo, apenas os pedidos que têm um correspondente na tabela de clientes serão retornados. </p>


