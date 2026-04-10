CREATE DATABASE tbEstoque
GO

USE DATABASE tbEstoque
GO

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1),
	nomeCLiente VARCHAR (50) NOT NULL,
	cpfCliente CHAR (11) NOT NULL,
	emailCliente VARCHAR (70) NOT NULL,
	sexoCliente VARCHAR (10) NOT NULL,
	dataNascimentoCliente SMALLDATETIME NOT NULL
);

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY (1,1),
	dataVenda SMALLDATETIME NOT NULL,
	valorTotalVenda MONEY NOT NULL,
	codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
);

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nomeFabricante VARCHAR (50) NOT NULL
);

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY (1,1),
	nomeFornecedor VARCHAR (50) NOT NULL,
	contatoFornecedor VARCHAR (50) NOT NULL
);

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY (1,1),
	descricaoProduto VARCHAR (50) NOT NULL,
 	valorProduto MONEY NOT NULL,
	quantidadeProduto INT NOT NULL,
	codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante),
	codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (codFornecedor)
);

CREATE TABLE tbItemVenda(
	codItemVenda INT PRIMARY KEY IDENTITY (1,1),
	quantidadeItemVenda INT NOT NULL,
	subTotalItemVenda MONEY NOT NULL,
	codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda),
	codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
);


SET IDENTITY_INSERT tbCliente ON;

INSERT INTO tbCliente (codCliente, nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente)
VALUES  ( 1,'Armando José Santana', '12345678900', 'armandojsantana@outlook.com', 'm', '21/02/1961'), 
		( 2, 'Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'f', '13/09/1978'),
		( 3, 'Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'm', '08/09/1981'),
		( 4, 'Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'f', '07/07/1962'),
		( 5, 'Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '09/04/1977'),
		( 6, 'Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com', 'm', '02/02/1987');

SET IDENTITY_INSERT tbCliente OFF;

SELECT * FROM tbCliente

SET IDENTITY_INSERT tbFabricante ON;

INSERT INTO tbFabricante (codFabricante, nomeFabricante)
VALUES	( 1, 'Unilever'),
		( 2, 'P&G'),
		( 3, 'Bunge');

SET IDENTITY_INSERT tbFabricante OFF;

SELECT * FROM tbFabricante
		
SET IDENTITY_INSERT tbFornecedor ON;

INSERT INTO tbFornecedor (codFornecedor, nomeFornecedor, contatoFornecedor)
VALUES  ( 1, 'Atacadão', 'Carlos Santos'),
		( 2, 'Assai', 'Maria Stella'),
		( 3, 'Roldão', 'Paulo César');

SET IDENTITY_INSERT tbFornecedor OFF;

SELECT * FROM tbFornecedor

SET IDENTITY_INSERT tbProduto ON;

INSERT INTO	tbProduto (codProduto, descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor)
VALUES  ( 1, 'Amaciante Downy', '5,76', '1500', 2, 1),
		( 2, 'Amaciante Comfort', '5,45', '2300', 1, 1),
		( 3, 'Sabão em Pó OMO', '5,99', '1280', 1, 2),
		( 4, 'Margarina Qually', '4,76', '2500', 3, 1),
		( 5, 'Salsicha Hot Dog Sadia', '6,68', '2900', 3, 2),
		( 6, 'Mortadela Perdigão', '2,50', '1200', 3, 3),
		( 7, 'Hambúrguer Sadia', '9,89', '1600', 3, 1),
		( 8, 'Fralda Pampers', '36,00', '340', 2, 3),
		( 9, 'Shampoo Seda', '5,89', '800', 1, 2),
		( 10, 'Condicionador Seda', '6,50', '700', 1, 3);

SET IDENTITY_INSERT tbProduto OFF;

SELECT * FROM tbProduto

SET IDENTITY_INSERT tbVenda ON;

INSERT INTO tbVenda (codVenda, dataVenda, valorTotalVenda, codCliente)
VALUES  ( 1, '01/02/2014', '4.500,00', 1),
		( 2, '03/02/2014', '3.400,00', 1),
		( 3, '10/02/2014', '2.100,00', 2),
		( 4, '15/02/2014', '2.700,00', 3),
		( 5, '17/03/2014', '560,00', 3),
		( 6, '09/04/2014', '1.200,00', 4),
		( 7, '07/05/2014', '3.500,00', 5),
		( 8, '07/05/2014', '3.400,00', 1),
		( 9, '05/05/2014', '4.000,00', 2);

SET IDENTITY_INSERT tbVenda OFF;

SELECT * FROM tbVenda

SET IDENTITY_INSERT tbItemVenda ON;

INSERT INTO tbItemVenda (codItemVenda, codVenda, codProduto, quantidadeItemVenda, subTotalItemVenda)
VALUES  ( 1, 1, 1, '200', '1.500,00'),
		( 2, 1, 2, '300', '3.000,00'),
		( 3, 2, 4, '120', '1.400,00'),
		( 4, 2, 2, '200', '1.000,00'),
		( 5, 2, 3, '130', '1.000,00'),
		( 6, 3, 5, '200', '2.100,00'),
		( 7, 4, 4, '120', '1.000,00'),
		( 8, 4, 5, '450', '700,00'),
		( 9, 5, 5, '200', '560,00'),
		(10, 6, 7, '200', '600,00'),
		(11, 6, 6, '300', '600,00');

SET IDENTITY_INSERT tbItemVenda OFF;

SELECT * FROM tbItemVenda



	


