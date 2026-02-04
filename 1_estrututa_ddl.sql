/* PROJETO: GESTÃO DE ATIVOS TECNOLÓGICOS - LOCOMOTIVA SOLUÇÕES
   OBJETIVO: Modelagem, Inserção e Relatórios de Ativos e Manutenções.
*/

-- 1. ESTRUTURA (DDL)
CREATE TABLE if not exists colaborador (
    id_colaborador SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, -- Adicionado UNIQUE para boa prática
    departamento VARCHAR(50)
);

CREATE TABLE if not exists ativo (
    id_ativo SERIAL PRIMARY KEY,
    nome_ativo VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    data_aquisicao DATE DEFAULT CURRENT_DATE,
    valor_compra NUMERIC(10,2) CHECK (valor_compra > 0),
    id_responsavel INTEGER REFERENCES colaborador(id_colaborador)
);

CREATE TABLE if not exists manutencao (
    id_manutencao SERIAL PRIMARY KEY,
    id_ativo INTEGER REFERENCES ativo(id_ativo),
    descricao_problema TEXT,
    data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fim TIMESTAMP,
    custo_reparo NUMERIC(10,2) DEFAULT 0
);

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

-- 4. CAMADA DE ABSTRAÇÃO (VIEW)
CREATE OR REPLACE VIEW v_resumo_ativos AS
SELECT 
    C.nome AS Funcionario,
    A.nome_ativo AS Equipamento,
    A.valor_compra, 
    M.descricao_problema AS Historico_manutencao,
    M.custo_reparo
FROM colaborador C
LEFT JOIN ativo A ON C.id_colaborador = A.id_responsavel
LEFT JOIN manutencao M ON A.id_ativo = M.id_ativo;