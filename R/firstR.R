setwd("C:/Users/iiitb/Desktop")
install.packages("tree")
library(tree)
library(ISLR)
library(tree)
library(party)
set.seed(123)
seeds <- read.csv("log_inf.csv",sep=",")
trainSize <- round(nrow(seeds) * 0.7)
testSize <- nrow(seeds) - trainSize
set.seed(123)
training_indices <- sample(seq_len(nrow(seeds)),
                           size=trainSize)

test_indices = -training_indices

trainSet <- seeds[training_indices, ]
testSet <- seeds[-training_indices, ]
attach(seeds)

diff <- depth_buy_quantity_0 - depth_sell_quantity_0
high_1 <- ifelse(diff>0,"HIGH","LOW")

seeds = data.frame(seeds,high_1)
trainSet = data.frame(seeds,high_1)
test_high = high_1[training_indices]

tree_1 = ctree(high_1~C(13:40),data=trainSet)
plot(tree_1)
table(predict(tree_1),seeds$high_1)
