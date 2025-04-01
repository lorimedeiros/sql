CREATE DATABASE Clinica

CREATE TABLE Pacientes(
	codP int not null identity,
	nome varchar(80) not null,
	cpf char(11) not null,
	sexo char(1) not null,
	idade int not null,
	convenio varchar(20),
	-- regras
	PRIMARY KEY (codP),
	UNIQUE(cpf),
	CHECK(sexo in ('M','F')),
	CHECK(idade > 0)
)

CREATE TABLE Medicos(
	codM int not null identity,
	nome varchar(80) not null,
	especialidade varchar(20) not null,
	turno varchar(20) not null,
	salario numeric(7,2),
	-- regras
	PRIMARY KEY (codM),
	CHECK(salario > 0),
	CHECK(turno in ('Matutino', 'Vespertino', 'Noturno'))
)

CREATE TABLE Consultas(
	idConsulta int not null,
	codP int not null,
	codM int not null,
	dataConsulta datetime,
	diagnostico varchar(80),
	preco numeric(6,2)
	-- regras
	PRIMARY KEY (idConsulta),
	FOREIGN KEY (codP) REFERENCES Pacientes,
	FOREIGN KEY (codM) REFERENCES Medicos,
	CHECK(preco > 0)
)

INSERT INTO Pacientes
VALUES ('Chico Butico', '30254198752', 'M', '25', '')

INSERT INTO Pacientes
VALUES ('Josep Kamole', '58769812659', 'M', '36', '')

INSERT INTO Pacientes
VALUES ('Jah Podih Al-Mossar', '85214796346', 'M', '41', '')

INSERT INTO Medicos
VALUES ('Severina Xique-Xique', 'Urologista', 'Noturno', '7000')

INSERT INTO Medicos
VALUES ('Lady Lourdes', 'Pediatra', 'Matutino', '7000')

INSERT INTO Medicos
VALUES ('Doctor Rey', 'Esteticista', 'Vespertino', '5000')

INSERT INTO Medicos
VALUES ('Cátia Damasceno', 'Sexologa', 'Noturno', '5000')

INSERT INTO Consultas
VALUES (1,1,1,'18-02-2025', 'Saudável', '100')

INSERT INTO Consultas
VALUES (2,2,4,'15-02-2025', 'Saudável', '120')

INSERT INTO Consultas
VALUES (3,3,3,'10-02-2025', 'Saudável', '150')

SELECT * FROM Pacientes
SELECT * FROM Medicos
SELECT * FROM Consultas
