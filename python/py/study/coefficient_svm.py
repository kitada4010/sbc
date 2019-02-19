import numpy as np
import pandas as pd
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
#from sklearn.svm import LinearSVC
from sklearn import datasets
from sklearn.preprocessing import StandardScaler
import sys
import numpy as np
from matplotlib import pyplot as plt
import matplotlib.pyplot as plt
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
#print("データ数 = %d  特徴量 = %d" % (X.shape[0], X.shape[1]))


# データ表示（目的変数）
#print("データ数 = %d" % (Y.shape[0]))
#print(Y)


from sklearn.neighbors import KNeighborsClassifier

# トレーニング・テストデータ分割
#X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=2)

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
line = model.fit(X, Y)
time = range(149, 1025)


#print(model.coef_[0])
plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[0])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'base.eps',dpi=300)


plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[1])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'ripple.eps',dpi=300)


plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[2])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'noise.eps',dpi=300)
 

plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[3])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'base-ripple.eps',dpi=300)
 

plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[4])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'base-noise.eps',dpi=300)
 

plt.figure(figsize=(10,4))
plt.plot(time, model.coef_[5])
plt.xlabel("frequency [Hz]")
plt.ylabel("coefficient")
plt.xlim(150,1024)
plt.ylim(-3.5,3.5)
plt.savefig(sys.argv[3]+'noise-ripple.eps',dpi=300)


print(len(model.coef_))
print(len(model.coef_[0]))
# 予測　
#Y_pred = knc.predict(X_test)
print(model.get_params)
# 評価 R^2
#score = knc.score(X_test, Y_test)
from sklearn.metrics import accuracy_score
# トレーニングデータに対する精度
pred_train = model.predict(X)
accuracy_train = accuracy_score(Y, pred_train)
#print('トレーニングデータに対する正解率： %.2f' % accuracy_train)



# テストデータに対する精度
#pred_test = model.predict(X_test)
#accuracy_test = accuracy_score(Y_test, pred_test)
#print('テストデータに対する正解率： %.2f' % accuracy_test)

from sklearn.metrics import confusion_matrix
#print(confusion_matrix(Y_train, pred_train))
#print(confusion_matrix(Y_test, pred_test))

result = confusion_matrix(X, pred_train)


f = open(sys.argv[3],'w')
f.write("accuracy:{:.4f} $\\pm$ {:.4f}\n".format(accuracy_train))
f.write("\\begin{table}[tbp]\n")  
f.write('  \\begin{center}\n')
f.write('    \caption{$SVM$による神経活動テストデータ判定の混同行列}\n')
f.write('    \label{knnconfusiontest}\n')
f.write('    \\begin{tabular}{| l | l | l | l | l | l | l | l |}\hline \n')
f.write('      \multicolumn{2}{|c|}{}& \multicolumn{6}{c|}{予測結果}\\\\ \hline \n')
f.write('      && ベース波形 & リップル波形 & ノイズ & リップル & ノイズ & リップル \\\\ \n')
f.write('      &&  &  &  & ・ベース & ・ベース & ・ノイズ \\\\ \cline{{2-8}} \n')
f.write('      実&ベース波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result[0][0], result[0][1], result[0][2], result[0][3], result[0][4], result[0][5] ))
f.write('      際& リップル波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result[1][0], result[1][1], result[1][2], result[1][3], result[1][4], result[1][5] ))
f.write('      の& ノイズ & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{{2-8}} \n'
.format(result[2][0], result[2][1], result[2][2], result[2][3], result[2][4], result[2][5] ))
f.write('      分& リップル・ベース & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result[3][0], result[3][1], result[3][2], result[3][3], result[3][4], result[3][5] ))
f.write('      類& ノイズ・ベース & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result[4][0], result[4][1], result[4][2], result[4][3], result[4][4], result[4][5] ))
f.write('      & リップル・ノイズ & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \hline \n' 
.format(result[5][0], result[5][1], result[5][2], result[5][3], result[5][4], result[5][5] ))
f.write('    \end{tabular} \n')
f.write('  \end{center} \n')
f.write('\end{table} \n')
