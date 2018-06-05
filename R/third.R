library(tree)
library(ISLR)
library(tree)
library(e1071)
library(party)
set.seed(123)
setwd("C://Users/iiitb/Desktop")
seeds <- read.csv("log_inf.csv",sep=",")
trainSize <- round(nrow(seeds) * 0.7)
testSize <- nrow(seeds) - trainSize
set.seed(123)
training_indices <- sample(seq_len(nrow(seeds)),
                           size=trainSize)

test_indices = -training_indices

attach(seeds)
diff <- depth_buy_quantity_0 - depth_sell_quantity_0
high_1 <- ifelse(diff>0,"high_demand","low_demand")

seeds = data.frame(seeds,high_1)
#trainSet = data.frame(trainSet,high_1)
#testSet = data.frame(testSet,high_1)
trainSet <- seeds[training_indices, ]
testSet <- seeds[-training_indices, ]
test_high = high_1[training_indices]
tree_2 = ctree(high_1~change,data=trainSet)
testpred <- predict(tree_2,newdata=testSet)
table(testpred,testSet$high_1)
plot(tree_2)


svm_model <- svm(high_1 ~ change ,trainSet)
predict_y <- predict(svm_model,trainSet)
points(trainSet$high_1,col="blue",pch=4)

model  <- svm(high_1 ~ depth_buy_quantity_0-depth_sell_quantity_0, data = trainSet, kernel = "radial", gamma = 0.001, cost = 10) 
set.seed(3233)

svm_Linear <- train(V14 ~., data = training, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)




lm_model <- lm(high_1 ~ (depth_buy_quantity_0 + depth_sell_quantity_0) ,data = trainSet)
test_pred <- predict(lm_model,newdata = testSet)
table(test_pred,high_1)

