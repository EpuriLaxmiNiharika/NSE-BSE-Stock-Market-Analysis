library(tree)
library(ISLR)
library(tree)
library(e1071)
set.seed(123)
setwd("C://Users/iiitb/Desktop")
seeds <- read.csv("log_inf.csv",sep=",")

attach(seeds)

diff1 <- depth_buy_price_0 - depth_buy_price_1
high_1 <- ifelse(diff>0,"1","-1")
diff1 <- depth_buy_price_1 - depth_buy_price_2
high_2 <- ifelse(diff1>0,"1","-1")
diff2 <- depth_buy_price_2 - depth_buy_price_3
high_2 <- ifelse(diff1>0,"1","-1")
diff3 <- depth_buy_price_3 - depth_buy_price_4
high_3 <- ifelse(diff1>0,"1","-1")
seeds = data.frame(seeds,high_1)
seeds = data.frame(seeds,high_2)
seeds = data.frame(seeds,high_3)

# 7, 43

#library(ggplot2)
#ggplot(seeds, aes(high_1, seeds)) + geom_point()
#irisCluster <- kmeans(seeds[, c("high_1","change")], 3, nstart = 20)

x <- rbind(matrix(rnorm(1000, sd = 0.2), ncol = 2),
           matrix(rnorm(1000, mean = 1, sd = 0.2), ncol = 2))

colnames(x) <- c("change","high_1")

clu <- kmeans(c(7,43,44,45), 2, nstart=20)
ggplot(data = seeds, aes(high_1, change)) +
  geom_point(alpha = 1, size = 9)

ggplot(seeds,aes(high_1,change),color=clu$cluster)+geom_point()
plot(x, col = clu$cluster)
points(clu$centers, col = 1:2, pch = 8, cex = 2)