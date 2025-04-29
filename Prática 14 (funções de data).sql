-- extrai o ano do nascimento dos clientes
SELECT YEAR(data_nascimento) AS ano_nascimento
FROM clientes;

-- função datepart (uma parte da data, como o year mas para outras partes):
-- Extrair o ano
SELECT DATEPART(YEAR, GETDATE()) AS ano_atual;

-- Extrair o mês
SELECT DATEPART(MONTH, GETDATE()) AS mes_atual;

-- Extrair o dia
SELECT DATEPART(DAY, GETDATE()) AS dia_atual;

-- Extrair o trimestre
SELECT DATEPART(QUARTER, GETDATE()) AS trimestre_atual;

-- Extrair o dia da semana (1=Domingo, 2=Segunda, etc.)
SELECT DATEPART(WEEKDAY, GETDATE()) AS dia_da_semana;

-- data e hora atual
SELECT GETDATE() AS data_hora_atual;

-- Adicionar 10 dias à data atual
SELECT DATEADD(DAY, 10, GETDATE()) AS daqui_a_10_dias;

-- Adicionar 3 meses
SELECT DATEADD(MONTH, 3, GETDATE()) AS daqui_a_3_meses;

-- Diferença em dias entre duas datas
SELECT DATEDIFF(DAY, '2023-01-01', '2023-01-31') AS diferenca_dias;

-- Diferença em meses
SELECT DATEDIFF(MONTH, '2023-01-15', '2023-04-20') AS diferenca_meses;

-- extrair dia e mês
SELECT 
    DAY(GETDATE()) AS dia_atual,
    MONTH(GETDATE()) AS mes_atual;

-- Converter data para formato brasileiro
SELECT CONVERT(VARCHAR, GETDATE(), 103) AS data_brasileira;

-- Converter para formato ANSI
SELECT CONVERT(VARCHAR, GETDATE(), 102) AS data_ansi;
