import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
#spec = pd.read_csv('150Hzhpassdata.csv', header=None)

#ubuntu
# 特徴量
X = np.loadtxt(sys.argv[1],delimiter=",")
# 目的変数
#Y = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")
Y = np.loadtxt(sys.argv[2],delimiter=",")


model = LinearSVC(C=1.0)
model.fit(X, Y)


import pickle
with open(sys.arg[3] + '.pickle', mode='wb') as fp:
     pickle.dump(model, fp)

