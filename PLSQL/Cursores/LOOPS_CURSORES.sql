--------------- Uso de CURSOR Simples com LOOP Infinito (Erro: Loop Infinito)
declare
  -- Declara um cursor que seleciona todos os funcionários do departamento 30
  cursor c_emps is select * from employees where department_id = 30;
  
  -- Declara uma variável que armazenará os registros do cursor
  v_emps c_emps%rowtype;
begin
  open c_emps; -- Abre o cursor para iniciar a leitura dos registros
  
  loop
    -- Busca um registro do cursor e armazena em v_emps
    fetch c_emps into v_emps;
    
    -- Exibe o ID, primeiro nome e sobrenome do funcionário
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    
    -- ⚠ PROBLEMA: Não há condição de saída, o loop nunca termina
  end loop;
  
  close c_emps; -- Fecha o cursor após o loop (nunca será atingido devido ao loop infinito)
end; 

--------------- Uso de CURSOR com %NOTFOUND (Correção do Loop Infinito)
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    
    -- Sai do loop quando não houver mais registros
    exit when c_emps%notfound;
    
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end;

--------------- Uso de WHILE LOOP com CURSOR
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  
  -- Faz a primeira leitura do cursor antes do loop
  fetch c_emps into v_emps;
  
  -- Enquanto ainda houver registros, executa o loop
  while c_emps%found loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    
    -- Busca o próximo registro
    fetch c_emps into v_emps;
    
    -- ⚠ Alternativamente, poderia usar 'exit when c_emps%notfound;' aqui
  end loop;
  
  close c_emps;
end;

--------------- Uso de FOR LOOP com Número Fixo de Iterações (⚠ Pode ser Problemático)
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  
  -- Executa um loop fixo de 6 iterações
  for i in 1..6 loop
    fetch c_emps into v_emps;
    
    -- Exibe o funcionário
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    
    -- ⚠ PROBLEMA: Se houver menos de 6 registros, pode gerar erro ao tentar buscar um registro inexistente
  end loop;
  
  close c_emps;
end;

--------------- Uso do FOR LOOP com CURSOR na Cláusula IN (Mais Simples)
declare
  -- Declaração do cursor
  cursor c_emps is select * from employees where department_id = 30;
begin
  -- Loop que percorre automaticamente todos os registros do cursor
  for i in c_emps loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;

--------------- Uso de FOR LOOP sem Declarar o Cursor (Consulta Direta)
begin
  -- Executa um loop diretamente sobre o resultado da consulta SQL
  for i in (select * from employees where department_id = 30) loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;
