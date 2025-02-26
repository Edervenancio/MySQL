/* DML TRIGGERS (Triggers de Manipulação de Dados) */

/* Criando ou substituindo uma trigger */
CREATE OR REPLACE TRIGGER trigger_name  
   
   /* Define o momento em que a trigger será acionada */
   TIMING = BEFORE | AFTER | INSTEAD OF  
   -- BEFORE: Executa antes da operação DML ocorrer
   -- AFTER: Executa após a operação DML ser concluída
   -- INSTEAD OF: Substitui a execução padrão da operação (usado principalmente em views)

   /* Define o evento que dispara a trigger */
   Event = INSERT | UPDATE | DELETE | UPDATE OF column_list  
   -- INSERT: Dispara quando um novo registro é inserido
   -- UPDATE: Dispara quando um registro existente é atualizado
   -- DELETE: Dispara quando um registro é removido
   -- UPDATE OF column_list: Dispara apenas quando colunas específicas são atualizadas

   /* Define sobre qual tabela ou view a trigger será aplicada */
   ON object_name  

   /* Permite referenciar os valores antigos (antes da operação) e novos (após a operação) */
   [ REFERENCING OLD AS old NEW AS new ]  
   -- OLD: Valores anteriores (antes da operação)
   -- NEW: Novos valores (após a operação)
   
   /* Define se a trigger será disparada para cada linha afetada */
   [ FOR EACH ROW ]  
   -- Se omitido, a trigger será disparada apenas uma vez para toda a operação

   /* Define uma condição opcional para acionar a trigger */
   [ WHEN (Condition) ]  
   -- Permite definir uma condição para que a trigger seja executada apenas em casos específicos

   /* Declaração de variáveis e tipos opcionais */
   [ DECLARE variável, tipos, etc. ]

BEGIN  
   /* Corpo da trigger: a lógica a ser executada quando acionada */
   trigger_body  

   /* Tratamento de exceções opcionais */
   [ EXCEPTION ]  

END; 




