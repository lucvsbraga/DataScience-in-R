# Pacotes e Instala��o de Pacotes

# De onde vem as fun��es? Pacotes (conjuntos de fun��es)
# Quando voc� inicia o RStudio, alguns pacotes s�o carregados por padr�o.

search()

install.packages("tm")
library(ggvis)
library(tm)
library(dplyr)

search()
?requiredetach(package:dplyr)
?attach

ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = TRUE)

lsf.str("package:tm")
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2")

## R possui um conjunto de datasets preinstalados.

library(MASS)
data()
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length > 5.1
sum(Sepal.Length)

attach(iris)
sum(Sepal.Length)
