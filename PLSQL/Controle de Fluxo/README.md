# Controle de Fluxo no PL/SQL

Este diretório contém scripts SQL relacionados a **estruturas de controle**, como loops, controle de fluxo condicional e uso de comandos especiais como `GOTO` e labels.

## 🔹 Estruturas de Controle no PL/SQL

### **Laços de Repetição (`LOOP`, `WHILE`, `FOR`)**
Os **laços de repetição** são usados para executar um bloco de código várias vezes enquanto uma condição for verdadeira. O PL/SQL oferece diferentes tipos de loops:

- **`LOOP ... EXIT WHEN`** → Executa indefinidamente até encontrar uma condição de saída.
- **`WHILE LOOP`** → Executa enquanto a condição inicial for verdadeira.
- **`FOR LOOP`** → Itera automaticamente dentro de um intervalo definido.

#### **Exemplo de um `WHILE LOOP`**:
```sql
DECLARE
  v_counter NUMBER := 1;
BEGIN
  WHILE v_counter <= 5 LOOP
    dbms_output.put_line('Contador: ' || v_counter);
    v_counter := v_counter + 1;
  END LOOP;
END;
/
```
### 🔹 O que é `GOTO` no PL/SQL?

O comando `GOTO` é usado para **saltar para um ponto específico do código**, indicado por um **label (`<<label>>`)**. Ele pode ser útil para sair de loops complexos ou pular partes do código sem depender de condições tradicionais.

#### **Exemplo de GOTO**
```sql
DECLARE
  v_num NUMBER := 10;
BEGIN
  IF v_num = 10 THEN
    GOTO pular;
  END IF;
  
  dbms_output.put_line('Isso nunca será exibido.');

<<pular>>
  dbms_output.put_line('Código pulado para cá!');
END; ```

## 🔹 Estruturas de Looping no PL/SQL

Os loops no PL/SQL são usados para **executar um bloco de código repetidamente**, até que uma condição de saída seja atendida. Existem três tipos principais de loops:

1. **`LOOP ... EXIT WHEN`** → Executa indefinidamente até encontrar uma condição de saída.
2. **`WHILE LOOP`** → Executa enquanto uma condição inicial for verdadeira.
3. **`FOR LOOP`** → Itera automaticamente dentro de um intervalo definido.

---

### 🔹 **1. `LOOP ... EXIT WHEN`**
O **`LOOP`** básico no PL/SQL executa o código indefinidamente, a menos que uma condição de saída (`EXIT WHEN`) seja especificada.

#### **Exemplo de `LOOP ... EXIT WHEN`**
```sql
DECLARE 
  v_counter NUMBER := 1;
BEGIN 
  LOOP
    DBMS_OUTPUT.PUT_LINE('Contador: ' || v_counter);
    
    v_counter := v_counter + 1; -- Incrementa o contador
    
    EXIT WHEN v_counter > 5; -- Sai do loop quando `v_coun
