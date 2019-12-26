# Library
import numpy as np # プロットするデータ配列を作成するため
import matplotlib.pyplot as plt # グラフ表示のため
from mpl_toolkits.mplot3d import Axes3D # ３Dグラフ作成のため

# params
frame = 1000  # プロットするフレーム数
sleepTime = 0.001  # １フレーム表示する時間[s]
dataLength = 10  # プロットするデータ配列の点数
zMax = 1 # z軸最大値
zMin = 0 # z軸最小値
xlabel = "x axis" # x軸ラベル
ylabel = "y axis"
zlabel = "z axis"

# making 3d figure object
fig = plt.figure() # figureオブジェクトを作る
ax = Axes3D(fig)

for i in range(frame):
        # getting data
        x = np.arange(0, 10, 1) # 0 ~ 10 の１次元配列
        y = np.arange(0, 10, 1) # 0 ~ 10 の１次元配列
        z = np.random.rand(10) # 0 ~ 10 の１次元配列

        # plot setting
        ax.set_zlim(zMin, zMax) # z軸固定
        ax.set_xlabel(xlabel)
        ax.set_ylabel(ylabel)
        ax.set_zlabel(zlabel)
    
        # plotting
        ax.plot(x, y, z)
        plt.draw()
        plt.pause(sleepTime)
        plt.cla()
