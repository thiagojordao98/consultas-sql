# Documentação das Consultas SQL

Este documento contém a descrição e as consultas SQL utilizadas para extrair informações a partir das tabelas de cadastro de clientes, vendedores, pedidos e itens do pedido. As consultas foram feitas com base nas seguintes perguntas:

## 2.1) Consulta que retorne todos os pedidos do cliente “AFONSO COSTA”

```sql
SELECT 
    *
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    A1_Cadastro_de_Clientes A1 ON C5.C5_CODCLI = A1.A1_COD
WHERE 
    A1.A1_NOME = 'AFONSO COSTA';
```
Essa consulta retorna todos os pedidos realizados pelo cliente "AFONSO COSTA".

## 2.2) Consulta que retorne todos os pedidos (com seus itens respectivos) emitidos no mês de janeiro de 2023

```sql
SELECT 
    C5.C5_NUM AS numero_pedido,
    C5.C5_EMISSAO AS data_emissao,
    C6.C6_ITEM AS numero_item,
    C6.C6_CODPROD AS codigo_produto,
    C6.C6_QTD AS quantidade,
    C6.C6_PRUNIT AS preco_unitario
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
WHERE 
    C5.C5_EMISSAO BETWEEN '2023-01-01' AND '2023-01-31';
```
Essa consulta retorna todos os pedidos e seus itens que foram emitidos no mês de janeiro de 2023.

## 2.3) Consulta que retorne o valor total dos pedidos em fevereiro de 2023

```sql
SELECT 
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS valor_total
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
WHERE 
    C5.C5_EMISSAO BETWEEN '2023-02-01' AND '2023-02-28';
```
Essa consulta calcula e retorna o valor total dos pedidos realizados no mês de fevereiro de 2023.

## 2.4) Consulta que retorne o valor total dos pedidos agrupados por nome de vendedor

```sql
SELECT 
    A3.A3_NOME AS nome_vendedor,
    SUM(C6.C6_QTD * C6.C6_PRUNIT) AS valor_total_pedidos
FROM 
    C5_Cadastro_de_Pedidos C5
JOIN 
    C6_Itens_do_Pedido C6 ON C5.C5_NUM = C6.C6_NUM
JOIN 
    A3_Cadastro_de_Vendedor A3 ON C5.C5_CODVEN = A3.A3_COD
GROUP BY 
    A3.A3_NOME;
```
Essa consulta retorna o valor total dos pedidos, agrupados pelo nome de cada vendedor.

## 2.5) Consulta que retorne o valor total dos pedidos, vendidos em 2022 agrupados por tipo de cliente (pessoa física ou jurídica)

```sql
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
```
Essa consulta retorna o valor total dos pedidos realizados em 2022, agrupados por tipo de cliente, podendo ser "Pessoa Física" ou "Pessoa Jurídica".

## 2.6) Consulta que retorne o valor total dos pedidos, vendidos no primeiro semestre de 2023 agrupados por região do vendedor

```sql
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
```
Essa consulta retorna o valor total dos pedidos vendidos no primeiro semestre de 2023, agrupados por região do vendedor.