library(tree)
library(ISLR)
library(tree)
library(e1071)
set.seed(123)
setwd("C://Users/iiitb/Desktop")
seeds <- read.csv("log_inf.csv",sep=",")

attach(seeds)

diff <- depth_buy_quantity_0 - depth_sell_quantity_0
high_1 <- ifelse(diff>0,"1","2")
seeds = data.frame(seeds,high_1)
# 7, 43

library(ggplot2)
ggplot(seeds, aes(high_1, seeds)) + geom_point()
irisCluster <- kmeans(seeds[, c("high_1","change")], 3, nstart = 20)

library(cluster)
clusplot(seeds, k.means.fit$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

#https://rstudio-pubs-static.s3.amazonaws.com/79267_cf36e5130fa449bb876ee563908c7a27.html
