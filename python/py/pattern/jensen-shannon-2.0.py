# Pearson-Divergence の計算
#引数一覧
# 1 : 経験後ファイル名
# 2 : 経験前ファイル名
# 3 : 計算する最小のウィンドウサイズ(ステップ数)
# 4 : 計算する最大のウィンドウサイズ(ステップ数)
# 5 : 計算する最小のパターン長
# 6 : 計算する最大のパターン長
# 7 : ウィンドウサイズとパターン長に対する刻み幅
# 8 : グラフ出力するパターン数(情報量が大きかったパターン順)

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

def inspect(time_leng, pattern_leng, top_print):
    #ファイル1のデータカウント
    pattern_dict1 = {}
    sumpsth = 0
    for i, name in enumerate(sheet_names1):
        sheet_df1[i] = file1.parse(name)
        #print(sheet_df1[i][1][1])
        start_number = (np.where(sheet_df1[i]['INFORMATION']=="CHANNEL")[0][0]) +cannel_start
        end_number = (np.where(sheet_df1[i]['INFORMATION']=="CHANNEL")[0][1]) - cannel_end
        sig1 = (sheet_df1[i]['Unnamed: 3'][start_number : end_number]).values
        sig1 = sig1.astype("int")
        #print(len(sig1))
        sig1 = np.trim_zeros(sig1)
#        print()
        leng = len(sig1)
        psth = np.zeros(int((leng/time_leng)+1), dtype=np.int)
        l = 0
        for k in range(0, leng, time_leng) :
            psth[l] = sig1[k : k+time_leng].sum()
            l += 1
#        print(sig1[len(psth)-1])
        if(len(psth) > pattern_leng) : 
            for k in range(len(psth) - pattern_leng +1) :   # PSTHデータからはパターンを重ねて検索している
                if (str(psth[k : k + pattern_leng]) in pattern_dict1) : 
                    pattern_dict1[str(psth[k : k + pattern_leng])] += 1
                else : 
                    pattern_dict1[str(psth[k : k + pattern_leng])] = 1
            sumpsth += (len(psth) -pattern_leng+1)
#    print()
#    print(sumpsth)

    #ファイル2のデータカウント
    pattern_dict2 = {}
    sum_dict = pattern_dict1.copy()
    for i, name in enumerate(sheet_names2):
        sheet_df2[i] = file2.parse(name)
        start_number = (np.where(sheet_df2[i]['INFORMATION']=="CHANNEL")[0][0]) + cannel_start
        end_number = (np.where(sheet_df2[i]['INFORMATION']=="CHANNEL")[0][1]) - cannel_end
        sig1 = (sheet_df2[i]['Unnamed: 3'][start_number : end_number]).values
        sig1 = sig1.astype("int")
        sig1 = np.trim_zeros(sig1)
        leng = len(sig1)
#        print(sig1[0])
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

            
    if(len(pattern_dict1.keys()) == 0 ):
        return 0
                            
    #情報量の計算準備
    pattern_information =  0.0
#    print()
#    print()
#    print(sum(pattern_dict1.values()))
#    print(sum(sum_dict.values()))
#    print()
    sum_pattern1 = sum(pattern_dict1.values()) #+ len(sum_dict.keys())
    sum_pattern2 = sum(pattern_dict2.values()) #+ len(sum_dict.keys())
#    print(sum_pattern1)
#    print(sum_pattern2)
#    sum_pattern = sum(sum_dict.values()) 
    pattern1 = len(sum_dict.keys())
    probability1 = np.zeros(pattern1, float)
    probability2 = np.zeros(pattern1, float)
    top_dict = {}
    k = 0
#    print(type(sum_dict.keys()))
    for i in (sum_dict.keys()) :
#        print(type(i))
        if(i in pattern_dict1) : 
            probability1[k] = (pattern_dict1[i] / sum_pattern1)
            if(i in pattern_dict2) : 
                probability2[k] = (pattern_dict2[i] / sum_pattern2)
                denominator = (probability1[k]/2) + (probability2[k]/2)
                info = ( probability1[k] * math.log2(probability1[k]/denominator) + probability2[k] * math.log2(probability2[k]/denominator) )/2
            else :
                probability2[k] = 0
#                denominator = probability1[k]/2
                info =  probability1[k]/2
        else :
            probability1[k] = 0
            info = probability2[k]/2


        
        pattern_information += info
        top_dict[i] = info
