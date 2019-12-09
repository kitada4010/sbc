#エクセルファイルの変換を目指して
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import math

#ファイルの読み込み
#file_name1 = sys.argv[1]
#file_name2 = sys.argv[2]
#file1 = pd.ExcelFile(file_name1+'.xlsx')
#file2 = pd.ExcelFile(file_name2+'.xlsx')

file1 = pd.ExcelFile(sys.argv[1])
file2 = pd.ExcelFile(sys.argv[2])

sheet_df1 = file1.parse(file1.sheet_names, header=None)
sheet_df2 = file2.parse(file2.sheet_names, header=None)

#cmap = plt.get_cmap("tab20")

sheet_names1 = file1.sheet_names
sheet_names2 = file2.sheet_names



def inspect(time_leng, pattern_leng, top_print):
    #ファイル1のデータカウント
    pattern_dict1 = {}
    for i, name in enumerate(sheet_names1):
        sheet_df1[i] = file1.parse(name)
        end_number = (np.where(sheet_df1[i]['INFORMATION']=="CHANNEL")[0][1])
        sig1 = (sheet_df1[i]['Unnamed: 3'][24:end_number-5])
        leng = end_number - 5 -24
        psth = np.empty(int((leng/time_leng)+1), dtype=np.int)
        l = 0
        for k in range(0, leng, time_leng) :
            psth[l] = sig1[k+j : k+j+time_leng].sum()
            l += 1
        if(len(psth) > pattern_leng) : 
            for k in range(len(psth) - pattern_leng +1) :
                if (str(psth[k : k + pattern_leng]) in pattern_dict1) : 
                    pattern_dict1[str(psth[k : k + pattern_leng])] += 1
                else : 
                    pattern_dict1[str(psth[k : k+ pattern_leng])] = 1

    
    #ファイル2のデータカウント
    pattern_dict2 = {}
    sum_dict = pattern_dict1
    for i, name in enumerate(sheet_names2):
        sheet_df2[i] = file2.parse(name)
        end_number = (np.where(sheet_df2[i]['INFORMATION']=="CHANNEL")[0][1])
        sig1 = (sheet_df2[i]['Unnamed: 3'][24:end_number-5])
        leng = end_number - 5 -24
        psth = np.empty(int((leng/time_leng)+1), dtype=np.int)
        l = 0
        for k in range(j, leng, time_leng) :
            psth[l] = sig1[k+j : k+j+time_leng].sum()
            l += 1
        if(len(psth) > pattern_leng) : 
            for k in range(len(psth) - pattern_leng +1) :
                if (str(psth[k : k+ pattern_leng]) in pattern_dict2) : 
                    pattern_dict2[str(psth[k : k+ pattern_leng])] += 1
                    sum_dict[str(psth[k : k+ pattern_leng])] += 1
                else : 
                    pattern_dict2[str(psth[k : k+ pattern_leng])] = 1
                    if (str(psth[k : k+ pattern_leng]) in sum_dict) : 
                        sum_dict[str(psth[k : k+ pattern_leng])] += 1
                    else :
                        sum_dict[str(psth[k : k+ pattern_leng])] = 1

    if(len(pattern_dict1.keys()) == 0 ):
        return 0
                            
    #情報量の計算準備
    pattern_information =  0.0
    sum_pattern1 = sum(pattern_dict1.values()) + len(sum_dict.keys())
    sum_pattern2 = sum(pattern_dict2.values()) + len(sum_dict.keys())
#    sum_pattern = sum(sum_dict.values()) 
    pattern1 = len(pattern_dict1.keys())
    probability1 = np.zeros(pattern1, float)
    probability2 = np.zeros(pattern1, float)
    top_dict = {}
    k = 0
    for i in (pattern_dict1.keys()) :
        probability1[k] = ((pattern_dict1[i]+1) / sum_pattern1)
        if(i in pattern_dict2) : 
            probability2[k] = ((pattern_dict2[i]+1) / sum_pattern2)
        else :
            probability2[k] = (1 / sum_pattern2)
        info = probability1[k] * math.log2(probability1[k]/probability2[k])
        pattern_information += info
        top_dict[i] = info
        k += 1

    if (k < top_print) :
        top_print = k
    #グラフ出力の準備
    print_probability1 = np.zeros(top_print, float)
    print_probability2 = np.zeros(top_print, float)
    print_pattern = []
    k = 0
    for i, v in sorted(top_dict.items(), key=lambda x:-x[1])[0:top_print] :
        print_probability1[k] = ((pattern_dict1[i]+1) / sum_pattern1)
        if(i in pattern_dict2) : 
            print_probability2[k] = ((pattern_dict2[i]+1) / sum_pattern2)
        else :
            print_probability2[k] = (1 / sum_pattern2)
#        print_probability2[k] = (pattern_dict2[i]+1 / sum_pattern2)
        print_pattern.append(i)
        k += 1
        
    #グラフ出力
    fig = plt.figure(dpi=600)
    ax = fig.gca()
    plt.bar(print_pattern, print_probability1, color="red", label="after")
    plt.bar(print_pattern, print_probability2, color="blue", label="before")
    plt.xlim(-0.5, top_print-0.5)
    plt.xlabel("pattern")
    plt.ylabel("probability")
    ax.set_xticklabels(print_pattern, rotation=90)
    plt.legend()
    #plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0, ncol=2)
    #fig.subplots_adjust(bottom=10)
    plt.savefig(str(time_leng) + "-" + str(pattern_leng) + ".png", bbox_inches='tight')
    
    return pattern_information

parameter1_start = int(sys.argv[3])
parameter1_end = int(sys.argv[4])

parameter2_start = int(sys.argv[5])
parameter2_end = int(sys.argv[6])

step = int(sys.argv[7])

file_kull = open("kullback-t" + sys.argv[3] + sys.argv[4] + "p" + sys.argv[5] + sys.argv[6] + "s" + sys.argv[7] +".txt", "w")


#kullback = np.zeros((parameter1, parameter2), float)
for i in range(parameter1_start, parameter1_end+1, step):
    for j in range(parameter2_start, parameter2_end+1, step):
#        kullback[i-1][j-1] = inspect(i, j, 20)
        print(i, j , inspect(i, j, 20), file=file_kull)
    print("end"+str(i))
#np.savetxt("kullback-t1-" + sys.argv[3] +"-p1-"+ sys.argv[4] +".txt", kullback)
file_kull.close()
