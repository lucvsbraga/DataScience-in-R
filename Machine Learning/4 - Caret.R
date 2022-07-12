# Carregando os pacotes
library(caret)
library(datasets)


# Usando o dataset mtcars
data(mtcars)

# Funcao do caret para divisao dos dados
split <- createDataPartition(y = mtcars$mpg, p = 0.7, list = FALSE)

# Criando dados de treino e de teste
dados_treino <- mtcars[split,]
dados_teste <- mtcars[-split,]

# Treinando o modelo
names(getModelInfo())


# Regressao Linear
modelolm <- train(mpg~., data = dados_treino, method = 'lm')

# Regressao Logística
modelolm2 <- train(mpg~., data = dados_treino, method = 'glm')

# Random Forest
modelolm3 <- train(mpg~., data = dados_treino, method = 'rf')

# Resumo do modelo
summary(modelolm)

# Ajustando o modelo
controle1 <- trainControl(method = 'cv', number = 10)
modelolm2 <- train(mpg ~ ., data = mtcars, method = 'lm', trControl = control1, metric = 'Rsquared')

# Resumo do modelo
summary(modelolm2)

# Coletando os residuos
residuals <- resid(modelolm2)

# Previsoes
predictedValues <- predict(modelolm2)
plot(dados_treino$mpg, predictedValues)

# Mostrando a importancia das variaveis para a criacao do modelo
varImp(modelolm2)
