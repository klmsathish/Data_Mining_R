
## Minkowski Distance


# Vectors
vec_1 <- c(2,8,9,4,7,6)
vec_2 <- c(9,7,8,5,3,1)

# COnverting vectors into matrix
mat <- rbind(vec_1,vec_2)


# Minkowski Distance
dist(mat,method="minkowski",p=3)



# Vectors
a<-c(2,4,4,6)
b<-c(5,5,7,8)
c<-c(9,9,9,8)
d<-c(1,2,3,3)


# COnverting vectors into matrix
mat<-rbind(a,b,c,d)

# Minkowski Distance
dist(mat,method="minkowski",p=3)
