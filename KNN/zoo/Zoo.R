# load the zoo data 

View(Zoo)
# table of diagnosis
table(Zoo$animal.name)


# table or proportion with more informative labels
round(prop.table(table(Zoo$animal.name))*100, digits = 1)

str(Zoo)

# summarize three numeric features

summary(Zoo[c("eggs","milk","backbone","legs","type")])

normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

# test the normalized function - result should be identical
normalize(c(10,20,30,40,50))

# normalixe the Zoo data

Zoo_n <- as.data.frame(lapply(Zoo[2:18], normalize))

# confirm that normalization worked

summary(Zoo_n$legs)

# creating train and test data

Zoo_train <- Zoo_n[1:60,] # inputs of the train data
Zoo_test <- Zoo_n[61:101,] # inputs of the test data

# creating labels for the train and test data

Zoo_train_labels <- Zoo[1:60,1] # outputs of the train data column 1 only
Zoo_test_labels <- Zoo[61:101,1] # outputs of the test data column 1 only

# Training a model on the data

# load the "class" library

library("class")

Zoo_test_pred <- knn(train = Zoo_train, test = Zoo_test,
                     cl = Zoo_train_labels, k = 11)

#
#
#
#
#
# ------- Evaluating model performance ----------

# load the "gmodels" library

library("gmodels")

# Create Cross tabulation predicted Vs. actual

CrossTable(x = Zoo_test_labels, y = Zoo_test_pred,
           prop.chisq = FALSE)





















