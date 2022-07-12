### Strings


# String
texto <- "Isso é uma string!"
texto


x = as.character(3:14)
x
class(x)


# Concatenando Strings
nome = "Barack"; sobrenome = "Obama"
paste(nome, sobrenome)
cat(nome, sobrenome)

#Formatando a saída
sprintf("%s governa os Eua há %d anos", "Barack Obama", 8)

# Extraindo parte da String
texto <- "Isso é uma string!"
substr(texto, start=12, stop=17)
?substr

#Contando o número de caracteres
nchar(texto)

# Alterando a capitalização
tolower("Histogramas e Elementos de Dados")
toupper("Histogramas e Elementos de dados")

# Usando stringr
library(stringr)

#Dividindo uma string em caracterest
strsplit("Histogramas e Elementos de Dados", NULL)

# Dividindo uma string em caracteres, após o caracter espaço
strsplit("Histogramas e Elementos de dados", " ")

#Trabalhando com strings
string1 <- c("Esta é a primeira parte da minha string e será a primeira parte do meu vetor", "Aqui a minha string continua, mas será transformada no segundo vetor")
string2 <- c("Precisamos testar outras strings = @???!#$")

# Adicionando 2 strings
str_c(c(string1, string2), sep="")

#POdemos contar quantas vezes um caracter aparece no texto
str_count(string2, "s")

#Localiza a primeira e última posição em que o caracter aparece
str)locate_all(string2, "s")

#Substitui a primeira ocorrência de um caracter
str_replace(string2, "//s", "")

# Substitui todas as ocorrências de um caracter
str_replace_all(string2, "//s", "")

#Decetando padrões nas strings
string1 <- "25 mai 1992"
string2 <- "1 mai 1997"
padrao <- "mai 199"
grepl(pattern = padrao, x = string1)

# Importando arquivo txt
# http://www.gutenberg.org/cache/epub/100/pg100.txt

arquivo <- read.table("http://www.gutenberg.org/cache/epub/100/pg100.txt")

head(arquivo)
tail(arquivo)

#Criando funções para manipular strings
strtail <- function(s, n=1) {
  if(n<0)
    substrings(s, 1-n)
  else
    substring(s, nchar(s)-n+1)
}
strtail("String de teste", 6)