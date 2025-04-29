-- a)
CREATE VIEW Compras_Show AS
SELECT c.nome as 'nome', COUNT(i.idIngresso) as qtd
FROM Clientes c JOIN Vendas v ON c.idCliente = v.idCliente JOIN Ingressos i ON i.idIngresso = v.idIngresso JOIN Eventos e ON e.idEvento = i.idEvento
WHERE v.data BETWEEN '2023-01-01' AND '2023-12-31' AND
	  e.tipo IN('Show')
GROUP BY c.nome

drop view Compras_Show

SELECT nome, qtd
FROM Compras_Show
WHERE qtd > 2

-- b) mostrar aqueles que não haviam comprado ingressos


-- c)
SELECT c.nome, v.valor
FROM Clientes c JOIN Vendas v ON c.idCliente = v.idCliente
WHERE v.data BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY c.nome, v.valor
HAVING v.valor > (SELECT AVG(valor) FROM Vendas)

-- d)
CREATE VIEW evento_mais_vendido AS
SELECT e.titulo AS 'titulo', count(*) as 'qtd'
FROM Vendas v JOIN Ingressos i ON v.idIngresso = i.idIngresso JOIN Eventos e ON i.idEvento = e.idEvento
GROUP BY e.titulo

SELECT titulo
FROM evento_mais_vendido
WHERE qtd = (SELECT MAX(qtd) FROM evento_mais_vendido)
-- houve um empate

-- e)
CREATE VIEW at_shows AS
SELECT e.local as 'locais', e.cidade as 'cidades', count(*) as qtd
FROM Eventos e JOIN Shows s ON s.idShow = e.idEvento
GROUP BY e.local, e.cidade

SELECT e.local, e.cidade
FROM at_shows, Eventos e
WHERE qtd = 0

-- f)
CREATE VIEW jogos_por_cidade AS
SELECT e.cidade,  count(*) as qt_jogos, sum(v.valor) as valor_arrecadado
FROM Eventos e JOIN Ingressos i ON e.idEvento = i.idEvento JOIN Vendas v ON v.idIngresso = i.idIngresso
GROUP BY e.tipo, e.cidade, e.dataHora
HAVING e.tipo IN('Jogo') AND
	   e.dataHora BETWEEN '2020-01-01 00:00:00' AND '2024-12-31 23:59:59'

drop view jogos_por_cidade

SELECT jogos_por_cidade.*
FROM jogos_por_cidade
WHERE jogos_por_cidade.valor_arrecadado > 200

-- g)
CREATE PROCEDURE infClientesCompArtista @nomeArtista varchar(80)
AS
BEGIN
	SELECT c.nome, c.CPF
	FROM Vendas v JOIN Ingressos i ON v.idIngresso = i.idIngresso JOIN Eventos e ON e.idEvento = i.idEvento JOIN Clientes c ON c.idCliente = v.idCliente JOIN Shows s ON s.idShow = e.idEvento
	WHERE s.artista = @nomeArtista
END

EXEC infClientesCompArtista 'Djavan'

-- h)
CREATE PROCEDURE IngressosPorAno @ano char(4)
AS
BEGIN
	SELECT c.nome, i.setor, e.titulo
	FROM Clientes c JOIN Vendas v ON c.idCliente = v.idCliente JOIN Ingressos i ON v.idIngresso = i.idIngresso JOIN Eventos e ON e.idEvento = i.idEvento
	WHERE DATEPART(YEAR, e.dataHora) = @ano
	ORDER BY e.titulo
END

EXEC IngressosPorAno 2022
