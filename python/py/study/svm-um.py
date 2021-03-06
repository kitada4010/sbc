import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score

#argv[1] 特徴量
#argv[2] 目的変数
#argv[3] 出力ファイル名

#spec = pd.read_csv('150Hzhpassdata.csv', header=None)

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
#print(Y)



roop = 100
#result = np.empty((6,6),int)
result_train = []
result = []
accuracy = []
accuracy_train = []
for i in range(roop): 
    # トレーニング・テストデータ分割
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=i)

    model = LinearSVC(C=1.0)
    model.fit(X_train, Y_train)
    
    # トレーニング, テストデータに対する精度   
    # 評価 R^2
    Y_pred_train = model.predict(X_train)
    Y_pred = model.predict(X_test)
    # 予測　
    score_train = accuracy_score(Y_train, Y_pred_train)
    score = accuracy_score(Y_test, Y_pred)
    #print("[%d] score: {:.2f}".format(score) % k)
    accuracy_train.append(score_train.tolist())
    accuracy.append(score.tolist())
    #print("{:.2f}".format(score))
    result1_train = np.array(confusion_matrix(Y_train,Y_pred_train), dtype = 'float')
    result1 = np.array(confusion_matrix(Y_test,Y_pred), dtype = 'float')
    result_train_sum = result1_train.sum(axis=1)
    result_sum = result1.sum(axis=1)
    #print(result_sum)
    for x in range(6):        
        result1_train[x,:] = 100*result1_train[x,:]/result_train_sum[x]
        result1[x,:] = 100*result1[x,:]/result_sum[x]
    result_train.append(result1.tolist())
    result.append(result1.tolist())

    
result_train = np.array(result_train)
accuracy_train = np.array(accuracy_train)
result_train_mean = result_train.mean(axis=0)
result_train_std = result_train.std(axis=0)
f = open(sys.argv[3]+"-train.tex",'w')
f.write("accuracy:{:.4f} $\\pm$ {:.4f}\n".format(accuracy_train.mean(axis=0), accuracy_train.std(axis=0)))
f.write("\\begin{table}[tbp]\n")  
f.write('  \\begin{center}\n')
f.write('    \caption{$SVM$による神経活動テストデータ判定の混同行列}\n')
f.write('    \label{knnconfusiontest}\n')
f.write('    \\begin{tabular}{| l | l | l | l | l |}\hline \n')
f.write('      \multicolumn{2}{|c|}{}& \multicolumn{3}{c|}{自動判定結果 ( 平均 $\\pm$ 標準偏差 [\%])}\\\\ \hline \n')
f.write('      && ベース波形 & リップル波形 & リップル  \\\\ \n')
f.write('      &&  &  & ベース  \\\\ \cline{2-4} \n')
f.write('      目視& ベース波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{2-4} \n'
.format(result_mean[0][0], result_std[0][0], result_mean[0][1], result_std[0][1], result_mean[0][2], result_std[0][2], ))
f.write('      による& リップル波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}   \\\\ \cline{2-4} \n'
.format(result_mean[1][0], result_std[1][0], result_mean[1][1], result_std[1][1], result_mean[1][2], result_std[1][2], ))
f.write('      判定& リップル・ベース & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{2-4} \n'
.format(result_mean[2][0], result_std[2][0], result_mean[2][1], result_std[2][1], result_mean[2][2], result_std[2][2], ))
f.write('    \end{tabular} \n')
f.write('  \end{center} \n')
f.write('\end{table} \n')
f.close()



result = np.array(result)
accuracy = np.array(accuracy)
result_mean = result.mean(axis=0)
result_std = result.std(axis=0)
f = open(sys.argv[3]+".tex",'w')
f.write("accuracy:{:.4f} $\\pm$ {:.4f}\n".format(accuracy.mean(axis=0), accuracy.std(axis=0)))
#f.write("\\begin{table}[tbp]\n")  
#f.write('  \\begin{center}\n')
#f.write('    \caption{$SVM$による神経活動テストデータ判定の混同行列}\n')
#f.write('    \label{knnconfusiontest}\n')
#f.write('  \end{center} \n')
#f.write('\end{table} \n')
f.close()

#print(result_mean[0][0],result_std[0][0])
