library(ISLR2)
data <- iris
plot(data$Sepal.Length,data$Petal.Width,
     xlab = "Sepal Length", ylab = "Petal Width", col = data$Species)

km3 <- kmeans(data[,1:4], 3, nstart = 20)
km3$withinss
km3$betweenss

plot(data$Sepal.Length, data$Petal.Width, col = (km3$cluster), 
     main = "K-Means Clustering Results with K = 3",xlab = "Sepal Length", 
     ylab = "Petal Width", cex = 2, pch=as.numeric(km3$cluster))
legend("topright",c("cluster1","cluster2", "cluster3"), pch=c(1,2,3))




