import pandas as pd
import numpy as np

zoo = pd.read_csv("file:///D:/ExcelR/Assignments/KNN/Zoo.csv")

# split the data into train and test

from sklearn.model_selection import train_test_split

train, test = train_test_split(zoo, test_size = 0.2) # 0.2 =20% of the entire data

# KNN usign skleran
# importing KNN algorithm from the sklear.neighbors

from sklearn.neighbors import KNeighborsClassifier as KNC\

# for 3 nearest neighbors

neigh = KNC(n_neighbors = 21)

# fitting  to the training data

neigh.fit(train.iloc[:,1:18], train.iloc[:,0])

# train accuracy

train_acc = np.mean(neigh.predict(train.iloc[:,1:18])==train.iloc[:,0])

# test accuracy 

test_acc = np.mean(neigh.predict(test.iloc[:,1:18])==test.iloc[:,0])

# creating an empty list

acc = []

for i in range(4, 80, 2):
    neigh = KNC(n_neighbors = i)
    neigh.fit(train.iloc[:,1:18], train.iloc[:,0])
    train_acc = np.mean(neigh.predict(train.iloc[:,1:18])==train.iloc[:,0])
    test_acc = np.mean(neigh.predict(test.iloc[:,1:18])==test.iloc[:,0])
    acc.append([train_acc, test_acc])

import matplotlib.pyplot as plt # library to visualization
# train accuracy plot
plt.plot(np.arange(4, 80, 2),[i[0] for i in acc], "ro-")

# test accuracy plot
plt.plot(np.arange(4,80,2),[i[1] for i in acc], "bo-")

plt.legend(["train", "test"])

















