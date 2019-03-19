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
accuracy = []
Y_pred = knc.predict


    

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
