# Análise Exloratória de Dados

# Carregando o pacote readr
library(readr)
getwd()
# Carregando o dataset
carros <- read_csv("C:/Users/Lucas/Documents/R/DataSets/carros-usados.csv")

# Resumo dos dados
head(carros)
str(carros)

# Medidas de Tendência Central
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])


## Explorando variáveis numéricas

# Usando as funções
mean(carros$preco)
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99))
quantile(carros$preco, seq( from = 0, to = 1, by = 0.20))
IQR(carros$preco) #Diferença entre Q3 e Q1
range(carros$preco)
diff(range(carros$preco))


# Plot

# Boxplot
# Leitura de Baixo para Cima - Q1, Q2 (Mediana) e Q3
boxplot(carros$preco, main = 'Boxplot para os preços de carros usados', ylab = "Preço (R$)")
boxplot(carros$kilometragem, main = "Boxplot para a Km de Carros Usados", ylab = "Kilometragem (R$)")

# Histograma
# Indicam a frequência de valores dentro de cada bin(Classes de Valores)
hist(carros$preco, main = 'Histograma para os Preços de Carros Usados', xlab = 'Preço (R$)')
hist(carros$kilometragem, main = 'Histograma para a Km de Carros Usados', ylab = "Kilometragem (KM)")
hist(carros$kilometragem, main = 'Histograma para a Km de Carros Usados', breaks = 5, ylab = "Kilometragem (KM)")


# Scatterplot Preço x Km
# Usando o preço como variável dependente (y)
plot(x = carros$kilometragem, y = carros$preco,
     main = "Scatterplot Preço x Km",
     xlab = "Kilometragem",
     ylab = "Preço (R$)")


# Medidas de Dispersão
# Ao interpretar a variância, números maiores indicam que 
# os dados estão espalhados mais amplamente em torno da 
# média O desvio padrão indica, em média, a quantidade 
# de cada valor diferente da média
var(carros$preco)
sd(carros$preco)
var(carros$kilometragem)
sd(carros$kilometragem)


## Explorando variáveis categóricas

# Criando tabelas de contingência - representam uma unica variável categórica
# Lista as categorias das variáveis nominais
?table
str(carros)
table(carros$cor)
table(carros$modelo)
str(carros)

# Calculando a porporção de cada categoria
model_table <- table(carros$modelo)
prop.table(model_table)

# Arrendondando os valores
model_table <- table(carros$modelo)
model_table <- prop.table(model_table) * 100
round(model_table, digits = 1)

# Criando uma nova variável indicando cores conservadoras 
# (que as pessoas compram com mais frequência)
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

# Qui Quadrado, simbolizado por Ï‡2 eh um teste de 
# hipóteses que se destina a encontrar um valor da 
# dispersão para duas variáveis nominais, avaliando a 
# associação existente entre variáveis qualitativas.

# Eh um teste não paramétrico, ou seja, não depende dos 
# parâmetros populacionais, como média e variância

# O princípio básico deste método eh comparar proporções, 
# isto eh, as possíveis divergências entre as frequências 
# observadas e esperadas para um certo evento.
# Evidentemente, pode-se dizer que dois grupos se 
# comportam de forma semelhante se as diferenças entre 
# as frequências observadas e as esperadas em cada 
# categoria forem muito pequenas, próximas a zero.

# Ou seja, Se a probabilidade eh muito baixa, ele fornece 
# fortes evidencias de que as duas variáveis estão associadas.

CrossTable(x = carros$modelo, y = carros$conserv, chisq = TRUE)
chisq.test(x = carros$modelo, y = carros$conserv)


# Trabalhamos com 2 hipóteses:
# Hipótese nula: As frequências observadas não são diferentes das frequências esperadas.
# Não existe diferença entre as frequências (contagens) dos grupos.
# Portanto, não ha associação entre os grupos
# Hipótese alternativa: As frequências observadas são diferentes da frequências esperadas, 
# portanto existe diferença entre as frequências
# Portanto, ha associação entre os grupos.


# Neste caso, o valor do Chi = 0.15  
# E graus de liberdade (df) = 2
# Portanto, não ha associação entre os grupos
# O valor alto do p-value confirma esta conclusão