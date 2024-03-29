#Listas s�o generaliza��es de vetores, representam uma cole��o de objetos. Essa � a estrutura mais generalista da linguagem R.


#Use list() para criar listas

#Listas de strings
lista_caracter = list('A', 'Bem-vindo', 'DSA')
lista_caracter

#Lista de n�meros inteiros
lista_inteiros = list(2,3,4)
lista_inteiros

#Lista de floats
lista_numerico = list(1.90, 45.3, 300.5)
lista_numerico

#Lista de n�meros complexos
lista_complexos = list(5.2+3i, 2.4+8i)
lista_complexos

#Lista de valores l�gicos
lista_logicos = list(TRUE, FALSE, FALSE)
lista_logicos

#Listas Compostas
lista_composta1 = list("A", 3, TRUE)
lista_composta1

lista1 <- list(1:10, c("Maria", "Jo�o", "Alfredo"), rnorm(10))
lista1

?rnorm


#Slicing da Lista
lista1[1]
lista1[c(1,2)]
lista1[2]
lista1[[2]][1]
lista1[[2]][1] = "Monica"
lista1


#Para nomear os elementos - Listas Nomeadas
names(lista1) <- c("inteiros", "caracteres", "num�ricos")
lista1

vec_num <- 1:4
vec_char <- c("A", "B", "C", "D")
lista2 <- list(Numeros = vec_num, Letras = vec_char)
lista2

#Nomear os elementos diretamente
lista2 <- list(elemento1=3:5, elemento2 = c(7.2, 3.5))
lista2


#Trabalhando com elementos espec�ficos da lista
names(lista1) <- c("inteiros", "caracteres", "num�ricos")
lista1

lista1$caracteres
length(lista1$inteiros)
lista1$inteiros


#Verificar o comprimento da lista
length(lista1)


#Podemos extrair o elmento espec�fico dentro de cada n�vel da lista
lista1$caracteres[2]


#Mode dos elementos
mode(lista1$num�ricos)
mode(lista1$caracteres)


#Combinando 2 listas
lista3 <- c(lista1, lista2)
lista3

#Transformando um vetor em lista
v = c(1:3)
v
l = as.list(v)
l

#unindo 2 elementos em uma lista
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat, vec)
lst