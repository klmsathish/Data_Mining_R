# Importing Packages
library("vcd")

# Reading data
df_students <- read.csv("Day - 2/Data/students.csv")

# Printing Df
df_students

# Renaming columns
colnames(df_students)[2] <- "Last"
colnames(df_students)[3] <- "First"
colnames(df_students)[7] <- "Status"
colnames(df_students)[12] <- "score"
colnames(df_students)[13] <- "height"
colnames(df_students)[14] <- "newspaper_read"

# Mode for each category
table_gender <- table(df_students$Gender)
table_newspaper <- table(df_students$newspaper_read)

# Comparing two columns
newspaper_gender_table <- table(df_students$newspaper_read,df_students$Gender)
newspaper_gender_table

#3 Way table
table_3way = xtabs(data = df_students,~newspaper_read+Major+Gender)
table_3way