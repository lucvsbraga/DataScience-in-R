# Big Data na Prática - Mapeando Áreas de Crimes

install.packages("downloader")
library(ggmap)
library(ggplot2)
library(downloader)

# Download e unzip do arquivo
url <- "http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/crimes.zip"
arquivo <- "crimes.zip"
download(url, arquivo)
unzip("crimes.zip")

# Criando o dataframe
df <- read.csv("C:/Users/Lucas/Documents/R/Datasets/crimes.txt")
head(df)
str(df)
dim(df)
dfReduzido <- head(df)
dfReduzido

# Criando o plot
mapa <- qmap("seattle", zoom = 11, source = "stamen",
             maptype = "toner", darken =c(.3, "#BBBBBB"))
mapa

# Mapeando os dados
mapa + geom_point(data = dfReduzido, aes (x = Longitude, y = Latitude))

# Mapeando os dados e ajustando a escala
mapa + geom_point(data = dfReduzido, aes (x = Longitude, y = Latitude),
                  color = "dark green", alpha = .03, size = 1.1)
