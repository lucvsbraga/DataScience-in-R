# Este codigo contem comandos para filtrar e plotar os dados de aluguel de bikes, dados que estao em nosso dataset
# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio

# Variavel que controla a execucao do script
Azure <- FALSE

getwd()
# Execucao de acordo com o valor da variavel Azure
if(Azure){
  restaurantes <- maml.mapInputPort(1)
  ratings <- maml.mapInputPort(2)
}else{
  restaurantes <- read.csv("C:/Users/Lucas/Documents/R/Datasets/Restaurant-features.csv")
  ratings <- read.csv('C:/Users/Lucas/Documents/R/DataSets/Restaurant-ratings.csv')
  

}

restaurantes <- restaurantes[restaurantes$franchise == 'f' & restaurantes$alcohol != 'No_Alcohol_Served',]

require(dplyr)
df <- as.data.frame(restaurantes %>%
                      inner_join(ratings, by = 'placeID') %>%
                      select(name, rating) %>%
                      group_by(name) %>%
                      summarize(avg_Rating = mean(rating)) %>%
                      arrange(desc(avg_Rating)))
df
if(Azure) maml.mapOutputPort('df')