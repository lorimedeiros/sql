USE Hotel

-- Views são consultas sql armazenadas. Elas funcionam como tabelas virtuais que não armazenam dados fisicamente, mas sim uma consulta que é executada sempre que a view é referenciada.
-- Sintaxe da view
CREATE VIEW QuantEstadias5Anos AS
SELECT h.nome, count (*) as QuantidadeEstadias
FROM Hospedes h JOIN Estadias e ON h.CPF = e.hospede
WHERE DATEPART (yy, e.dataEntrada) between 2017 and
2022
GROUP BY h.nome

SELECT * FROM QuantEstadias5Anos --para ver
DROP VIEW QuantEstadias5Anos --para excluir

--outro exemplo
CREATE VIEW NomeHospedes AS
SELECT nome FROM Hospedes

SELECT * FROM NomeHospedes
DROP VIEW NomeHospedes


-- INTO: realmente cria uma tabela física que armazena dados. Ela congela os dados no momento da execução, enquanto view está sempre atualizada
SELECT nome
INTO tabtemp
FROM Hospedes

SELECT * FROM tabtemp
DROP TABLE tabtemp

-- INTO (tabela), VIEW(pesquisa)


-- datepart:
-- DATEPART(datepart, date)
-- datepart: É a parte da data que você quer extrair (como 'yy' para ano, 'mm' para mês, 'dd' para dia)
-- date: É a coluna ou expressão de data que você está analisando
-- é uma solução para: e.dataEntrada >= '2017-01-01' AND e.dataEntrada < '2023-01-01' (ou between)


-- TOP n: as primeiras n linhas de uma consulta
SELECT TOP 2 * FROM Hospedes

-- TOP n PERCENT: as primeiras n porcento linhas de uma consulta
SELECT TOP 20 PERCENT * FROM Hospedes


-- DATAS
-- DATEPART: partes de uma data
SELECT DATEPART(yy, dataNascimento) --dd,mm
FROM Hospedes

SELECT YEAR(dataNascimento) --DAY, MONTH
FROM Hospedes --é interessante colocar as 2 funções pois algumas das funções aqui listadas são exclusivas SQL SERVER

-- GETDATE: data atual do sistema
SELECT GETDATE()
SELECT YEAR(GETDATE()) -- combinando funções

-- DATEADD:
SELECT DATEADD(dd, 5, GETDATE()) --parte, adição, data a receber adição

-- DATEDIFF:
SELECT DATEDIFF(yy, dataEntrada, GETDATE()) 
FROM Estadias --parte + datas a serem comparadas (dadas as diferenças)

-- DATENAME: nome da data
SELECT DATENAME(mm, GETDATE()) --não funciona com ano e dia (são numéricos)
SELECT DATENAME(dw, GETDATE()) --dia da semana

-- Quais os dados das estadias que aconteceram nos últimos 3 anos?
SELECT * 
FROM Estadias
WHERE DATEDIFF(yy, dataEntrada, GETDATE()) <= 3 --últimos 3 anos (de 2022 para cá, 2025 - 3 = 2022)

-- Qual o nome do hóspede que teve mais estadias?
CREATE VIEW desafio as
SELECT h.nome, COUNT(*) qtd
FROM Hospedes h JOIN Estadias e ON h.CPF = e.hospede
GROUP BY h.nome

SELECT nome 
FROM desafio
WHERE qtd = (SELECT MAX(qtd) from desafio)
