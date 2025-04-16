-- Crie uma view chamada vw_produtos_estoque_baixo que mostre todos os produtos com quantidade em estoque abaixo do estoque mínimo. Deve incluir: código, nome, quantidade em estoque e estoque mínimo.
CREATE VIEW vw_produtos_estoque_baixo AS
SELECT codigo, nome, quantest as qt_em_estoque, estmin as estoque_minimo
FROM Produto
WHERE quantest < estmin;

SELECT * FROM vw_produtos_estoque_baixo;

-- Crie uma view chamada vw_vendas_por_cliente que mostre o total gasto por cada cliente, ordenado do maior para o menor valor. Inclua: nome do cliente e valor total gasto.
CREATE VIEW vw_vendas_por_cliente AS
SELECT c.nome as Cliente, SUM(i.quant * i.preco) as Total_Gasto
FROM Cliente c JOIN Pedido p ON c.codigo = p.cliente JOIN Itens i ON i.pedido = p.codigo
GROUP BY c.codigo, c.nome
ORDER BY Total_Gasto DESC;

SELECT * FROM vw_vendas_por_cliente;

-- Crie uma view chamada vw_produtos_mais_vendidos que mostre os 5 produtos mais vendidos em quantidade, com: código do produto, nome e quantidade total vendida.
CREATE VIEW vw_produtos_mais_vendidos AS
SELECT p.codigo, p.nome, SUM(i.quant) AS quantidade_total_vendida
FROM Itens i JOIN Produto p ON i.produto = p.codigo
GROUP BY p.codigo, p.nome
ORDER BY quantidade_total_vendida DESC
LIMIT 5;

SELECT * FROM vw_produtos_mais_vendidos;

-- Crie uma stored procedure chamada sp_atualiza_estoque que receba o código do produto e a quantidade vendida, atualizando o estoque do produto.
DELIMITER //
CREATE PROCEDURE sp_atualiza_estoque(
    IN p_codigo_produto INT,
    IN p_quantidade_vendida INT
)
BEGIN
    UPDATE Produto 
    SET quantest = quantest - p_quantidade_vendida 
    WHERE codigo = p_codigo_produto;
    
    SELECT 'Estoque atualizado com sucesso' AS mensagem;
END //
DELIMITER ;

CALL sp_atualiza_estoque(1, 5);  -- Diminui 5 unidades do produto com código 1

-- Crie uma stored procedure chamada sp_relatorio_vendas_periodo que receba duas datas (início e fim) e retorne todas as vendas realizadas nesse período, com: data do pedido, nome do cliente e valor total.
DELIMITER //
CREATE PROCEDURE sp_relatorio_vendas_periodo(
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    SELECT 
        p.codigo AS pedido,
        p.dataPedido AS data_pedido,
        c.nome AS cliente,
        SUM(i.quant * i.preco) AS valor_total
    FROM 
        Pedido p
        JOIN Cliente c ON p.cliente = c.codigo
        JOIN Itens i ON p.codigo = i.pedido
    WHERE 
        p.dataPedido BETWEEN p_data_inicio AND p_data_fim
    GROUP BY 
        p.codigo, p.dataPedido, c.nome
    ORDER BY 
        p.dataPedido;
END //
DELIMITER ;

CALL sp_relatorio_vendas_periodo('2023-01-01', '2023-12-31');

-- Crie uma stored procedure chamada sp_cadastra_cliente que receba todos os dados necessários para cadastrar um novo cliente, verificando antes se o CPF já existe.
DELIMITER //
CREATE PROCEDURE sp_cadastra_cliente(
    IN p_nome VARCHAR(50),
    IN p_tipo CHAR(2),
    IN p_contato VARCHAR(30),
    IN p_cargo VARCHAR(30),
    IN p_endereco VARCHAR(50),
	IN p_cidade INT,
    IN p_cep VARCHAR(8),
    IN p_fone VARCHAR(16),
    IN p_fax VARCHAR(50),
    IN p_obs text
)
BEGIN
    DECLARE cliente_existe INT;
    
    SELECT COUNT(*) INTO cliente_existe FROM Cliente WHERE fone = p_fone;
    
    IF cliente_existe = 0 THEN
        INSERT INTO Cliente (
            nome, tipo, contato, cargo, endereco, 
            cidade, cep, fone, fax, obs
        ) VALUES (
            p_nome, p_tipo, p_contato, p_cargo, p_endereco,
            p_cidade, p_cep, p_fone, p_fax, p_obs
        );
        
        SELECT 'Cliente cadastrado com sucesso' AS mensagem;
    ELSE
        SELECT 'Erro: Cliente já cadastrado' AS mensagem;
    END IF;
END //
DELIMITER ;

CALL sp_cadastra_cliente(
    'Lori', 'PF', 'Lori', 'Estudante', 'R. Rejane, 22',
    '1', '58280-000', '9186-2052', null, null
);

-- Crie uma stored procedure chamada sp_aplica_desconto_categoria que receba o código do tipo de produto e um percentual de desconto, aplicando esse desconto a todos os produtos da categoria.
DELIMITER //
CREATE PROCEDURE sp_aplica_desconto_categoria(
    IN p_codigo_tipo INT,
    IN p_percentual_desconto DECIMAL(5,2)
)
BEGIN
    UPDATE Produto
    SET venda = venda * (1 - (p_percentual_desconto/100))
    WHERE tipo = p_codigo_tipo;
    
    SELECT CONCAT('Desconto de ', p_percentual_desconto, '% aplicado aos produtos da categoria') AS mensagem;
END //
DELIMITER ;

CALL sp_aplica_desconto_categoria(2, 10.00);  -- 10% de desconto nos produtos do tipo 2
