/*

Desafio: Produtos Duplicados no Estoque
Voc� gerencia uma tabela de produtos em estoque. Alguns produtos foram 
cadastrados mais de uma vez com o mesmo nome e categoria, mas IDs diferentes. 
Sua tarefa é criar um procedimento que:

Detecte produtos duplicados, considerando:
Mesmo nome (nome_produto).
Mesma categoria (categoria).
Mantenha apenas o produto com o menor id_produto e remova os outros.
Insira os registros removidos em uma tabela chamada historico_produtos_removidos.

*/

CREATE TABLE produtos (
    id_produto NUMBER PRIMARY KEY,
    nome_produto VARCHAR2(100),
    categoria VARCHAR2(50),
    quantidade NUMBER,
    preco NUMBER(10, 2)
);

CREATE TABLE historico_produtos_removidos (
    id_produto NUMBER PRIMARY KEY,
    nome_produto VARCHAR2(100),
    categoria VARCHAR2(50),
    data_remocao DATE DEFAULT SYSDATE
);

-- Inserindo registros na tabela produtos
INSERT INTO produtos VALUES (1, 'Notebook', 'Eletr�nicos', 10, 3000.00);
INSERT INTO produtos VALUES (2, 'Notebook', 'Eletr�nicos', 15, 2900.00); -- Duplicado
INSERT INTO produtos VALUES (3, 'Cadeira Gamer', 'M�veis', 5, 700.00);
INSERT INTO produtos VALUES (4, 'Mouse', 'Eletr�nicos', 20, 150.00);
INSERT INTO produtos VALUES (5, 'Teclado', 'Eletr�nicos', 30, 200.00);
INSERT INTO produtos VALUES (6, 'Cadeira Gamer', 'M�veis', 8, 750.00); -- Duplicado
INSERT INTO produtos VALUES (7, 'Smartphone', 'Eletr�nicos', 12, 2000.00);
INSERT INTO produtos VALUES (8, 'Teclado', 'Eletr�nicos', 25, 210.00); -- Duplicado


CREATE OR REPLACE NONEDITIONABLE PROCEDURE PROCESSAR_PRODUTOS AS
  v_id_minimo_produto NUMBER;
  v_nome_produto      VARCHAR2(255);
  v_data_remocao      DATE;
  v_categoria_produto VARCHAR(255);

BEGIN
  for l_produtos in (select count(*) as Quantidade,
                            MIN(produtos.id_produto) as MenorId,
                            produtos.nome_produto as Nome,
                            produtos.categoria as Categoria
                       from produtos
                      group by produtos.nome_produto, produtos.categoria) loop
  
    v_id_minimo_produto := l_produtos.MenorId;
    v_nome_produto      := l_produtos.Nome;
    v_data_remocao      := sysdate;
    v_categoria_produto := l_produtos.Categoria;
  
    for l_produtos_excluidos in (select *
                                   from produtos
                                  where produtos.nome_produto =
                                        l_produtos.Nome
                                    AND produtos.categoria =
                                        l_produtos.categoria
                                    AND produtos.id_produto <>
                                        l_produtos.MenorId) loop
    
      if l_produtos.Quantidade >= 2 AND
         l_produtos_excluidos.id_produto <> v_id_minimo_produto THEN
      
        INSERT INTO historico_produtos_removidos
          (historico_produtos_removidos.id_produto,
           historico_produtos_removidos.nome_produto,
           historico_produtos_removidos.categoria,
           historico_produtos_removidos.data_remocao)
        VALUES
          (l_produtos_excluidos.id_produto,
           l_produtos_excluidos.nome_produto,
           l_produtos_excluidos.categoria,
           SYSDATE);
           
                   DELETE FROM produtos
         WHERE produtos.nome_produto = l_produtos.Nome
           AND produtos.categoria = v_categoria_produto
           AND produtos.id_produto <> v_id_minimo_produto;
       

      
      END IF;
    END LOOP;
  END LOOP;
END;
