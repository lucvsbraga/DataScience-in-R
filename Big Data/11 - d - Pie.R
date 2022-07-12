# Gráficos de Pizza

# Criando as fatias
fatias = c(40, 20 ,40)

# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias
paises = (paste(paises, fatias))

# to further especify the labels
paises = paste(paises, "%", sep = "")


# Construindo um gráfico
pie(fatias,  labels = paises, col=c("darksalmon", "gainsboro", "lemonchiffon4"), main = "Distribuição de Vendas")


# Trabalhando com dataframes
attach(iris)
Values = table(Species)
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies")

# 3D
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.05, col = c("steelblue1", "tomato2", "tan3"), main = "Distribuição de Vendas")
