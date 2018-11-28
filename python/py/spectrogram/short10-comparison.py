import pickle
import numpy as np
import wave
import sys
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B36 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
    
####base---------------------------------------------------------------------------------------------
starttime = float(sys.argv[1])
endtime = float(sys.argv[2])
start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []
#print(df[start:end])
#specdatab = np.array(df[start:end])
for i in range(len(df[start:end])):
#    print(i)
    datatime.append([(starttime+(i*0.00004))])
#print(datatime)

plt.figure(figsize=(6, 4))

plt.subplot(2, 1, 1)
plt.xlim(starttime,endtime)
plt.plot(datatime,df[start:end])
del datatime

#data = df.dataframe([0], dtype='float')
#data = (pd.Series(df[start:end], dtype=np.float64))
#data = df.as_matrix(0,)#[start:end]
specdatab = np.array(df[start:end])
del df
specdataa = specdatab.flatten()
del specdatab
fp.close
#print(specdataa)
N = 2048
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

#plt.figure(figsize=(7, 2))

# スペクトログラムを描画
plt.subplot(2, 1, 2)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N-1, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim(0,N/2)
ylabel("frequency [Hz]")
plt.colorbar(orientation='horizontal')

#plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] +'ripple-spec.png',dpi=300)
plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] +'spec-ripple.png',dpi=300)

del specdataa, pxx, freqs, bins, im
