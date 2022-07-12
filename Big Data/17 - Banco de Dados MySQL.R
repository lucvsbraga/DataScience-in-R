# MySQL

install.packages("RMySQL")
library(RMySQL)
library(ggplot2)
library(dplyr)

# Conexão com o banco de dados
con = dbConnect(MySQL(), user = "lucas", password = "PasswordMySQL", dbname = "titanicDB", host = "localhost")

# Query
qry <- " "
dbGetQuery(con, qry)

# Plotar
dados <- dbGetQuery(con, qry)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")

# Conectando no MySQL com dplyr
con2 <- src_mysql(dbname = "titanicDB", user = "lucas", password = "PasswordMySQL", host = "localhost")

dados2 <- con2 %>%
  tbl("titanic") %>%
  selec(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()

# Manipulando dados
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = mean(survived)) %>%
  collect

ggplot(dados2, aes(pclass,survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) + geom_line()

# Sumarizando os dados
dados2 <- con2 %>%
  tbl("titanic") %>% 
  filter(fare > 150) %>%
  select(pclass,sex,age,fare) %>%
  group_by(pclass,sex) %>% 
  summarise(avg_age = mean(age),
            avg_fare = mean(fare))

head(dados2)

# --> Para outros bancos de dados, use RODBC