# Banco de Dados

# Instalar SQLite
install.packages('RSQLite')
library(RSQLite)

# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")

# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars)

# Listando uma tabela
dbListTables(con)
dbExistsTable(con, "mtcars")
dbListFields(con, "mtcars")

# Lendo o conteúdo da table
dbReadTable(con , "mtcars")

# Criando apenas a definição da tablea
dbWriteTable(con, "mtcars2", mtcars[0, ])
dbListTables(con)
dbReadTable(con, "mtcars2")

# Executando consultas no banco de dados
query = "select mpg from mtcars"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados
class(dados)

# Executando consultas no banco de dados
query = "select mpg from mtcars"
rs = dbSendQuery(con, query)
while(!dbHasCompleted(rs)){
  dados = fetch(rs, n = 1)
  print(dados$mpg)
}


# Criando uma tabela a partir de um arquivo
dbWriteTable(con, "tempo", "tempo.txt", sep = ",", header = T)
dbListTables(con)
dbReadTable(con, "tempo")

# Encerrando a conexão
dbDisconnect(con)

# Carregando dados no banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")
dbWriteTable(con, "indices", "indice.csv", sep = "|", header = T)
dbRemoveTable(con, "indices")