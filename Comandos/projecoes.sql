DROP DATABASE IF EXISTS projeto;
CREATE DATABASE IF NOT EXISTS projeto;
use projeto;


CREATE TABLE cliente (
nome VARCHAR(30),
sexo VARCHAR(1),
email VARCHAR(30),
cpf int(11),
telefone VARCHAR(30),
endereco VARCHAR(100)
);

/* Omitindo colunas */
INSERT INTO CLIENTE VALUES
 ('JOAO', 'M', 'JOAOZINHO@HOTMAIL.COM', 512222222,
  '19999999999', 'Rua ficticia');

INSERT INTO CLIENTE VALUES
 ('Rafael', 'M', 'Rafa222@HOTMAIL.COM', 123422222,
  '19999999988', 'Rua dos sonhos');
  
  /* Ordenando as colunas */
  
  INSERT INTO CLIENTE (nome) VALUES ("Rafaela");
  
  INSERT INTO CLIENTE (nome, sexo, cpf, telefone, endereco) VALUES
 ('Zezinha', 'F', 1111111111,
  '20111111111', 'Rua dos ipes');
  
  /* Inserto compacto */
  
  INSERT INTO CLIENTE VALUES
  ('ANA', 'F', 'ANA@GLOBO.COM', 85549862, '548556985', 
  'PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
  ('CARLA', 'F', 'CARLA@TERATI.COM.BR', 7745828, '66587458', 
  'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

desc cliente;
show tables;

/* O comando SELECT
selecao, projecao e juncao */


-- Exibe o horario e data de agora.
SELECT NOW(); 

-- Exibe o horário com o alias
SELECT NOW() as DATA_HORA;

-- Exibe o horário com o alias e projetando o que desejo.
SELECT NOW() AS DATA_HORA, 'EDER V' as 'ESTUDANTE';
-- Procura por 'Zezinha';
SELECT 'Zezinha';


/* Alias de colunas */ 

SELECT * FROM CLIENTE;
SELECT NOME, SEXO, EMAIL FROM CLIENTE;
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;
SELECT NOME AS CLIENTE, SEXO, EMAIL, ENDERECO FROM CLIENTE;





