import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
#from sklearn.svm import LinearSVC
from sklearn import datasets
from sklearn.preprocessing import StandardScaler
import numpy as np
from matplotlib import pyplot as plt
#spec = pd.read_csv('150Hzhpassdata.csv', header=None)

#ubuntu
# 特徴量
#X = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/150.csv",delimiter=",")
X = np.loadtxt(sys.argv[1],delimiter=",")
# 目的変数
#Y = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")
Y = np.loadtxt(sys.argv[2],delimiter=",")

#vine linux
# 特徴量
#X = np.loadtxt("/home2/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/150.csv",delimiter=",")
#print(X)
# 目的変数
#Y = np.loadtxt("/home2/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")


# データ表示（特徴量）
print("データ数 = %d  特徴量 = %d" % (X.shape[0], X.shape[1]))


# データ表示（目的変数）
print("データ数 = %d" % (Y.shape[0]))
#print(Y)


from sklearn.neighbors import KNeighborsClassifier

# トレーニング・テストデータ分割
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=2)

#
# K-近傍法
#


list_nn = []
list_score = []

from sklearn.svm import LinearSVC
# 線形SVMのインスタンスを生成
#model = SVC(kernel='linear', random_state=None)
model = LinearSVC(C=1.0)

# モデルの学習。fit関数で行う。
line = model.fit(X_train, Y_train)
time = range(149, 1025)


#print(model.coef_[0])
plt.plot(time, model.coef_[0])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('base.eps',dpi=300)
plt.figure()

plt.plot(time, model.coef_[1])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('ripple.eps',dpi=300)
plt.figure()

plt.plot(time, model.coef_[2])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('noise.eps',dpi=300)
plt.figure()

plt.plot(time, model.coef_[3])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('base-ripple.eps',dpi=300)
plt.figure()

plt.plot(time, model.coef_[4])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('base-noise.eps',dpi=300)
plt.figure()

plt.plot(time, model.coef_[5])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient of determination")
plt.xlim(150,1024)
plt.savefig('noise-ripple.eps',dpi=300)
plt.figure()
print(len(model.coef_))
print(len(model.coef_[0]))
# 予測　
#Y_pred = knc.predict(X_test)
print(model.get_params)
# 評価 R^2
#score = knc.score(X_test, Y_test)
from sklearn.metrics import accuracy_score
# トレーニングデータに対する精度
pred_train = model.predict(X_train)
accuracy_train = accuracy_score(Y_train, pred_train)
print('トレーニングデータに対する正解率： %.2f' % accuracy_train)



# テストデータに対する精度
pred_test = model.predict(X_test)
accuracy_test = accuracy_score(Y_test, pred_test)
print('テストデータに対する正解率： %.2f' % accuracy_test)

from sklearn.metrics import confusion_matrix
print(confusion_matrix(Y_train, pred_train))
print(confusion_matrix(Y_test, pred_test))
