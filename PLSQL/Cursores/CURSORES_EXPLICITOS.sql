declare
  -- Declara��o do cursor que seleciona funcion�rios dos departamentos entre 30 e 60
  cursor c_emps is
    select first_name, last_name, department_name 
    from employees
    join departments using (department_id)
    where department_id between 30 and 60;

  -- Vari�veis para armazenar os dados do cursor
  v_first_name employees.first_name%type;
  v_last_name  employees.last_name%type;
  v_department_name departments.department_name%type;
begin
  open c_emps; -- Abre o cursor para iniciar a leitura dos registros
  
  -- Busca um �nico registro do cursor e armazena nas vari�veis
  fetch c_emps into v_first_name, v_last_name, v_department_name;
  
  -- Exibe o nome do funcion�rio e o departamento
  dbms_output.put_line(v_first_name || ' ' || v_last_name || 
  ' in the department of ' || v_department_name);

  close c_emps; -- Fecha o cursor ap�s a leitura do registro
end;
