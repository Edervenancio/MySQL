DECLARE
  v_counter NUMBER(2) := 1; -- Declara a variável `v_counter` iniciando com 1
BEGIN
  -- 🔹 Loop WHILE: continua enquanto `v_counter <= 10`
  WHILE v_counter <= 10 LOOP  
    dbms_output.put_line('Meu contador está em: ' || v_counter); -- Exibe o valor do contador
    
    v_counter := v_counter + 1; -- Incrementa `v_counter` em +1 a cada iteração
  END LOOP;
END;
/
