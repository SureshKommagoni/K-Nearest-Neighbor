install.packages("caret")
install.packages("pROC")
install.packages("mlbench")
install.packages("lattice")
install.packages("gmodels")
install.packages("class")

library("caret")
library("pROC")
library("mlbench")
library("lattice")
library("gmodels")
library("class")

glass <- read.csv(file.choose())

View(glass)
# table on different types of glasses
table(glass$Type)

glass$Type = as.factor(glass$Type)
str(glass)
# Type1- 70, Type2-76,Type3-17,Type5-13,Type6-9,Type7-29

# table or proportation of enteries in the datasets. What % of glass of Type 1 and 2,3,4,5,6,7

round(prop.table(table(glass$Type))*100, 1)

summary(glass[c("RI","Na", "Mg")])

# Create a function to normalize the data

normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

# test normalization
normalize(c(10,20,30,40,50)) # here 10 =0 and 50 =1

# apply the normalization function to glass dataset

glass_n <- as.data.frame(lapply(glass[1:9], normalize))
View(glass_n)
summary(glass_n[c("RI","Na", "Mg")])

# Create training and test datasets

?set.seed()

set.seed(123)

ind <- sample(2, nrow(glass_n), replace = TRUE, prob = c(0.7,0.3))
?sample

glass_train <- glass_n[ind== 1,]
glass_test <- glass_n[ind== 2,]

# get lables for training and test datasets
set.seed(123)

ind1 <- sample(2, nrow(glass), replace = TRUE, prob = c(0.7,0.3))
glass_train_labels <- glass[ind== 1,10]
glass_test_labels <- glass[ind== 2, 10]

# Build a KNN model on training dataset

# Building the KNN model on training dataset and also need
# also need labels which we are including c1. once we build the prediction model
# we have to test on test dataset

glass_test_pred <- knn(train = glass_train, test = glass_test,
                       cl = glass_train_labels, k = 3)
table(glass_test_pred, glass_test_labels)

mean(glass_test_pred==glass_test_labels) # 68.42

## Evaluating model performance

# load "gmodel" library

CrossTable(x = glass_test_labels, y = glass_test_pred, prop.chisq = FALSE)

# for different values of k

glass_test_pred <- knn(train = glass_train, test = glass_test,
                       cl = glass_train_labels, k = 6)

CrossTable(x = glass_test_labels, y = glass_test_pred, prop.chisq = FALSE)

mean(glass_test_pred==glass_test_labels) 


glass_test_pred <- knn(train = glass_train, test = glass_test,
                       cl = glass_train_labels, k = 12)

CrossTable(x = glass_test_labels, y = glass_test_pred, prop.chisq = FALSE)

mean(glass_test_pred==glass_test_labels) 

glass_test_pred <- knn(train = glass_train, test = glass_test,
                       cl = glass_train_labels, k = 25)

mean(glass_test_pred==glass_test_labels) 














