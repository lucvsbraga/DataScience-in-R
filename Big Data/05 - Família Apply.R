# A fam�lia apply = uma forma elegante de fazer loops

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - vers�o amig�vel do lapply
# vapply() - similar ao sapply, com valor de retorno modificado
# rapply() - similar ao lapply()
# eapply() - gera uma lista
# mapply() - similar ao sapply, multivariada
# by

# Se voc� estiver trabalhando com os objetos:
# list, numeric, character (list/vector) => sapply ou lapply
# matrix, data.frame (agrega��o por coluna) => by / tapply
# Opera��es por linha ou opera��es espec�ficas => apply

# Usando um Loop
lista1 <- list(a = (1:10), b = (45:77))

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0
for (i in lista1$a){
  valor_a = valor_a + i
}
for (j in lista1$b){
  valor_b = valor_b + j
}
print(valor_a)
print(valor_b)

# Calculando cada elmento da lista com sapply
?sapply
sapply(lista1, sum)

# Aplicando fun��es com sapply
sapply(lista1, mean)

# apply()
?apply

x <- matrix(rnorm(9), nr = 3, byrow = T)
x

apply(x, 1, mean)
apply(x, 2, mean)
apply(x, 1 , plot)

resultapply <- apply(x,1,mean)
resultapply

escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Bruno'), 
                     Matem�tica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Qu�mica = c(76, 56, 89, 90, 100, 87))
escola

# Calculando a m�dia por aluno
escola$M�dia = NA
escola

escola$M�dia = apply(escola[, c(2,3,4)],1, mean)
escola
escola$M�dia = round(escola$M�dia)
escola

# tapply() vs sqldf
install.packages("RSQLite")

require(sqldf)
escola2 <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Bruno'),
                      Semestre = c(1, 1, 1, 2, 2, 2),
                      Matem�tica = c(90, 80, 85, 87, 56, 79),
                      Geografia = c(100, 78, 86, 90, 98, 67),
                      Qu�mica = c(76, 56, 89, 90, 100, 87))

escola2
sqldf("select aluno, sum(Matem�tica), sum(Geografia), sum(Qu�mica) from escola2 group by aluno")
tapply(c(escola2$Matem�tica), escola2$Aluno, sum)
