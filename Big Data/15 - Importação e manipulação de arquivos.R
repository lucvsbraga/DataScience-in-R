# Importação e manipulação de arquivos

# Pacote readr
# read_delim()
# read_csv()
# read_tsv()

#Pacote utils
# read.csv() - Para valores separados por vírgula e ponto como separador decimal
# read.csv2() - Para valores separados por ponto vírgula e vírgula como separador decimal
# read.delim() - Para valores separador por tab e ponto como separador decimal
# read.delim2() - Para valores separador por tab e vírgula, e vírgula como serapador decimal
# read.fwf() - Para valores com número exato de bytes por coluna
# read.table() - Utilizado quando se está fazendo a leitura de arquivos ASCII, que contém dados em formato retangular

# read.table("arquivo.txt", header = TRUE, sep =",",stringAsFactors = FALSE)
# read.table("arquivo.txt", header = TRUE, sep ="\t",stringAsFactors = FALSE)

# read.csv("arquivo.csv", stringAsFactors = FALSE)
# read.csv("arquivo.csv", sep = ";", dec = ",", stringAsFactors = FALSE)

# read.delim("arquivo.txt")
# read.delim2("arquivo.txt")

