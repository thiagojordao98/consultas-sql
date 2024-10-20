SELECT 
    A3.A3_REGIAO AS regiao_vendedor,
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS valor_total_pedidos
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
JOIN 
    A3_Cadastro_de_Vendedor A3 ON C5.C5_CODVEN = A3.A3_COD
WHERE 
    C5.C5_EMISSAO BETWEEN '2023-01-01' AND '2023-06-30'
GROUP BY 
    A3.A3_REGIAO;
