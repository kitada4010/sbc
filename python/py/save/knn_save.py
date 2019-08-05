import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys
from sklearn.model_selection import train_test_split
#spec = pd.read_csv('150Hzhpassdata.csv', header=None)

#ubuntu
# 特徴量
X = np.loadtxt(sys.argv[1],delimiter=",")
# 目的変数
#Y = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")
Y = np.loadtxt(sys.argv[2],delimiter=",")




from sklearn.neighbors import KNeighborsClassifier
k=3

knc = KNeighborsClassifier(n_neighbors=k)
knc.fit(X, Y)
import pickle
with open(sys.argv[3] + '.pickle', mode='wb') as fp:
     pickle.dump(knc, fp)
