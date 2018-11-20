import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle
import csv
import sys


#vine linux
#f = pd.read_csv('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/'+ sys.argv[1] +'d.csv',header=None)
#f.to_pickle('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/'+ sys.argv[1] +'d.pickle')

#mac
#f = pd.read_csv('/Volumes/NO NAME/25kHz-data/B36 Rd.csv',header=None)
#f.to_pickle('/Volumes/NO NAME/25kHz-data/B36 Rd.pickle')

#ubuntu
f = pd.read_csv(sys.argv[1]+ '.csv',header=None)
f.to_pickle(sys.argv[1]+ '.pickle')
#f.close
