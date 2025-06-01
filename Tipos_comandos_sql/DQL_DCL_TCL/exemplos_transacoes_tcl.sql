
-- Criação da tabela e dados iniciais
CREATE TABLE conta_bancaria (
  id_conta INT PRIMARY KEY,
  titular VARCHAR(100),
  saldo DECIMAL(10, 2)
);

INSERT INTO conta_bancaria VALUES (1, 'João', 1000.00);
INSERT INTO conta_bancaria VALUES (2, 'Maria', 2000.00);

-- ============================================
-- Exemplo 1: COMMIT — Confirmando uma transferência
-- ============================================

-- Inicia a transação
BEGIN;

-- João transfere 200 reais para Maria
UPDATE conta_bancaria SET saldo = saldo - 200 WHERE id_conta = 1;
UPDATE conta_bancaria SET saldo = saldo + 200 WHERE id_conta = 2;

-- Confirma as alterações de forma permanente
COMMIT;

-- ============================================
-- Exemplo 2: SAVEPOINT + ROLLBACK TO SAVEPOINT
-- ============================================

BEGIN;

-- João saca 100 reais
UPDATE conta_bancaria SET saldo = saldo - 100 WHERE id_conta = 1;

-- Cria um ponto de salvamento
SAVEPOINT depois_do_saque;

-- Tentativa incorreta de transferir 500 reais
UPDATE conta_bancaria SET saldo = saldo - 500 WHERE id_conta = 1;

-- Desfaz somente a parte da transferência incorreta
ROLLBACK TO SAVEPOINT depois_do_saque;

-- Confirma o saque original
COMMIT;

-- ============================================
-- Exemplo 3: ROLLBACK total
-- ============================================

BEGIN;

-- Atualizações em lote
UPDATE conta_bancaria SET saldo = saldo - 50 WHERE id_conta = 1;
UPDATE conta_bancaria SET saldo = saldo + 50 WHERE id_conta = 2;

-- Algo deu errado, desfaz tudo
ROLLBACK;
