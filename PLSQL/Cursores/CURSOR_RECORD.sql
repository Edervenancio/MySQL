declare
  -- Declara��o do cursor que seleciona os nomes dos funcion�rios da tabela employees
  cursor c_emps is select first_name, last_name from employees;

  -- Declara��o da vari�vel v_emp do tipo ROWTYPE para armazenar uma linha do cursor
  v_emp c_emps%rowtype;
begin
  open c_emps; -- Abre o cursor para iniciar a leitura dos registros
  
  -- Busca um �nico registro do cursor e armazena nas colunas correspondentes de v_emp
  fetch c_emps into v_emp.first_name, v_emp.last_name;
  
  -- Exibe o nome e sobrenome do funcion�rio recuperado
  dbms_output.put_line(v_emp.first_name || ' ' || v_emp.last_name);

  close c_emps; -- Fecha o cursor ap�s a leitura do registro
end;
