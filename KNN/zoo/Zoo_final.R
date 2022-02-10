# importing the zoo data set 

str(Zoo)

zoo1 <- Zoo[,-1]

View(zoo1)

str(zoo1)

zoo1$type <- factor(zoo1$type)

summary(zoo1)

# splitting the data into train and test

zoo_train <- zoo1[1:69,-17]
zoo_test <- zoo1[70:101,-17]

# creating lables for train and test data

zoo_train_lables <- zoo1[1:69,17]
zoo_test_lables <- zoo1[70:101,17]

# performing the knn model on the training data

library(class)

zoo_test_pred <- knn(train = zoo_train, test = zoo_test,
                     cl = zoo_train_lables, k = 4)

summary(zoo_test_pred)

library(gmodels)

CrossTable(x = zoo_test_pred, y = zoo_test_lables,
           prop.chisq = FALSE)

mean(zoo_test_pred == zoo_test_lables)

# for different values of k 
# for k = 5
zoo_test_pred <- knn(train = zoo_train, test = zoo_test,
                     cl = zoo_train_lables, k = 5)
CrossTable(x = zoo_test_pred, y = zoo_test_lables,
           prop.chisq = FALSE)

mean(zoo_test_pred == zoo_test_lables)

# for k = 7
zoo_test_pred <- knn(train = zoo_train, test = zoo_test,
                     cl = zoo_train_lables, k = 7)
CrossTable(x = zoo_test_pred, y = zoo_test_lables,
           prop.chisq = FALSE)

mean(zoo_test_pred == zoo_test_lables)

# for k = 9
zoo_test_pred <- knn(train = zoo_train, test = zoo_test,
                          cl = zoo_train_lables, k = 9)
CrossTable(x = zoo_test_pred, y = zoo_test_lables,
                prop.chisq = FALSE)
     
mean(zoo_test_pred == zoo_test_lables)

# so we will choose the k value to be k = 5      