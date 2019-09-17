import pylab as p
import numpy as np
import pandas as pd
import sys
import os.path
file_name, ext = os.path.splitext(sys.argv[1])
SAMPLING_RATE = 25000
print(ext)
#if (ext) != '.xls'
#   sys.exit()

file = pd.ExcelFile(file_name+'.xls')
#all_df = pd.DataFrame()
time_file = open(file_name+'_time_data.csv', 'w')


sheet_df = file.parse(file.sheet_names, header=None)
all_df = pd.DataFrame()

sheet_names = file.sheet_names
for i, name in enumerate(sheet_names):
    sheet_df[i] = file.parse(name)
    #print(sheet_df[i]['INFORMATION'][20:])
    #print(sheet_df[i].index.get_loc('START'))
#    print(i)
#    print(np.where(sheet_df[i]['INFORMATION']=="START")[0][1])
#    print(sheet_df[i]['Unnamed: 1'][19])
#    print((np.where(sheet_df[i]['INFORMATION']=="START")[0][1]/SAMPLING_RATE)
#          +sheet_df[i]['Unnamed: 1'][19])
    start_time = sheet_df[i]['Unnamed: 1'][19]
    end_time = (np.where(sheet_df[i]['INFORMATION']=="START")[0][1]/SAMPLING_RATE)+sheet_df[i]['Unnamed: 1'][19]
    print("{:.5f},{:.5f}".format(start_time, end_time), file = time_file)
#    all_df = pd.concat([all_df, sheet_df[i]['INFORMATION'][21:]], axis=1)

file.close()
time_file.close()

