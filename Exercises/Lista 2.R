#	Exerc�cio	1	- Crie	uma	fun��o	que	receba	e	vetores	como	par�metro,	converta-os	em	um dataframe	e	imprima.
vec1 <- c(1:10)
vec2 <- c(11:20)

conversor <- function(x, y){
  df = data.frame(cbind(x,y))  
  print(df)
}
conversor(vec1, vec2)


#	Exerc�cio	2	- Crie	uma	matriz	com	4	linhas	e	4	colunas	preenchida	com	n�meros	inteiros	e calcule	a	m�dia	de	cada	linha
matriz <- matrix(c(1:16), nrow = 4, ncol = 4)
matriz
apply(matriz, 1, mean)


#	Exerc�cio	3	- Considere	o	dataframe	abaixo.	Calcule	a	m�dia	por	disciplina
escola	<- data.frame(Aluno	=	c('Alan',	'Alice',	'Alana',	'Aline',	'Alex',	'Ajay'),
                     Matem�tica	=	c(90,	80,	85,	87,	56,	79),
                     Geografia	=	c(100,	78,	86,	90,	98,	67),
                     Qu�mica	=	c(76,	56,	89,	90,	100,	87))
escola
apply(escola[, c(2, 3, 4)], 2, mean)


#	Exerc�cio	4	- Cria	uma	lista	com	3	elementos, todos	num�ricos	e	calcule	a	soma de todos	os elementos da lista.
lista <- list(1,2,3)
do.call(sum, lista)


#	Exerc�cio	5	- Transforme	a	lista	anterior	um	vetor.
unlist(lista)


#	Exerc�cio	6	- Considere	a	string	abaixo.	Substitua	a	palavra	textos	por	frases.
str	<- c("Expressoes",	"regulares",	"em	linguagem	R",	
         "permitem	a	busca	de	padroes",	"e	exploracao	de	textos",
         "podemos	buscar	padroes	em	digitos",
         "como	por	exemplo",
         "10992451280")
gsub('textos', 'frases', str)
str


#	Exerc�cio 7	- Usando	o	dataset	mtcars,	crie	um	gr�fico com	ggplot	do	tipo	scatter	plot.	Use	as 
# colunas	disp e mpg nos eixos x e y respectivamente
library(ggplot2)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()


#	Exerc�cio 8	- Usando	o	exemplo	anterior,	explore	outros	tipos	de	gr�ficos
