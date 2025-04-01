-- tipo do quarto que possui maior valor de diária
SELECT tipo
FROM Quartos
WHERE valorDiaria = (SELECT MAX(valorDiaria) FROM Quartos)

-- nomes dos hospedes que solicitaram serviço mais barato (COM SUBCONSULTA SIMPLES)
SELECT Hospedes.nome
FROM Hospedes, Servicos, Solicitacoes
WHERE Hospedes.CPF = Solicitacoes.hospede AND
	  Solicitacoes.servico = Servicos.codServico AND
	  Servicos.preco = (SELECT MIN(Servicos.preco) FROM Servicos) --liga subconsulta com '=' quando o retorno é um resultado só

-- nomes dos hospedes que solicitaram serviço mais barato (FULL SUBCONSULTA)
SELECT nome
FROM Hospedes
WHERE CPF IN (SELECT hospede FROM Solicitacoes --liga subconsulta com 'IN' quando o retorno pode ser > 1
WHERE servico IN (SELECT codServico FROM Servicos
WHERE preco = (SELECT MIN(preco) FROM Servicos)))

-- OBS: aqui tá a mágica, realizando somente com subconsultas são eliminadas as ocorrencias repetidas (um distinct automático)

--JOIN (junta as chaves)(forma real oficial de fazer em empresas)
SELECT Hospedes.nome, Solicitacoes.data
FROM Hospedes JOIN Solicitacoes ON Hospedes.CPF = Solicitacoes.hospede
	 JOIN Servicos ON Solicitacoes.servico = Servicos.codServico
WHERE Servicos.preco = (SELECT MIN(preco) FROM Servicos)

-- ou seja, o join faz a junção das chaves no from, poupando o where

-- serviços solicitados em 2023 por hospedes do sexo masculino
SELECT Servicos.*
FROM Servicos JOIN Solicitacoes ON Servicos.codServico = Solicitacoes.servico
	 JOIN Hospedes ON Hospedes.CPF = Solicitacoes.hospede
WHERE Solicitacoes.data BETWEEN '2023-01-01' AND '2023-12-31' AND
	  Hospedes.sexo = 'M'
