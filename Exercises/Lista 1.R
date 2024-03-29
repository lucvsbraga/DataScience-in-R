# Lista de Exerc�cios 1

# Exerc�cio 1 - Crie um vetor com 12 n�meros inteiros
vetor <- c(1:12)



# Exerc�cio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com n�meros inteiros
matriz <- matrix(c(1 ,2, 3, 4,
                 4, 5, 2, 1,
                 3, 4, 7, 9,
                 2, 8, 1, 6), nrow = 4, ncol =4)
matriz



# Exerc�cio 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista <- list(vetor, matriz)
lista



# Exerc�cio 4 - Usando a fun��o read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
head(df)



# Exerc�cio 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df) = c("config", "esfc", "chang")
head(df)



# Exerc�cio 6 - Imprima na tela o dataframe iris, verifique quantas dimens�es existem no dataframe iris, imprima um resumo do dataset
iris
class(iris)
dim(iris)
summary(iris)
str(iris)



# Exerc�cio 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)



# Exerc�cio 8 - Usando as fun��o subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a fun��o subset()
iris1 <- subset(iris, Sepal.Length > 7)
iris1



# Exerc�cio 9 - Crie um dataframe que seja c�pia do dataframe iris e usando a fun��o slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: voc� vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a fun��o slice()
library(dplyr)
iris2 <- iris
slice(iris2, 1:15)



# Exerc�cio 10 - Use a fun��o filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a fun��o filter
filter(iris2, Sepal.Length > 7)
