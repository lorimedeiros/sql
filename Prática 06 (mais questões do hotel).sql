-- a) Mostre os nomes dos hóspedes e a descrição dos serviços solicitados, para cada hóspede que solicitou serviço no segundo semestre de 2023.
SELECT Hospedes.nome, Servicos.descricao 
FROM Hospedes, Servicos, Solicitacoes 
WHERE Hospedes.CPF = Solicitacoes.hospede AND Solicitacoes.servico = Servicos.codServico AND Solicitacoes.data > '01/07/2023' AND Solicitacoes.data < '01/01/2024'

-- b) Exiba os dados dos serviços solicitados por hóspedes cujo nome tenha “Santos”  em qualquer parte. Ordene pela descrição do serviço.
SELECT Servicos.*
FROM Hospedes, Servicos, Solicitacoes 
WHERE nome LIKE '%Santos%' AND Hospedes.CPF = Solicitacoes.hospede AND Solicitacoes.servico = Servicos.codServico
ORDER BY Servicos.descricao

-- c) Mostre os nomes dos hóspedes e quantidade de suas estadias, apenas para hospedes  que tiveram estadias em quartos do tipo Standard ou Luxo Superior em 2012.
SELECT Hospedes.nome, COUNT(DISTINCT Estadias.hospede)
FROM Hospedes, Estadias, Quartos
WHERE Hospedes.CPF = Estadias.hospede AND Estadias.quarto = Quartos.numero 
AND (Quartos.tipo = 'Standard' OR Quartos.tipo = 'Luxo Superior')
AND Estadias.dataEntrada BETWEEN '01/01/2012' AND '31/12/2012'
GROUP BY Hospedes.nome

-- d) Mostre as datas de entrada e saída das estadias realizadas por hóspedes que  informaram a data de nascimento. Ordene pela data de entrada em ordem descendente.
SELECT Estadias.dataEntrada, Estadias.dataSaida
FROM Estadias, Hospedes
WHERE Hospedes.dataNascimento IS NOT NULL
AND Estadias.hospede = Hospedes.CPF
ORDER BY Estadias.dataEntrada DESC

-- e) Mostre a quantidade por sexo de cada serviço solicitado.
SELECT COUNT(DISTINCT Solicitacoes.hospede)
FROM Servicos, Solicitacoes, Hospedes
WHERE Servicos.codServico = Solicitacoes.servico AND Solicitacoes.hospede = Hospedes.CPF
GROUP BY Hospedes.sexo

-- f) Exiba os distintos nomes dos hóspedes que tiveram estadias em quartos cujo valor  da diária é maior que R$500, e que solicitaram serviço de Lanchonete ou Passadeira.
SELECT DISTINCT Hospedes.nome
FROM Hospedes, Quartos, Estadias, Solicitacoes, Servicos
WHERE Hospedes.CPF = Solicitacoes.hospede AND
	  Solicitacoes.servico = Servicos.codServico AND
	  Estadias.quarto = Quartos.numero AND
	  Estadias.hospede = Hospedes.CPF AND
	  Quartos.valorDiaria > '500' AND
	  (Solicitacoes.servico = '1' OR Solicitacoes.servico = '2')

-- g) Mostre, para cada serviço, a sua descrição e uma média de preços pagos, apenas para  serviços solicitados entre os anos de 2015 e 2018.
SELECT Servicos.descricao, AVG(Servicos.preco)
FROM Servicos, Solicitacoes
WHERE Servicos.codServico = Solicitacoes.servico AND
	  Solicitacoes.data BETWEEN '01/01/2015' AND '31/12/2018'
GROUP BY Servicos.descricao

-- h) Mostre, para cada quarto, o seu tipo, valor de diária e quantidade de estadias.  Ordene pelo tipo do quarto.
SELECT Quartos.tipo, Quartos.valorDiaria, COUNT(DISTINCT Estadias.quarto)
FROM Quartos, Estadias
WHERE Quartos.numero = Estadias.quarto
GROUP BY Quartos.tipo, Quartos.valorDiaria
ORDER BY Quartos.tipo

-- i) Mostre os nomes dos hóspedes que pagaram pelo quarto com maior valor de diária.
SELECT Hospedes.nome
FROM Hospedes, Quartos, Estadias
WHERE Hospedes.CPF = Estadias.hospede AND
	  Estadias.quarto = Quartos.numero AND
	  quartos.valorDiaria = (SELECT MAX(valorDiaria) FROM Quartos)

SELECT * FROM Quartos
SELECT * FROM Estadias
SELECT * FROM Hospedes
SELECT * FROM Servicos
SELECT * FROM Solicitacoes
