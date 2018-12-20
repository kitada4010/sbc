#import pylab as p
#import iwavelets.pycwt as w
import math,numpy,matplotlib
import pickle
#import numpy as np
import scipy
import sys
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
from scipy import signal
from pylab import *
import pycwt
from swan import pycwt
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
    datatime.append([(starttime+(i*0.00004))])

plt.figure(figsize=(10, 4))
plt.subplots_adjust(wspace=0.0, hspace=-0.4)
plt.subplot(4, 1, 1)
xlim(starttime,endtime)
plt.yticks([-3,-2,-1,0,1,2])
plt.ylim(-4,2)
ylabel("voltage [V]")
plt.xticks(color="None")
plt.tick_params('x',direction='in' ,  top=True)
plt.plot(datatime,df[start:end])
del datatime

specdatab = np.array(df[start:end])
del df
specdataa = specdatab.flatten()
fp.close
del specdatab
#widths = np.arange(1, 31)
P = 1024
#P = 16384

widths = np.arange(1, P)

plt.subplot(2, 1, 2)
sigma = 1.0
cwtmatr = pycwt.cwt_f(specdataa, widths, 25000, pycwt.Mexican_hat(sigma))
rr=np.abs(cwtmatr)

del widths
im = plt.imshow(np.flipud(rr), extent=[starttime, endtime, P, 1], aspect='auto',interpolation='nearest')
xlim(starttime, endtime)
#ylim(0, 4096)
xlabel("time [s]")
ylabel("frequency [Hz]")
plt.yticks([1,10,100,1000])
plt.ylim(1,1000)
#plt.yticks([1,10,100,1000,10000])
#plt.ylim(1,10000)
plt.yscale("log")
axColor = plt.axes([0.91, 0.13, 0.03, 0.45])
plt.colorbar(im, cax=axColor, orientation="vertical")
#plt.clim(-15,15)

plt.savefig('B39'+ sys.argv[1] +'-'+ sys.argv[2] +'-'+ sys.argv[3] +'.png',dpi=300)

#p.show()
#del  widths, specdataa, cwtmatr, signal.ricker, im, axColor
del specdataa, cwtmatr, im, axColor, 