#        print(i)
        k += 1



    if (len(pattern_dict1.keys()) < top_print) :
        max_print = len(pattern_dict1.keys())
    else :
        max_print =top_print
    
    #グラフ出力の準備
    print_probability1 = np.zeros(max_print, float)
    print_probability2 = np.zeros(max_print, float)
    print_kullback = np.zeros(max_print, float)
    print_pattern = []
    k = 0
    for i, v in sorted(top_dict.items(), key=lambda x:-x[1])[0:max_print] :
        if(i in pattern_dict1) : 
            print_probability1[k] = (pattern_dict1[i] / sum_pattern1)
            if(i in pattern_dict2) : 
                print_probability2[k] = (pattern_dict2[i] / sum_pattern2)
                denominator = (print_probability1[k]/2) + (print_probability2[k]/2)
                print_kullback[k] = ( print_probability1[k] * math.log2(print_probability1[k]/denominator) + print_probability2[k] * math.log2(print_probability2[k]/denominator) )/2
            else :
                print_probability2[k] = 0
                #denominator = print_probability1[k]/2
                print_kullback[k] = print_probability1[k]/2
        
        else :
            print_probability1[k] = 0
            #denominator = print_probability2[k]/2
            print_kullback[k] = print_probability2[k]/2

        print_pattern.append(i)
        k += 1
#        print(i)
#        print_probability2[k] = (pattern_dict2[i]+1 / sum_pattern2)


        
 #   print(print_pattern)
    #グラフ出力
    #パターンの確率比較
    fig = plt.figure(dpi=600)
    ax = fig.gca()
    x = np.arange(len(print_pattern))
    w = 0.4
    plt.bar(x+w, print_probability1, width=w, color="red", label="after")
    plt.bar(x, print_probability2, width=w, color="blue", label="before")
    plt.xlim(-(w/2), max_print-(w/2))
    plt.xlabel("pattern")
    plt.ylabel("probability")
    plt.xticks(x + w/2, print_pattern)
    ax.set_xticklabels(print_pattern, rotation=90)
    plt.legend()
    plt.savefig(str(time_leng) + "-" + str(pattern_leng) + ".png", bbox_inches='tight')
    plt.close()
    #パターンのカルバックライブラー項比較
    fig = plt.figure(dpi=600)
    ax = fig.gca()
    plt.bar(print_pattern, print_kullback, color="red", label="after")
    plt.xlim(-0.5, max_print-0.5)
    plt.xlabel("pattern")
    plt.ylabel("divergence")
    ax.set_xticklabels(print_pattern, rotation=90)
    plt.legend()
    #print(print_kullback)
    #plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0, ncol=2)
    #fig.subplots_adjust(bottom=10)
    plt.savefig(str(time_leng) + "-" + str(pattern_leng) + "-kullback.png", bbox_inches='tight')
    plt.close()
    del pattern_dict1, pattern_dict2, sum_dict, probability1, probability2, top_dict, print_pattern
    
    return pattern_information, sum_pattern1, sum_pattern2

parameter1_start = int(sys.argv[3])
parameter1_end = int(sys.argv[4])

parameter2_start = int(sys.argv[5])
parameter2_end = int(sys.argv[6])

step = int(sys.argv[7])

top_pattern = int(sys.argv[8])

file_kull = open("kullback-t" + sys.argv[3] + sys.argv[4] + "p" + sys.argv[5] + sys.argv[6] + "s" + sys.argv[7] +".txt", "w")
file_data = open("data-ab.txt", "w")

#kullback = np.zeros((parameter1, parameter2), float)
for i in range(parameter1_start, parameter1_end+1, step):
    for j in range(parameter2_start, parameter2_end+1, step):
#        kullback[i-1][j-1] = inspect(i, j, 20)
        pattern_information, sum_pattern1, sum_pattern2 = inspect(i, j, top_pattern)
        print(i, j, pattern_information, file=file_kull)
        print(i, j, sum_pattern1, 1/sum_pattern1, sum_pattern2, 1/sum_pattern2, file=file_data)
    print("", file=file_kull)
    print("", file=file_data)
    print("end"+str(i))
#np.savetxt("kullback-t1-" + sys.argv[3] +"-p1-"+ sys.argv[4] +".txt", kullback)
file_kull.close()
file_data.close()
