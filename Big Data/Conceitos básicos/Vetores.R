#Vetores

#Vetores de caracteres
vetor_caracter = c("Ol�", "DSA")
vetor_caracter


#Vetor de floats
vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico


#Vetor de valores complexos
vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo


#Vetor de valores l�gicos
vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico


#Vetor de n�meros inteiros
vetor_integer = c(2, 4, 6)
vetor_integer


#Utilizando seq()
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)


#Utilizando rep()
vetor2 = rep(1:5)
vetor2


#Indexa��o de vetores
a <- c(1, 2, 3, 4, 5)
a
a[1]
a[4]

b <- c("Data", "Science")
b
b[1]


#Combinando vetores
v1 = c(2,3,5)
v2 = c("aa", "bb", "cc", "dd", "ee")
c(v1, v2)


#Opera��es com Vetores
x = c(1, 3, 5, 7)
y = c(2, 4, 6, 8)

x*y
x+y
x-y
x*5
x/y



#Somando vetores com diferentes elementos
alfa = c(10, 20, 30)
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
alfa + beta


#Vetor Nomeado
v = c("Barack", "Obama")
v
names(v) = c("Nome", "Sobrenome")
v
v["Nome"]
