/* Um cursor explícito é um ponteiro para um conjunto de resultados de uma consulta SQL. */

DECLARE 
  -- 🔹 Declaração de um cursor explícito chamado `c_emps`
  -- 🔹 Ele seleciona o primeiro nome, último nome e nome do departamento dos funcionários
  -- 🔹 Filtra apenas os funcionários cujos `department_id` estão entre 30 e 60
  CURSOR c_emps IS 
    SELECT first_name, last_name, department_name  
    FROM employees 
    JOIN departments USING (department_id) 
    WHERE department_id BETWEEN 30 AND 60;
  
  -- 🔹 Declaração de variáveis que armazenarão os valores retornados pelo cursor
  v_first_name employees.first_name%TYPE;
  v_last_name  employees.last_name%TYPE;
  v_department_name departments.department_name%TYPE;

BEGIN 
  -- 🔹 Abre o cursor para iniciar a leitura dos registros
  OPEN c_emps;
  
  -- 🔹 Busca uma única linha do cursor e armazena os valores nas variáveis declaradas
  FETCH c_emps INTO v_first_name, v_last_name, v_department_name;
  
  -- 🔹 Exibe os valores recuperados no console
  DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name || ' - ' || v_department_name);
 
  -- 🔹 Fecha o cursor após a leitura do registro
  CLOSE c_emps;
END;
/
