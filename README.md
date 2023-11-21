## Valor total das vendas e dos fretes por produto e ordem de venda

```


SELECT 
   p.Produto,
   fd.CupomID,
   SUM(fd.Valor) AS TotalVendas,
   SUM(fc.ValorFrete) AS TotalFretes
FROM dbo.FatoDetalhes fd
JOIN dbo.Produtos$ p ON fd.ProdutoID = p.ProdutoID
JOIN FatoCabecalho fc ON fd.CupomID = fc.CupomID
GROUP BY p.Produto, fd.CupomID
ORDER BY p.Produto ASC;
'''
Valor de venda por tipo de produto

SELECT 
   c.Categoria,
   SUM(fd.Valor) AS TotalVendas
FROM FatoDetalhes fd
JOIN dbo.Produtos$ p ON fd.ProdutoID = p.ProdutoID
JOIN dbo.Categoria$ c ON p.CategoriaID = c.CategoriaID
GROUP BY c.Categoria
ORDER BY TotalVendas DESC;

--● Quantidade e valor das vendas por dia, mês, ano

SELECT 
   FORMAT(fc.Data, 'dd-MM-yyyy') AS Data,
   COUNT(*) AS QuantidadeVendas,
   SUM(fd.Valor) AS TotalVendas
FROM Fatocabecalho fc
JOIN FatoDetalhes fd ON fc.CupomID = fd.CupomID
GROUP BY FORMAT(fc.Data, 'dd-MM-yyyy')
ORDER BY FORMAT(fc.Data, 'dd-MM-yyyy') DESC;

--● Lucro dos meses

SELECT 
   FORMAT(fc.Data, 'yyyy-MM') AS Mes,
   SUM(fd.Valor - fd.Custo) AS Lucro
FROM dbo.FatoCabecalho fc
JOIN FatoDetalhes fd ON fc.CupomID = fd.CupomID
GROUP BY FORMAT(fc.Data, 'yyyy-MM');

--● Venda por produto

SELECT 
   p.Produto,
   COUNT(*) AS QuantidadeVendas,
   SUM(fd.Valor) AS TotalVendas
FROM FatoDetalhes fd
JOIN dbo.Produtos$ p ON fd.ProdutoID = p.ProdutoID
GROUP BY p.Produto;

--● Venda por cliente, cidade do cliente e estado

SELECT 
   c.Cliente,
   c.Cidade,
   c.Pais,
   COUNT(*) AS QuantidadeVendas,
   SUM(fd.Valor) AS TotalVendas
FROM dbo.FatoCabecalho fc
JOIN FatoDetalhes fd ON fc.CupomID = fd.CupomID
JOIN dbo.Clientes$ c ON fc.ClienteID = c.ClienteID
GROUP BY c.Cliente, c.Cidade, c.Pais;

--Média de produtos vendidos
SELECT 
	AVG(Quantidade) AS MediaProdutos
FROM 
	dbo.FatoDetalhes;

--● Média de compras que um cliente faz.

SELECT 
   c.Cliente,
   AVG(Quantidade) AS MediaCompras
FROM dbo.FatoCabecalho fc
JOIN dbo.FatoDetalhes fd ON fc.CupomID = fd.CupomID
JOIN dbo.Clientes$ c ON fc.ClienteID = c.ClienteID
GROUP BY c.Cliente;
