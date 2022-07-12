# Split-Apply-Combine - plyr
install.packages("plyr")
install.packages("gapminder")

library(plyr)
library(gapminder)

?ddply
# Split-Apply-COmbine
df <- ddply(gapminder, ~ continent,
            summarize,
            max_le = max(lifeExp))
str(df)
levels(df$continent)
head(df)


#SPlit-Apply-Combine
ddply(gapminder, ~ continent,
      summarize,
      n_uniq_countries= length(unique(country)))

ddply(gapminder, ~ continent,
      function(x) c(n_uniq_countries = length(unique(x$country))))

ddply(gapminder, ~ continent, 
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))

# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)

# Trabalhando com um subset do dataset
data <- mpg[ ,c(1,7:9)]
str(mpg)

# Sumarizando e Agregando Dados
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))

# Várias funções em uma única chamada
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))

# Sumarizando os dados pela combinação da variáveis/fatores
ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))

# Perceba a diferença entre summarize e transform
ddply(data, .(drv), summarize, avgcty = mean(cty))
ddply(data, .(drv), transform, avgcty = mean(cty))
