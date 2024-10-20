SELECT 
    A3.A3_NOME AS nome_vendedor,
    COALESCE(SUM(C6.C6_QTD * C6.C6_PRUNIT), 0) AS valor_total_pedidos
FROM 
    A3_Cadastro_de_Vendedor A3
LEFT JOIN 
    C5_Cadastro_de_Pedidos C5 ON A3.A3_COD = C5.C5_CODVEN
LEFT JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
GROUP BY 
    A3.A3_NOME;
