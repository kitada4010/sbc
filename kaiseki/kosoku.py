import numpy as np
from scipy.fftpack import fft, fftfreq
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# 時系列のサンプルデータ作成
N = 512                         # データ数
dt = 0.01                       # サンプリング間隔
f = 20                          # 周波数
t = np.linspace(1, N, N)*dt-dt
y = np.sin(2*np.pi*f*t)

# 離散フーリエ変換
yf = fft(y)

# 周波数スケール作成
# t/dt/dt/N で作成しても良い
freq = fftfreq(N, dt)

# プロット
# 大きさ、位相
plt.figure(1)
plt.subplot(211)
plt.plot(freq[1:N/2], np.abs(yf)[1:N/2])
plt.axis('tight')
plt.ylabel("amplitude")
plt.subplot(212)
plt.plot(freq[1:N/2], np.degrees(np.angle(yf)[1:N/2]))
plt.axis('tight')
plt.ylim(-180, 180)
plt.xlabel("frequency[Hz]")
plt.ylabel("phase[deg]")

plt.show()
