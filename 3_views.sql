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