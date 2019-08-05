import pickle
import numpy as np
import wave
from pylab import *
import matplotlib as mpl
#mpl.use('Agg')
import matplotlib.pyplot as plt
plt.switch_backend('agg')
#from mpl_toolkits.mplot3d import axes3d
#from matplotlib import cm

#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B36 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B36 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B36 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)

#start = int(58.59/0.00004)
#end = int(197.47/0.00004)
#start = int(167.39/0.00004)
#end = int(272.67/0.00004)
#start = int(881.13744/0.00004)
#end = int(881.35202/0.00004)

starttime = 881.13744
endtime = 881.35202
start = int(starttime/0.00004)
end = int(endtime/0.00004)
datatime = []
#print(df[start:end])
#specdatab = np.array(df[start:end])
for i in range(len(df[start:end])):
#    print(i)
    datatime.append([(starttime+(i*0.00004))])
#print(datatime)

plt.subplot(2, 2, 1)
plt.plot(datatime,df[start:end])
del datatime

#data = df.dataframe([0], dtype='float')
#data = (pd.Series(df[start:end], dtype=np.float64))
#data = df.as_matrix(0,)#[start:end]
specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
fp.close
#print(specdataa)
N = 1024
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

# スペクトログラムを描画
plt.subplot(2, 2, 2)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N-1, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim([0,2056])
ylabel("frequency [Hz]")
plt.colorbar()

del specdataa, specdatab, pxx, freqs, bins, im, hammingWindow

plt.subplot(2, 2, 3)
starttime = 889.13744
endtime = 889.35202
datatime = []
start = int(starttime/0.00004)
end = int(endtime/0.00004)
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])
plt.plot(datatime,df[start:end])

#data = df.dataframe([0], dtype='float')
#data = (pd.Series(df[start:end], dtype=np.float64))
#data = df.as_matrix(0,)#[start:end]
specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
fp.close
#print(specdataa)
N = 1024
hammingWindow = np.hamming(N)
samplingrate = 25000
length = (end - start)/samplingrate

# FFTで用いるハミング窓
hammingWindow = np.hamming(N)

# スペクトログラムを描画
plt.subplot(2, 2, 4)
pxx, freqs, bins, im = plt.specgram(specdataa, NFFT=N, Fs=samplingrate, noverlap=N-1, window=hammingWindow)
axis([0, length, 0, samplingrate / 2])
xlabel("time [second]")
plt.ylim([0,2056])
ylabel("frequency [Hz]")
plt.colorbar()

plt.savefig('B36hikakunotameno.png',dpi=300)
#plt.imwrite('B36hikakunotameno.png',img)


del df, specdataa, specdatab, pxx, freqs, bins, im, hammingWindow
