import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import openpyxl
import statistics
import math
from matplotlib.backends.backend_pdf import PdfPages


def diff_x_i(sig, x_i) :
        return [sig[i]-x_i for i in range(len(sig))]

    
def write_data(wb_sheet, sig, column_point, start_row, value_title) :
    wb_sheet.cell(column=column_point, row=1, value=value_title)
    for i, sig_data in enumerate(sig) :
        #print(sig_data)
        wb_sheet.cell(column=column_point, row=i+start_row, value=sig_data)
        
def inspect(file1, k, h):
    sheet_df1 = file1.parse(file1.sheet_names, header=None)
    sheet_names1 = file1.sheet_names
    #ファイル1のデータカウント
    pattern_dict1 = {}
    sumpsth = 0
    peak = -0.08
    for i, name in enumerate(sheet_names1):
        sheet_df1[i] = file1.parse(name)

        try :
            sig_ori = (sheet_df1[i]["volt"]).values
            sig_ori = sig_ori[150:300]
        except KeyError :
            print("not max data number")
            break

        
        S_1 = [(max(diff_x_i(sig_ori[i-k:i], sig_ori[i])) + max(diff_x_i(sig_ori[i+1:i+k+1], sig_ori[i])))/2 for i in range(k, len(sig_ori)-k)]
        sig_mean = sum(S_1)/len(S_1) # m'
        sig_sd = statistics.pstdev(S_1) # s'
        S_1_fire = [1 if(S_1[i]-sig_mean > h*sig_sd) else 0 for i in range(len(S_1))]        
    

        plot_len = min([len(sig_smooth), len(sig_fire), len(sig_fire_a), len(S_1_fire), len(S_2_fire)])

        time_plot = [i/25 for i in range(plot_len)]
        peak_line = [peak for i in range(len(sig_fire))]
        
        plt.figure(figsize=(10, 4))
        plt.subplot(2, 1, 1)
        plt.subplots_adjust(wspace=0.0, hspace=0)
        plt.xticks(color="None")
        plt.ylabel("(a) [V]")
        start_point = int((len(sig_ori)-plot_len)/2)
        plt.xlim(0, plot_len/25)
        if(start_point == 0) :
            plt.plot(time_plot, sig_ori, linewidth = 0.5)
        else :
            plt.plot(time_plot, sig_ori[start_point:-start_point], linewidth = 0.5)
    
        
        plt.subplot(8, 1, 5)
        plt.ylim(0.95, 1.05)
        plt.yticks(color="None")
        plt.xticks(color="None")
        
        plt.ylabel("(b)")
        start_point = int((len(S_1_fire)-plot_len)/2)
        plt.xlim(0, plot_len/25)
        if(start_point == 0) :
            plt.scatter([i/25 for i in range(len(S_1_fire))], S_1_fire,marker='s', s=3)
        else :
            plt.scatter([i/25 for i in range(len(S_1_fire[start_point:-start_point]))], S_1_fire[start_point:-start_point],marker='s', s=3)
        
        
        plt.subplot(8, 1, 6)
        plt.ylim(0.95, 1.05)
        plt.yticks(color="None")
        start_point = int((len(S_1_fire_dt)-plot_len)/2)
        plt.ylabel("(c)")
        plt.xlabel("time[ms]")
        plt.xlim(0, plot_len/25)
        if(start_point == 0) :
            plt.scatter([i/25 for i in range(len(S_1_fire_dt))], S_1_fire_dt,marker='s', s=3)
        else :
            plt.scatter([i/25 for i in range(len(S_1_fire_dt[start_point:-start_point]))], S_1_fire_dt[start_point:-start_point],marker='s', s=3)
        
        pdf.savefig()
        plt.close()
    pdf.close()



file1 = pd.ExcelFile(sys.argv[1])

k = 5
#k = int(sys.argv[2])
h = 1.1
#h = float(sys.argv[3])



pdf = PdfPages('peak_data_short.pdf')



count_data = open("count_data.csv", "a")
inspect(file1, k, h)
