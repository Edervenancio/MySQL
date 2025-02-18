CREATE OR REPLACE NONEDITIONABLE PROCEDURE GERA_RELATORIO_COMPLETO AS
v_aluno varchar(255);
v_media number;
v_status varchar(255);
v_disciplinas_cursadas NUMBER;
v_status_geral VARCHAR(255);
v_nota         number;
v_qtd_alunos   number; 


BEGIN

      v_media := 0;
     for loop_aluno in (
       select * from alunos inner join notas on alunos.id_aluno = notas.id_aluno )
       loop

       v_aluno := loop_aluno.nome;
       v_nota  := loop_aluno.nota;

       if loop_aluno.nota >= 6 then
         v_status := 'Aprovado';
         else
           v_status := 'Reprovado';
       end if;
         DBMS_OUTPUT.put_line('Relatório de notas para o aluno: ' || v_aluno);
         DBMS_OUTPUT.put_line(' ');
         DBMS_OUTPUT.put_line('Disciplina: ' || loop_aluno.disciplina ||
                                    ' Nota: ' || v_nota || ' Status: ' || v_status);

          select count(distinct notas.disciplina) into v_disciplinas_cursadas from notas;
        for loop_nota in (
          select * from notas )
          loop

          select count(distinct notas.id_aluno) into v_qtd_alunos from dual;

            v_media := (v_media + v_nota) / v_qtd_alunos;
                    
           
            if v_media >= 6 then
              v_status_geral := 'Aprovados';
              else
                v_status_geral := 'Reprovados';
                end if;
                end loop;

            DBMS_OUTPUT.PUT_LINE('Quantidade de disciplinas: ' || v_disciplinas_CURSADAS || ' - ' || 
                                 'Média Geral: ' || v_media || ' - ' || 'Status Geral: ' || v_status_geral);
                            end loop;
                         
                          end gera_relatorio_completo;
