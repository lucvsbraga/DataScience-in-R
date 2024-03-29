# Text Mining

# Exemplo 1 
install.packages(c("SnowballC", "wordcloud", "RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# Carregando o dataset
df <- read.csv('C:/Users/Lucas/Documents/R/DataSets/questoes.csv', stringsAsFactors = FALSE)
head(df)

# Criando um Corpus
dfCorpus <- Corpus(VectorSource(df$Question))
class(dfCorpus)

# Convertendo Corpus em um documento de texto plano
dfCorpus <- tm_map(dfCorpus, PlainTextDocument)

# Remover pontua��o
dfCorpus <- tm_map(dfCorpus, removePunctuation)

# Remover palavras espec�ficas do ingl�s
dfCorpus <- tm_map(dfCorpus, removeWords, stopwords('english'))

# Neste processo, v�rias vers�es de uma palvras s�o convertidas em uma �nica string
dfCorpus <- tm_map(dfCorpus, stemDocument)

# Removendo palavras espec�ficas
dfCorpus <- tm_map(dfCorpus, removeWords, c('the', 'this', stopwords('english')))

#wordcloud
wordcloud(dfCorpus, max.words = 100, random.order = FALSE)

# Lendo o arquivo
arquivo <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
texto <- readLines(arquivo)

# Carregando os dados como Corpus
docs <- Corpus(VectorSource(texto))

# Pr�-processamento
inspect(docs)
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Converte o texto para min�sculo
docs <- tm_map(docs, content_transformer(tolower))

# Remove n�meros
docs <- tm_map(docs, removeNumbers)

# Remove as palavras mais comuns do idioma ingl�s
docs <- tm_map(docs, removeWords, stopwords("english"))

# Voc� pode definir um vetor de palavras (stopwords) a serem removidas do texto.
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2"))

# Remove pontua��o
docs <- tm_map(docs, removePunctuation)

# Elimina espa�os extras
docs <- tm_map(docs, stripWhitespace)

# Text stemming
docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing=TRUE)
d <- data.frame(word = names(v), freq=v)
head(d, 10)

#wordcloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

# Tabela de frequ�ncia
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
head(d, 10)

# Gr�ficos de barras com as palavras mais frequentes
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col = 'lightblue', main = 'Most frequent words',
        ylab = "Word frequencies")