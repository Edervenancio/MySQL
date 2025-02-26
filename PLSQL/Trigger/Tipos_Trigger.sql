/* 
   Tempos das triggers no Oracle PL/SQL

   BEFORE -> Executada antes da opera��o DML ocorrer.
           -> Permite validar ou modificar os dados antes da inser��o/atualiza��o.
   
   AFTER  -> Executada depois que a opera��o DML foi conclu�da.
           -> �til para auditoria, logs ou c�pia de dados.

   INSTEAD OF -> Substitui a execu��o padr�o da opera��o, geralmente usada em views.
*/

/* Cria��o de uma trigger BEFORE para a tabela employees */
CREATE OR REPLACE TRIGGER primeira_trigger
    BEFORE INSERT OR UPDATE ON employees  -- Dispara antes de uma inser��o ou atualiza��o
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
   -> A trigger ser� acionada apenas uma vez, mesmo que v�rias linhas sejam afetadas */
UPDATE employees_copy SET nome = 'teste';

/* Deletando dados da employees (n�o acionar� a trigger, pois n�o foi definida para DELETE) */
DELETE FROM employees;

/* Criando uma trigger BEFORE para a tabela employees_copy */
CREATE OR REPLACE TRIGGER before_statement_emp_copy
BEFORE INSERT OR UPDATE ON EMPLOYEES_COPY  -- Dispara antes da inser��o ou atualiza��o
FOR EACH ROW  -- A trigger ser� executada para cada linha afetada
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Before statement trigger is fired!.');
END; 

/* Criando uma trigger AFTER para a tabela employees_copy */
CREATE OR REPLACE TRIGGER after_statement_emp_copy
AFTER INSERT OR UPDATE ON EMPLOYEES_COPY  -- Dispara ap�s a inser��o ou atualiza��o
FOR EACH ROW  -- A trigger ser� executada para cada linha afetada
BEGIN 
    DBMS_OUTPUT.PUT_LINE('After statement trigger is fired!.');
END; 
