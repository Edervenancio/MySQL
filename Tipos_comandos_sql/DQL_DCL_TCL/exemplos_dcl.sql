
-- Concede permissões para o usuário 'joao'
GRANT SELECT, INSERT ON clientes TO joao;

-- Concede permissão total em uma tabela específica
GRANT ALL PRIVILEGES ON pedidos TO analista;

-- Revoga a permissão de inserção do usuário 'joao'
REVOKE INSERT ON clientes FROM joao;

-- Revoga todas as permissões do usuário 'analista' na tabela pedidos
REVOKE ALL PRIVILEGES ON pedidos FROM analista;
