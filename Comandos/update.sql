DROP DATABASE IF EXISTS exercicio;
create database IF NOT EXISTS exercicio;
use exercicio;
create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );
  
  -- Inserts
insert into funcionarios values (1, 'Ana Silva', 'ana@email.com', 'FEMININO', 'Filmes', '01/01/2020', 5000, 'Analista', 1);
insert into funcionarios values (2, 'João Santos', 'joao@email.com', 'MASCULINO', 'Roupas', '02/02/2021', 6000, 'Analista', 2);
insert into funcionarios values (3, 'Maria Oliveira', 'maria@email.com', 'FEMININO', 'Jardim', '03/03/2022', 7000, 'Coordenador', 1);
insert into funcionarios values (4, 'Pedro Rocha', 'pedro@email.com', 'MASCULINO', 'Filmes', '04/04/2020', 5500, 'Analista', 2);
insert into funcionarios values (5, 'Carla Lima', 'carla@email.com', 'FEMININO', 'Lar', '05/05/2021', 6500, 'Coordenador', 3);
insert into funcionarios values (6, 'Lucas Oliveira', 'lucas@email.com', 'MASCULINO', 'Jardim', '06/06/2022', 7500, 'Gerente', 1);
insert into funcionarios values (7, 'Amanda Silva', 'amanda@email.com', 'FEMININO', 'Filmes', '07/07/2020', 5200, 'Analista', 2);
insert into funcionarios values (8, 'Rafael Pereira', 'rafael@email.com', 'MASCULINO', 'Roupas', '08/08/2021', 6200, 'Analista', 3);
insert into funcionarios values (9, 'Beatriz Santos', 'beatriz@email.com', 'FEMININO', 'Jardim', '09/09/2022', 7200, 'Coordenador', 1);
insert into funcionarios values (10, 'Carlos Lima', 'carlos@email.com', 'MASCULINO', 'Lar', '10/10/2020', 5300, 'Analista', 2);
insert into funcionarios values (11, 'Juliana Oliveira', 'juliana@email.com', 'FEMININO', 'Filmes', '11/11/2021', 6300, 'Analista', 3);
insert into funcionarios values (12, 'Fernando Rocha', 'fernando@email.com', 'MASCULINO', 'Roupas', '12/12/2022', 7300, 'Gerente', 1);
insert into funcionarios values (13, 'Isabela Santos', 'isabela@email.com', 'FEMININO', 'Jardim', '13/01/2020', 5400, 'Analista', 2);
insert into funcionarios values (14, 'Vinícius Lima', 'vinicius@email.com', 'MASCULINO', 'Lar', '14/02/2021', 6400, 'Analista', 3);
insert into funcionarios values (15, 'Mariana Oliveira', 'mariana@email.com', 'FEMININO', 'Filmes', '15/03/2022', 7400, 'Coordenador', 1);
insert into funcionarios values (16, 'Henrique Silva', 'henrique@email.com', 'MASCULINO', 'Roupas', '16/04/2020', 5500, 'Analista', 2);
insert into funcionarios values (17, 'Gabriela Santos', 'gabriela@email.com', 'FEMININO', 'Jardim', '17/05/2021', 6500, 'Analista', 3);
insert into funcionarios values (18, 'Paulo Lima', 'paulo@email.com', 'MASCULINO', 'Lar', '18/06/2022', 7500, 'Gerente', 1);
insert into funcionarios values (19, 'Natália Oliveira', 'natalia@email.com', 'FEMININO', 'Filmes', '19/07/2020', 5200, 'Analista', 2);
insert into funcionarios values (20, 'Bruno Pereira', 'bruno@email.com', 'MASCULINO', 'Roupas', '20/08/2021', 6200, 'Analista', 3);
insert into funcionarios values (21, 'Larissa Santos', 'larissa@email.com', 'FEMININO', 'Jardim', '21/09/2022', 7200, 'Coordenador', 1);
insert into funcionarios values (22, 'Gustavo Lima', 'gustavo@email.com', 'MASCULINO', 'Lar', '22/10/2020', 5300, 'Analista', 2);
insert into funcionarios values (23, 'Aline Oliveira', 'aline@email.com', 'FEMININO', 'Filmes', '23/11/2021', 6300, 'Analista', 3);
insert into funcionarios values (24, 'Roberto Rocha', 'roberto@email.com', 'MASCULINO', 'Roupas', '24/12/2022', 7300, 'Gerente', 1);
insert into funcionarios values (25, 'Camila Santos', 'camila@email.com', 'FEMININO', 'Jardim', '25/01/2020', 5400, 'Analista', 2);
insert into funcionarios values (26, 'Felipe Lima', 'felipe@email.com', 'MASCULINO', 'Lar', '26/02/2021', 6400, 'Analista', 3);
insert into funcionarios values (27, 'Tatiane Oliveira', 'tatiane@email.com', 'FEMININO', 'Filmes', '27/03/2022', 7400, 'Coordenador', 1);
insert into funcionarios values (28, 'Renato Silva', 'renato@email.com', 'MASCULINO', 'Roupas', '28/04/2020', 5500, 'Analista', 2);
insert into funcionarios values (29, 'Fernanda Santos', 'fernanda@email.com', 'FEMININO', 'Jardim', '29/05/2021', 6500, 'Analista', 3);
insert into funcionarios values (30, 'Luciano Lima', 'luciano@email.com', 'MASCULINO', 'Lar', '30/06/2022', 7500, 'Gerente', 1);
insert into funcionarios values (31, 'Giovanna Silva', 'giovanna@email.com', null, 'Roupas', '05/11/2022', 7800, 'Gerente', null);
insert into funcionarios values (32, 'Matheus Santos', null, 'MASCULINO', 'Jardim', '06/12/2020', 5800, 'Analista', 2);
insert into funcionarios values (33, 'Laura Lima', 'laura@email.com', 'FEMININO', 'Lar', null, 6700, 'Analista', 3);
insert into funcionarios values (34, 'Anderson Rocha', 'anderson@email.com', 'MASCULINO', null, '08/02/2021', 7800, 'Coordenador', 1);


/* Utilizando o update para atualizar valores */
-- Atualiza todos 
-- UPDATE CLIENTE SET EMAIL = 'TESTE@HOTMAIL.COM';



select nome, sexo from funcionarios where sexo = "FEMININO";
-- Atualizando a sigla de sexo do Banco de dados.
update exercicio.funcionarios set sexo = 'F' where sexo = 'FEMININO';



select * from funcionarios where departamento = 'Jardim';
-- atualizando funcionarios que estao no departamento do jardim, para departamento inoperante 
update exercicio.funcionarios set departamento = 'inoperante' WHERE departamento = 'jardim'; 
select * from funcionarios where departamento = 'inoperante' or sexo = 'F';















