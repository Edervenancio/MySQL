# Triggers no PL/SQL

Este diretório contém scripts SQL relacionados ao **uso de triggers e sua aplicação no PL/SQL**. Triggers são blocos de código que são executados **automaticamente** antes ou depois de eventos específicos no banco de dados, garantindo segurança, auditoria e integridade dos dados.

## 📌 O que são Triggers?
No PL/SQL, uma **trigger** é um bloco de código associado a uma tabela, view, esquema ou banco de dados, que é executado automaticamente em resposta a um evento. Elas podem ser usadas para:
- **Garantir segurança e auditoria** (por exemplo, log de alterações).
- **Manter a integridade dos dados** (por exemplo, prevenir exclusões indevidas).
- **Automatizar ações** (por exemplo, cálculos em colunas derivadas).

## 🔹 Tipos de Triggers
As triggers podem ser classificadas de acordo com o tipo de evento que as aciona:

### **1️⃣ DML Triggers** (Data Manipulation Language)
São disparadas em operações de manipulação de dados (`INSERT`, `UPDATE`, `DELETE`).
- **BEFORE** → Executadas antes da operação DML ocorrer.
- **AFTER** → Executadas depois da operação DML ser concluída.
- **INSTEAD OF** → Substituem a operação padrão (usadas principalmente em views).

### **2️⃣ DDL Triggers** (Data Definition Language)
São acionadas por operações de definição de estrutura, como `CREATE`, `ALTER` e `DROP`.

### **3️⃣ Database Event Triggers**
Executadas em eventos específicos do banco de dados, como:
- **LOGON** → Quando um usuário se conecta.
- **STARTUP** → Quando o banco de dados é inicializado.
- **SERVERERROR** → Quando ocorre um erro no servidor.

## 🚀 Benefícios do uso de Triggers
✔️ Automação de processos sem necessidade de intervenção manual.  
✔️ Controle de auditoria para rastrear alterações.  
✔️ Implementação de regras de negócio diretamente no banco de dados.  
✔️ Manutenção da consistência dos dados.  

---

📂 **EXEMPLOS DE TRIGGERS.**  

### 🔹 Exemplo 1: Trigger **BEFORE INSERT** chamando uma procedure
Garante que os dados sejam validados antes da inserção.

```sql
CREATE OR REPLACE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    validate_employee(:NEW.id); -- Chama uma procedure para validar os dados
END;
```

### 🔹 Exemplo 2: Trigger AFTER UPDATE chamando uma procedure de log

```sql
CREATE OR REPLACE TRIGGER after_salary_update
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    log_salary_change(:OLD.id, :OLD.salary, :NEW.salary); -- Registra mudanças de salário
END;
```


