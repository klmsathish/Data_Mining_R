# Creating a vector
scores <- c(74,56,78,89,23,98,48,56,78)
scores

# Sorting them in ascending
sort(scores)

# The five number summary

# Min value
min(scores)

# 25th Quartile 
quantile(scores,0.25)

# Median
median(scores)

# 75th Quartile 
quantile(scores,0.75)

# Maximum
max(scores)


# Inbuilt function for all five values
fivenum(scores)

# Summary of the vector
summary(scores)

#Plotting 
par(mfrow = c(1,2))
boxplot(scores)
abline(h=min(scores),col = "Blue")
abline(h=max(scores), col= "Red")
abline(h=median(scores), col= "Yello")
abline(h=quantile(scores, c(0.25, 0.75)), col= "Green")

