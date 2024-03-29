# RProfiler

a <- c(1, 2, 3)
b <- c(4, 5, 6)

# Iniciando o profile
?Rprof
Rprof("debug.txt")
df= data.frame(a, b)
df

# C�digo que n�o deve fazer parte do profile
Rprof(NULL)
str(df)

# Interrompendo o profile
Rprof()

# Sumarizando os resultados
summaryRprof("debug.txt")

# Utilizando um arquivo tempor�rio
Rprof(tmp <- tempfile())
example(glm)
Rprof()
summaryRprof(tmp)

install.packages("profr")
library(profr)
library(ggplot2)

x = profr(example(glm))
ggplot(x)
