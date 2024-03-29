# Big Data na Pr�tica - Buscando Dados para An�lise Financeira

#htt://www.quantmod.com

# INstalar e carregar os pacotes
install.packages("quantmod")
install.packages("xts")
install.packages("moments")
library(quantmod, xts)
library(moments)


# Sele��o do per�odo de an�lise
startDate = as.Date("2021-06-21")
endDate = as.Date("2022-02-23")

# Download dos dados do per�odo
?getSymbols
getSymbols("PETR4.SA", src = "yahoo", from = startDate, to = endDate)


# Checando o tipo de dado retornado
class(PETR4.SA)
is.xts(PETR4.SA)


# Mostra os primeiros registros para as a��es da Petrobras
head(PETR4.SA)

# Analisando os dados de fechamento
PETR4.SA.Close <- PETR4.SA[, "PETR4.SA.Close"]
is.xts(PETR4.SA.Close)
?Cl
head(Cl(PETR4.SA), 5)


# Agora, vamos plotar o gr�fico da Petrobras
# Gr�fico de canclestick da Petrobras
candleChart(PETR4.SA)

# Plot de fechamento
plot(PETR4.SA.Close, main = "Fechamento Di�rio das A��es Petrobras", col = "red",
     xlab = "Data", ylab = "Pre�o", major.ticks = 'month',
     minor.ticks = FALSE)

# Adicionado as bandas de bollinger ao gr�fico, com m�dia de 20 per�odos e 2 desvios
# Bollinger Band
# Como o desvio padr�o � uma medida de volatilidade, 
# Bollinger Bands ajustam-se �s condi��es de mercado. Mercados mais vol�teis, 
# possuem as bandas mais distantes da m�dia, enquanto mercados menso vol�teis possuem as
# bancas mais pr�ximas da m�dia.
?addBBands
addBBands(n = 20, sd = 2)


# Adicionando o indicador ADX, m�dia 11 do tipo exponencial
addADX(n = 11, maType = "EMA")

# Calculando logs di�rios
?log
PETR4.SA.ret <- diff(log(PETR4.SA.Close), lag = 1)

# Remove valores NA na posi��o 1
PETR4.SA.ret <- PETR4.SA.ret[-1]

# Plotar a taxa de retorno
plot(PETR4.SA.ret, main = "Fechamento Di�rio das A��es da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno", major.ticks = 'months',
     minor.ticks = FALSE)

# Calculando algumas medidas estat�sticas
statNames <- c("Mean", "Standard Deviation", "Skewness", "Kurtosis")
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statNames
PETR4.SA.stats

# Salvando os dados em um arquivo .rds (arquivo em formato bin�rio do R)
getSymbols("PETR4.SA", src = 'yahoo')
saveRDS(PETR4.SA, file = "PETR4.SA.rds") # Salva os dados em formato bin�rio
Ptr = readRDS("PETR4.SA.rds")
dir()
head(Ptr)