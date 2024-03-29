# Boxplots

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)

# Constru��o do boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group, main = "Dura��o do Sono", col.main = "red", ylab = "Horas", xlab = "Drogas")

# C�lculo da m�dia
means = by(extra, group, mean)

# Adiciona a m�dia ao gr�fico
points(means, col = "red")

# Boxplot horizontal
horizontalboxplot = boxplot(data = sleep, extra ~ group, ylab="", xlab="", horizontal = T)
horizontalboxplot = boxplot(data = sleep, extra ~ group, ylab="", xlab="", horizontal = T, col = c("blue", "red"))
