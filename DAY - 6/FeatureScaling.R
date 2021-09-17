# Importing Packages
library("BBmisc")
library("scorecard")
library("reshape2")
library("plyr")
library("readr")
library("GGally")
library("mlbench")
library("caret")

# Importing data
data <- read_delim("DAY - 6/Data/Data_Norm.csv")
data


# Applying Standardization and normalization for our dataset


# Fiiting and getting standardized values
preproc_standardize <- preProcess(data[,c(1:4,6)],method = c("center","scale"))
data_preprocess <- predict(preproc_standardize,data[,c(1:4,6)])
summary(data_preprocess)

# Checking updated values
data_scaled_standardize <- as.data.frame(scale(data[,c(1:4,6)]))
data_scaled_standardize
summary(data$Income)
summary(data_scaled_standardize$Income)


# Fiiting and getting Normalized values
preproc_normalize <- preProcess(data[,c(1:4,6)],method = c("range"))
data_preprocess <- predict(preproc_normalize,data[,c(1:4,6)])
summary(data_preprocess)

# Checking updated values
data_scaled_normalize <- as.data.frame(scale(data[,c(1:4,6)]))
summary(data$Income)
summary(data_scaled_normalize$Income)