library(tree)
library(ISLR)
library(tree)
library(e1071)
set.seed(123)
setwd("C://Users/iiitb/Desktop")
seeds <- read.csv("log_inf.csv",sep=",")

attach(seeds)

diff <- volume - sell_quantity
high_1 <- ifelse(diff>0,"1","2")

seeds = data.frame(seeds,high_1)
# 7, 43

#library(ggplot2)
#ggplot(seeds, aes(high_1, seeds)) + geom_point()
#irisCluster <- kmeans(seeds[, c("high_1","change")], 3, nstart = 20)

x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))

colnames(x) <- c("diff","change")

#r1 = c(7,3:12,42)
(cl <- kmeans(x, 2, nstart=3))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)

