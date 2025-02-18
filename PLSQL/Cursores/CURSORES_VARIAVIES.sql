--------------- Uso de Cursor com Parâmetro (Departamento)
declare
  -- Declara um cursor que recebe um parâmetro (ID do departamento)
  cursor c_emps (p_dept_id number) is 
    select first_name, last_name, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id;
    
  -- Variável para armazenar os dados do cursor
  v_emps c_emps%rowtype;
begin
  -- Abre o cursor passando o valor 20 para o parâmetro
  open c_emps(20);
  fetch c_emps into v_emps;

  -- Exibe o nome do departamento antes de listar os funcionários
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  -- Abre o cursor novamente para listar todos os funcionários do departamento 20
  open c_emps(20);
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound; -- Sai do loop quando não houver mais registros
    dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name);
  end loop;
  close c_emps;
end;

--------------- Uso de Variável de Bind como Parâmetro
declare
  cursor c_emps (p_dept_id number) is 
    select first_name, last_name, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id;

  v_emps c_emps%rowtype;
begin
  -- Abre o cursor utilizando uma variável de bind (deve ser definida antes da execução)
  open c_emps(:b_emp);
  fetch c_emps into v_emps;
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  open c_emps(:b_emp);
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name);
  end loop;
  close c_emps;
end;

--------------- Uso de Cursor com Dois Parâmetros Diferentes
declare
  cursor c_emps (p_dept_id number) is 
    select first_name, last_name, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id;

  v_emps c_emps%rowtype;
begin
  -- Primeiro cursor usando a variável de bind :b_dept_id
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  open c_emps(:b_dept_id);
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name);
  end loop;
  close c_emps;

  -- Segundo cursor usando a variável de bind :b_dept_id2
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  open c_emps(:b_dept_id2);
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name);
  end loop;
  close c_emps;
end;

--------------- Cursor com Parâmetro Usando FOR LOOP
declare
  cursor c_emps (p_dept_id number) is 
    select first_name, last_name, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id;

  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  open c_emps(:b_dept_id);
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name);
  end loop;
  close c_emps;

  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
  dbms_output.put_line('The employees in department of '|| v_emps.department_name || ' are:');
  close c_emps;

  -- FOR LOOP para iterar diretamente no cursor
  for i in c_emps(:b_dept_id2) loop
    dbms_output.put_line(i.first_name || ' ' || i.last_name);
  end loop;
end;

--------------- Cursor com Múltiplos Parâmetros (Departamento e Cargo)
declare
  cursor c_emps (p_dept_id number , p_job_id varchar2) is 
    select first_name, last_name, job_id, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id
    and job_id = p_job_id;

  v_emps c_emps%rowtype;
begin
  -- Filtrando por departamento 50 e cargo 'ST_MAN'
  for i in c_emps(50, 'ST_MAN') loop
    dbms_output.put_line(i.first_name || ' ' || i.last_name || ' - ' || i.job_id);
  end loop;
  
  dbms_output.put_line(' - ');

  -- Filtrando por departamento 80 e cargo 'SA_MAN'
  for i in c_emps(80, 'SA_MAN') loop
    dbms_output.put_line(i.first_name || ' ' || i.last_name || ' - ' || i.job_id);
  end loop;
end;

--------------- Exemplo de Erro: Nome do Parâmetro Igual ao Nome da Coluna
declare
  cursor c_emps (p_dept_id number , job_id varchar2) is 
    select first_name, last_name, job_id, department_name 
    from employees 
    join departments using (department_id)
    where department_id = p_dept_id
    and job_id = job_id; -- ⚠ ERRO: Aqui 'job_id' é tanto o parâmetro quanto o nome da coluna!

  v_emps c_emps%rowtype;
begin
  -- Tentativa de execução com erro de ambiguidade
  for i in c_emps(50, 'ST_MAN') loop
    dbms_output.put_line(i.first_name || ' ' || i.last_name || ' - ' || i.job_id);
  end loop;
  
  dbms_output.put_line(' - ');

  for i in c_emps(80, 'SA_MAN') loop
    dbms_output.put_line(i.first_name || ' ' || i.last_name || ' - ' || i.job_id);
  end loop;
end;
