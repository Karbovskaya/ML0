colors <- c("setosa" = "purple", "versicolor" = "green3", "virginica" = "red")

plot(iris[, 3:4], pch = 21, bg = colors[iris$Species],col = colors[iris$Species])

euclideanDistance <- function(u, v)

{

sqrt(sum((u - v)^2))

}

sortObjectsByDist <- function(xl, z, metricFunction =

euclideanDistance)

{

l <- dim(xl)[1]

n <- dim(xl)[2] - 1

distances <- matrix(NA, l, 2)

for (i in 1:l)

{

distances[i, ] <- c(i, metricFunction(xl[i, 1:n], z))

}

orderedXl <- xl[order(distances[, 2]), ]
return (orderedXl<-cbind( orderedXl, evcld = sort(distances[,2],decreasing =FALSE)));

}

rectangle <- function(r,h){

      return (0.5)
    } 
   else {
      return(0)
  }
}
epan <- function(r,h){
  if(abs(r/h) <= 1){
      return (3/4*(1-(r/h)^2))
    } 
   else {
      return(0)
  }

}
kvad <- function(r,h){
  if(abs(r/h) <= 1){
      return (15/16*(1-(r/h)^2)^2)
    } 
  else {
      return(0)
  }

}
trey <- function(r,h){
  if(abs(r/h) <= 1){
      return ((2*pi)^(-0.5)*exp(-0.5*(r/h)^2))
    } 
  else {
      return(0)
  }

}
gaus <- function(r,h){
     return ( (2*pi)^(-1/2) * exp(-1/2 * (r/h)^2 ) ) 
}
Loo <- function(classificator,func){
 res <- c(seq(0, 19)) 
    cnt <- 1
    for (h in seq(0.1,2,by=0.05)) { 
      sum <- 0 
      for (i in 1:150) { 
        z <- c(iris[i, 3], iris[i, 4]) 
        x_l <- iris[-i, 3:5] 
        class <- classificator(x_l, z, h, func) 
        if (iris[i, 5] != class) { 
          sum <- sum + 1 
        } 
      }
      res[cnt] <- sum / 150
      cnt = cnt + 1
    } 
    return (res)
}
parzen <- function(xl, z, h, func) {
    orderedXl <- sortObjectsByDist(xl, z, euclideanDistance) 
    n <- dim(orderedXl)[2]-1
    classes <-orderedXl[1:150, n]
    m = c("setosa" = 0, "versicolor" = 0, "virginica" = 0) 
    for (i in seq(1:149)){
      m[[classes[i]]] <- m[[classes[i]]] + func(orderedXl[i,4], h) 
    } 
    class <- names(which.max(m))
if(sum(m) > 0) class <- names(which.max(m))
  else class <- "unknown" 
    return (class) 
}
Loo_rectangl  = Loo(parzen, rectangle)
j<- seq(0.1,2,by=0.05)
min_rect=which(Loo_rectangl==min(Loo_rectangl))
plot(j,Loo_rectangl,type="l")
points(j[min_rect],Loo_rectangl[min_rect],col="red",pch=19)
label = paste("   h = ", j[min_rect[1]], "\n   LOO = ", round(Loo_rectangl[min_rect[1]],3), sep = "")
text(j[min_rect[1]],Loo_rectangl[min_rect[1]],labels=label,pos=3)


Loo_gaus=Loo(parzen,gaus)
j<- seq(0.1,2,by=0.05)
min_gaus=which(Loo_gaus==min(Loo_gaus))
plot(j,Loo_gaus,type="l")
points(j[min_gaus],Loo_gaus[min_gaus],col="red",pch=19)
label = paste("   h = ", j[min_gaus[1]], "\n   LOO = ", round(Loo_gaus[min_gaus[1]],3), sep = "")
text(j[min_gaus[1]],Loo_gaus[min_gaus[1]],labels=label,pos=4)

colors <- c("setosa" = "red", "versicolor" = "green3", "virginica" = "blue", "unknown"="white")

map <- function(ir=iris,h=0.4,K=rectangle){
  for (i in seq(0,7,0.1)) {
    for (j in seq(0,2.5,0.1)){
      points(i, j, pch = 21, col = colors[parzen(ir[,3:5],c(i,j),h,K)])
    }
  }
}

map(iris, 0.35, rectangle)
map(iris, 0.1, gaus)
