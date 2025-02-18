DECLARE
  v_searched_number NUMBER  := 22;  -- Número que queremos verificar se é primo
  v_is_prime        BOOLEAN := true; -- Assume inicialmente que o número é primo
BEGIN
  FOR x IN 2..v_searched_number-1 LOOP  -- Testa todos os divisores de 2 até (n-1)
    IF v_searched_number MOD x = 0 THEN  -- Se for divisível por `x`, não é primo
      dbms_output.put_line(v_searched_number || ' is not a prime number..');
      v_is_prime := false;
      GOTO end_point;  -- Sai do loop e pula direto para `end_point`
    END IF;
  END LOOP;

  IF v_is_prime THEN  -- Se `v_is_prime` ainda for `TRUE`, o número é primo
    dbms_output.put_line(v_searched_number || ' is a prime number..');
  END IF;

<<end_point>>  -- Marcador para onde o `GOTO` leva
  dbms_output.put_line('Check complete..');
END;

/*******************************************************************/

DECLARE
  v_searched_number NUMBER  := 32457;  -- Número a ser verificado
  v_is_prime        BOOLEAN := TRUE;   -- Assume inicialmente que é primo
  x                 NUMBER  := 2;      -- Começa testando divisores a partir de 2
BEGIN
  <<start_point>>  -- Ponto inicial do loop
    IF v_searched_number MOD x = 0 THEN  -- Se encontrar um divisor, não é primo
      dbms_output.put_line(v_searched_number || ' is not a prime number..');
      v_is_prime := FALSE;
      GOTO end_point;  -- Sai da verificação e pula para o final
    END IF;
  
  x := x + 1;  -- Incrementa o divisor
  
  IF x = v_searched_number THEN  -- Se `x` chegou ao número, verifica se ainda é primo
    GOTO prime_point;
  END IF;
  
  GOTO start_point;  -- Continua verificando o próximo divisor
  
  <<prime_point>>  
  IF v_is_prime THEN
    dbms_output.put_line(v_searched_number || ' is a prime number..');
  END IF;

<<end_point>>  -- Marca o final do programa
  dbms_output.put_line('Check complete..');
END;

/*******************************************************************/



