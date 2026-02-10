-- 2. POPULANDO O BANCO (DML)
INSERT INTO colaborador (nome, email, departamento) VALUES
('Alice Silva','alice.silva@locomotiva.tech','TI'),
('Bruno Costa','bruno.costa@locomotiva.tech','Desenvolvimento'),
('Carla Souza','carla.souza@locomotiva.tech','RH');

INSERT INTO ativo (nome_ativo, tipo, valor_compra, id_responsavel) VALUES
('MacBook Pro M2','Notebook',12500.00, 1),
('Dell Latitude','Notebook', 7400.00, 2),
('Servidor PowerEdge','Servidor', 45000.00, 1);

-- 3. LOG DE MANUTENÇÃO (TROUBLESHOOTING)
INSERT INTO manutencao(id_ativo, descricao_problema, custo_reparo)
VALUES(1, 'Substituição da tela quebrada e limpeza interna', 1100.00);

UPDATE manutencao SET data_fim = CURRENT_TIMESTAMP WHERE id_manutencao = 1;

