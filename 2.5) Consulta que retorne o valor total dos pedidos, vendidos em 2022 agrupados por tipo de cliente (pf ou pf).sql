SELECT 
    A1.A1_TIPO AS tipo_cliente,
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS valor_total_pedidos
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
JOIN 
    A1_Cadastro_de_Clientes A1 ON C5.C5_CODCLI = A1.A1_COD
WHERE 
    C5.C5_EMISSAO BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY 
    A1.A1_TIPO;
