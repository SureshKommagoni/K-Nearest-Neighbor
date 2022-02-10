import pandas as pd
import numpy as np

glass = pd.read_csv("file:///D:/ExcelR/Assignments/KNN/glass.csv")

# split data into train and test

from sklearn.model_selection import train_test_split

train, test = train_test_split(glass, test_size = 0.2) # 0.2 = 20% of entire data

# KNN using sklear
# importing KNN algorithm form sklearn.neighbors

from sklearn.neighbors import KNeighborsClassifier as KNC

# for 3 nearest neighbors

neigh = KNC(n_neighbors = 3)

# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])


# for 5 nearest neighbors

neigh = KNC(n_neighbors = 5)

# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])

# # for 10 nearest neighbors

neigh = KNC(n_neighbors = 10)

# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])


# for 15 nearest neighbors

neigh = KNC(n_neighbors = 15)

# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])

# for 12 nearest neighbors

neigh = KNC(n_neighbors = 18)

# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])

# creating an empty list

acc = []

for i in range(4, 50, 2):
    neigh = KNC(n_neighbors = i)
    neigh.fit(train.iloc[:,0:9], train.iloc[:,9])
    train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])
    test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])
    acc.append([train_acc, test_acc])


import matplotlib.pyplot as plt # library to visualization
# train accuracy plot
plt.plot(np.arange(4, 50, 2),[i[0] for i in acc], "ro-")

# test accuracy plot
plt.plot(np.arange(4,50,2),[i[1] for i in acc], "bo-")

plt.legend(["train", "test"])

# 
neigh = KNC(n_neighbors = 12) # here the 12 is choosen from the plot 


# fitting with training data

neigh.fit(train.iloc[:,0:9], train.iloc[:,9])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])

# test accuracy

test_acc = np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])












