/* DML TRIGGERS (Triggers de Manipula��o de Dados) */

/* Criando ou substituindo uma trigger */
CREATE OR REPLACE TRIGGER trigger_name  
   
   /* Define o momento em que a trigger ser� acionada */
   TIMING = BEFORE | AFTER | INSTEAD OF  
   -- BEFORE: Executa antes da opera��o DML ocorrer
   -- AFTER: Executa ap�s a opera��o DML ser conclu�da
   -- INSTEAD OF: Substitui a execu��o padr�o da opera��o (usado principalmente em views)

   /* Define o evento que dispara a trigger */
   Event = INSERT | UPDATE | DELETE | UPDATE OF column_list  
   -- INSERT: Dispara quando um novo registro � inserido
   -- UPDATE: Dispara quando um registro existente � atualizado
   -- DELETE: Dispara quando um registro � removido
   -- UPDATE OF column_list: Dispara apenas quando colunas espec�ficas s�o atualizadas

   /* Define sobre qual tabela ou view a trigger ser� aplicada */
   ON object_name  

   /* Permite referenciar os valores antigos (antes da opera��o) e novos (ap�s a opera��o) */
   [ REFERENCING OLD AS old NEW AS new ]  
   -- OLD: Valores anteriores (antes da opera��o)
   -- NEW: Novos valores (ap�s a opera��o)
   
   /* Define se a trigger ser� disparada para cada linha afetada */
   [ FOR EACH ROW ]  
   -- Se omitido, a trigger ser� disparada apenas uma vez para toda a opera��o

   /* Define uma condi��o opcional para acionar a trigger */
   [ WHEN (Condition) ]  
   -- Permite definir uma condi��o para que a trigger seja executada apenas em casos espec�ficos

   /* Declara��o de vari�veis e tipos opcionais */
   [ DECLARE vari�vel, tipos, etc. ]

BEGIN  
   /* Corpo da trigger: a l�gica a ser executada quando acionada */
   trigger_body  

   /* Tratamento de exce��es opcionais */
   [ EXCEPTION ]  

END; 




