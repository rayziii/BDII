CREATE DATABASE bdCampi;
GO

USE bdCampi;
GO

CREATE TABLE tbCampi(
	idCampi INT PRIMARY KEY IDENTITY (1,1),
	nomeCampi VARCHAR (50),
	paisCampi VARCHAR (30),
	estadoCampi VARCHAR (50),
	cidadeCampi VARCHAR (50),
	bairroCampi VARCHAR (50),
	logradouroCampi VARCHAR (50),
	numLograCampi VARCHAR (10),
	ufCampi CHAR (2)
);

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1),
	nomeCurso VARCHAR (50),
	descCurso VARCHAR  (30),
	idCampi INT FOREIGN KEY REFERENCES tbCampi (idCampi)
);

CREATE TABLE tbDisciplina(
	idDisciplina INT PRIMARY KEY IDENTITY (1,1),
	nomeDisciplina VARCHAR (50),
	cargaHorariaDisciplina VARCHAR (30),
	descDisciplina VARCHAR (30)
);

CREATE TABLE tbCursoDisciplina(
	idCursoDisciplina INT PRIMARY KEY IDENTITY (1,1),
	idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso),
	idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina (idDisciplina)
);

CREATE TABLE tbProfessor(
	idProfessor INT PRIMARY KEY IDENTITY (1,1),
	nomeProfessor VARCHAR (50),
	cpfProfessor CHAR (13) NOT NULL,
	dataNascProfessor SMALLDATETIME
);

CREATE TABLE tbTelProfessor(
	idTelProfessor INT PRIMARY KEY IDENTITY (1,1),
	numTelProfessor CHAR (14),
	descTelProfessor VARCHAR (30),
	idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor)
);

CREATE TABLE tbProfessorDisciplina(
	idProfessorDisciplina INT PRIMARY KEY IDENTITY (1,1),
	idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor),
	idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina (idDisciplina)
);

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY (1,1),
	nomeAluno VARCHAR (50),
	cpfAluno CHAR (13) NOT NULL,
	dataNascAluno SMALLDATETIME,
	idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
);

CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY (1,1),
	dataInicioTurma SMALLDATETIME,
	anoFormacaoTurma SMALLDATETIME,
	numSalaTurma VARCHAR (10),
	numAlunosTurma VARCHAR (10),
	descTurma VARCHAR (30),
	idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
);

CREATE TABLE tbTurmaAluno(
	idTurmaAluno  INT PRIMARY KEY IDENTITY (1,1),
	idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma),
	idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
);



