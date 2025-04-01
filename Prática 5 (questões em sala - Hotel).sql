-- Questão (a) Exiba os nomes de todos os hospedes.
SELECT nome FROM Hospedes

-- Questão (b) Exiba todos os dados dos serviços.
SELECT * FROM Servicos

-- Questão (c) Mostre o tipo, o valor da diária, e o lucro mensal de cada quarto (valor da diária * 31). Renomeie esta última coluna para Valor da Diária/Mês.
SELECT tipo, valorDiaria, valorDiaria * 31 AS 'Valor da Diária/Mês' FROM Quartos

-- Questão (d) Mostre a soma e a média dos preços de todos os serviços.
SELECT SUM(preco) AS 'Soma', AVG(preco) AS 'Média' FROM Servicos

-- Questão (e) Mostre o valor da diária do quarto mais caro e do mais barato.
SELECT MAX(valorDiaria) AS 'Mais Caro', MIN(valorDiaria) AS 'Mais Barato' FROM Quartos

-- Questão (f) Exiba a data de nascimento do hóspede mais novo.
SELECT MAX(dataNascimento) FROM Hospedes

-- Questão (g) Mostre quantos serviços foram solicitados pelo hóspede de CPF 922411035844.
SELECT COUNT(servico) AS 'Serviços Solicitados' 
FROM Solicitacoes 
WHERE hospede = '922411035844' 

-- Questão (h) Mostre quantos hóspedes distintos já tiveram estadias.
SELECT COUNT(DISTINCT hospede) AS 'Hóspedes Distintos' FROM Estadias

-- Questão (i) Mostre a descrição, preço e o preço com 35% de aumento, de todos os serviços.
SELECT descricao, preco, preco + preco * 0.35 AS 'Valor Acrescido' FROM Servicos

-- Questão (j) Quais os dados dos quartos que possuem valor de diária maior que R$ 300?
SELECT * FROM Quartos WHERE valorDiaria > 300

-- Questão (k) Mostre os dados de todos os hóspedes que tiveram estadias no ano de 2018.
SELECT Hospedes.* 
FROM Hospedes, Estadias 
WHERE Estadias.dataEntrada BETWEEN '01-01-2018' AND '31-12-2018' AND Hospedes.CPF = Estadias.hospede

-- Questão (l) Exiba os dados dos serviços solicitados em setembro de 2023.
SELECT Servicos.* 
FROM Servicos, Solicitacoes 
WHERE Solicitacoes.data BETWEEN '01-09-2023' AND '30-09-2023' AND Servicos.codServico = Solicitacoes.servico

-- Questão (m) Exiba os nomes dos hóspedes e a hora da solicitação do serviço, para hospedes que solicitaram serviços de Lavanderia ou de Babá.
SELECT Hospedes.nome, Solicitacoes.hora 
FROM Servicos, Solicitacoes, Hospedes 
WHERE Servicos.descricao IN ('Babá', 'Lavanderia') AND Hospedes.CPF = Solicitacoes.hospede AND Solicitacoes.servico = Servicos.codServico

-- Questão (n) Mostre quantos serviços foram solicitados por hóspedes do sexo masculino, no primeiro semestre de 2012.
SELECT COUNT(servico) AS 'Serviços Solicitados' 
FROM Servicos, Hospedes, Solicitacoes 
WHERE Hospedes.sexo IN ('M') AND Solicitacoes.data BETWEEN '01-01-2012' AND '30-06-2012' AND Hospedes.CPF = Solicitacoes.hospede AND Solicitacoes.servico = Servicos.codServico
