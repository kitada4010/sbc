import pylab as p
import math,numpy,matplotlib
import pickle
import numpy as np
import pandas as pd
import sys
import scipy
from swan import pycwt
from scipy import signal
from pylab import *
#spec = pd.read_csv('/home/nodoka/18-kitada-bachelor-paper/knn/feature-data'+sys.argv[4], header=None)
spec = pd.read_csv(sys.argv[4], header=None)
spec = spec

spec_new = pd.DataFrame(index=spec.T.index, columns=[])
for i in range(0,len(spec)) :
    spec1 = spec.T[i]
    mr = max(spec1)
    spec1 /= mr
    #plot(spec1)
    spec_new[i]=spec1

spec_new.T.to_csv('B39-'+ sys.argv[1]+'-'+ sys.argv[2] +'-'+ sys.argv[3] +'-nomalize.csv',header=False, index=False)