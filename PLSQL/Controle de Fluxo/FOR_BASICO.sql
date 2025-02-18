-- For loops

begin 
  -- 🔹 Loop FOR: percorre valores de 1 a 3
  for i in 1..3 loop
    dbms_output.put_line('My counter is: ' || i); -- Exibe o valor de `i` em cada iteração
  end loop; 
end;
/
