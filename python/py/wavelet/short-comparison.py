#import pylab as p
#import iwavelets.pycwt as w
import math,numpy,matplotlib
import pickle
import numpy as np
import scipy
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
from scipy import signal
from pylab import *
#with open('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
with open('/home/nodoka/spike-data/25kHz-data/B39 Rd.pickle', mode='rb') as fp:
#with open('/Volumes/NO NAME/25kHz-data/B39 Rd.pickle',mode='rb') as fp:
    df = pickle.load(fp)


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
xlim(starttime,endtime)
ylabel("voltage")
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
del df
specdataa = specdatab.flatten()
fp.close
del specdatab
#widths = np.arange(1, 31)
P = 4096
widths = np.arange(1, P)

plt.subplot(2, 1, 2)
cwtmatr = scipy.signal.cwt(specdataa, signal.ricker, widths)
plt.imshow(cwtmatr, extent=[starttime, endtime, P, 1], cmap='PRGn', aspect='auto',vmax=abs(cwtmatr).max(), vmin=-abs(cwtmatr).max())
xlim(starttime, endtime)
#ylim(0, 4096)
xlabel("time [second]")
ylabel("frequency [Hz]")
plt.colorbar(orientation='horizontal')
plt.yscale("log")
#plt.clim(-15,15)
plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] +'-'+ sys.argv[3] +'.png',dpi=300)

#p.show()
del widths, specdataa
