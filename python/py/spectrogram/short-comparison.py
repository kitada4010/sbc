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
N = 2048
fs = 25000
starttime = float(sys.argv[1])
endtime = float(sys.argv[2])
start = int(starttime*fs)
end = int(endtime*fs)
startdata = int((starttime*fs) - (N/2)+1)
enddata= int((endtime*fs) + (N/2) -1)

datatime = []
#print(df[start:end])
#specdatab = np.array(df[start:end])
for i in range(len(df[start:end])):
#    print(i)
    datatime.append([(starttime+(i/fs))])
#print(datatime)

plt.rcParams["font.size"] = 15
plt.figure(figsize=(10, 4))
plt.subplots_adjust(wspace=0.0, hspace=-0.4)
plt.subplot(4, 1, 1)
plt.yticks([-2, 0, 2])
ylabel("  voltage [V]\n ")
plt.tick_params(axis = 'y', length = 10)
plt.tick_params(axis = 'x', length = 10)
plt.xticks(color="None")
plt.tick_params('x',direction='in' ,  top=True)
plt.xlim(starttime,endtime)
plt.ylim(-4,2)
plt.plot(datatime,df[start:end])
del datatime

#data = df.dataframe([0], dtype='float')
#data = (pd.Series(df[start:end], dtype=np.float64))
#data = df.as_matrix(0,)#[start:end]
specdatab = np.array(df[startdata:enddata])
del df
specdataa = specdatab.flatten()
del specdatab
fp.close
#print(specdataa)

#N = 512
#N = 128
hammingWindow = np.hamming(N)
length = (end - start)/fs

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

#plt.figure(figsize=(7, 2))

# スペクトログラムを描画
plt.subplot(2, 1, 2)
#pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=fs, noverlap=N-1, window=hammingWindow, xextent=(starttime,endtime))
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=fs, noverlap=N-1, window=hammingWindow, xextent=(0, (endtime-starttime)*1000))
#axis([starttime, starttime+length, 0, fs / 2])
plt.tick_params(length = 10)
axis([0, (endtime-starttime)*1000, 0, fs / 2])
xlabel("time [ms]")
#plt.ylim(0,10000)
#plt.yticks([100,1000,10000])
#plt.ylim(100,10000)
#plt.yscale("log")
plt.yticks([200, 400, 600, 800, 1000])
#plt.yticks([150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000])
plt.ylim(150,1000)
ylabel("frequency [Hz]  ")
axColor = plt.axes([0.91, 0.13, 0.03, 0.45])
plt.colorbar(im, cax=axColor, orientation="vertical")
#plt.colorbar(orientation='horizontal')


#from matplotlib import rcParams
#rcParams.update({'figure.autolayout': True})
#plt.tick_params(length = 10)
plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] +'.pdf', bbox_inches="tight", dpi=300)
#plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] +'.eps')
#plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] +'.pdf',dpi=300)
#plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] + sys.argv[3] + '.png',dpi=300)

del specdataa, pxx, freqs, bins, im
