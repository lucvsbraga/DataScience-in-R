# Web Scraping

# Pacotes R para Web Scraping
# RCurl
# httr
# XML
# rvest

# Pacote rvest - útil para quem não conhece HTML e CSS
install.packages('rvest')
library(rvest)

# Coletando a url do filme: Homem-Aranha - Sem Volta Para Casa
?read_html
filme <- read_html("https://www.imdb.com/title/tt10872600/")
class(filme)
head(filme)

# Coletando a classificação do filme
?html_node
?html_text

filme %>%
  html_node(".AggregateRatingButton__RatingScore-sc-1ll29m0-1") %>%
  html_text() %>%
  as.numeric()

sinopse <- read_html("https://www.imdb.com/title/tt10872600/") %>%
  html_nodes(".GenresAndPlot__TextContainerBreakpointXL-sc-cum89p-2") %>%
  html_text()

sinopse

# Coletando o elenco do filme
filme %>%
  html_nodes(".ipc-metadata-list-item__content-container") %>%
  html_text()

# Formatando os dados de uma página da web
library(rvest)
library(stringr)
library(tidyr)

# Extraindo a página web
url <- "http://www.espn.com/nfl/superbowl/history/winners"
pagina <- read_html(url)

# Etraindo a tag "table do código html e convertendo para dataset
tabela <- html_nodes(pagina, "table")
class(tabela)
tab <- html_table(tabela)[[1]]
head(tab)

# Removendo as duas primeiras linhas e adicionando nomes as colunas
tab <- tab[-(1:2), ]
head(tab)
names(tab) <- c("Número", "Data", "Local", "Resultado")
head(tab)
tail(tab)

# Convertendo de algarismo romano para número inteiro
tab$Número <- 1:56
tab$Data <- as.Date(tab$Data, "%B. %d, %Y")
head(tab)

# Dividindo as colunas em 4 colunas
tab <- separate(tab, Resultado, c('winner', 'loser'), sep =", " , remove = TRUE)
head(tab)                

pattern <- " \\d+$"
tab$winnerScore <- as.numeric(str_extract(tab$winner, pattern))
tab$loserScore <- as.numeric(str_extract(tab$loser, pattern))
tab$winner <- gsub(pattern, "", tab$winner)
tab$loser <- gsub(pattern, "", tab$loser)
head(tab)

# Grava o resultado no arquivo csv
write.csv(tab, 'superbowl.csv', row.names = F)
dir()
