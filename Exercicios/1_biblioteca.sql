/*
1 – Trazer todos os dados.
2 – Trazer o nome do livro e o nome da editora
3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
5 – Trazer os valores dos livros das editoras de São Paulo.
6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).
*/



DROP DATABASE IF EXISTS livraria;
CREATE DATABASE IF NOT EXISTS livraria;
use livraria;


CREATE TABLE livros (
nome_livro VARCHAR(100),
nome_autor VARCHAR(100),
sexo_autor CHAR(1),
numero_paginas int(4),
nome_editora VARCHAR(100),
valor_livro double(5,2),
uf_editora CHAR(2),
ano_publicacao DATE
);

INSERT INTO livros (nome_livro, nome_autor, sexo_autor, numero_paginas, 
				    nome_editora, valor_livro, uf_editora, ano_publicacao)
VALUES ('O Senhor dos Anéis', 'J.R.R. Tolkien', 'M', 1000, 'Editora Fantástica',
	49.99, 'SP', '1954-07-29');
    
INSERT INTO livros (nome_livro, nome_autor, sexo_autor, numero_paginas,
					nome_editora, valor_livro, uf_editora, ano_publicacao)
VALUES
  ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'M', 200, 'Editora Clássica', 24.99, 'RJ', '1881-12-15');


INSERT INTO livros VALUES  
('1984', 'George Orwell', 'M', 300, 'Editora Distópica', 29.99, 'RJ', '1949-06-08');
  
  INSERT INTO livros (nome_livro, nome_autor, sexo_autor, numero_paginas, valor_livro) VALUES 
  ('Orgulho e Preconceito', 'Jane Austen',  'F', 400, 19.99 );


-- Trazer todos os dados
SELECT * FROM LIVROS;

-- Trazer o nome do livro e o nome da editora
SELECT nome_livro, nome_editora FROM livros; 

-- Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
SELECT nome_livro, uf_editora FROM livros WHERE sexo_autor = 'M';

/* Trazer o nome do livro e o número de páginas dos 
livros publicados por autores do sexo feminino. */
SELECT nome_livro, numero_paginas FROM livros WHERE sexo_autor = 'F';

-- Trazer os valores dos livros das editoras de São Paulo.
SELECT valor_livro FROM LIVROS WHERE uf_editora LIKE '%SP';

/*6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados
 por São Paulo ou Rio de Janeiro (Questão Desafio). */
 
 SELECT nome_autor, sexo_autor FROM livros WHERE uf_editora LIKE '%SP' OR uf_editora LIKE '%RJ';

  


