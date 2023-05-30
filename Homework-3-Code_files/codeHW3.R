library(fpc)
library(RSSL)
library(ISLR2)
library(tidyr)
library(factoextra)


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



data2 <- read.csv("homework3_clustering.csv")
plot(data2$V1, data2$V2)
km2 <- kmeans(data2, 2)
#Plot of Kmeans
plot(data2$V1, data2$V2, col = (km2$cluster), 
     main = "K-Means Clustering Results with K = 2",xlab = "V1", 
     ylab = "V2", cex = .5, )
legend("topright",c("cluster1","cluster2"), col=c("black", "red"), lty=1:1)

#Plot of DBSCANS



dbscan_data2 <- dbscan(data2, eps = .5, MinPts = 5)
plot(data2$V1, data2$V2, col = dbscan_data2$cluster, 
     main = "DBSCAN Clustering Results", xlab = "V1", ylab = "V2", cex = .5)
legend("topright",c("cluster1","cluster2"), col=c("black", "red"), lty=1:1)

# The K-Means algorithm is partitioning the data in K clusters based on distance from cental points.
This process results in spherical clusting that misrepresents our non-spherical clusters of data. 
DBSCAN detects alturnitive shapes in the data by identifying clusters based on density. As our data is shaped into two visible elipses, DBSCANS provides us with a much better clustered representation. 