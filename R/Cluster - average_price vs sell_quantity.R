setwd("C://Users/iiitb/Desktop")
seeds <- read.csv("log_inf.csv",sep=",")
# Determine number of clusters
#set.seed(20)
cluster <- kmeans(seeds[,3:12], 3, nstart = 20)
cluster
library(ggplot2)
ggplot(seeds, aes(average_price, sell_quantity, color = cluster$cluster)) + geom_point()
