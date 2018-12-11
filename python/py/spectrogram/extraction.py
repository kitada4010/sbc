import pickle
import numpy as np
import pandas as pd
import wave
import sys
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
    
####base---------------------------------------------------------------------------------------------
starttime = 1695
endtime = 1705

N = 2048 #区切りデータ数




start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])


specdatab = np.array(df[start:end])
del df
specdataa = specdatab.flatten()
del specdatab
fp.close

hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate


hammingWindow = np.hamming(N)


pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N/2, window=hammingWindow,  xextent=(starttime,endtime))
axis([starttime, starttime + length, 0, samplingrate / 2])
spec = pd.DataFrame(pxx)
freq1 = spec.ix[600] #注目する周波数
freq2 = spec.ix[800]
freq3 = spec.ix[900]
freq4 = spec.ix[1000]
#freq5 = spec.ix[1000]

freq = (freq1 > 3*np.mean(freq1)) | (freq2 > 3*np.mean(freq2)) | (freq3 > 3*np.mean(freq3)) | (freq4 > 3*np.mean(freq4)) #| (freq5 > 3*np.mean(freq5))
#plt.plot(freq)
del freq1, freq2, freq3
#plt.show()

timescale = N/50000
#timerangepm = 0.15 #切り出し時間データプラスマイナス何秒か

with open('/home/nodoka/sbc/shell/extraction/1695-1705/68910or.txt', mode='w') as f:
    for i in range(len(freq)) :
        if freq[i] :
            writetime = starttime + (i+1) * timescale
            f.write(str(writetime-timescale) + '\t' + str(writetime+timescale) + '\n')


del specdataa, pxx, bins, im, spec
