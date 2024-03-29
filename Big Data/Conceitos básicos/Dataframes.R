### DataFrames

#Similar a matrizes, por�m cada coluna pode possuir elementos de natureza diferente


# Criando um dataframe vazio
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
datas <- as.Date(character())
codigos <- integer()

df <- data.frame(c(nomes, idades, datas, codigos))
df

# Criando vetores
pais = c("EUA", "Dinamarca", "Holanda", "Espanha", "Brasil")
nome = c("Maur�cio", "Pedro", "Aline", "Beatriz", "Marta")
altura = c(1.78, 1.72, 1.63, 1.59, 1.63)
codigo = c(5001, 2183, 4702, 7965, 8890)

# Criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c("verde", "azul", "azul", "castanho", "castanho")
pesq = cbind(pesquisa, olhos)
pesq

# INforma��es sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)


#Obtendo um vetor de um dataframe
pesq$pais
pesq$nome

# Extraindo um �nico valor
pesq[1,1]
pesq[3,2]


# N�mero de Linhas e Colunas
nrow(pesq)
ncol(pesq)

# Primeiros elementos do dataframe
head(pesq)
head(mtcars)

# �ltimos elementos do dataframe
tail(pesq)
tail(mtcars)

# Data frames built-in do R
?mtcars
mtcars

# Filtro para um subset de dados que atendem � um crit�rio
pesq[altura < 1.60,]
pesq[altura < 1.60, c('codigo', 'olhos')]
pesq


# Dataframes NOmeados
names(pesq) <- c("Pa�s", "Nome", "Altura", "C�digo", "Olhos")
pesq

colnames(pesq) <- c("Var 1", "Var 2", "Var 3", "Var 4", "Var 5")
rownames(pesq) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
pesq


# Importando arquivos
# read.xls() - Excel
# read.mtp() - Minitab
# read.spss - SPSS
# read.table() - Arquivos txt
# read.csv() - Arquivos csv
# read.delim() - Leitura de arquivos delimitados

summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)


# Combinando dataframes
df3 <- merge(pesq, df2)
df3
