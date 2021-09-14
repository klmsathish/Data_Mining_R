# Installing Packages
install.packages("gmodels")

# Loading Packages
library(gmodels)

# Reading data
df_sharks <- read.csv("Day - 2/Data/sharks.csv")

# Cross table for comparison of two columns
cross_name_length <- CrossTable(df_sharks$COMMON.NAME,df_sharks$LENGTH..m.)

# Exporting cross table into  csv
write.csv(cross_name_length,"Day - 2/Data/crosstable_commonname_length.csv")


# Reading data
df_titanic <- read.csv("Day - 2/Data/Titanic.csv")

# Structure
str(df_titanic)

# dimensions
dim(df_titanic)

# Classes in PClass attribute
table(df_titanic$PClass)

# Proportion Table
prop.table(table(df_titanic$Sex))

# Cross table
cross_sex_survived <- CrossTable(df_titanic$Sex,df_titanic$Survived)

