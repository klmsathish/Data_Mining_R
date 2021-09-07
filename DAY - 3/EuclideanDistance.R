## Euclidean Distance

# Function for finding euclidean distance
euclidean <- function(a,b) sqrt(sum((a-b)^2))

# Vectors
vec_1 <- c(2,8,9,4,7,6)
vec_2 <- c(9,7,8,5,3,1)

# Euclidean Distance
euclidean(vec_1,vec_2)

# Datframes with equal vector size
df <- data.frame(a = c(2,8,9,4,7,6),b = c(9,7,8,5,3,1))

# Euclidean Distance
euclidean(df$a,df$b)

# Vectors with uequal size
vec_1 <- c(2,8,7,6)
vec_2 <- c(9,7,8,5,3,1)

# Euclidean Distance
euclidean(vec_1,vec_2)