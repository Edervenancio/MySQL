-- Criação da tabela Alunos
CREATE TABLE Alunos (
    id_aluno NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);

-- Criação da tabela Notas
CREATE TABLE Notas (
    id_nota NUMBER PRIMARY KEY,
    id_aluno NUMBER,
    disciplina VARCHAR2(100),
    nota NUMBER(3, 1),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (id_aluno, nome) VALUES (1, 'Ana Silva');
INSERT INTO Alunos (id_aluno, nome) VALUES (2, 'Bruno Mendes');
INSERT INTO Alunos (id_aluno, nome) VALUES (3, 'Carla Pereira');

-- Inserindo dados na tabela Notas
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (1, 1, 'Matemática', 8.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (2, 1, 'Português', 5.7);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (3, 1, 'História', 7.0);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (4, 2, 'Matemática', 4.3);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (5, 2, 'Português', 6.8);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (6, 3, 'Matemática', 9.2);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (7, 3, 'Português', 5.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (8, 3, 'História', 6.1);

COMMIT;


CREATE OR REPLACE PROCEDURE GERA_RELATORIO_NOTAS  
declare 
v_aluno VARCHAR(255);
v_media NUMBER; 
v_situacao VARCHAR(255);

begin 
      for aluno IN (
        select * from alunos) 
        loop 
          v_aluno := aluno.nome;
        
        for nota in (select notas.id_aluno, notas.disciplina, notas.nota
                       from notas
                      where notas.id_aluno = aluno.id_aluno) loop
                      
                      v_media := nota.nota;
                      
                      if v_media >= 6 then
                        v_situacao := 'Aprovado'
                        Else 
                          v_situacao := 'Reprovado' 
                          end if; 
                          
                          DBMS_OUTPUT.put_line('Aluno: ' || v_aluno || ' - ' || v_media || ' - ' || v_situacao );
                          end loop;
                          end loop; 
                         end; 
                         
                      BEGIN GERA_RELATORIO_NOTAS; END; 
                          
