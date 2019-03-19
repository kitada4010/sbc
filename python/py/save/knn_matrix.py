import pylab as p
#import iwavelets.pycwt as w
import math,numpy,matplotlib
import matplotlib.ticker as ticker
import pickle
import numpy as np
import pandas as pd
import sys
import scipy
from swan import pycwt
from scipy import signal
from pylab import *
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix

#引数1 : 学習したデータ
#引数2 : エピソード
#引数3 : 個体番号
#引数4 : 判定データ
#引数5 : 判定データの開始時間
#引数6 : 判定データの終了時間

#特徴量
X = np.loadtxt(sys.argv[1],delimiter=",")
# 目的変数
#Y = np.loadtxt("/home/nodoka/18-kitada-bachelor-data/spectrogram/4ms-feature-data/group/label.csv",delimiter=",")
Y = np.loadtxt(sys.argv[2],delimiter=",")

#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open(sys.argv[3], mode='rb') as st:
    model = pickle.load(st)



k=3
roop = 100
#result = np.empty((6,6),int)
result = []
Y_pred = knc.predict

result = np.array(confusion_matrix(Y,Y_pred), dtype = 'float')


f = open(sys.argv[3],'w')
f.write("accuracy:{:.4f} \n"
.format(knc.sorce(X,Y))
#f.write("\\begin{table}[tbp]\# n")  
# f.write('  \\begin{center}\n')
# f.write('    \caption{$SVM$による神経活動テストデータ判定の混同行列}\n')
# f.write('    \label{knnconfusiontest}\n')
f.write('\begin{tabular}{| c | c | r | r | r | r | r | r | r |}\hline \n')
f.write('  \multicolumn{3}{|c|}{}& \multicolumn{6}{c|}{識別率 ( 平均 $\pm$ 標準偏差 [\%])}\\\\ \hline \n')
f.write('  \multicolumn{3}{|c|}{}& \multicolumn{3}{c|}{経験前} & \multicolumn{3}{c|}{経験後}\\\\ \hline \n')
f.write('  &&& ベース波形 & リップル波形 & リップル & ベース波形 & リップル波形 & リップル \\\\ \n')
f.write('  &&&  &  &  ・ベース&  &  & ・ベース \\\\ \cline{2-9} \n')
f.write('  & 経 &ベース波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[0][0], result[0][1], result[0][2], result[0][3], result[0][4], result[0][5]))
f.write('  入& 験 & リップル波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[1][0], result[1][1], result[1][2], result[1][3], result[1][4], result[1][5]))
f.write('  力& 前 &リップル・ベース & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[2][0], result[2][1], result[2][2], result[2][3], result[2][4], result[2][5]))
f.write('  波& 経 &  ベース波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[3][0], result[3][1], result[3][2], result[3][3], result[3][4], result[3][5]))
f.write('  形& 験 &  リップル波形 & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[4][0], result[4][1], result[4][2], result[4][3], result[4][4], result[4][5]))
f.write('  & 後 &  リップル・ベース & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f} & {:.1f}  \\\\ \cline{3-9} \n'
.format(result[5][0], result[5][1], result[5][2], result[5][3], result[5][4], result[5][5]))
f.write('\end{tabular} ')

print('100.0%')

