import pickle
import numpy as np
import sys
import wave
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B36 Rd.pickle', mode='rb') as fp:
with open(sys.argv[1]+ '.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B36 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)
    
####base---------------------------------------------------------------------------------------------
starttime = 400
endtime = 800
start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []

for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])


plt.subplot(3, 2, 1)
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
fp.close
#print(specdataa)
N = 2048
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

# スペクトログラムを描画
plt.subplot(3, 2, 2)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N/2, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim(0,N/2)
ylabel("frequency [Hz]")
plt.colorbar()

del specdataa, specdatab, pxx, freqs, bins, im
####10min---------------------------------------------------------------------------------------------
starttime = 1700
endtime = 2100
start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []

for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])


plt.subplot(3, 2, 3)
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
fp.close
N = 2048
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

# スペクトログラムを描画
plt.subplot(3, 2, 4)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N/2, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim(0,N/2)
ylabel("frequency [Hz]")
plt.colorbar()


del specdataa, specdatab, pxx, freqs, bins, im
####10min---------------------------------------------------------------------------------------------
starttime = 2750
endtime = 3150
start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])


plt.subplot(3, 2, 5)
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
fp.close
N = 2048
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

# スペクトログラムを描画
plt.subplot(3, 2, 6)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N/2, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim(0,N/2)
ylabel("frequency [Hz]")
plt.colorbar()

plt.savefig(sys.argv[1] + '-comparison.png',dpi=300)

del df, specdataa, specdatab, pxx, freqs, bins, im, plt, length, samplingrate, end, start
