DECLARE
  v_counter NUMBER(2) := 1; -- Declara a variável `v_counter` iniciando com 1
BEGIN 
  LOOP
    -- Exibe o valor atual do contador
    dbms_output.put_line('MyCounter is: ' || v_counter);
    
    -- Incrementa `v_counter` em +1 a cada iteração
    v_counter := v_counter + 1;
    
    -- Condição para sair do loop quando `v_counter` for maior que 10
    EXIT WHEN v_counter > 10;
  END LOOP;
END;
/
