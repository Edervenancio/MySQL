DECLARE 
  -- 🔹 Declaração de um cursor chamado `c_emps`, que seleciona os primeiros e últimos nomes dos funcionários
  cursor c_emps is select first_name, last_name from employees;
  
  -- 🔹 Declara uma variável `v_emp` que pode armazenar uma linha inteira do cursor
  v_emp c_emps%rowtype; 
BEGIN 
  -- 🔹 Abre o cursor para iniciar a leitura dos registros
  open c_emps;

  -- 🔹 Busca um único registro do cursor e armazena nos campos correspondentes da variável `v_emp`
  fetch c_emps into v_emp.first_name, v_emp.last_name;

  -- 🔹 Exibe o nome do funcionário recuperado
  dbms_output.put_line(v_emp.first_name || ' ' || v_emp.last_name);
 
  -- 🔹 Fecha o cursor após a leitura do registro
  close c_emps;
END;
/
