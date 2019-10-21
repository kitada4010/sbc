import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys
from sklearn.model_selection import train_test_split

#リップルに対する識別率の導出
#argv[1] 特徴量
#argv[2] 目的変数
#argv[3] 出力ファイル名


#ubuntu
# 特徴量
X = np.loadtxt(sys.argv[1],delimiter=",")
# 目的変数
#Y = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")
Y = np.loadtxt(sys.argv[2],delimiter=",")

#vine linux
# 特徴量
#X = np.loadtxt("/home/hera/nodoka/home2/nodoka/knn/spectrogram/4ms-feature-data/group/all.csv",delimiter=",")
#print(X)
# 目的変数
#Y = np.loadtxt("/home/hera/nodoka/home2/nodoka/knn/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")


# データ表示（特徴量）
#print("データ数 = %d  特徴量 = %d" % (X.shape[0], X.shape[1]))


# データ表示（目的変数）
#print("データ数 = %d" % (Y.shape[0]))
#print(Y
print(X.dtype)
print(Y.dtype)
Y = Y.astype(int)
print(Y.dtype)

from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
k=3
roop = 3
#result = np.empty((6,6),int)
result = []
accuracy = []
for i in range(roop): 

    # トレーニング・テストデータ分割
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.3, random_state=i)

    # KNeighborsClassifier
    knc = KNeighborsClassifier(n_neighbors=k)
    knc.fit(X_train, Y_train)
    
    # 予測　
    Y_pred = knc.predict(X_test)
    
    # 評価 R^2
    score = knc.score(X_test, Y_test)
    #print("[%d] score: {:.2f}".format(score) % k)
    accuracy.append(score.tolist())
    #print("{:.2f}".format(score))
    result1 = np.array(confusion_matrix(Y_test,Y_pred), dtype = 'float')
    result_sum = result1.sum(axis=1)
    #print(result_sum)
    for x in range(3):
        result1[x,:] = 100*result1[x,:]/result_sum[x]
    result.append(result1.tolist())
    print('{:.1f}%' .format((100*i)/roop))

    

result = np.array(result)
accuracy = np.array(accuracy)
result_mean = result.mean(axis=0)
result_std = result.std(axis=0)
print(result_mean)
print(result_std)
f = open(sys.argv[3],'w')
print(sys.argv[1] + "-" + sys.argv[2])
print("accuracy:{:.4f} $\\pm$ {:.4f}\n".format(accuracy.mean(axis=0), accuracy.std(axis=0)))
print("\\begin{table}[tbp]\# n", file=f)  
print('  \\begin{center}\n', file=f)
print('    \caption{$k$nnによる' + sys.argv[1] +'リップル出現識別率}\n', file=f)
print('    \label{knnconfusiontest}\n', file=f)
print('    \\begin{tabular}{| l | l | l | l | l |}\hline \n', file=f)
print('      \multicolumn{2}{|c|}{}& \multicolumn{3}{c|}{自動判定結果 ( 平均 $\\pm$ 標準偏差 [\%])}\\\\ \hline \n', file=f)
print('      && ベース波形 & リップル波形 & リップル  \\\\ \n')
print('      &&  &  & ベース  \\\\ \cline{2-5} \n', file=f)
print("      目視& ベース波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{2-5} \n".format(result_mean[0][0], result_std[0][0], result_mean[0][1], result_std[0][1], result_mean[0][2], result_std[0][2]) , file=f)
print('      による& リップル波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}   \\\\ \cline{2-5} \n'.format(result_mean[1][0], result_std[1][0], result_mean[1][1], result_std[1][1], result_mean[1][2], result_std[1][2] ), file=f)
print('      判定& リップル・ベース & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{2-5} \n'.format(result_mean[2][0], result_std[2][0], result_mean[2][1], result_std[2][1], result_mean[2][2], result_std[2][2] ), file=f)
print('    \end{tabular} \n', file=f)
print('  \end{center} \n', file=f)
print('\end{table} \n', file=f)
print('100.0%')
#print(result_mean[0][0],result_std[0][0])
