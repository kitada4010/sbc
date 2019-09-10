#エクセルファイルの変換を目指して
import pandas as pd
import numpy as np
import sys
import os.path

name, ext = os.path.splitext(sys.argv[1])
file = pd.ExcelFile(sys.argv[1])
time_file = open(name+'_time_data.csv', 'w')

sheet_df = file.parse(file.sheet_names, header=None)
all_df = pd.DataFrame()

sheet_names = file.sheet_names
for i, name in enumerate(sheet_names):
    sheet_df[i] = file.parse(name)
    start_time = sheet_df[i]['Unnamed: 1'][(np.where(sheet_df[i]['INFORMATION']=="START")[0][0])]
    end_time = (np.where(sheet_df[i]['INFORMATION']=="START")[0][1]/25000)+ start_time
    print("{:.5f},{:.5f}".format(start_time, end_time), file = time_file)

file.close()
time_file.close()
