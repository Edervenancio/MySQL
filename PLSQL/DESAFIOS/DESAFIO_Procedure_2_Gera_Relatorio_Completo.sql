-- Removendo as tabelas caso j� existam
DROP TABLE Aprovados PURGE;
DROP TABLE Reprovados PURGE;
DROP TABLE Notas PURGE;
DROP TABLE Alunos PURGE;

-- Cria��o da tabela Alunos
CREATE TABLE Alunos (
    id_aluno NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);

-- Cria��o da tabela Notas
CREATE TABLE Notas (
    id_nota NUMBER PRIMARY KEY,
    id_aluno NUMBER,
    disciplina VARCHAR2(100),
    nota NUMBER(3, 1),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- Cria��o da tabela Aprovados
CREATE TABLE Aprovados (
    id_aprovado NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    media_geral NUMBER(4, 2),
    qtd_disciplinas NUMBER
);

-- Cria��o da tabela Reprovados
CREATE TABLE Reprovados (
    id_reprovado NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    media_geral NUMBER(4, 2),
    qtd_disciplinas NUMBER
);
 

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (id_aluno, nome) VALUES (1, 'Ana Silva');
INSERT INTO Alunos (id_aluno, nome) VALUES (2, 'Bruno Mendes');
INSERT INTO Alunos (id_aluno, nome) VALUES (3, 'Carla Pereira');
INSERT INTO Alunos (id_aluno, nome) VALUES (4, 'Diego Santos');
INSERT INTO Alunos (id_aluno, nome) VALUES (5, 'Elisa Costa');
INSERT INTO Alunos (id_aluno, nome) VALUES (6, 'F�bio Lima');
INSERT INTO Alunos (id_aluno, nome) VALUES (7, 'Gabriela Souza');
INSERT INTO Alunos (id_aluno, nome) VALUES (8, 'Heitor Carvalho');
INSERT INTO Alunos (id_aluno, nome) VALUES (9, 'Isabela Fernandes');

-- Inserindo dados na tabela Notas
-- Notas de Ana Silva
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (1, 1, 'Matem�tica', 8.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (2, 1, 'Portugu�s', 5.7);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (3, 1, 'Hist�ria', 7.0);

-- Notas de Bruno Mendes
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (4, 2, 'Matem�tica', 4.3);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (5, 2, 'Portugu�s', 6.8);

-- Notas de Carla Pereira
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (6, 3, 'Matem�tica', 9.2);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (7, 3, 'Portugu�s', 5.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (8, 3, 'Hist�ria', 6.1);

-- Notas de Diego Santos
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (9, 4, 'Matem�tica', 6.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (10, 4, 'Portugu�s', 4.0);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (11, 4, 'Hist�ria', 7.2);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (12, 4, 'Geografia', 5.8);

-- Notas de Elisa Costa
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (13, 5, 'Matem�tica', 8.0);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (14, 5, 'Portugu�s', 9.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (15, 5, 'Hist�ria', 8.3);

-- Notas de F�bio Lima
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (16, 6, 'Matem�tica', 5.0);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (17, 6, 'Portugu�s', 6.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (18, 6, 'Ci�ncias', 7.0);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (19, 6, 'Ingl�s', 8.2);

-- Notas de Gabriela Souza
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (20, 7, 'Matem�tica', 3.7);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (21, 7, 'Portugu�s', 5.4);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (22, 7, 'Geografia', 4.1);

-- Notas de Heitor Carvalho
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (23, 8, 'Matem�tica', 9.5);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (24, 8, 'Portugu�s', 8.7);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (25, 8, 'Hist�ria', 7.8);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (26, 8, 'Geografia', 8.0);

-- Notas de Isabela Fernandes
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (27, 9, 'Matem�tica', 5.6);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (28, 9, 'Portugu�s', 6.4);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (29, 9, 'Hist�ria', 4.9);
INSERT INTO Notas (id_nota, id_aluno, disciplina, nota) VALUES (30, 9, 'Ingl�s', 7.0);

COMMIT;


CREATE OR REPLACE PROCEDURE GERA_RELATORIO_COMPLETO_FINAL AS
    v_media NUMBER := 0;
    v_status VARCHAR(255);
    v_disciplinas_cursadas NUMBER;
    v_status_geral VARCHAR(255);
    v_nota NUMBER;
    v_aluno VARCHAR(255);
    v_id_aluno NUMBER;
    v_iterador NUMBER := 0;
BEGIN
    FOR loop_aluno IN (
        SELECT alunos.nome, alunos.id_aluno, notas.nota, notas.disciplina
        FROM alunos
        INNER JOIN notas ON alunos.id_aluno = notas.id_aluno
        ORDER BY alunos.nome ASC
    ) LOOP
        -- Incrementa o iterador para controlar as disciplinas
        v_iterador := v_iterador + 1;
        v_aluno := loop_aluno.nome;
        v_nota := loop_aluno.nota;
        v_id_aluno := loop_aluno.id_aluno;

        -- Conta a quantidade de disciplinas do aluno atual
        SELECT COUNT(*) INTO v_disciplinas_cursadas
        FROM notas
        WHERE id_aluno = v_id_aluno;

        -- Determina o status da disciplina com base na nota
        IF v_nota >= 6 THEN
            v_status := 'Aprovado';
        ELSE
            v_status := 'Reprovado';
        END IF;

        DBMS_OUTPUT.PUT_LINE('Relat�rio de notas para o aluno: ' || v_aluno);
        DBMS_OUTPUT.PUT_LINE('Disciplina: ' || loop_aluno.disciplina || ' - Nota: ' || v_nota || ' - Status: ' || v_status);

        -- Acumula a nota para o c�lculo da m�dia
        v_media := v_media + v_nota;

        -- Verifica se � a �ltima disciplina do aluno atual
        IF v_iterador = v_disciplinas_cursadas THEN
            v_media := v_media / v_disciplinas_cursadas;
            v_media := CEIL(v_media / 0.01) * 0.01; -- Arredonda para 2 casas decimais

            -- Define o status geral do aluno e realiza a inser��o
            IF v_media >= 6 THEN
                v_status_geral := 'Aprovado';
                INSERT INTO Aprovados (id_aprovado, nome, media_geral, qtd_disciplinas)
                VALUES (v_id_aluno, v_aluno, v_media, v_disciplinas_cursadas);
            ELSE
                v_status_geral := 'Reprovado';
                INSERT INTO Reprovados (id_reprovado, nome, media_geral, qtd_disciplinas)
                VALUES (v_id_aluno, v_aluno, v_media, v_disciplinas_cursadas);
            END IF;

            DBMS_OUTPUT.PUT_LINE('Quantidade de disciplinas: ' || v_disciplinas_cursadas || 
                                 ' - M�dia Geral: ' || v_media || ' - Status Geral: ' || v_status_geral);

            -- Reseta vari�veis para o pr�ximo aluno
            v_media := 0;
            v_disciplinas_cursadas := 0;
            v_iterador := 0;
        END IF;
    END LOOP;
END GERA_RELATORIO_COMPLETO_FINAL;


BEGIN GERA_RELATORIO_COMPLETO_FINAL; 
