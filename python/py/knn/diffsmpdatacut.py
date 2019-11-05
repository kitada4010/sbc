#import pylab as p
#import iwavelets.pycwt as w
import math,numpy
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
#plt.switch_backend('agg')
import pickle
import numpy as np
import pandas as pd
import sys
import os
#import scipy
#from swan import pycwt
#from scipy import signal
#from pylab import *
#sys.argv[1] : 開始時間データ
#sys.argv[2] : 終了時間データ
#sys.argv[3] : エピソード
#sys.argv[4] : 個体番号-(HR or HL)
#sys.argv[5] : 区切るデータ数(N) range
#sys.argv[6] : 飛ばすデータ数(s) 例) N=2048 → s=100
#sys.argv[7] : サンプリング周波数

#with open('/home/nodoka/win/ubuntu/txt-data/' + sys.argv[3] + '/' + sys.argv[4] + '.pickle', mode='rb') as fp:
#with open('/mnt/export1/st9/b009vb/yuni/txt-data/' + sys.argv[3] + '/' + sys.argv[4] + '.pickle', mode='rb') as fp:
with open(os.environ['HOME'] + '/data/txt-data/' + sys.argv[3] + '/' + sys.argv[4] + '.pickle', mode='rb') as fp:
    df = pickle.load(fp)
N = int(sys.argv[5])
s = int(sys.argv[6])
fs = float(sys.argv[7])
starttime = np.array(sys.argv[1], dtype='float128')
endtime = np.array(sys.argv[2], dtype='float128')
#endtime = float(sys.argv[2])
#print(df.dtypes)
print(type(starttime))
print(starttime.dtype)

if fs == 25000 :
    a = starttime * 100000
    b = round(a, 0)
    print(b)
    b = b // 4
#    print(a)
    c = b - (N/2)
    start = int(c)
    a = endtime * 100000
    b = round(a, 0)
#    print(a)
    b = b // 4
    #    print(b)
    c = b + (N/2)
    end = int(c)  
elif fs == 16666.6666667 :
    a = starttime * 100000
    b = round(a, 0)
    print(b)
    b = b // 6
#    print(a)
    c = b - (N/2)
    start = int(c)
    a = endtime * 100000
    b = round(a, 0)
    print(b)
#    print(a)
    b = b // 6

    c = b + (N/2)
    end = int(c)
else :
    print("not found smp data")
    sys.exit()

#end = int((endtime*fs) + (N/2) -s + 1)



specdatab = np.array(df[start:end])
del df

specdataa = specdatab.flatten()
del specdatab
fp.close

#print(specdataa.dtype)
specdataa = specdataa.astype(float)
#print(specdataa.dtype)


hammingWindow = np.hamming(N)
length = (end - start)/fs


pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=fs, noverlap=N-s, window=hammingWindow, xextent=(starttime,endtime))

del starttime, endtime, freqs, bins, im
spec = pd.DataFrame(pxx)
del specdataa, pxx

#print(len(df[start:end]))

spec_new = pd.DataFrame(index=spec.index, columns=[])
for i in range(0,len(spec.columns)) :
    spec1 = spec[i]
    spec_new[i]=spec1

spec_new.T.to_csv(sys.argv[3] + '-' + sys.argv[4] + '-' + sys.argv[1] + '-' + sys.argv[2] +'-pscut' +sys.argv[5]+ '.csv',header=False, index=False)
del spec, spec1
