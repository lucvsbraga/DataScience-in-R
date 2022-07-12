# A família apply = uma forma elegante de fazer loops

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão amigável do lapply
# vapply() - similar ao sapply, com valor de retorno modificado
# rapply() - similar ao lapply()
# eapply() - gera uma lista
# mapply() - similar ao sapply, multivariada
# by

# Se você estiver trabalhando com os objetos:
# list, numeric, character (list/vector) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações específicas => apply

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

# Aplicando funções com sapply
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
                     Matemática = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Química = c(76, 56, 89, 90, 100, 87))
escola

# Calculando a média por aluno
escola$Média = NA
escola

escola$Média = apply(escola[, c(2,3,4)],1, mean)
escola
escola$Média = round(escola$Média)
escola

# tapply() vs sqldf
install.packages("RSQLite")

require(sqldf)
escola2 <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Bruno'),
                      Semestre = c(1, 1, 1, 2, 2, 2),
                      Matemática = c(90, 80, 85, 87, 56, 79),
                      Geografia = c(100, 78, 86, 90, 98, 67),
                      Química = c(76, 56, 89, 90, 100, 87))

escola2
sqldf("select aluno, sum(Matemática), sum(Geografia), sum(Química) from escola2 group by aluno")
tapply(c(escola2$Matemática), escola2$Aluno, sum)
