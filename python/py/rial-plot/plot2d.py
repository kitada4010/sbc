# ２次元リアルタイムグラフの雛形

# Library
import numpy as np # プロットするデータ配列を作成するため
import matplotlib.pyplot as plt # グラフ作成のため

# params
dataLength = 100  # １つのデータの配列の点数
frame = 500  # プロットするフレーム数
sleepTime = 0.0001  # １フレーム表示する時間[s]

data = [1]
# plotting
for i in range(frame): # フレーム回数分グラフを更新
        plt.plot(data) # データをプロット
        data = np.append(data, 1)
#        print(data)
        plt.xlim(0,100)
        plt.draw() # グラフを画面に表示開始
        plt.pause(sleepTime) # SleepTime時間だけ表示を継続
        plt.cla() # プロットした点を消してグラフを初期化
        
