import sys
import numpy as np

data = np.loadtxt(sys.argv[1], skiprows=0, dtype='float')
data[:, 0] = data[:,0]*0.04
#np.set_printoptions(precision=3)
output_data = np.vstack(data[:, 0], data[:,1])
print(np.vstack(output_data, data[:,2]))
#np.savetxt(sys.argv[1].replace(".txt", "-ms.txt"), data, fmt=['%.2e', '%.0e', '%.12e'])
