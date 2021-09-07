
## Manhattan Distance

# Function for finding manhattan distance
manhattan <-function(a,b)
  {
  dist <- abs(a-b)
  dist <- sum(dist)
  return (dist)
}

# Vectors
vec_1 <- c(2,8,9,4,7,6)
vec_2 <- c(9,7,8,5,3,1)


# Euclidean Distance
manhattan(vec_1,vec_2)

# Manhattan distance between vectors in a matrix
a <- c(2,8,9,4,7,6)
b <- c(9,7,8,5,3,1)
c <- c(9,7,1,3,5,4)
d <- c(6,4,6,9,8,2)

# COnverting vectors into matrix
mat <- rbind(a,b,c,d)

# manhattan distance
dist(mat,method ="manhattan")



