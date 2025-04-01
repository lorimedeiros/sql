--Consultas:

--visualização
SELECT o que eu quero
FROM onde tá o que quero
WHERE condições

--alteração de atributos
UPDATE tabela
SET atributo = valor
WHERE condição

--esvaziando tabela (ela ainda vai existir)
DELETE FROM tabela
WHERE condição

--deleção de tabela
DROP TABLE tabela

--adicionando coluna
ALTER TABLE tabela
ADD atributo + tipo + tamanho

--removendo coluna
ALTER TABLE tabela
DROP COLUMN nomeColuna

-- algumas explicações de consultas
SELECT DISTINCT --vizualizar todos que diferem (normalmente usado em tabelas que se cruzam e valores podem ser repetir ex: compra, pedido)
SUM(preco) AS soma_preco --soma de atributos + dando nome para a coluna que isso irá resultar
AVG() --média
MAX() --maior valor
MIN() --menor valor
COUNT(*) --conta de todos aqueles itens em determinada tabela
COUNT(atributo) --conta especificando atributo
COUNT(DISTINCT atributo) --conta atributos sem repetição (útil em tabelas que se cruzam)

Where atributo = 'nomeAtrib'
Where preco > 100
Where data > '2004-01-01'
Where valor in(500,600)
   Igual a 500 ou 600
Where valor between 500 and 600
   Entre 500 e 600
Where nome LIKE 'M%'
   Nome começado por M
Where nome LIKE '%M'
   Nome terminado por M
Where nome LIKE '%M%'
   M em qualquer parte do nome
Where nome LIKE 'Mar_a%'
   Nome começado com Mar, seguido de um caracter qualquer e terminado com a após esse carácter.

Where is null
Where is not null

Order by: ordena/classifica
   ASC, DESC --complementa a ordem, especificando se será decrescente ou crescente
Group by: agrupa as linhas
   Uso com funções agregadas
   Ex: SELECT sexo, count(*)
          FROM hospedes
          GROUP BY sexo
Having: usardo com group by
