# Importing Packages
library(data.table)
library(scorecard)
library(caret)

# Creating vectors
a <-c('red','red','orange')
b <-c('large','medium','small')
c <-c('wide','narrow','narrow')

# Creating a dataframe by combining vectors
df <- data.frame(a,b,c)

# applying on hot function
one_hot(df)

# Creating a new table
df = data.table(ID = 1:4,
                color = factor(c("red",NA,"blue","blue"),
                               levels = c("blue","green","red")))

# Applying onehot in different ways
one_hot(df)
one_hot(df, sparsifyNAS = TRUE)
one_hot(df, naCols = TRUE)
df_updated <- one_hot(df,dropCols=TRUE)
df_updated