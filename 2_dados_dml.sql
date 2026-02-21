-- 1. Limpa os dados mas mantém a estrutura das tabelas
-- O CASCADE limpa as tabelas relacionadas (manutenção) automaticamente
TRUNCATE TABLE manutencao, ativo, colaborador RESTART IDENTITY CASCADE;

-- 2. Agora insira os colaboradores novamente (Limpos)
INSERT INTO colaborador (nome, email, departamento) VALUES
('Alice Silva','alice.silva@locomotiva.tech','TI'),
('Bruno Costa','bruno.costa@locomotiva.tech','Desenvolvimento'),
('Carla Souza','carla.souza@locomotiva.tech','RH');

-- 3. Insira os ativos JÁ COM AS COLUNAS NOVAS no mesmo comando
-- Isso evita ter que dar UPDATE depois e deixa o script mais elegante
INSERT INTO ativo (nome_ativo, tipo, valor_compra, id_responsavel, numero_serie, status) VALUES
('MacBook Pro M2', 'Notebook', 12500.00, 1, 'SN-AAPL-2024-M2', 'Ativo'),
('Dell Latitude', 'Notebook', 7400.00, 2, 'SN-DELL-LAT-9900', 'Ativo'),
('Servidor PowerEdge', 'Servidor', 45000.00, 1, 'SN-SERV-PWR-550', 'Ativo');

-- 4. Insira a manutenção
INSERT INTO manutencao(id_ativo, descricao_problema, custo_reparo)
VALUES(1, 'Substituição da tela quebrada e limpeza interna', 1100.00);

UPDATE manutencao SET data_fim = CURRENT_TIMESTAMP WHERE id_manutencao = 1;

select * from ativo;