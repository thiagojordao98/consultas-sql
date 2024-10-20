SELECT 
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS valor_total_fevereiro
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
WHERE 
    C5.C5_EMISSAO BETWEEN '2023-02-01' AND '2023-02-28';
