#エクセルファイルの変換を目指して
import pandas as pd
import numpy as np
import sys
import os.path


file_name = sys.argv[1]
#file_name = "B39 restraint R2.xls"

#前後のとる範囲(s)
ds = 0.5

name, ext = os.path.splitext(file_name)
file = pd.ExcelFile(file_name)
time_file = open(name+'_ripple_data.csv', 'w')



sheet_df = file.parse(file.sheet_names, header=None)
all_df = pd.DataFrame()

sheet_names = file.sheet_names
for i, sheet_name in enumerate(sheet_names):
    sheet_df[i] = file.parse(sheet_name)
    start_time = sheet_df[i]['Unnamed: 1'][(np.where(sheet_df[i]['INFORMATION']=="START")[0][0])]
    if sheet_df[i]['Unnamed: 1'][(np.where(sheet_df[i]['INFORMATION']=="START")[0][0])-1] == 25000 :
        end_time = (np.where(sheet_df[i]['INFORMATION']=="START")[0][1]*4)/100000 + start_time
    else :
        end_time = (np.where(sheet_df[i]['INFORMATION']=="START")[0][1]*6)/100000 + start_time
    print("{:.6f},{:.6f}".format(start_time, end_time), file=time_file)

file.close()
time_file.close()

data = np.loadtxt(name+'_ripple_data.csv', delimiter=",")
time_file = open(name+'_time_data.csv', 'w')
label_file = open(name+'_label_data.csv', 'w')
x = np.sort(data, axis=0)

k=0

for i in range(0, len(x)-1) :

    if( x[i-k][1] >= x[i+1-k][0] ) :
        x[i-k][1] = x[i+1-k][1]
        x = np.delete(x, i+1-k, 0)
        k = k+1
        

start_cut = x[0][0] - ds

for i in range(0, len(x)-1) :
    if(x[i][1]+(2*ds) < x[i+1][0]) :
        print("{:.6f},{:.6f},{:.6f},{:.6f}".format(start_cut, x[i][1]+ds, x[i][0], x[i][1]), file=label_file)
        print("{:.6f},{:6f}".format(start_cut, x[i][1]+ds), file=time_file)
        start_cut = x[i+1][0]-ds
    else :
        diff = (x[i+1][0] - x[i][1])/2
        print("{:.6f},{:.6f},{:.6f},{:.6f}".format(start_cut, x[i][1]+diff, x[i][0], x[i][1]), file=label_file)
        print("{:.6f},{:.6f}".format(start_cut, x[i][1]+diff), file=time_file)
        start_cut = x[i+1][0]-diff

print("{:.6f},{:.6f},{:.6f},{:.6f}".format(start_cut, x[(len(x)-1)][1]+ds, x[(len(x)-1)][0], x[(len(x)-1)][1]), file=label_file)
print("{:.6f},{:.6f}".format(start_cut, x[(len(x)-1)][1]+ds), file=time_file)
time_file.close()
label_file.close()
print(sys.argv[1]+"----end")
