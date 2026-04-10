CREATE DATABASE bdOng;

GO

USE bdOng;

GO

CREATE TABLE tbSexo(
	idSexo INT PRIMARY KEY IDENTITY (1,1), 
	descSexo VARCHAR (50)
);

CREATE TABLE tbStatus(
	idStatus INT PRIMARY KEY IDENTITY(1,1), 
	descStatus VARCHAR (50)
);

CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY(1,1), 
	dtNascCrianca SMALLDATETIME, 
	idSexo INT FOREIGN KEY REFERENCES tbSexo (idSexo), 
	idStatus INT FOREIGN KEY REFERENCES tbStatus (idStatus)
);

CREATE TABLE tbObservacao(
	idObservacao INT PRIMARY KEY IDENTITY(1,1),
	descObservacao VARCHAR (50), 
	dataObservacao SMALLDATETIME,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca)
);

CREATE TABLE tbGenitor(
	idGenitor INT PRIMARY KEY IDENTITY(1,1),
	nomeGenitor VARCHAR (30),
	descGenitor VARCHAR (50)
);

CREATE TABLE tbFiliacao(
	idFiliacao INT PRIMARY KEY IDENTITY(1,1),
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca),
	idGenitor INT FOREIGN KEY REFERENCES tbGenitor (idGenitor)
);

CREATE TABLE tbTelPadrinho(
	idTelPadrinho  INT PRIMARY KEY IDENTITY(1,1),
	numTelPadrinho CHAR (13) NOT NULL,
	descTelPadrinho VARCHAR (20)
);

CREATE TABLE tbPadrinho(
	idPadrinho INT PRIMARY KEY IDENTITY(1,1),
	nomePadrinho VARCHAR (50),
	cpfPadrinho CHAR (11) NOT NULL,
	paisPadrinho VARCHAR (30),
	estadoPadrinho VARCHAR (30),
	cidadePadrinho VARCHAR (30),
	bairroPadrinho VARCHAR (30),
	ufPadrinho CHAR (2),
	lograPadrinho VARCHAR (30),
	numLograPadrinho CHAR (10),
	idTelPadrinho INT FOREIGN KEY REFERENCES tbTelPadrinho (idTelPadrinho)
);


CREATE TABLE tbApadrinhamento(
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1),
	dataApadrinhamento SMALLDATETIME,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca),
	idPadrinho INT FOREIGN KEY REFERENCES tbPadrinho (idPadrinho)
);


CREATE TABLE tbDoenca(
	idDoenca INT PRIMARY KEY IDENTITY(1,1),
	nomeDoenca VARCHAR (70),
	descDoenca VARCHAR (50)
);

CREATE TABLE tbProntuario(
	idProntuario INT PRIMARY KEY IDENTITY(1,1),
	dataProntuario SMALLDATETIME,
	idCrianca INT FOREIGN KEY REFERENCES tbCrianca (idCrianca)
);

CREATE TABLE tbProntuarioDoenca(
	idProntuarioDoenca INT PRIMARY KEY IDENTITY(1,1),
	dataProntuarioDoenca SMALLDATETIME,
	idProntuario INT FOREIGN KEY REFERENCES tbProntuario (idProntuario),
	idDoenca INT FOREIGN KEY REFERENCES tbDoenca (idDoenca)
);


