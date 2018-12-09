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

plt.figure(figsize=(10, 4))
plt.subplots_adjust(wspace=0.0, hspace=-0.4)
plt.subplot(4, 1, 1)
ylabel("voltage [V]")
plt.xticks(color="None")
plt.tick_params('x',direction='in' ,  top=True)
plt.xlim(starttime,endtime)
plt.ylim(-4,2)
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
#N = 2048
N = 512
#N = 128
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

#plt.figure(figsize=(7, 2))

# スペクトログラムを描画
plt.subplot(2, 1, 2)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N-1, window=hammingWindow, xextent=(starttime,endtime))
axis([starttime, starttime+length, 0, samplingrate / 2])
xlabel("time [second]")
#plt.ylim(0,10000)
plt.yticks([100,1000,10000])
plt.ylim(100,10000)
plt.yscale("log")
ylabel("frequency [Hz]")
axColor = plt.axes([0.91, 0.13, 0.03, 0.45])
plt.colorbar(im, cax=axColor, orientation="vertical")
#plt.colorbar(orientation='horizontal')

plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] +'.png',dpi=300)
#plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] + '.png',dpi=300)

del specdatab, pxx, freqs, bins, im
