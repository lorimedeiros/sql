CREATE DATABASE Hotel
SET DATEFORMAT YMD -- ajustando data
USE Hotel

--tabelas
Create Table Hospedes (
CPF varchar (12) not null,
nome varchar (50) not null,
endereco varchar (50),
sexo char(1),
dataNascimento datetime,

Primary Key (CPF),
check (sexo in ('M', 'F'))
)

Create Table Quartos (
numero int not null,
tipo varchar (40),
valorDiaria money,

Primary Key (numero),
check (valorDiaria > 0)
)

Create Table Estadias (
hospede varchar(12) not null,
quarto int not null,
dataEntrada datetime,
dataSaida datetime,

Foreign Key (hospede) References Hospedes (CPF),
Foreign Key (quarto) References Quartos (numero),
Check (dataSaida > dataEntrada)
)

Create Table Servicos (
codServico int not null,
descricao varchar (40),
preco money,

Primary Key (codServico),
check (preco > 0)
)

Create Table Solicitacoes (
hospede varchar(12) not null,
servico int not null,
data datetime,
hora datetime,

Foreign Key (hospede) References Hospedes (CPF),
Foreign Key (servico) References Servicos (codServico)
)

--inserts
Insert Into Hospedes Values ('159874256911', 'Maria dos Santos', 'Av. Epitácio Pessoa, 21, João Pessoa', 'F', '1960-02-06')
Insert Into Hospedes Values ('547221658922', 'João Augusto Trindade', 'R. das Flores, 33, Recife', 'M', '1980-05-14')
Insert Into Hospedes Values ('522655488922', 'Ana Maria Pereira', 'R. Augusta, 51, São Paulo', 'F', '1972-08-09')
Insert Into Hospedes Values ('922411035844', 'Luiza Costa', 'Av. Epitácio Pessoa, 297, João Pessoa', 'F', '1985-12-24')
Insert Into Hospedes Values ('241699512000', 'Francisco Chaves dos Santos', 'R. Aurora, 95, Maceió', 'M', '1955-09-06')
Insert Into Hospedes Values ('621000385221', 'Antônio Alves', 'R. José Firmino, 33, Rio de Janeiro', 'M', '1980-05-09')
Insert Into Hospedes (cpf, nome, endereco, sexo) Values ('453982210087', 'Marieta Gonçalves', 'R. Luiz Paiva, 90, Curitiba', 'F')
INSERT INTO Hospedes (CPF, nome, endereco, sexo, dataNascimento) VALUES ('12345678901', 'John Smith', '123 Main St, City, State', 'M', '1990-05-15');
INSERT INTO Hospedes (CPF, nome, endereco, sexo, dataNascimento) VALUES ('98765432109', 'Jane Doe', '456 Elm St, Town, State', 'F', '1988-07-20');
INSERT INTO Hospedes (CPF, nome, endereco, sexo, dataNascimento) VALUES ('55555555555', 'Bob Johnson', '789 Oak St, Village, State', 'M', '1995-03-25');
Insert Into Hospedes (cpf, nome, endereco, sexo) Values ('452981110385', 'Ana Paula Abrantes', 'R. Amparadouro Pereira, 80, São Paulo', 'F')
Insert Into Hospedes (cpf, nome, endereco, sexo) Values ('651582954399', 'Mário Augisto Tarantela', 'R. das Flores, 55, Recife', 'M')

--select * from Hospedes

Insert Into Quartos Values (220, 'Standard', 250.60)
Insert Into Quartos Values (230, 'Suíte Master', 700)
Insert Into Quartos Values (240, 'Luxo Superior', 520)
Insert Into Quartos Values (250, 'Suíte Presidencial', 950)
Insert Into Quartos Values (320, 'Standard', 250.60)
Insert Into Quartos Values (330, 'Luxo Superior', 520)
Insert Into Quartos Values (340, 'Suíte Master', 700)

--select * from Quartos

