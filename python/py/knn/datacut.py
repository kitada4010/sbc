import pylab as p
#import iwavelets.pycwt as w
import math,numpy,matplotlib
import pickle
import numpy as np
import pandas as pd
import sys
import scipy
from swan import pycwt
from scipy import signal
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
fs = 25000 #サンプリング周波数
starttime = float(sys.argv[1])
endtime = float(sys.argv[2])
start = int(starttime*fs)
end = int(endtime*fs)

del starttime, endtime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()

fp.close

P = 1024
widths = np.arange(1, P)


cwtmatr = pycwt.cwt_f(specdataa, widths, fs, pycwt.Morlet())
rr = np.abs(cwtmatr)
del cwtmatr


spec = pd.DataFrame(rr)
del specdataa

del rr
s=1000
spec_new = pd.DataFrame(index=spec.index, columns=[])
for i in range(0,len(df[start:end])-1,s) :
    spec1 = spec[i]
    spec_new[i/s]=spec1
spec_new.T.to_csv('B39-'+ sys.argv[1] + '-' + sys.argv[2] +'-cut.csv',header=False, index=False)
del df, widths, spec, spec1
