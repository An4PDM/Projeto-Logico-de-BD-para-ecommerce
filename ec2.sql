-- Inserção de dados nas tabelas
-- use ecommerce;
show tables;

-- cliente
INSERT INTO cliente (Fname, Minit, Lname, Birth, Address, Identity) VALUES
	('Julia','L','Souza','1989-05-30','Rua B, n 2, bairro y, RJ','98765432101'),
    ('Cristian','M','Nunes','2000-08-12','Rua C, n 3, bairro A, MG','89674523101'),
    ('Luis','O','Peter','1998-06-26','Rua D, n 4, bairro Z, SP','12378934533'),
    ('Paula','A','Martins','1899-10-30','Rua E, n 5, bairro W, MG','45678912322');
SELECT * FROM cliente;
    
-- produto
-- categorias - 'Alimento','Roupa','Brinquedo', 'Móveis','Eletrônicos'
INSERT INTO produto (ProdNome, categoria, classification_kids, avaliacao, size) VALUES
	('Colchão', 'Móveis',FALSE, 4, NULL),
    ('Boneca', 'Brinquedo', TRUE, 5, NULL),
    ('Liquidificador', 'Eletrônicos', FALSE, 4.5, NULL),
    ('Geladeira', 'Eletrônicos', FALSE, 5, '590 litros'),
    ('Blusa', 'Roupa', FALSE, DEFAULT, 'M'),
    ('Carrinho','Brinquedo', TRUE, DEFAULT, NULL),
    ('Salgadinho', 'Alimento', FALSE, 5, NULL),
    ('Mesa', 'Móveis',FALSE, 3.8, '60x90x75 cm'),
    ('Achocolatado', 'Alimento', FALSE, 3, NULL);

-- pedido
-- stts ('Em andamento','Processando', 'Enviado','Entregue') DEFAULT 'Processando'
INSERT INTO pedido (idPedidoCliente, stts, Address, Descricao, Frete, Code_frete, pagamento_dinheiro) VALUES
	(1, 'Em andamento','Rua B, n 2, bairro y, RJ', 'Duas camisetas P', DEFAULT, NULL, FALSE),
    (2, 'Enviado', 'Rua C, n 3, bairro A, MG', 'Brinquedo My Little Pony, cinco unidades', 30.90, 23456, FALSE),
    (3, 'Em andamento', 'Rua D, n 4, bairro Z, SP', 'Colchão Kappesberg', DEFAULT, NULL, FALSE);

-- estoque
INSERT INTO estoque (local_estoque, quantidade) VALUES
	('SP', 10200),
    ('MG', 20350),
    ('RJ', 45159);
    
-- fornecedor
INSERT INTO fornecedor (razão_social, CNPJ, contato) VALUES
	('Electrolux', 123456789101234, 11988877777),
    ('Mobly', 127222766543250, 31912344515),
    ('Italac', 456789123876098, 12954555566),
    ('Kappesberg', 999234765891245, 21987684434),
    ('Doritos', 938456712409475, 11923447312);

-- vendedor
INSERT INTO vendedor (razão_social, tipo_identificação, identificação, contato) VALUES
	('Electrolux','CNPJ', 123456789101234, 11988877777),
    ('Mattel', 'CNPJ', 123456789123350, 31914444555),
    ('Renner', 'CNPJ', 098765432145678, 21956236677),
    ('Italac', 'CNPJ', 456789123876098, 12954555566),
    ('Alana R.Roupas', 'CPF', 91867854322, 11957656544);
    

    
-- produto_pedido
-- pp_stts ('Sem estoque','Disponível') DEFAULT 'Disponível'
INSERT INTO produto_pedido (idPProduto, idPPedido, pp_quantidade, pp_stts) VALUES 
	(1,1,2, 'Disponível'),
    (2,2,5,'Disponível'),
    (3,3,1, 'Sem estoque');
    
-- local_estoque
INSERT INTO local_estoque (idLProduto, idLEstoque, Elocal) VALUES
	(1,1,'SP'),
    (1,3,'RJ'),
    (2,2,'MG'),
    (3,3,'RJ'),
    (4,3,'SP'), 
    (5,2,'MG'),
    (6,1,'SP'),
    (7,1,'SP'),
    (8,2,'MG'),
    (9,3,'RJ');
    
-- prod_fornecedor
INSERT INTO prod_fornecedor (idPFornecedor, idFProduto, quantidade) VALUES
	(1,4,3400),
    (2,8,4500),
    (3,9,300),
    (4,1,4300),
    (5,7,870);
    
-- produto_vendedor
INSERT INTO produto_vendedor (idVProduto, idPVendedor, quantidade) VALUES
	(1,5, 400),
    (2,2, 550),
    (6,2, 860),
    (3,5, 1760),
    (4,3, 302),
    (5,2, 590);
    

    




