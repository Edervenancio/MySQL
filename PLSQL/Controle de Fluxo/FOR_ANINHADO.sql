-- 🔹 Loopings aninhados no PL/SQL
declare
   v_inner number := 1; -- Declara a variável `v_inner` iniciando com 1
begin
  -- 🔹 Loop externo: percorre os valores de `v_outer` de 1 a 5
  for v_outer in 1..5 loop  
    dbms_output.put_line('My Outer VALUE IS: ' || v_outer); -- Exibe o valor do loop externo

    v_inner := 1; -- Reinicializa `v_inner` para 1 a cada iteração do loop externo

    -- 🔹 Loop interno: executa indefinidamente até que a condição de saída seja atendida
    loop  
      v_inner := v_inner + 1; -- Incrementa `v_inner` em +1 a cada iteração
      
      -- Exibe os valores de `v_inner`
      dbms_output.put_line('   My Inner VALUE IS: ' || v_inner);

      -- 🔹 Sai do loop interno quando a multiplicação `v_inner * v_outer` for >= 15
      exit when v_inner * v_outer >= 15;

    end loop; -- 🔹 Fim do loop interno
    
  end loop; -- 🔹 Fim do loop externo
end;
/