Insert Into Estadias Values ('159874256911', 220, '2011-12-14', '2011-12-24')
Insert Into Estadias Values ('547221658922', 230, '2011-01-01', '2011-01-10')
Insert Into Estadias Values ('522655488922', 340, '2011-08-09', '2011-08-20')
Insert Into Estadias Values ('159874256911', 330, '2011-02-05', '2011-02-09')
Insert Into Estadias Values ('922411035844', 250, '2011-07-05', '2011-07-22')
Insert Into Estadias Values ('241699512000', 220, '2011-05-21', '2011-05-25')
Insert Into Estadias Values ('621000385221', 330, '2012-03-03', '2012-03-09')
Insert Into Estadias Values ('621000385221', 340, '2012-09-01', '2012-09-04')
Insert Into Estadias Values ('547221658922', 330, '2012-06-20', '2012-06-30')
Insert Into Estadias Values ('922411035844', 250, '2012-10-10', '2012-10-15')
Insert Into Estadias Values ('922411035844', 330, '2012-03-12', '2012-03-15')
Insert Into Estadias Values ('547221658922', 340, '2012-10-04', '2012-10-08')
Insert Into Estadias Values ('547221658922', 340, '2012-01-04', '2012-01-08')
Insert Into Estadias Values ('621000385221', 330, '2012-01-12', '2012-01-15')
Insert Into Estadias Values ('241699512000', 250, '2012-02-20', '2012-02-22')
Insert Into Estadias Values ('547221658922', 330, '2012-04-20', '2012-04-23')
Insert Into Estadias Values ('621000385221', 250, '2012-06-12', '2012-06-15')
Insert Into Estadias Values ('241699512000', 220, '2012-08-20', '2012-08-24')
Insert Into Estadias Values ('621000385221', 340, '2012-09-01', '2012-09-04')
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('12345678901', 220, '2023-09-18', '2023-09-20');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('98765432109', 230, '2023-09-19', '2023-09-22');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('55555555555', 240, '2023-09-20', '2023-09-23');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('159874256911', 250, '2023-09-21', '2023-09-24');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('522655488922', 320, '2023-09-22', '2023-09-25');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('453982210087', 330, '2023-09-23', '2023-09-26');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('12345678901', 220, '2015-05-15', '2015-05-20');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('98765432109', 230, '2016-03-10', '2016-03-15');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('55555555555', 240, '2017-08-20', '2017-08-25');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('159874256911', 250, '2018-04-25', '2018-04-30');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('522655488922', 320, '2019-09-05', '2019-09-10');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('453982210087', 330, '2020-07-12', '2020-07-17');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('241699512000', 220, '2021-12-01', '2021-12-06');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('621000385221', 230, '2022-10-15', '2022-10-20');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('98765432109', 220, '2015-08-10', '2015-08-15');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('55555555555', 230, '2016-07-20', '2016-07-25');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('453982210087', 240, '2017-09-25', '2017-09-30');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('241699512000', 320, '2018-04-15', '2018-04-20');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('621000385221', 330, '2019-12-05', '2019-12-10');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('12345678901', 340, '2020-03-08', '2020-03-13');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('98765432109', 220, '2021-06-22', '2021-06-27');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('55555555555', 230, '2022-09-10', '2022-09-15');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('452981110385', 220, '2023-05-05', '2023-05-07');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('651582954399', 330, '2023-01-04', '2023-01-10');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('651582954399', 220, '2024-02-03', '2024-02-10');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('452981110385', 340, '2024-07-14', '2024-07-22');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('98765432109', 250, '2024-09-21', '2024-09-22');
INSERT INTO Estadias (hospede, quarto, dataEntrada, dataSaida) VALUES ('621000385221', 250, '2024-12-21', '2024-12-30');

--select * from Estadias

Insert Into Servicos Values (1, 'Lavanderia', 45)
Insert Into Servicos Values (2, 'Passadeira', 25.50)
Insert Into Servicos Values (3, 'Babá', 330)
Insert Into Servicos Values (4, 'Café no Quarto', 64.50)
Insert Into Servicos Values (5, 'Lanchonete', 50)

--select * from Servicos

Insert Into Solicitacoes Values ('159874256911', 1, '2011-12-15', '09:30:00')
Insert Into Solicitacoes Values ('547221658922', 5, '2011-01-09', '22:15:20')
Insert Into Solicitacoes Values ('621000385221', 3, '2011-09-03', '13:00:00')
Insert Into Solicitacoes Values ('922411035844', 1, '2012-10-12', '20:06:52')
Insert Into Solicitacoes Values ('922411035844', 4, '2012-07-10', '11:32:41')
Insert Into Solicitacoes Values ('922411035844', 4, '2012-03-14', '15:22:00')
Insert Into Solicitacoes Values ('547221658922', 1, '2012-10-05', '07:11:41')
Insert Into Solicitacoes Values ('547221658922', 5, '2012-01-05', '10:20:00')
Insert Into Solicitacoes Values ('241699512000', 1, '2012-02-21', '19:55:22')
Insert Into Solicitacoes Values ('547221658922', 3, '2012-04-22', '19:06:52')
Insert Into Solicitacoes Values ('241699512000', 4, '2012-08-21', '09:43:55')
Insert Into Solicitacoes Values ('621000385221', 5, '2012-09-03', '17:09:00')
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('12345678901', 1, '2023-09-18', '10:00:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('98765432109', 2, '2023-09-19', '14:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('55555555555', 3, '2023-09-20', '16:45:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('159874256911', 4, '2023-09-21', '11:15:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('522655488922', 5, '2023-09-22', '09:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('12345678901', 1, '2023-09-18', '09:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('98765432109', 2, '2023-09-19', '14:45:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('55555555555', 3, '2023-09-20', '11:15:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('159874256911', 4, '2023-09-21', '16:20:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('453982210087', 5, '2023-09-22', '10:00:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('12345678901', 1, '2015-05-15', '10:00:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('98765432109', 2, '2016-03-10', '15:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('55555555555', 3, '2017-08-20', '11:45:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('159874256911', 4, '2018-04-25', '14:00:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('453982210087', 5, '2019-09-05', '12:15:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('241699512000', 1, '2020-07-12', '09:45:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('621000385221', 2, '2021-12-01', '16:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('12345678901', 3, '2022-10-15', '13:20:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('12345678901', 1, '2015-05-15', '10:30:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('621000385221', 5, '2024-12-22', '14:21:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('98765432109', 2, '2024-09-21', '21:00:00');
INSERT INTO Solicitacoes (hospede, servico, data, hora) VALUES ('452981110385', 2, '2024-07-18', '05:52:00');

--select * from Solicitacoes
