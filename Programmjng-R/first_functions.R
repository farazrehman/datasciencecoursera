
add2 <- function(x, y){
  x + y
}


above <- function (x, n){
  use <- x > n
  x[use]
}


# calculate the mean of each column in a matrix
colmean <- function (y){
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc){
    means[i] <- mean(y[,i])
  }
  means
}






