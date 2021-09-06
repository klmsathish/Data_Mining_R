#Importing Packages
library(moments)

# Seeting the seed to have same random values in every run
set.seed(1)

# rnorm(number of points,mean,std)
random_normal <- rnorm(50,10,10)
random_normal

#Skewness
skewness(random_normal)

#Historgrom
hist(random_normal)

# Hist plot
h <- hist(random_normal,breaks = 10,col = "white",xlab = "Random Points", main="Histogram with Normal Curve")
xfit <-seq(min(random_normal), max(random_normal), length=40)
yfit <-dnorm(xfit, mean=mean(random_normal), sd=sd(random_normal))
yfit <- yfit*diff(h$mids[1:2])*length(random_normal)

# skewline
lines(xfit,yfit,col = "Blue",lwd = 2)

# Find the skew for 30, 31, 32, 33, 40
# Positive skewed
x <- c(30, 31, 32, 33, 40)
skewness(x)
hist(x)
h<-hist(x, breaks=10, col="Green", xlab="X",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)

# Find the skew for 20,21,31,28,32,33,35
# Negative skewed
x <- c(20,21,31,28,32,33,35)
skewness(x)
hist(x)
h<-hist(x, breaks=10, col="Green", xlab="X",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
