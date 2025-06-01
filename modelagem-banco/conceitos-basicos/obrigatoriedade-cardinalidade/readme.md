
# Obrigatoriedade e Cardinalidade

<h2>Obrigatoriedade</h2>
A obrigatoriedade de um atributo é uma restrição que indica se o atributo deve ou não ter um valor. Um atributo pode ser obrigatório ou opcional.

Obrigatório: O atributo deve ter um valor. Se o atributo não tiver um valor, a linha não será válida.
Opcional: O atributo pode ter ou não um valor. Se o atributo não tiver um valor, a linha ainda será válida.
Exemplo

Considere a seguinte tabela de clientes:

| id_cliente | nome | endereço |
|---|---|---|
| 1 | João da Silva | Rua da Paz, 123 |
| 2 | Maria da Costa | Avenida da Liberdade, 456 |
A coluna nome é obrigatória, pois um cliente deve ter um nome. A coluna endereço é opcional, pois um cliente pode não ter um endereço registrado.

<h2>Cardinalidade</h2>

A cardinalidade de um relacionamento é uma restrição que indica quantos registros de uma tabela podem estar relacionados a quantos registros de outra tabela.

Existem quatro tipos de cardinalidade:

1:1: Um registro de uma tabela pode estar relacionado a apenas um registro da outra tabela.
1:N: Um registro de uma tabela pode estar relacionado a zero, um ou mais registros da outra tabela.
N:1: Um registro da tabela pode estar relacionado a zero, um ou mais registros da outra tabela.
N:M: Um registro de uma tabela pode estar relacionado a zero, um ou mais registros da outra tabela, e um registro da outra tabela pode estar relacionado a zero, um ou mais registros da tabela original.
Exemplo

Considere a seguinte tabela de clientes:

| id_cliente | nome |
|---|---|
| 1 | João da Silva |
| 2 | Maria da Costa |
A coluna id_cliente é uma chave primária, o que significa que cada registro na tabela deve ter um valor exclusivo para esta coluna. Isso significa que a cardinalidade do relacionamento entre a tabela de clientes e a si mesma é 1:1.

Considere agora a seguinte tabela de pedidos:

| id_pedido | id_cliente | data | valor |
|---|---|---|---|
| 1 | 1 | 2023-07-20 | 100,00 |
| 2 | 2 | 2023-07-21 | 200,00 |
A coluna id_cliente é uma chave estrangeira, o que significa que seu valor deve corresponder ao valor da chave primária de outra tabela. No caso, a tabela de clientes. Isso significa que a cardinalidade do relacionamento entre a tabela de pedidos e a tabela de clientes é 1:N.

<h1>Exemplo</h1>

<img src="../../images/cardinalidade-obrigatoriedade.png" width="600px">
<ul>
    <li>TELEFONE - O CLIENTE NAO É OBRIGADO A INFORMAR TELEFONE (0, N) - Mas pode informar vários </li>
       <li>É obrigatório que haja um cliente com um telefone? Qual o máximo? (1,1)</li>
    <li>OBRIGATORIO O CADASTRO DE UM ENDERECO (NO MAXIMO 1) (1,1)</li>
    <li>O Endereço deve pertencer a alguem? (1,1)</li>
</li>
</ul>
<h2>Benefícios da obrigatoriedade e cardinalidade</h2

A obrigatoriedade e cardinalidade fornecem uma série de benefícios, incluindo:

Melhoram a integridade dos dados. Ao restringir os valores que podem ser armazenados em um atributo, a obrigatoriedade e cardinalidade ajudam a garantir que os dados sejam precisos e consistentes.
Facilitam a consulta dos dados. Ao conhecer a obrigatoriedade e cardinalidade de um relacionamento, é possível escrever consultas mais precisas e eficientes.
Facilitam a manutenção dos dados. Ao restringir os valores que podem ser armazenados em uma coluna, a obrigatoriedade e cardinalidade tornam mais fácil adicionar novos dados e fazer alterações nos dados existentes.