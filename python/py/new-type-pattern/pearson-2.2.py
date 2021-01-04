# Pearson-Divergence の計算
#引数一覧
# 1 : 経験後ファイル名
# 2 : 経験前ファイル名
# 3 : 計算する最小のウィンドウサイズ(ステップ数)
# 4 : 計算する最大のウィンドウサイズ(ステップ数)
# 5 : 計算する最小のパターン長
# 6 : 計算する最大のパターン長
# 7 : ウィンドウサイズとパターン長に対する刻み幅

#注意
# divergence.txt は上書きではなく追記

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

cannel_start = 10
cannel_end = 5

def inspect(time_leng, pattern_leng, count_data):
    #ファイル1のデータカウント
    pattern_dict1 = {}
    sumpsth = 0
    for i, name in enumerate(sheet_names1):
        sheet_df1[i] = file1.parse(name)
        try :
            sig1 = (sheet_df1[i]["spike_data"]).values
            sig1 = sig1[~np.isnan(sig1)]
        except KeyError :
            print("not max data number")
            break
        sig1 = sig1.astype("int")
        sig1 = np.trim_zeros(sig1)
        leng = len(sig1)
        psth = np.zeros(int((leng/time_leng)+1), dtype=np.int)
        l = 0
        for k in range(0, leng, time_leng) :
            psth[l] = sig1[k : k+time_leng].sum()
            l += 1
        if(len(psth) > pattern_leng) : 
            for k in range(len(psth) - pattern_leng +1) :   # PSTHデータからはパターンを重ねて検索している
                if (str(psth[k : k + pattern_leng]) in pattern_dict1) : 
                    pattern_dict1[str(psth[k : k + pattern_leng])] += 1
                else : 
                    pattern_dict1[str(psth[k : k + pattern_leng])] = 1
            sumpsth += (len(psth) -pattern_leng+1)


    #ファイル2のデータカウント
    pattern_dict2 = {}
    sum_dict = pattern_dict1.copy()
    for i, name in enumerate(sheet_names2):
        sheet_df2[i] = file2.parse(name)
        try :
            sig1 = (sheet_df2[i]["spike_data"]).values
            sig1 = sig1[~np.isnan(sig1)]
        except KeyError :
            print("not max data number")
            print(name)
            break
        sig1 = sig1.astype("int")
        sig1 = np.trim_zeros(sig1)
        leng = len(sig1)
        psth = np.zeros(int((leng/time_leng)+1), dtype=np.int)
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


    sum_pattern1 = sum(pattern_dict1.values()) #+ len(sum_dict.keys())
    sum_pattern2 = sum(pattern_dict2.values()) #+ len(sum_dict.keys())            
    if(len(pattern_dict1.keys()) == 0) :
        del pattern_dict1, sum_dict, leng, psth, sig1, i, l, k, sum_pattern1
        if(len(pattern_dict2.keys()) == 0 ):
            return 0, 0, 0
        else :
            return 0, 0, sum_pattern2
    elif(len(pattern_dict2.keys()) == 0 ):
        del pattern_dict2, sum_dict, leng, psth, sig1, i, l, k, sum_pattern2
        return 0, sum_pattern1, 0            

                            
    #情報量の計算準備
    pattern_information =  0.0
    sum_pattern1 = sum(pattern_dict1.values()) + len(sum_dict.keys())
    sum_pattern2 = sum(pattern_dict2.values()) + len(sum_dict.keys())
    pattern1 = len(pattern_dict1.keys())
    probability1 = {}
    probability2 = {}
    top_dict = {}
    for i in (pattern_dict1.keys()) :
        probability1[i] = ((pattern_dict1[i]+1) / sum_pattern1)
        if(i in pattern_dict2) : 
            probability2[i] = ((pattern_dict2[i]+1) / sum_pattern2)
        else :
            probability2[i] = (1 / sum_pattern2)
        info = probability2[i] * ((probability1[i]/probability2[i] - 1) ** 2)
        pattern_information += info
        top_dict[i] = info



    
    #グラフ出力の準備
    for i, v in sorted(top_dict.items(), key=lambda x:-x[1]) :
        if(i in pattern_dict1) : 
            if(i in pattern_dict2) : 
                print(time_leng, pattern_leng, i.replace('\n', ''), pattern_dict1[i], pattern_dict2[i], probability1[i], probability2[i], top_dict[i], file=count_data, sep=",")
            else :
                print(time_leng, pattern_leng, i.replace('\n', ''), pattern_dict1[i], 0, probability1[i], 0, top_dict[i], file=count_data, sep=",")
        elif(i in pattern_dict2) :
            print(time_leng, pattern_leng, i.replace('\n', ''), 0, pattern_dict2[i], 0, probability2[i], top_dict[i], file=count_data, sep=",")



        
    del pattern_dict1, pattern_dict2, sum_dict, probability1, probability2, top_dict, leng, psth, sig1
    return pattern_information, sum_pattern1, sum_pattern2

parameter1_start = int(sys.argv[3])
parameter1_end = int(sys.argv[4])

parameter2_start = int(sys.argv[5])
parameter2_end = int(sys.argv[6])

step = int(sys.argv[7])


file_kull = open("divergence.txt", "a")
file_data = open("data-ab.txt", "a")

for i in range(parameter1_start, parameter1_end+1, step):
    for j in range(parameter2_start, parameter2_end+1, step):
        count_data = open("count_data.csv", "a")        
        pattern_information, sum_pattern1, sum_pattern2 = inspect(i, j, count_data)
        print(i, j, pattern_information, file=file_kull)
        if (sum_pattern1 == 0) :
            if (sum_pattern2 == 0) :
                print(i, j, 0, 0, 0, 0, file=file_data)
            else :
                print(i, j, 0, 0, sum_pattern2, 1/sum_pattern2, file=file_data)
        elif(sum_pattern2 == 0) :
            print(i, j, sum_pattern1, 1/sum_pattern1, 0, 0, file=file_data)
        else : 
            print(i, j, sum_pattern1, 1/sum_pattern1, sum_pattern2, 1/sum_pattern2, file=file_data)
        count_data.close()
    print("", file=file_kull)
    print("", file=file_data)
    print("end"+str(i))
file_kull.close()
file_data.close()
