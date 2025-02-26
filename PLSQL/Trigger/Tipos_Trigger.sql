/* 
   Tempos das triggers no Oracle PL/SQL

   BEFORE -> Executada antes da operação DML ocorrer.
           -> Permite validar ou modificar os dados antes da inserção/atualização.
   
   AFTER  -> Executada depois que a operação DML foi concluída.
           -> Útil para auditoria, logs ou cópia de dados.

   INSTEAD OF -> Substitui a execução padrão da operação, geralmente usada em views.
*/

/* Criação de uma trigger BEFORE para a tabela employees */
CREATE OR REPLACE TRIGGER primeira_trigger
    BEFORE INSERT OR UPDATE ON employees  -- Dispara antes de uma inserção ou atualização
BEGIN
    DBMS_OUTPUT.PUT_LINE('An insert or update occurred in the employees table'); 
    -- Exibe uma mensagem no console quando a trigger for acionada
END primeira_trigger;

/* Criando uma tabela para exemplificar o uso das triggers */
CREATE TABLE employees_copy (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);

/* Inserindo um registro na tabela employees_copy */
INSERT INTO employees_copy (id, nome) VALUES (3, 'teste 3'); 

/* Atualizando a tabela employees_copy 
   -> A trigger será acionada apenas uma vez, mesmo que várias linhas sejam afetadas */
UPDATE employees_copy SET nome = 'teste';

/* Deletando dados da employees (não acionará a trigger, pois não foi definida para DELETE) */
DELETE FROM employees;

/* Criando uma trigger BEFORE para a tabela employees_copy */
CREATE OR REPLACE TRIGGER before_statement_emp_copy
BEFORE INSERT OR UPDATE ON EMPLOYEES_COPY  -- Dispara antes da inserção ou atualização
FOR EACH ROW  -- A trigger será executada para cada linha afetada
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Before statement trigger is fired!.');
END; 

/* Criando uma trigger AFTER para a tabela employees_copy */
CREATE OR REPLACE TRIGGER after_statement_emp_copy
AFTER INSERT OR UPDATE ON EMPLOYEES_COPY  -- Dispara após a inserção ou atualização
FOR EACH ROW  -- A trigger será executada para cada linha afetada
BEGIN 
    DBMS_OUTPUT.PUT_LINE('After statement trigger is fired!.');
END; 
