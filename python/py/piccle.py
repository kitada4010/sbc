import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle
import csv
#%matplotlib inline
#%config InlineBackend.figure_format = 'retina'
#vine linux
#f = pd.read_csv('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B36 Rd.csv',header=None)
#f.to_pickle('/home/hera/nodoka/home2/nodoka/spike-data/25kHz-data/B36 Rd.pickle')

#mac
#f = pd.read_csv('/Volumes/NO NAME/25kHz-data/B36 Rd.csv',header=None)
#f.to_pickle('/Volumes/NO NAME/25kHz-data/B36 Rd.pickle')

#ubuntu
f = pd.read_csv('/home/nodoka/spike-data/25kHz-data/B36 Rd.csv',header=None)
f.to_pickle('/home/nodoka/spike-data/25kHz-data/B36 Rd.pickle')
#f.close
