-- a) Qual o nome do funcionário mais novo?
SELECT nome
FROM Funcionario
WHERE datanasc = (SELECT MAX(datanasc) FROM Funcionario)

-- b) Mostre os nomes dos produtos que foram comprados no pedido mais recente.
SELECT pro.nome
FROM Produto pro JOIN Itens i ON pro.codigo = i.produto 
	JOIN Pedido pe ON pe.codigo = i.pedido
WHERE pe.dataPedido = (SELECT MAX(dataPedido) FROM Pedido)

-- c) Quais os nomes e salários dos funcionários do sexo masculino que realizaram pedidos no ano de 2020 e 2021?
SELECT f.nome, f.salario
FROM Funcionario f JOIN Pedido p ON f.codigo = p.vendedor
WHERE p.dataPedido BETWEEN '2020-01-01' AND '2021-12-31' AND
	f.sexo = 'M'

-- d) Quais os nomes dos produtos que foram comprados por clientes pessoa física no ano de 2022?
SELECT pro.nome
FROM Produto pro JOIN Itens i ON pro.codigo = i.produto 
	JOIN Pedido pe ON pe.codigo = i.pedido
	JOIN Cliente c ON c.codigo = pe.cliente
WHERE c.tipo = 'PF' AND
	pe.dataPedido BETWEEN '2022-01-01' AND '2022-12-31'

-- e) Exiba os nomes dos clientes que realizaram pedidos no ano de 2014 ou no ano de 2016.
SELECT DISTINCT c.nome
FROM Cliente c JOIN Pedido p ON c.codigo = p.cliente
WHERE p.dataPedido BETWEEN '2014-01-01' AND '2014-12-31' OR
	p.dataPedido BETWEEN '2016-01-01' AND '2016-12-31'

-- e.2 (maneira mais eficiente de fazer)
SELECT DISTINCT c.nome
FROM Cliente c 
JOIN Pedido p ON c.codigo = p.cliente
WHERE YEAR(p.dataPedido) IN (2014, 2016)

-- f) Exiba os nomes das cidades que possuem clientes que realizaram pedidos em 2023.
SELECT DISTINCT cid.nome
FROM Pedido p JOIN Cliente c ON p.cliente = c.codigo
	JOIN Cidade cid ON c.cidade = cid.codigo
WHERE YEAR(p.dataPedido) = 2023

-- g) Mostre as datas dos pedidos que tiveram produtos com preço de venda maior que R$ 200 e do tipo Cama(4) ou Eletro(6).
SELECT DISTINCT pe.dataPedido
FROM Produto pro JOIN Itens i ON pro.codigo = i.produto 
	JOIN Pedido pe ON pe.codigo = i.pedido
WHERE pro.tipo IN(4,6) AND
	pro.venda > 200

-- h) Quais os distintos nomes dos produtos vendidos cujo preço de venda seja maior do que a média dos preços de vendas dos produtos.
SELECT DISTINCT p.nome
FROM Produto p
WHERE p.venda > (
    SELECT AVG(venda) 
    FROM Produto
)
