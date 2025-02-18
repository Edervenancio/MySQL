-- Cursores 

-- São ponteiros para memória.

-- Criação da tabela employees, caso ainda não exista
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(10),
    salary NUMBER(10, 2),
    department_id NUMBER
);


DECLARE 
  -- 🔹 Declara um cursor chamado `c_emps`, que seleciona os nomes dos funcionários
  cursor c_emps is select first_name, last_name from employees;
  
  -- 🔹 Declara variáveis para armazenar os valores retornados pelo cursor
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN 
  -- 🔹 Abre o cursor para iniciar a leitura dos registros
  open c_emps;
  
  -- 🔹 Busca uma única linha do cursor e armazena nas variáveis `v_first_name` e `v_last_name`
  fetch c_emps into v_first_name, v_last_name;
  
  -- 🔹 Exibe os valores retornados pelo cursor
  dbms_output.put_line(v_first_name || ' ' || v_last_name);
  
  -- 🔹 Fecha o cursor após a leitura do registro
  close c_emps;
END;
/
