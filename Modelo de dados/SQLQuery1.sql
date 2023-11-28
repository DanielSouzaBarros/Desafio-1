use test_SQL

--Valor total das vendas e dos fretes por produto e ordem de venda;
--● Valor de venda por tipo de produto;
--● Quantidade e valor das vendas por dia, mês, ano;
--● Lucro dos meses;
--● Venda por produto;
--● Venda por cliente, cidade do cliente e estado;
--● Média de produtos vendidos;
--● Média de compras que um cliente faz.
 SELECT 
   p.Produto,
   fd.CupomID,
   SUM(fd.Valor) AS TotalVendas,
   SUM(fd.ValorFrete) AS TotalFretes
FROM FatoDetalhes fd
JOIN Produtos p ON fd.ProdutoID = p.ProdutoID
GROUP BY p.Produto, fd.CupomID;

