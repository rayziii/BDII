CREATE DATABASE bdEscola
GO

USE bdEscola


CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY IDENTITY (1,1),
	nomeCurso VARCHAR (50), 
	cargaHorariaCurso  VARCHAR (50),
	valorCurso MONEY
);

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY (1,1),
	nomeAluno VARCHAR (50),  
	dataNascimentoAluno SMALLDATETIME, 
	rgAluno CHAR (12),
	naturalidadeAluno VARCHAR (50) 
);

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY (1,1),
	nomeTurma VARCHAR (50),
	horarioTurma SMALLDATETIME, 
	codCurso INT FOREIGN KEY REFERENCES tbCurso (codCurso),
);

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY (1,1),
	dataMatricula SMALLDATETIME,  
	codAluno INT FOREIGN KEY REFERENCES tbAluno (codAluno),
	codTurma  INT FOREIGN KEY REFERENCES tbTurma (codTurma)
);


SET IDENTITY_INSERT tbCurso ON;
INSERT INTO tbCurso (codCurso, nomeCurso, cargaHorariaCurso, valorCurso)
VALUES  (1, 'Inglês', 2000, '356,00'),
		(2, 'Alemão', 3000, '478,00');
SET IDENTITY_INSERT tbCurso OFF;

SET IDENTITY_INSERT tbAluno ON;
INSERT INTO tbAluno (codAluno, nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
VALUES  (1, 'Paulo Santos', '03/10/2000', '82.292.122-0', 'SP'),
		(2, 'Maria da Gloria', '10/03/1999', '45.233.123-0', 'SP'),
		(3, 'Perla Nogueira Silva', '04/04/1998', '23.533.211-9', 'SP'),
		(4, 'Gilson Barros Silva', '09/09/1995', '34.221.111-x', 'PE'),
		(5, 'Mariana Barbosa Santos', '10/10/2001', '54.222.122-9', 'RJ');
SET IDENTITY_INSERT tbAluno OFF;

SET IDENTITY_INSERT tbTurma ON;
INSERT INTO tbTurma (codTurma, nomeTurma, codCurso, horarioTurma) 
VALUES  (1, '1A', 1, '12:00'),
		(2, '1B', 1, '18:00'),
		(3, '1AA', 2, '19:00');
SET IDENTITY_INSERT tbTurma OFF;

SET IDENTITY_INSERT tbMatricula ON;
INSERT INTO tbMatricula (codMatricula, dataMatricula, codAluno, codTurma) 
VALUES  (1, '10/03/2015', 1, 1),
		(2, '05/04/2014', 2, 1),
		(3, '05/03/2012', 3, 2),
		(4, '03/03/2016', 1, 3),
		(5, '05/07/2015', 4, 2),
		(6, '07/05/2015', 4, 3),
		(7, '06/06/2015', 5, 1),
		(8, '05/05/2015', 5, 3);
SET IDENTITY_INSERT tbMatricula OFF;

-- exercicio 1

SELECT nomeAluno, rgAluno, dataNascimentoAluno
FROM tbAluno 
WHERE naturalidadeAluno LIKE 'SP';

-- exercicio 2

SELECT nomeAluno, rgAluno
FROM tbAluno 
WHERE nomeAluno LIKE '%P%';

-- exercicio 3

SELECT nomeCurso
FROM tbCurso
WHERE cargaHorariaCurso > 2000;

-- exercicio 4

SELECT nomeAluno, rgAluno
FROM tbAluno
WHERE nomeAluno	LIKE '%Silva%';

-- exercicio 5

SELECT nomeAluno, dataNascimentoAluno 
FROM tbAluno
WHERE MONTH(dataNascimentoAluno) = 3;

-- exercicio 6

SELECT codAluno, dataMatricula
FROM tbMatricula
WHERE MONTH(dataMatricula) = 3;

-- exercicio 7

SELECT codAluno
FROM tbMatricula
WHERE codTurma IN (
    SELECT codTurma
    FROM tbTurma
    WHERE codCurso = (
        SELECT codCurso
        FROM tbCurso
        WHERE codCurso = 1
    )
);

-- exercicio 8 

SELECT codAluno
FROM tbMatricula
WHERE codTurma = 3;

-- exercicio 9 

SELECT codAluno, nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno
FROM tbAluno;

-- exercicio 10

SELECT codTurma, nomeTurma, horarioTurma, codCurso
FROM tbTurma;