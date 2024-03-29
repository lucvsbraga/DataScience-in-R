# An�lise Exlorat�ria de Dados

# Carregando o pacote readr
library(readr)
getwd()
# Carregando o dataset
carros <- read_csv("C:/Users/Lucas/Documents/R/DataSets/carros-usados.csv")

# Resumo dos dados
head(carros)
str(carros)

# Medidas de Tend�ncia Central
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])


## Explorando vari�veis num�ricas

# Usando as fun��es
mean(carros$preco)
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99))
quantile(carros$preco, seq( from = 0, to = 1, by = 0.20))
IQR(carros$preco) #Diferen�a entre Q3 e Q1
range(carros$preco)
diff(range(carros$preco))


# Plot

# Boxplot
# Leitura de Baixo para Cima - Q1, Q2 (Mediana) e Q3
boxplot(carros$preco, main = 'Boxplot para os pre�os de carros usados', ylab = "Pre�o (R$)")
boxplot(carros$kilometragem, main = "Boxplot para a Km de Carros Usados", ylab = "Kilometragem (R$)")

# Histograma
# Indicam a frequ�ncia de valores dentro de cada bin(Classes de Valores)
hist(carros$preco, main = 'Histograma para os Pre�os de Carros Usados', xlab = 'Pre�o (R$)')
hist(carros$kilometragem, main = 'Histograma para a Km de Carros Usados', ylab = "Kilometragem (KM)")
hist(carros$kilometragem, main = 'Histograma para a Km de Carros Usados', breaks = 5, ylab = "Kilometragem (KM)")


# Scatterplot Pre�o x Km
# Usando o pre�o como vari�vel dependente (y)
plot(x = carros$kilometragem, y = carros$preco,
     main = "Scatterplot Pre�o x Km",
     xlab = "Kilometragem",
     ylab = "Pre�o (R$)")


# Medidas de Dispers�o
# Ao interpretar a vari�ncia, n�meros maiores indicam que 
# os dados est�o espalhados mais amplamente em torno da 
# m�dia O desvio padr�o indica, em m�dia, a quantidade 
# de cada valor diferente da m�dia
var(carros$preco)
sd(carros$preco)
var(carros$kilometragem)
sd(carros$kilometragem)


## Explorando vari�veis categ�ricas

# Criando tabelas de conting�ncia - representam uma unica vari�vel categ�rica
# Lista as categorias das vari�veis nominais
?table
str(carros)
table(carros$cor)
table(carros$modelo)
str(carros)

# Calculando a porpor��o de cada categoria
model_table <- table(carros$modelo)
prop.table(model_table)

# Arrendondando os valores
model_table <- table(carros$modelo)
model_table <- prop.table(model_table) * 100
round(model_table, digits = 1)

# Criando uma nova vari�vel indicando cores conservadoras 
# (que as pessoas compram com mais frequ�ncia)
head(carros)
carros$conserv <- carros$cor %in% c("Preto", "Cinza", "Prata", "Branco")
head(carros)

# Checando a variavel
table(carros$conserv)

# Verificando o relacionamento entre 2 variaveis categoricas
# Criando uma crosstable 
# Tabelas de contingencia fornecem uma maneira de exibir 
# as frequencias e frequencias relativas de observacoes 
# (lembra do capitulo de Estatistica?), que sao classificados 
# de acordo com duas variaveis categoricas. Os elementos de 
# uma categoria sao exibidas atraves das colunas; 
# os elementos de outra categoria sao exibidas sobre as linhas.
install.packages("gmodels")
library(gmodels)
?CrossTable
CrossTable(x = carros$modelo, y = carros$conserv)


## Teste do Qui-quadrado

# Qui Quadrado, simbolizado por χ2 eh um teste de 
# hip�teses que se destina a encontrar um valor da 
# dispers�o para duas vari�veis nominais, avaliando a 
# associa��o existente entre vari�veis qualitativas.

# Eh um teste n�o param�trico, ou seja, n�o depende dos 
# par�metros populacionais, como m�dia e vari�ncia

# O princ�pio b�sico deste m�todo eh comparar propor��es, 
# isto eh, as poss�veis diverg�ncias entre as frequ�ncias 
# observadas e esperadas para um certo evento.
# Evidentemente, pode-se dizer que dois grupos se 
# comportam de forma semelhante se as diferen�as entre 
# as frequ�ncias observadas e as esperadas em cada 
# categoria forem muito pequenas, pr�ximas a zero.

# Ou seja, Se a probabilidade eh muito baixa, ele fornece 
# fortes evidencias de que as duas vari�veis est�o associadas.

CrossTable(x = carros$modelo, y = carros$conserv, chisq = TRUE)
chisq.test(x = carros$modelo, y = carros$conserv)


# Trabalhamos com 2 hip�teses:
# Hip�tese nula: As frequ�ncias observadas n�o s�o diferentes das frequ�ncias esperadas.
# N�o existe diferen�a entre as frequ�ncias (contagens) dos grupos.
# Portanto, n�o ha associa��o entre os grupos
# Hip�tese alternativa: As frequ�ncias observadas s�o diferentes da frequ�ncias esperadas, 
# portanto existe diferen�a entre as frequ�ncias
# Portanto, ha associa��o entre os grupos.


# Neste caso, o valor do Chi = 0.15  
# E graus de liberdade (df) = 2
# Portanto, n�o ha associa��o entre os grupos
# O valor alto do p-value confirma esta conclus�o