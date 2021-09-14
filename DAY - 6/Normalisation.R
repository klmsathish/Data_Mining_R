# Importing Packages
library("BBmisc")
library("scorecard")
library("reshape2")
library("plyr")
library("readr")
library("GGally")
library("mlbench")
library("caret")

# Creating Dataframe
data <- data.frame(Age = rnorm(500,50,8),weight = rnorm(500,80,10))

# Normalization
data.pre=preProcess(data,method ="range")
data<-predict(data.pre,data)
data
