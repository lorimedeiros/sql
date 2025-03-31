CREATE DATABASE Biblioteca -- Criação da database

CREATE TABLE Usuarios(
	idUsuario int not null identity,
	nome varchar(80) not null, -- 80 = numero maximo de caracteres (varchar == String (from Java))
	RG char(6) not null, -- char, por questões de armazenamento (tem tamanho fixo, exato)
	sexo char(1) not null,
	tipo varchar(11) not null DEFAULT 'Discente',
	PRIMARY KEY (idUsuario),
	UNIQUE(RG),
	CHECK(sexo in ('M','F')),
	CHECK(tipo in ('Docente','Discente','Funcionario'))
) -- Criação da Tabela de Usuarios

SELECT * FROM Usuarios -- comando para dar uma vizualizada (tá vazio)

CREATE TABLE Livros(
	idLivro int not null identity,
	titulo varchar(40) not null,
	genero varchar(15),
	ano int,
	situacao varchar(12) default 'Disponível',
	precoCusto numeric(6,2), -- 6 é o total de números, 2 é a quantidade de decimais
	PRIMARY KEY (idLivro),
	CHECK (situacao in('Emprestado','Disponível')),
	CHECK (precoCusto > 0)
)

CREATE TABLE Emprestimos(
	idEmprestimo int not null,
	idUsuario int not null,
	idLivro int not null,
	dataSaida datetime,
	dataDevolucao datetime,
	PRIMARY KEY (idEmprestimo),
	FOREIGN KEY (idUsuario) REFERENCES Usuarios,
	FOREIGN KEY (idLivro) REFERENCES Livros
) -- tabela de relação de empréstimo que envolve Livro e Usuario

-- colocando usuarios na tabela
INSERT INTO Usuarios --inaerção simples
VALUES ('Ana Moura','824573','F','Docente')

INSERT INTO Usuarios (nome, RG, sexo) --inserção especificando campos cujos valores serão inseridos
VALUES ('Caio Leme','112478','M')

INSERT INTO Usuarios (nome, RG, sexo)
VALUES ('José João','115847','M')
       ('José Jaime','115689','M')
       ('Maria Clara','115235','F')

INSERT INTO Usuarios --default
VALUES ('Maria Silva','115900','F',default)

-- colocando livro na tabela
INSERT INTO Livros (titulo, genero)
VALUES ('SQL na Prática', 'Programação')

-- criando emprestimo
INSERT INTO Emprestimos
VALUES (1,1,1,'01-02-2025','13-02-2025')

SELECT * FROM Emprestimos
