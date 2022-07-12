# Big Data na Prática 1 - Temperatura Média nas Cidades Brasileiras

# Dataset:
# Berkeley Earth
# http://berkeleyearth.org/data
# TemperaturasGlobais.csv ~ 78 MB (zip) ~ 496 MB (unzip)

# Instalando e Carregando Pacotes
install.packages("readr")
install.packages("data.table")
install.packages("ggplot2")
install.packages("scales")
install.packages("dtplyr")
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

# Carregando os dados (Usando um timer para comparar o tempo de carregamento)

#Usando o read.csv2()
system.time(df_teste1 <- read.csv2("C:/Users/Lucas/Documents/DataSets/TemperaturasGlobais.csv"))
getwd()


# Usando o read.table()
system.time(df_teste2 <- read.table("C:/Users/Lucas/Documents/DataSets/TemperaturasGlobais.csv"))


#Usando o fread()
?fread
system.time(df <- fread("C:/Users/Lucas/Documents/DataSets/TemperaturasGlobais.csv"))



# Criando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)


# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)


# Carregandos os subsets

# Sete Lagoas
seteLagoas <- subset(cidadesBrasil, City == 'Sete Lagoas')
head(seteLagoas)
seteLagoas <- subset(seteLagoas, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Belo Horizonte
bh <- subset(cidadesBrasil, City == 'Belo Horizonte')
bh <- subset(bh, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Recife
rcf <- subset(cidadesBrasil, City == 'Recife')
rcf <- subset(rcf, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Construindo os Plots
p_seteLagoas <-
  ggplot(seteLagoas, aes(
    x = (Month),
    y = AverageTemperature,
    color = as.factor(Year)
  )) + geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) + xlab("Mês") + ylab("Temperatura Média") + scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Sete Lagoas") + theme(plot.title = element_text(size = 18))

p_bh <-
  ggplot(bh, aes(
    x = (Month),
    y = AverageTemperature,
    color = as.factor(Year)
  )) + geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) + xlab("Mês") + ylab("Temperatura Média") + scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Belo Horizonte") + theme(plot.title = element_text(size = 18))

p_rcf <-
  ggplot(rcf, aes(
    x = (Month),
    y = AverageTemperature,
    color = as.factor(Year)
  )) + geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) + xlab("Mês") + ylab("Temperatura Média") + scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Recife") + theme(plot.title = element_text(size = 18))



# Plotando
p_seteLagoas
p_bh
p_rcf
