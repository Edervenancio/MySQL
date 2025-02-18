declare
  -- Declaração do cursor que seleciona os nomes dos funcionários da tabela employees
  cursor c_emps is select first_name, last_name from employees;

  -- Declaração da variável v_emp do tipo ROWTYPE para armazenar uma linha do cursor
  v_emp c_emps%rowtype;
begin
  open c_emps; -- Abre o cursor para iniciar a leitura dos registros
  
  -- Busca um único registro do cursor e armazena nas colunas correspondentes de v_emp
  fetch c_emps into v_emp.first_name, v_emp.last_name;
  
  -- Exibe o nome e sobrenome do funcionário recuperado
  dbms_output.put_line(v_emp.first_name || ' ' || v_emp.last_name);

  close c_emps; -- Fecha o cursor após a leitura do registro
end;
