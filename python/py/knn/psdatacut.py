import pylab as p
#import iwavelets.pycwt as w
import math,numpy,matplotlib
import pickle
import numpy as np
import pandas as pd
import sys
import scipy
#from swan import pycwt
from scipy import signal
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
N = 2048
s=100
fs = 25000 #サンプリング周波数
starttime = float(sys.argv[1])
endtime = float(sys.argv[2])
start = int((starttime*fs) - (N/2))
end = int((endtime*fs) + (N/2) -s + 1)



specdatab = np.array(df[start:end])
del df
specdataa = specdatab.flatten()
del specdatab
fp.close


hammingWindow = np.hamming(N)
length = (end - start)/fs



pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=fs, noverlap=N-s, window=hammingWindow, xextent=(starttime,endtime))
del starttime, endtime
spec = pd.DataFrame(pxx)
del specdataa, pxx

#print(len(df[start:end]))
spec_new = pd.DataFrame(index=spec.index, columns=[])
for i in range(0,len(spec.columns)) :
    spec1 = spec[i]
    spec_new[i]=spec1
spec_new.T.to_csv('B39-'+ sys.argv[1] + '-' + sys.argv[2] +'-pscut.csv',header=False, index=False)
del spec, spec1
