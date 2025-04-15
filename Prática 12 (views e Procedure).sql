USE SCP
SET DATEFORMAT YMD

-- a) Crie uma view com os nomes dos produtos comprados entre janeiro e junho de 2022, e a diferença entre o seu preço de venda e custo.
CREATE VIEW ProdComp01a06de2022 AS
SELECT prod.nome, prod.venda - prod.custo AS Diferença
FROM Produto prod JOIN Itens i ON prod.codigo = i.produto JOIN Pedido ped ON ped.codigo = i.pedido
WHERE ped.dataPedido BETWEEN '2022-01-01' AND '2022-06-30'

SELECT * FROM ProdComp01a06de2022

-- b) Qual o nome do cliente que mais realizou pedidos no ano de 2018?
CREATE VIEW MaisPediu AS
SELECT c.nome AS nome, COUNT(*) qtd
FROM Cliente c JOIN Pedido p ON c.codigo = p.cliente
GROUP BY c.nome

SELECT nome
FROM MaisPediu
WHERE qtd = (SELECT MAX(qtd) FROM MaisPediu)

-- c) Crie uma Stored Procedure que, passando como parâmetro de entrada o código do funcionário, mostre todas as datas dos pedidos que foram realizados por este funcionário.
CREATE PROCEDURE PedidosRealizadosPorFunc @codigo varchar(80) 
AS
BEGIN
	SELECT p.dataPedido
	FROM Funcionario f JOIN Pedido p ON f.codigo = p.vendedor
	WHERE f.codigo = @codigo
END

EXEC PedidosRealizadosPorFunc 1

-- d) Crie uma Stored Procedure, que passando como parâmetro de entrada o código do pedido, mostre o nome do cliente que fez este pedido, o nome e o preço de venda do produto comprado e a data do pedido.
CREATE PROCEDURE ClienteRealizouPedido @codigoPedido int
AS
BEGIN
	SELECT c.nome, prod.nome, prod.venda, p.dataPedido
	FROM Cliente c JOIN Pedido p ON c.codigo = p.cliente JOIN Itens i ON i.pedido = p.codigo JOIN Produto prod ON prod.codigo = i.produto
	WHERE p.codigo = @codigoPedido
END

EXEC ClienteRealizouPedido 1

-- e) Crie uma Stored Procedure que mostre para cada funcionário passado como parâmetro de entrada, o nome da cidade e do país que ele nasceu. Passe como parâmetro de entrada o nome do funcionário.
CREATE PROCEDURE InfoFuncionario @nome varchar(80)
AS
BEGIN
	SELECT c.nome, p.nome
	FROM Funcionario f JOIN Cidade c ON f.cidade = c.codigo JOIN Pais p ON p.sigla = c.Pais
	WHERE f.nome = @nome
END

DROP PROCEDURE InfoFuncionario

EXEC InfoFuncionario 'João da Silva'

-- f) Crie uma Stored Procedure que tenha como parâmetro de entrada o nome da função, e mostre os nomes e cidades dos funcionários que exercem esta função.
CREATE PROCEDURE NomeCidadeProFuncaoFuncionario @funcao varchar(80)
AS
BEGIN
	SELECT f.nome, c.nome
	FROM Funcionario f JOIN Funcao fun ON f.funcao = fun.codigo JOIN Cidade c ON f.cidade = c.codigo
	WHERE fun.nome = @funcao
END

EXEC NomeCidadeProFuncaoFuncionario 'Vendedor'
