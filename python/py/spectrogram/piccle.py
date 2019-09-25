import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle
import csv
import sys

#引数1 元ファイル(.csv付けずに)

#vine linux
#f = pd.read_csv(sys.argv[1] +'.csv',header=None)
#f.to_pickle(sys.argv[1] +'.pickle')

#mac
#f = pd.read_csv('/Volumes/NO NAME/25kHz-data/B36 Rd.csv',header=None)
#f.to_pickle('/Volumes/NO NAME/25kHz-data/B36 Rd.pickle')

#ubuntu
f = pd.read_csv(sys.argv[1]+ '.csv',header=None)
f.to_pickle(sys.argv[1]+ '.pickle')
#f.close
