-- criação do BD para o cenário de E-commerce
create database if not exists ecommerce;
use ecommerce;
drop database ecommerce;

-- Tabela Client
select * from cliente;
drop table cliente;
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(20),
    Minit VARCHAR (3),
    LName VARCHAR (20),
    Birth DATE NOT NULL,
    Address VARCHAR(45),
    Identity CHAR(11) NOT NULL,
    CONSTRAINT unique_ident_client UNIQUE (Identity) -- Uma constraint não pode ser modificada como um atributo!
);

alter table cliente auto_increment=1;

-- Tabela pagamento
CREATE TABLE pagamento (
	idPag INT AUTO_INCREMENT NOT NULL,
    idCliente INT,
    tipo_pagamento ENUM('Boleto','Cartão'),
	limite_disponível FLOAT,
    PRIMARY KEY (idPag, idCliente)
);
drop table pagamento;

-- Tabela Produto
CREATE TABLE produto (
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    ProdNome VARCHAR(20),
    categoria ENUM ('Alimento','Roupa','Brinquedo', 'Móveis','Eletrônicos') NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    avaliacao FLOAT DEFAULT NULL,
    size VARCHAR(20)
);
drop table produto;

-- Tabela Pedido
drop table pedido;
CREATE TABLE pedido (
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedidoCliente INT,
    stts ENUM('Em andamento','Processando', 'Enviado','Entregue') DEFAULT 'Processando',
    Address VARCHAR(45),
    Descricao VARCHAR(200),
    Frete FLOAT DEFAULT 0,
    Code_frete FLOAT,
    pagamento_dinheiro BOOL DEFAULT FALSE,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idPedidoCliente) REFERENCES cliente(idCliente)
);
desc pedido;

-- Estoque
CREATE TABLE estoque (
	idEstoque INT NOT NULL auto_increment PRIMARY KEY, 
    local_estoque VARCHAR(200) NOT NULL,
    quantidade INT DEFAULT 0
);

-- Fornecedor
CREATE TABLE fornecedor (
	idFornecedor INT NOT NULL auto_increment PRIMARY KEY, 
    razão_social VARCHAR(45) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contato CHAR(11) NOT NULL,
    CONSTRAINT unique_CNPJ_fornecedor UNIQUE (CNPJ)
);
desc fornecedor;


-- Terceiros - vendedor
DROP TABLE vendedor;
CREATE TABLE vendedor (
	idVendedor INT NOT NULL auto_increment PRIMARY KEY, 
    razão_social VARCHAR(45) NOT NULL,
    tipo_identificação ENUM('CPF','CNPJ') NOT NULL,
    identificação VARCHAR(15),
    contato CHAR(11) NOT NULL,
    CONSTRAINT unique_identificação_vendedor UNIQUE (identificação)
);

-- Relação produto - vendedor
CREATE TABLE produto_vendedor (
	idVProduto INT,
    idPVendedor INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idVProduto, idPVendedor),
    CONSTRAINT fk_produto_vendedor FOREIGN KEY (idPVendedor) REFERENCES vendedor(idVendedor),
    CONSTRAINT fk_produto_produto FOREIGN KEY (idVProduto) REFERENCES produto(idProduto)
);
-- drop table produto_vendedor;

-- Relação produto - pedido
-- drop table produto_pedido;
CREATE TABLE produto_pedido (
	idPProduto INT,
    idPPedido INT,
    pp_quantidade INT NOT NULL,
    PRIMARY KEY (idPProduto, idPPedido),
    pp_stts ENUM('Sem estoque','Disponível') DEFAULT 'Disponível',
    CONSTRAINT fk_produto_pedido FOREIGN KEY (idPPedido) REFERENCES pedido(idPedido),
    CONSTRAINT fk_pproduto_produto FOREIGN KEY (idPProduto) REFERENCES produto(idProduto)
);

-- Local do estoque
CREATE TABLE local_estoque (
	idLProduto INT,
    idLEstoque INT,
    Elocal VARCHAR(255) NOT NULL,
    PRIMARY KEY(idLProduto, idLEstoque),
    CONSTRAINT fk_local_estoque_produto FOREIGN KEY (idLProduto) REFERENCES produto(idProduto),
	CONSTRAINT fk_local_estoque_estoque FOREIGN KEY (idLEstoque) REFERENCES estoque(idEstoque)
);
drop table local_estoque;

-- prod_fornecedor
 CREATE TABLE prod_fornecedor (
	idPFornecedor INT,
    idFProduto INT,
	quantidade INT NOT NULL,
    PRIMARY KEY (idPFornecedor, idFProduto),
    CONSTRAINT fk_pfornecedor_fornecedor FOREIGN KEY (idPFornecedor) REFERENCES fornecedor(idFornecedor),
    CONSTRAINT fk_fproduto_produto FOREIGN KEY (idFProduto) REFERENCES produto(idProduto)
);
DESC prod_fornecedor;



-- Checando constraints
show databases;
use information_schema;
show tables;
select * from REFERENTIAL_CONSTRAINTS where constraint_schema = 'ecommerce';
DESC REFERENTIAL_CONSTRAINTS;



