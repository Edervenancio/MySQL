-- 🔹 Loopings aninhados com labels no PL/SQL
declare
   v_inner number:= 1; -- Declara a variável `v_inner` iniciando com 1
begin
  <<outer_loop>>  -- 🔹 Rótulo (label) para o loop externo
  for v_outer in 1..5 loop  -- 🔹 Loop externo de 1 a 5 (itera sobre `v_outer`)
    dbms_output.put_line('My Outer VALUE IS: ' || v_outer);
    
    v_inner := 1; -- Reinicializa `v_inner` para 1 a cada iteração do loop externo

    <<inner_loop>>  -- 🔹 Rótulo (label) para o loop interno
    loop 
      v_inner := v_inner + 1; -- Incrementa `v_inner` em +1 a cada iteração
      dbms_output.put_line('   My Inner VALUE IS: ' || v_inner);
      
      -- 🔹 Verificação para sair do LOOP externo (usando label)
      exit outer_loop when v_inner * v_outer >= 16;
      
      -- 🔹 Verificação para sair apenas do LOOP interno
      exit when v_inner * v_outer >= 15;
      
    end loop inner_loop; -- 🔹 Fim do loop interno
    
  end loop outer_loop; -- 🔹 Fim do loop externo
end;
/

      
