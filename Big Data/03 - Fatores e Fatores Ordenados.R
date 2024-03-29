# Fatores


vec1 <- c("Macho", "F�mea", "F�mea", "Macho", "Macho")
vec1
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)


# Vari�veis categ�ricas nominais
# N�o existe uma ordem impl�cita

animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
class(animais)
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)


# Vari�veis categ�ricas ordinais
# POssuem uma ordem natural

grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Licenciatura")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado", "Licenciatura"))
fac_grad
levels(fac_grad)


# Sumarizar os dados fornece uma vis�o geral sobre o conte�do
summary(fac_grad)
summary(grad)

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "F")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("F�mea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)


# Mais exemplos
data = c(1, 2, 2, 3, 1, 2, 3, 3, 1, 2, 3, 3, 1)
fdata = factor(data)
fdata

rdata = factor(data, labels = c("I", "II", "III"))
rdata

# Fatores N�o-ORdenados

set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA", "CC", "CC")
set1

#Transformando os dados. O R apenas criou n�veis

f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)


#Fatores ORdenados
o.set1 <- factor(set1, levels = c("CA", "BA", "AA", "CC", "B"), ordered = TRUE)
O.SET1
o.set1
is.ordered(o.set1)
as.numeric(o.set1)
table(o.set1)

# Fatores e Dataframes
df <- read.csv2("C:/Users/Lucas/Documents/DataSets/etnias.csv", sep =",")
df

# Vari�veis do tipo fator
str(df)

# Convertendo uma coluna para fator
df$Etnia <- factor(df$Etnia)
df$Sexo <- factor(df$Sexo)

# N�veis dos fatores
levels(df$Etnia)
summary(df$Etnia)

# Plot
# Agora se fizermos um plot, temos um boxlot para as variaveis fatores
plot(df$Idade~df$Etnia, xlab = 'Etnia', ylab = 'Idade', main = 'Idade por Etnia')

# Regress�o
summary(lm(Idade~Etnia, data=df))

# Convertendo uma coluna em vari�vel categ�rica. Isso criar� um fator n�o-ordenado
df
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels=c("Solteiro", "Casado", "Divorciado"))
df
