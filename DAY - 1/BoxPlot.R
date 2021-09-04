# Loading the dataset
df = read.csv("Day - 1/Data/Survey.csv")

# Boxplot(column,head,color,ylabel)
boxplot(df$age,main = "Distrubution of Age",col = "blue",ylab = "Age")
