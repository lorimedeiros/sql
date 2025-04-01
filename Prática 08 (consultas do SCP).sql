-- a)  Exibir código, nome, preço de custo, preço de venda e a diferença entre estes dois preços para todos os produtos.
SELECT Produto.codigo, Produto.nome, Produto.custo, Produto.venda, 
(Produto.venda - Produto.custo)
FROM Produto

-- b) Mostre todos os pedidos realizados no ano de 2009.
SELECT *
FROM Pedido
WHERE Pedido.dataPedido BETWEEN '01/01/2009' AND '31/12/2009'

-- c) Mostre quantos funcionários tem e-mail
SELECT COUNT(*)
FROM Funcionario
WHERE Funcionario.email IS NOT NULL

-- d) Exibir código e nome de todos os funcionários que tenham “Silva” em qualquer parte do nome
SELECT Funcionario.codigo, Funcionario.nome
FROM Funcionario
WHERE Funcionario.nome LIKE '%Silva%'

-- e) Mostre os produtos comprados por clientes pessoa jurídica.
SELECT DISTINCT Produto.*
FROM Produto, Itens, Pedido, Cliente
WHERE Pedido.cliente = Cliente.codigo AND
	  Itens.pedido = Pedido.codigo AND
	  Itens.produto = Produto.codigo AND
	  Cliente.tipo = 'PJ'

-- f) Mostre os nomes e as cidades que nasceram os funcionários que realizaram pedidos de Liquidificador.
SELECT DISTINCT Funcionario.nome, Cidade.nome
FROM Funcionario, Pedido, Itens, Produto, Cidade
WHERE Funcionario.codigo = Pedido.vendedor AND
	  Itens.pedido = Pedido.codigo AND
	  Itens.produto = Produto.codigo AND
	  Cidade.codigo = Funcionario.naturalidade AND
	  Produto.codigo = 5
	  
-- g) Exiba nome e tipo dos clientes que foram atendidos por funcionários que não moram no Bessa nem em Manaíra.
SELECT DISTINCT Cliente.nome, Cliente.tipo
FROM Funcionario, Cliente, Pedido
WHERE Pedido.cliente = Cliente.codigo AND
	  Pedido.vendedor = Funcionario.codigo AND
	  Funcionario.bairro NOT IN ('Bessa', 'Manaíra')

-- ESSA SEGUNDA FORMA NÃO É RECOMENDADA POIS ESTÁ USANDO OR (NÃO É BOA PRÁTICA) E TAMBÉM POR USAR != (ALGUNS SGBD NÃO TEM ESSES SINAIS EM SUA SINTAXE)
SELECT DISTINCT Cliente.nome, Cliente.tipo
FROM Funcionario, Cliente, Pedido
WHERE Pedido.cliente = Cliente.codigo AND
	  Pedido.vendedor = Funcionario.codigo AND
	  (Funcionario.bairro != 'Bessa' OR
	  Funcionario.bairro != 'Manaíra')

-- h) Mostre os nomes dos funcionários que realizaram algum pedido para clientes que moram no Rio de Janeiro.
SELECT DISTINCT Funcionario.nome
FROM Funcionario, Cliente, Pedido, Cidade
WHERE Pedido.cliente = Cliente.codigo AND
	  Pedido.vendedor = Funcionario.codigo AND
	  Cidade.codigo = Cliente.cidade AND
	  Cidade.nome = 'Rio de Janeiro'

-- i) Mostre nome, descrição e data da compra dos produtos comprados entre 2020 e 2022. Ordene pela data em ordem descendente.
SELECT DISTINCT Produto.nome, Produto.descricao, Pedido.dataPedido
FROM Produto, Pedido, Itens
WHERE Itens.pedido = Pedido.codigo AND
	  Itens.produto = Produto.codigo AND
	  Pedido.dataPedido BETWEEN '01/01/2020' AND '31/12/2022'
ORDER BY Pedido.dataPedido

-- j) Mostre para cada funcionário o seu nome e a quantidade de vendas realizadas.
SELECT Funcionario.nome, COUNT(Pedido.codigo)
FROM Funcionario, Pedido
WHERE Pedido.vendedor = Funcionario.codigo
GROUP BY Funcionario.nome

-- k) Mostre o nome do produto, o seu valor de venda, a quantidade vendida e a soma dos preços de venda destes produtos comprados, que possuem quantidade em estoque entre 10 e 100 itens, apenas para os produtos cuja esta soma seja maior do que R$2000,00.
SELECT Produto.nome, Produto.venda, COUNT(*), SUM(Produto.venda)
FROM Itens, Produto
WHERE Produto.codigo = Itens.produto AND
	  Produto.quantest BETWEEN '10' AND '100'
GROUP BY Produto.nome, Produto.venda
HAVING SUM(Produto.venda) > '2000'

-- l) Exibir o código do produto e a quantidade de pedidos feitos para os produtos que foram pedidos mais do que 30 vezes.
SELECT produto, COUNT(*)
FROM Itens
GROUP BY produto
HAVING COUNT(*) > 30
