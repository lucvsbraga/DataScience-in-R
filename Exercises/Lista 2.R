#	Exercício	1	- Crie	uma	função	que	receba	e	vetores	como	parâmetro,	converta-os	em	um dataframe	e	imprima.
vec1 <- c(1:10)
vec2 <- c(11:20)

conversor <- function(x, y){
  df = data.frame(cbind(x,y))  
  print(df)
}
conversor(vec1, vec2)


#	Exercício	2	- Crie	uma	matriz	com	4	linhas	e	4	colunas	preenchida	com	números	inteiros	e calcule	a	média	de	cada	linha
matriz <- matrix(c(1:16), nrow = 4, ncol = 4)
matriz
apply(matriz, 1, mean)


#	Exercício	3	- Considere	o	dataframe	abaixo.	Calcule	a	média	por	disciplina
escola	<- data.frame(Aluno	=	c('Alan',	'Alice',	'Alana',	'Aline',	'Alex',	'Ajay'),
                     Matemática	=	c(90,	80,	85,	87,	56,	79),
                     Geografia	=	c(100,	78,	86,	90,	98,	67),
                     Química	=	c(76,	56,	89,	90,	100,	87))
escola
apply(escola[, c(2, 3, 4)], 2, mean)


#	Exercício	4	- Cria	uma	lista	com	3	elementos, todos	numéricos	e	calcule	a	soma de todos	os elementos da lista.
lista <- list(1,2,3)
do.call(sum, lista)


#	Exercício	5	- Transforme	a	lista	anterior	um	vetor.
unlist(lista)


#	Exercício	6	- Considere	a	string	abaixo.	Substitua	a	palavra	textos	por	frases.
str	<- c("Expressoes",	"regulares",	"em	linguagem	R",	
         "permitem	a	busca	de	padroes",	"e	exploracao	de	textos",
         "podemos	buscar	padroes	em	digitos",
         "como	por	exemplo",
         "10992451280")
gsub('textos', 'frases', str)
str


#	Exercício 7	- Usando	o	dataset	mtcars,	crie	um	gráfico com	ggplot	do	tipo	scatter	plot.	Use	as 
# colunas	disp e mpg nos eixos x e y respectivamente
library(ggplot2)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()


#	Exercício 8	- Usando	o	exemplo	anterior,	explore	outros	tipos	de	gráficos
