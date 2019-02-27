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


#引数1 : 学習したデータ
#引数2 : エピソード
#引数3 : 個体番号
#引数4 : 判定データ
#引数5 : 判定データの開始時間
#引数6 : 判定データの終了時間


#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/18-kitada-bachelor-data/testdata' + sys.argv[1], mode='rb') as st:
    model = pickle.load(st)
with open('/home/nodoka/win/ubuntu/txt-data/'+ sys.argv[2] +'/'+ sys.argv[3], mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
# 特徴量
X = np.loadtxt(sys.argv[4],delimiter=",")
fs = 25000 #サンプリング周波数

starttime = float(sys.argv[1])
endtime = float(sys.argv[2])
start = int(starttime*fs)
end = int(endtime*fs)
datatime = []
#print(df[start:end])
#specdatab = np.array(df[start:end])
for i in range(len(df[start:end])):
    #    print(i)
    datatime.append([(i/fs)*1000])
    #print(datatime)

plt.figure(figsize=(10, 3))
#plt.subplots_adjust(wspace=0.0, hspace=-0.4)
#plt.subplot(4, 1, 1)
plt.rcParams["font.size"] = 15
xlim(0, (endtime-starttime)*1000)
plt.tick_params(length = 10)
plt.yticks([-3,-2,-1,0,1,2])
plt.ylim(-4,2)
plt.gca().get_xaxis().set_major_locator(ticker.MaxNLocator(integer=True))
#plt.xticks(int(starttime), int(endtime))
#ax.xaxis.set_major_formatter(ticker.FormatStrFormatter('%0.1f'))
ylabel("voltage [mV]")
xlabel("time [ms]")
#plt.xticks(color="None")
plt.plot(datatime,df[start:end])
plt.grid(which='major')
#gca().xaxis.set_minor_locator(MultipleLocator(0.04))
leng = np.arange(0, (endtime-starttime)*1000, 0.04)
#plt.xticks(leng,color="None")
#plt.xaxis.set_minor_locator(dates.DayLocator(interval=0.04))
#gca().xaxis.set_minor_locator(True,0.04)
s = 100



Y_graph = model.predict(X)

plt.axvspan(100,200,color="red")
for i in range(len(Y_graph)):
    print(Y_graph[i])
    if(Y_graph[i] == 1.0):
        plt.axvspan(((i*s-(s/2))/fs)*1000 ,((i*s+(s/2))/fs)*1000 ,color="blue")
    if(Y_graph[i] == 2.0):
        plt.axvspan(((i*s-(s/2))/fs)*1000 ,((i*s+(s/2))/fs)*1000 ,color="red")
    if(Y_graph[i] == 3.0):
        plt.axvspan(((i*s-(s/2))/fs)*1000 ,((i*s+(s/2))/fs)*1000 ,color="aqua")
    if(Y_graph[i] == 4.0):
        plt.axvspan(((i*s-(s/2))/fs)*1000 ,((i*s+(s/2))/fs)*1000 ,color="orange")
    if(Y_graph[i] == 5.0):
        plt.axvspan(((i*s-(s/2))/fs)*1000 ,((i*s+(s/2))/fs)*1000 ,color="mediumorchid")



plt.savefig(sys.argv[3] +'-'+ sys.argv[5] +'-'+ sys.argv[6] +'.eps',dpi=300)

del datatime
                                                                                                                
