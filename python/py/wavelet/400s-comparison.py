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

with open(sys.argv[1]+ '.pickle', mode='rb') as fp:
    df = pickle.load(fp)
fp.close
###base###-----------------------------------------------------------------------------------------------------------------------------------------
starttime = 400
endtime = 800
start = int(starttime/0.00004)
end = int(endtime/0.00004)

datatime = []
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])

plt.figure(figsize=(6, 4))

plt.subplot(6, 1, 1)
xlim(starttime,endtime)
ylabel("電圧")
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
del specdatab
P = 1028
widths = np.arange(1, P)

plt.subplot(6, 1, 2)
cwtmatr = scipy.signal.cwt(specdataa, signal.ricker, widths)
plt.imshow(cwtmatr, extent=[starttime, endtime, P, 1], cmap='PRGn', aspect='auto',vmax=abs(cwtmatr).max(), vmin=-abs(cwtmatr).max())
xlim(starttime, endtime)
xlabel("time [second]")
ylabel("frequency [Hz]")
plt.colorbar(orientation='horizontal')


###base###-----------------------------------------------------------------------------------------------------------------------------------------
starttime = 1700
endtime = 2100
start = int(starttime/0.00004)
end = int(endtime/0.00004)

datatime = []
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])

plt.figure(figsize=(6, 4))

plt.subplot(6, 1, 3)
xlim(starttime,endtime)
ylabel("電圧")
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
del specdatab
P = 1028
widths = np.arange(1, P)

plt.subplot(6, 1, 4)
cwtmatr = scipy.signal.cwt(specdataa, signal.ricker, widths)
plt.imshow(cwtmatr, extent=[starttime, endtime, P, 1], cmap='PRGn', aspect='auto',vmax=abs(cwtmatr).max(), vmin=-abs(cwtmatr).max())
xlim(starttime, endtime)
xlabel("time [second]")
ylabel("frequency [Hz]")
plt.colorbar(orientation='horizontal')
del widths, specdataa

###30min###-----------------------------------------------------------------------------------------------------------------------------------------
starttime = 2750
endtime = 3150
start = int(starttime/0.00004)
end = int(endtime/0.00004)

datatime = []
for i in range(len(df[start:end])):
    datatime.append([(starttime+(i*0.00004))])

plt.figure(figsize=(6, 4))

plt.subplot(6, 1, 1)
xlim(starttime,endtime)
ylabel("電圧")
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
specdataa = specdatab.flatten()
del specdatab
P = 1028
widths = np.arange(1, P)

plt.subplot(6, 1, 2)
cwtmatr = scipy.signal.cwt(specdataa, signal.ricker, widths)
plt.imshow(cwtmatr, extent=[starttime, endtime, P, 1], cmap='PRGn', aspect='auto',vmax=abs(cwtmatr).max(), vmin=-abs(cwtmatr).max())
xlim(starttime, endtime)
xlabel("time [second]")
ylabel("frequency [Hz]")
plt.colorbar(orientation='horizontal')


plt.savefig( sys.argv[1] +'400s.png',dpi=300)

del widths, specdataa
