## Mahanbolis Distance

# Setting seed for same random values
set.seed(1)

# Random vectors
score = sample(75:100,20,replace=T)
hours = sample(2:12,20,replace=T)
prep = sample(1:5,20,replace=T)
grade = sample(1:10,20,replace =T)

# Converting vectors to df
df <- data.frame(score,hours,prep,grade)

# Mahanbolis function
mahalanobis(df,colMeans(df),cov(df))


# Creating new column to store mahanbolis distances
df$mahan_disatnce <- mahalanobis(df,colMeans(df),cov(df))

# Updated df
df

# Calculating P value for the distances
# Create a new column for P values
df$p_value <- pchisq(df$mahan_disatnce,df =3,lower.tail = FALSE)

df
# P Value less than 0.001 is considered to be a outlier



