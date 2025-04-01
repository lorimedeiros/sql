CRIAÇÃO DE TABELAS
CREATE DATABASE NomeDB
    
CREATE TABLE Cliente(
   id int not null identity,
   RG char(6), not null,
   nome varchar(80) not null,
   tipo char(2) not null,
   primeiraCompra numeric(6,2),
   anoEntrada int,
   dataEntrada datetime
   fornecedor varchar(10) not null DEFAULT "Filial",

   CONSTRAINT pk_Cliente PRIMARY KEY(id),
   CONSTRAINT un_Cliente_RG UNIQUE(RG),
   CONSTRAINT ck_Cliente_Tipo CHECK (tipo IN ('PF','PJ')),
   CONSTRAINT ck_Cliente_PrimeiraCompra CHECK (primeiraCompra > 0),
)

-- explicando a bagaça:
1 - palavra 'IDENTITY':
     Ela significa que os valores serão automaticamente gerados (começados pelo valor 1), é a chamada coluna auto incremento.
     A ausência dela implica que o próprio usuário terá que colocar esses valores. Por exemplo, se a chave for um CPF, um CPF não pode ser 1, emtão digitamos
     1.1 Também pode ser informados parâmetros inicio e incremento para ela, ex:
            id int not null identity(100,5) --começa em 100 e aumenta de 5 em 5
            Dessa forma a sequência de chaves será 100, 105, 110, 115...

2 - qtMax caracteres/parâmetros
      Em char(6) informamos que a qt máxima (e fixa, por ser char) de caracteres é (exatamente) 6.
      Já em primeiraCompra numeric(p,s) (em outros bancos de dados pode ser decimal), temos p(precision): total de digitos (incluindo os decimais), s(scale): número de dígitos após a vírgula.
      Exemplos de numeric:
      numeric(6,2)
          • 1234.56
          • 100.00
          • -500.50
          • -5000.50 (o sinal não ocupa espaço)
     numeric(4,1)
          • 123.4
          • 99.9
          • -456.7

3 - quando não colocamos not null o atributo pode sim ser vazio.

4 - DEFAULT implica que, caso não informado, o valor será aquele.

5 - São postos no fim:
     PRIMARY KEY
     FOREIGN KEY
     UNIQUE
     CHECK

-- lembrar sempre de setar data e usar a base certa, ex:
USE NomeBD
SET DATEFORMAT YMD

Inserção de dados:
• Modelos:

   Direto:
   INSERT INTO Clientes VALUES('123456','Ze Xibata','PF',null,null,null,DEFAULT)
 
   Especificando coluna:
   INSERT INTO Tipo (codigo, nome) VALUES(2, 'Tecidos')

   Múltiplos:
   INSERT INTO Tipo (codigo, nome) VALUES
   (2, 'Tecidos')
   (1, 'Móveis')
   (3, 'Eletro')
