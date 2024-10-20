SELECT 
    *
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    A1_Cadastro_de_Clientes A1 ON C5.C5_CODCLI = A1.A1_COD
WHERE 
    A1.A1_NOME = 'AFONSO COSTA';
