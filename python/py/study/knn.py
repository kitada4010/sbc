import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys
from sklearn.model_selection import train_test_split

#argv[1] 特徴量
#argv[2] 目的変数
#argv[3] 


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


from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
k=3
roop = 100
#result = np.empty((6,6),int)
result = []
accuracy = []
for i in range(roop): 
    # トレーニング・テストデータ分割
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=i)

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
    for x in range(6):        
        result1[x,:] = 100*result1[x,:]/result_sum[x]
    result.append(result1.tolist())
    print('{:.1f}%' .format((100*i)/roop))

    

result = np.array(result)
accuracy = np.array(accuracy)
result_mean = result.mean(axis=0)
result_std = result.std(axis=0)
f = open(sys.argv[3],'w')
f.write("accuracy:{:.4f} $\\pm$ {:.4f}\n".format(accuracy.mean(axis=0), accuracy.std(axis=0)))
#f.write("\\begin{table}[tbp]\# n")  
# f.write('  \\begin{center}\n')
# f.write('    \caption{$SVM$による神経活動テストデータ判定の混同行列}\n')
# f.write('    \label{knnconfusiontest}\n')
f.write('    \\begin{tabular}{| l | l | l | l | l | l | l | l |}\hline \n')
f.write('      \multicolumn{2}{|c|}{}& \multicolumn{6}{c|}{自動判定結果 ( 平均 $\\pm$ 標準偏差 [\%])}\\\\ \hline \n')
f.write('      && ベース波形 & リップル波形 & ノイズ & リップル & ノイズ & リップル \\\\ \n')
f.write('      &&  &  &  & ・ベース & ・ベース & ・ノイズ \\\\ \cline{2-8} \n')
f.write('      実&ベース波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result_mean[0][0], result_std[0][0], result_mean[0][1], result_std[0][1], result_mean[0][2], result_std[0][2], result_mean[0][3], result_std[0][3], result_mean[0][4], result_std[0][4], result_mean[0][5], result_std[0][5]))
f.write('      際& リップル波形 & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result_mean[1][0], result_std[1][0], result_mean[1][1], result_std[1][1], result_mean[1][2], result_std[1][2], result_mean[1][3], result_std[1][3], result_mean[1][4], result_std[1][4], result_mean[1][5], result_std[1][5]))
f.write('      の& ノイズ & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{{2-8}} \n' 
      .format(result_mean[2][0], result_std[2][0], result_mean[2][1], result_std[2][1], result_mean[2][2], result_std[2][2], result_mean[2][3], result_std[2][3], result_mean[2][4], result_std[2][4], result_mean[2][5], result_std[2][5]))
f.write('      ラ& リップル・ベース & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result_mean[3][0], result_std[3][0], result_mean[3][1], result_std[3][1], result_mean[3][2], result_std[3][2], result_mean[3][3], result_std[3][3], result_mean[3][4], result_std[3][4], result_mean[3][5], result_std[3][5]))
f.write('      ベ& ノイズ・ベース & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \cline{{2-8}} \n' 
.format(result_mean[4][0], result_std[4][0], result_mean[4][1], result_std[4][1], result_mean[4][2], result_std[4][2], result_mean[4][3], result_std[4][3], result_mean[4][4], result_std[4][4], result_mean[4][5], result_std[4][5]))
f.write('      ル&  リップル・ノイズ & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f} & {:.1f} $\\pm$ {:.1f}  \\\\ \hline \n' 
.format(result_mean[5][0], result_std[5][0], result_mean[5][1], result_std[5][1], result_mean[5][2], result_std[5][2], result_mean[5][3], result_std[5][3], result_mean[5][4], result_std[5][4], result_mean[5][5], result_std[5][5]))
f.write('    \end{tabular} \n')
#f.write('  \end{center} \n')
#f.write('\end{table} \n')
print('100.0%')
#print(result_mean[0][0],result_std[0][0])
