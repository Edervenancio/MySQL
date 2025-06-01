DROP DATABASE IF EXISTS comercio;
CREATE DATABASE IF NOT exists comercio;

use COMERCIO;

-- Exibindo os banco de dados
show DATABASES;

/* Tabela CLIENTE:
Contém informações sobre os clientes, como nome, sexo, e-mail e CPF.
A chave primária é "idCliente" e é do tipo AUTO_INCREMENT, o que significa que é gerada automaticamente ao inserir um novo cliente.*/

CREATE TABLE CLIENTE(
idCliente INT PRIMARY KEY AUTO_INCREMENT, 
NOME VARCHAR(50) NOT NULL,
SEXO ENUM('M', 'F') NOT NULL,
email varchar(50) UNIQUE,
CPF VARCHAR(15) unique
);


/* Tabela ENDERECO:
Armazena informações sobre os endereços dos clientes.
A chave primária é "idEndereco" e também é do tipo AUTO_INCREMENT.
A coluna "idCliente" é uma chave estrangeira que faz referência à tabela CLIENTE. 
Isso indica uma relação 1x1 entre CLIENTE e ENDERECO, pois cada cliente tem no máximo um endereço.*/

CREATE TABLE endereco(
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(50) NOT NULL, 
bairro VARCHAR(50) NOT NULL,
CIDADE VARCHAR(50) NOT NULL, 
ESTADO CHAR(2) NOT NULL,
idCliente INT UNIQUE,
FOREIGN KEY (idCliente) 
REFERENCES cliente (idCliente)
);

/* Tabela TELEFONE:
Armazena informações sobre os telefones dos clientes.
A chave primária é "idTelefone" e é do tipo AUTO_INCREMENT.
A coluna "idCliente" é uma chave estrangeira que faz referência à tabela CLIENTE. Isso indica uma relação 1xN entre CLIENTE e TELEFONE,
 pois um cliente pode ter vários telefones, mas cada telefone está associado a apenas um cliente.
Comentários adicionais:
Os tipos ENUM são utilizados para restringir os valores que podem ser armazenados nas colunas "sexo" e "tipo".

Os comandos INSERT adicionam dados de exemplo nas tabelas CLIENTE, ENDERECO e TELEFONE.

O relacionamento 1x1 entre CLIENTE e ENDERECO é estabelecido pela chave estrangeira "idCliente" na tabela ENDERECO,
 referenciando a chave primária "idCliente" na tabela CLIENTE.

O relacionamento 1xN entre CLIENTE e TELEFONE é estabelecido pela chave estrangeira "idCliente" na tabela TELEFONE,
 referenciando a chave primária "idCliente" na tabela CLIENTE. Cada cliente pode ter vários telefones. */

create TABLE TELEFONE (
idTelefone INT PRIMARY KEY AUTO_INCREMENT,
tipo ENUM('RES', 'COM', 'CEL') not null,
numero varchar(11),
idCliente INT,
FOREIGN KEY (idCliente)
REFERENCES cliente (idCliente)
);


-- Exibindo as tabelas
SHOW TABLES;

/* Endereco - Obrigatorio
Cadastro de somente um.

Telefone - Nao Obrigatorio
CADASTRO DE MAIS DE UM (OPCIONAL) */

/* 
Chave estrageinra é a chave primaria de um tabela que vai ate a outra tabela
para fazer referencia entre registros */

/* Em relacionamento 1 x 1, a chave estrangeira fica na tabela mais fraca */
/* Em relacionamento 1 X N, a chave estrangeira fica sempre na cardinalidade N */

INSERT INTO CLIENTE VALUES(NULL, 'Eder', 'M', 'EDER@EMAIL.COM', '11111111111');
INSERT INTO CLIENTE VALUES(NULL, 'Maria', 'F', 'maria@email.com', '22222222222');
INSERT INTO CLIENTE VALUES(NULL, 'João', 'M', NULL, '33333333333');
INSERT INTO CLIENTE VALUES(NULL, 'Ana', 'F', 'ana@email.com', '44444444444');
INSERT INTO CLIENTE VALUES(NULL, 'Carlos', 'M', 'carlos@email.com', '55555555555');
INSERT INTO CLIENTE VALUES(NULL, 'Mariana', 'F', 'mariana@email.com', '66666666666');
INSERT INTO CLIENTE VALUES(NULL, 'Pedro', 'M', 'pedro@email.com', '77777777777');
INSERT INTO CLIENTE VALUES(NULL, 'Isabel', 'F', 'isabel@email.com', '88888888888');
INSERT INTO CLIENTE VALUES(NULL, 'Ricardo', 'M', 'ricardo@email.com', '99999999999');
INSERT INTO CLIENTE VALUES(NULL, 'Fernanda', 'F', 'fernanda@email.com', '10101010101');

SELECT * FROM CLIENTE;


-- Exibindo atributos que são utilizados no endereco
DESC endereco;

INSERT INTO ENDERECO VALUES (NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 3);
INSERT INTO ENDERECO VALUES (NULL, 'RUA BELA VISTA', 'JARDIM', 'SAO PAULO', 'SP', 1);
INSERT INTO ENDERECO VALUES (NULL, 'AVENIDA BRASIL', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES (NULL, 'RUA DA LIBERDADE', 'LIBERDADE', 'SAO PAULO', 'SP', 4);
INSERT INTO ENDERECO VALUES (NULL, 'RUA DAS FLORES', 'FLORES', 'CAMPINAS', 'SP', 5);
INSERT INTO ENDERECO VALUES (NULL, 'AVENIDA PAULISTA', 'BELA VISTA', 'SAO PAULO', 'SP', 6);
INSERT INTO ENDERECO VALUES (NULL, 'RUA DOS ARTISTAS', 'ARTISTAS', 'SALVADOR', 'BA', 7);
INSERT INTO ENDERECO VALUES (NULL, 'AVENIDA AMAZONAS', 'AMAZONAS', 'BELO HORIZONTE', 'MG', 8);
INSERT INTO ENDERECO VALUES (NULL, 'RUA DA REPÚBLICA', 'REPÚBLICA', 'CURITIBA', 'PR', 9);

SELECT * FROM ENDERECO;

DESC telefone;

INSERT INTO telefone VALUES (NULL, 'CEL', '123213441', 1);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '1122334455', 2);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '9988776655', 3);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '9876543210', 4);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '1122334455', 5);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '9988776655', 6);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '9876543210', 1);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '9923376655', 6);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '9876543210', 1);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '1122334455', 4);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '9988776655', 3);

SELECT * FROM TELEFONE;


































