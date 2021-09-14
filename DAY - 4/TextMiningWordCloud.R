install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes


library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Loading Data
text_blockchain <- readLines(file.choose())

text_blockchain

# Converting to corpus
docs <- Corpus(VectorSource(text_blockchain))

# Inspect the content of document
inspect(docs)

# Text Transformation
# Replace special character from text "?","/"

tospace <-content_transformer(function(x,pattern)gsub(pattern," ",x))

docs <- tm_map(docs,tospace,"/")
docs <- tm_map(docs,tospace,"@")
docs <- tm_map(docs,tospace,"\\|")


# Text CLeaning

# Case Sensitive
docs <- tm_map(docs,content_transformer(tolower))

# Remove Numbers
docs <- tm_map(docs,removeNumbers)

# Remove common stop words
docs <- tm_map(docs,removeWords,stopwords("english"))

# Specifying stop words
docs <- tm_map(docs,removewords,c("all","not"))

# Remove Punctutation
docs <- tm_map(docs,removePunctuation)

# Eliminate extra white spaces
docs <-tm_map(docs,stripWhitespace)

# Building term document matrix

dtm <- TermDocumentMatrix(docs)
dtm

# Converting to a matrix
m <- as.matrix(dtm)

# Sorting
v <- sort(rowSums(m),decreasing=TRUE)

# Converting into dataframe
df <- data.frame(word = names(v),freq = v)
df

# Word cloud
set.seed(1234)
wordcloud(words = df$word, freq = df$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))