-- Queries
use ecommerce;
show tables;

-- SELECT, WHERE e ALIAS
-- Retornando o nome e sobrenome dos clientes que possuem pedidos em aberto
SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT concat(Fname,' ', LName) AS 'Nome completo' FROM cliente, pedido
	WHERE idCliente = idPedidoCliente;

-- Criação de atributo derivado
-- Retornando a idade dos clientes a partir da data de nascimento
SELECT (2024 - YEAR(birth)) AS Idade FROM cliente;

-- Order by
-- Ordenação de acordo com a avaliação dos produtos
SELECT * FROM produto ORDER BY avaliacao;

-- Cláusula Having
-- Contagem de estoques presentes em SP
SELECT count(Elocal) AS 'quantidade por local'
	FROM local_estoque 	
	GROUP BY Elocal
    HAVING Elocal='SP';

-- Junção entre tabelas 
-- Visualização de produtos de acordo com o local de estoque
SELECT * FROM estoque;
SELECT p.idProduto, l.idLEstoque, p.ProdNome, l.Elocal 
	FROM produto p 
	INNER JOIN local_estoque l 
    ON idProduto=idLProduto;




