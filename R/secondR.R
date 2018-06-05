install.packages("tree")
library(tree)
library(ISLR)
set.seed(123)
seeds <- read.csv("log_inf.csv",sep=",")
trainSize <- round(nrow(seeds) * 0.7)
testSize <- nrow(seeds) - trainSize
set.seed(123)
training_indices <- sample(seq_len(nrow(seeds)),
                           size=trainSize,replace = TRUE)

test_indices = -training_indices

trainSet <- seeds[training_indices, ]
testSet <- seeds[-training_indices, ]
attach(seeds)

diff <- average_price
high_1 <- ifelse(diff>1000,"HIGHBUDGET","LOWBUDGET")

seeds = data.frame(seeds,high_1)
trainSet = data.frame(seeds,high_1)
test_high = high_1[training_indices]
tree_1 = ctree(high_1~sell_quantity,data=trainSet)
plot(tree_1)
text(tree_1,pretty=0)
