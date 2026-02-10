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

