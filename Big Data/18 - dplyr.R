# dplyr
# Transformação de Dados
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

# Suprimindo mensagens de warning
searchpaths()
suppressMessages(library(dplyr))

# Carregando o dataset
getwd()
df_sono <- read_csv("C:/Users/Lucas/Documents/R/Datasets/sono.csv")
head(df_sono)
class(df_sono)
str(df_sono)

glimpse(df_sono)
glimpse(mutate(df_sono, peso_libras = sono_total / 0.45359237))

count(df_sono, cidade)
hist(df_sono$sono_total)

# Mostrar o autocomplete
?sample_n
sample_n(df_sono, size = 10)

# select()
sleepData <- select(df_sono, nome, sono_total)
head(sleepData)
class(sleepData)
select(df_sono, nome)
select(df_sono, nome:cidade)

# filter()
filter(df_sono, sono_total >= 16)
filter(df_sono, sono_total >= 16 , peso >= 80)
filter(df_sono, cidade %in% c("Recife", "Curitiba"))

# arrange()
df_sono %>% arrange(cidade) %>% head

df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% head

df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)

# mutate()
head(df_sono)
df_sono %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head
head(df_sono)

df_sono %>%
  mutate(novo_indice = sono_total / peso, peso_libras = peso / 0.45359237) %>% head

# summarise()
df_sono %>%
  summarise(media_sono = mean(sono_total))

df_sono %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# group_by()
df_sono %>%
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# Pipe operator: %>%
head(select(df_sono, nome, sono_total))

df_sono %>%
  select(nome, sono_total) %>%
  head

df_sono %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

# Instalando pacote hflights (dados de voos de Houston)
install.packages("hflights")
library(hflights)

# Criando um objeto tbl
flights <- tbl_df(hflights)
flights

# Resumindo os dados
str(hflights)
glimpse(hflights)

data.frame(head(hflights))

flights[flights$Month == 1 & flights$DayofMonth == 1, ]

filter(flights, Month == 1, DayofMonth == 1 )
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))
select(flights, Year:DayofMonth, contains("Taxi"), contains("De"))
