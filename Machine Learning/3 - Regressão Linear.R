Sys.setlocale("LC_ALL","pt_BR.UTF-8")
## RegressãoLinear


# Prevendo nota final dos alunos.


# Carregando o dataset
df <- read.csv2("C:/Users/Lucas/Documents/R/Datasets/estudantes.csv")


# Explorando os dados
head(df)
summary(df)
str(df)
any(is.na(df))


library(ggplot2)
library(ggthemes)
library(dplyr)

# Obtendo apenas as colunas num�ricas
colunas_numericas <- sapply(df, is.numeric)
colunas_numericas


# Filtrando as colunas num�ricas para correla��o
data_cor <- cor(df[, colunas_numericas])
data_cor
head(data_cor)

# Pacotes para visualizar a análise de correla��o
library(corrplot)
library(corrgram)

# Criando um corrplot
corrplot(data_cor, method = 'color')

# Criando um corrgram
corrgram(df, order = TRUE, lower.panel = panel.shade, upper.panel = panel.pie, text.panel = panel.txt)

# Criando um histograma
ggplot(df, aes(x = G3)) + 
  geom_histogram(bins = 20,
                 alpha = 0.5, fill = 'blue') + theme_minimal()


# Treinando e Interpretando o Modelo
# Import Library
library(caTools)

# Criando as amostras de forma randômica
set.seed(101)
?sample.split
amostra <- sample.split(df$age, SplitRatio = 0.7)

# ***** Treinamos nosso modelo nos dados de treino *****
# ***** Fazemos as predições nos dados de teste *****

# Criando dados de treino - 70% dos dados
treino = subset(df, amostra == TRUE)

# Criando dados de teste - 30% dos dados
teste = subset(df, amostra == FALSE)

# Gerando o Modelo (Usando todas os atributos)
modelo_v1 <- lm(G3 ~ ., treino)
modelo_v2 <- lm(G3 ~ G2 + G1, treino)
modelo_v3 <- lm(G3 ~ absences, treino)
modelo_v4 <- lm(G3 ~ Medu, treino)


# Interpretando o modelo
summary(modelo_v1)
summary(modelo_v2)
summary(modelo_v3)
summary(modelo_v4)


# par(mfrow = c(2,2))
# plot(modelo_v3)

# ****************************************************
# *** Estas informacoes abaixo eh que farao de vocÃª ***
# *** um verdadeiro conhecedor de Machine Learning ***
# ****************************************************

# Residuos
# Diferenca entre os valores observados de uma variavel e seus valores previstos
# Seus residuos devem se parecer com uma distribuicao normal, o que indica
# que a media entre os valores previstos e os valores observados eh proximo de 0 (o que eh bom)

# Coeficiente - Intercept - a (alfa)
# Valor de a na equação de Regressão

# Coeficiente - G2 - b (beta)
# Neste caso, o valor de G2 representa o valor de b na equação de Regressão

# Erro Padrão
# Medida de variabilidade na estimativa do coeficiente a (alfa). O ideal eh que este valor 
# seja menor que o valor do coeficiente, mas nem sempre isso irá ocorrer.

# Asteriscos 
# Os asteriscos representam os níveis de significancia de acordo com o p-value.
# Quanto mais estrelas, maior a siginificância.
# Atencao --> Muitos asteriscos indicam que eh improvável que não exista relacionamento entre as variáveis.

# Valor t
# Define se coeficiente da variavel eh significativo ou nao para o modelo. 
# Ele eh usado para calcular o p-value e os níveis de significância.

# p-value
# O p-value representa a probabilidade que a variável não seja relevante. 
# Deve ser o menor valor possível. Se este valor for realmente pequeno, o R ira mostrar o valor como notacao cientifica

# Significancia
# São aquelas legendas proximas as suas variáveis
# Espaço em branco - ruim
# Pontos - razoável
# Asteriscos - bom
# Muitos asteriscos - muito bom

# Residual Standar Error
# Este valor representa o desvio padrão dos resíduos

# Degrees of Freedom
# É a diferenca entre o número de observações na amostra de treinamento e o número de variáveis no seu modelo

# R-squared
# Ajuda a avaliar o nivel de precisao do nosso modelo. Quanto maior, melhor, sendo 1 o valor ideal.

# F-statistics
# Eh o teste F do modelo. Esse teste obtem os parametros do nosso modelo e compara com um modelo que tenha menos parametros
# Em teoria, um modelo com mais parametros tem um desempenho melhor. Se o seu modelo com mais parametros NAO tiver perfomance
# melhor que um modelo com menos parametros, o valor do p-value sera bem alto. Se o modelo com mais parametros tem performance
# melhor que um modelo com menos parametros, o valor do p-value sera mais baixo.

# Lembre que correlacao nao implica causalidade


# visualizando o Modelo e Fazendo Previsões

# Obtendo resíduos
res <- residuals(modelo_v1)

# Convertendo o objeto para um dataframe
res <- as.data.frame(res)
head(res)

# Histograma dos resíduos
ggplot(res, aes(res)) +
  geom_histogram(fill = 'blue',
                 alpha = 0.5,
                 binwidth = 1)


# Plot do Modelo
# plot(modelo_v1)

# Fazendo as predições
prevendo_G3 <- predict(modelo_v1, teste)
prevendo_G3

# Visualizando os valores previstos e observados
resultados <- cbind(prevendo_G3, teste$G3)
colnames(resultados) <- c('Previsao', 'Real')
resultados <- as.data.frame(resultados)
resultados$Previsao <- round(resultados$Previsao)
resultados
min(resultados)

# Tratando os valores negativos
trata_zero <- function(x){
  if(x < 0){
    return(0)
  }else{
    return(x)
  }
}

# aplicando a função para tratar valores negativos em nossa previsão
resultados$Previsao <- sapply(resultados$Previsao, trata_zero)
resultados


# Calculando o erro média
# Quão distantes seus valores previstos estão dos valores observados
# MSE

mse <- mean((resultados$Real - resultados$Previsao)^2)
print(mse)


#RMSE
rmse <- mse^0.5
rmse

# Calculando R Squared
SSE = sum((resultados$Previsao - resultados$Real)^2)
SST = sum((mean(df$G3) - resultados$Real)^2)


# R-Squared
# AJuda a avaliar o nível de precisão do nosso modelo. Quanto mais próximo de 1 melhor.
R2 = 1 - (SSE/SST)
R2
