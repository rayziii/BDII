CREATE DATABASE bdLojaRoupas
GO

USE DATABASE bdLojaRoupas
GO

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1),
	nomeCliente VARCHAR (50) NOT NULL,
	idadeCliente VARCHAR (20) NOT NULL
);

CREATE TABLE tbVendedor(
	codVendedor INT PRIMARY KEY IDENTITY (1,1),
	nomeVendedor  VARCHAR (50) NOT NULL
);

CREATE TABLE tbFuncionario(
	codFuncionario INT PRIMARY KEY IDENTITY (1,1),
	nomeFuncionario VARCHAR (50) NOT NULL,
	idadeFuncionario VARCHAR (20) NOT NULL,
	dataAdmissaoFuncionario SMALLDATETIME NOT NULL,
	salarioFuncionario  MONEY NOT NULL
);

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY (1,1),
	nomeFabricante VARCHAR (50) NOT NULL
);

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY (1,1),
	dataVenda SMALLDATETIME NOT NULL,
	totalVenda MONEY NOT NULL,
	codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente),
	codVendedor INT FOREIGN KEY REFERENCES tbVendedor (codVendedor)
);

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY (1,1),
	nomeProduto VARCHAR (50) NOT NULL,
	precoProduto MONEY NOT NULL,
	dataEntradaProduto SMALLDATETIME NOT NULL,
	codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (codFuncionario), 
	codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante)
);

CREATE TABLE tbItemVenda(
	codItemVenda INT PRIMARY KEY IDENTITY (1,1),
	quantidadeItem INT NOT NULL,
	subTotalItem MONEY NOT NULL,
	codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda),
	codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
);

INSERT INTO tbFabricante (codFabricante, nomeFabricante)
VALUES	( 1, 'Malwee'),
		( 2, 'Marisol'),
		( 3, 'Cia da Malha');

INSERT INTO tbCliente (codCliente, nomeCliente, idadeCliente)
VALUES  ( 1, 'Hermenegildo', 85),
		( 2, 'Yasmin Cristina', 28),
		( 3, 'Rayssa', 33),
		( 4, 'Anny', 69),
		( 5, 'Yasmin Santos', 44);

INSERT INTO tbFuncionario (codFuncionario, nomeFuncionario, idadeFuncionario, dataAdmissaoFuncionario, salarioFuncionario)
VALUES  ( 1, 'João Santana', 24, '13/09/2024', '1.500,00'),
		( 2, 'Raquel Torres', 67, '07/05/2010', '2.700,00');

INSERT INTO tbProduto (codProduto, nomeProduto, precoProduto, dataEntradaProduto, codFuncionario, codFabricante)
VALUES  ( 1, 'Suéter Vermelho', 85, '18/02/2024', 1, 3),
		( 2, 'Vestido Preto', 35, '22/07/2024', 2, 1),
		( 3, 'Camiseta Azul', 23, '03/10/2024', 1, 2),
		( 4, 'Meias Roxas', 15, '30/05/2024', 2, 1),
		( 5, 'Casaco Cinza', 30, '14/09/2024', 1, 3),
		( 6, 'Sutiã Branco', 28, '16/06/2024', 2, 2),
		( 7, 'Cueca Box Amarela', 10, '09/08/2024', 1, 3),
		( 8, 'Cachecol Listrado Vermelho e Cinza', 40, '12/04/2024', 2, 1),
		( 9, 'Luvas Lilás', 20, '05/01/2024', 2, 1),
		( 10, 'Calcinha Rosa', 14, '16/06/2024', 1, 3);

INSERT INTO tbVendedor (codVendedor, nomeVendedor)
VALUES  ( 1, 'Victor Oliveira'),
		( 2, 'Sheila Guerra');

INSERT INTO tbVenda (codVenda, dataVenda, totalVenda, codCliente, codVendedor)
VALUES  ( 1, '02/04/2025', 35 , 1, 1),
		( 2, '03/04/2025', 67, 2, 2),
		( 3, '01/09/2025', 25, 3, 1),
		( 4, '28/02/2025', 58, 4, 2),
		( 5, '09/04/2025', 45, 5, 2);

-- EXERCICIO 1

UPDATE tbFabricante
SET nomeFabricante = 'Turma da Malha'
WHERE codFabricante = 3; 

-- EXERCICIO 2

UPDATE tbVenda
SET totalVenda = totalVenda * 0.9
WHERE codCliente = 1;

-- EXERCICIO 3

UPDATE tbProduto
SET precoProduto = precoProduto * 1.2
WHERE codFabricante = 2;

-- EXERCICIO 4

UPDATE tbItemVenda
SET quantidadeItem = quantidadeItem - 10
WHERE codProduto = 3;

-- EXERCICIO 5

DELETE tbItemVenda
WHERE codVenda = 2 AND codItemVenda = 2;

-- EXERCICIO 6

DELETE FROM tbItemVenda
WHERE codVenda = 3;

-- EXERCICIO 7

DELETE FROM tbFabricante
WHERE codFabricante = 1;

-- Não foi possível remover o fabricante porque tem produtos vinculados a ele pelas chaves estrangeiras.


