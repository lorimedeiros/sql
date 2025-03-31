--OPERAÇÕES SIMPLES
SELECT AVG(valorDiaria) AS media_preco FROM Quartos
SELECT MAX(valorDiaria) FROM Quartos
SELECT MIN(valorDiaria) FROM Quartos
SELECT SUM(valorDiaria) FROM Quartos

--SELEÇÃO DE TODAS COLUNAS x SELEÇÃO DE COLUNAS ESPECIFICADAS
SELECT * FROM Hospedes
SELECT CPF, nome FROM Hospedes

SELECT COUNT(*) FROM Hospedes --(numero de hospedes)
SELECT COUNT(dataNascimento) FROM Hospedes --ira dar 9 (linhas preenchidas da coluna dataNascimento)(quantos hospedes informaram data de nascimento)

-- PALAVRA NULL
SELECT nome FROM Hospedes WHERE dataNascimento IS NULL
SELECT nome FROM Hospedes WHERE dataNascimento IS NOT NULL
  
SELECT COUNT(DISTINCT servico) FROM Solicitacoes --codigo de serviço diferente
SELECT * FROM Solicitacoes

SELECT * FROM Estadias
SELECT COUNT(hospede) FROM Estadias --QUANTIDADE DE HOSPEDES (INCLUINDO REPETIDOS) QUE TIVERAM ESTADIA, ou seja, estadias no geral
SELECT COUNT(DISTINCT hospede) FROM Estadias --QUANTIDADE DE HOSPEDES (DIFERENTES) QUE TIVERAM ESTADIA
SELECT hospede FROM Estadias
SELECT DISTINCT hospede FROM Estadias --DETALHADO

-- CONSULTAS MESCLADAS
SELECT nome 
FROM Hospedes, Estadias 
WHERE Hospedes.CPF = Estadias.hospede

SELECT h.nome
FROM Hospedes h, Estadias e --definindo apelidos para tabelas (forma de simplificar)
WHERE h.CPF = e.hospede

SELECT * FROM Quartos WHERE valorDiaria < 100 
SELECT * FROM Quartos WHERE valorDiaria > 500
SELECT * FROM Quartos WHERE valorDiaria BETWEEN 600 AND 900 --intervalo (valor ENTRE tal e tal)
SELECT * FROM quartos WHERE valorDiaria IN (700,950) --conjunto (valores que sejam exatamente 700 ou 950)

SELECT * FROM Quartos WHERE tipo = 'Standard'
SELECT * FROM Hospedes WHERE dataNascimento > '1975-01-01' AND sexo = 'F'

SELECT cpf, nome FROM hospedes WHERE nome LIKE 'M%' --hospedes com nome INICIADO em M
SELECT cpf, nome FROM hospedes WHERE nome LIKE '%Santos%' --hospedes com nome contendo Santos EM QUALQUER parte
SELECT cpf, nome FROM hospedes WHERE nome LIKE '%Santos' --hospedes com nome TERMINADO em Santos
SELECT cpf, nome FROM hospedes WHERE nome LIKE 'Mar_a%' --começado com Mar, seguido de um caractere qualquer, terminado com a, e continuando %

SELECT * FROM Estadias
SELECT nome, dataEntrada FROM Hospedes, Estadias WHERE dataEntrada BETWEEN '01-01-2024' AND '31-12-2024' --sim, ele mescla as tabelas, por isso gera 48 linhas de uma tabela com apenas 47
SELECT nome, dataEntrada FROM Hospedes, Estadias WHERE dataEntrada BETWEEN '01-01-2024' AND '31-12-2024' AND Hospedes.CPF = Estadias.hospede --agora sim, selecionadas sem repetição decorrente da mescla

-- ALTERANDO LINHAS
UPDATE Quartos
SET valorDiaria = valorDiaria + (valorDiaria*0.1) --AUMENTANDO EM 10% O VALOR DA DIÁRIA DE TODOS OS QUARTOS

UPDATE Quartos
SET valorDiaria = 260
WHERE tipo = 'Standard'

--DELETANDO DADOS
DELETE FROM Quartos --apaga todos os quartos

DELETE FROM Quartos
WHERE valorDiaria < 300

--EXCLUSÃO DE TODA TABELA
DROP TABLE Quartos

--ADIÇÃO DE ATRIBUTO
ALTER TABLE Hospedes
ADD profissao varchar(40)

--EXCLUSÃO DE ATRIBUTO
ALTER TABLE Hospedes
DROP COLUMN dataNascimento

-- *                       = mostra todos os atributos
-- atrinuto1, atributo2... = mostra apenas o(s) atributo(s) que for especificado separados por vírgula 

-- FUNÇÕES: MAX - maior valor
--          MIN - menor valor
--          AVG - média dos valores da coluna
--          SUM - soma dos valores da coluna
--          COUNT(*) - quantidade linhas da coluna 
--          COUNT(atributo) - quantidade de linhas não nulas que aquele atributo preenche
