#Matrizes s�o conjuntos de elementos de uma mesma natureza, organizados em linhas e colunas

#Criando Matrizes

#N�mero de Linhas
matrix(c(1, 2, 3, 4, 5, 6), nr = 2)
matrix(c(1, 2, 3, 4, 5, 6), nr = 3)
matrix(c(1, 2, 3, 4, 5, 6), nr = 6)


#N�mero de Colunas
matrix(c(1,2,3,4,5,6), nc = 2)


#Help
?matrix


#Matrizes precisam ter um n�mero par de valores
matrix(c (1,2,3,4,5), nc= 2)


#Criando matrizes a partir de vetores e preenchendo a partir deste
meus_dados = c(1:10)
matrix(data = meus_dados, nrow= 5, ncol = 2, byrow = T)


#Fatiando a Matriz
mat <- matrix(c(2,3,4,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]


#Criando uma matriz diagonal
matriz = 1:3
diag(matriz)

#Extraindo vetor de uma matriz diagonal
vetor = diag(matriz)
diag(vetor)


#Transpose a matrix
W <- matrix(c(2,4,8,12), nr=2, ncol=2)
W
t(W)
U <- t(W)
U

#Obtendo uma matriz inversa
solve(W)


#Opera��es com Matrizes
mat1 <- matrix(c(2,3,4,5), nr =2)
mat1
mat2 <- matrix(c(6,7,8,9), nr = 2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

#Multiplicando Matriz com Vetor
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nr=2)
x * y

#Nomeando a Matriz
mat3 <- matrix(c('Futebol', 'Nata��o', 'Campo', 'Piscina'), nr = 2)
mat3
dimnames(mat3) = (list(c('Linha1', 'Linha 2'), c('Coluna1', 'Coluna2')))
mat3


#Identificando linhas e colunas no momento de cria��o da Matriz
matrix(c(1,2,3,4), nr=2, nc=2, dimnames=list(c('Linha 1', 'Linha 2'), c('Coluna 1', 'Coluna 2')))


#Combinando Matrizes
mat4 <- matrix(c(2,3,4,5), nr = 2)
mat4
mat5 <- matrix(c(6,7,8,9), nr = 2)
mat5
cbind(mat4, mat5)
rbind(mat4, mat5)


#Desconstruindo a  Matriz
c(mat4)
