import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import math


file1 = pd.read_csv(sys.argv[1], header=None)
top_print = int(sys.argv[2])


if (len(file1[0]) < top_print) :
    max_print = len(file1[0])
else :
    max_print = top_print


print_probability1 = np.ravel(file1[[5]][:max_print].values)
print_probability2 = np.ravel(file1[[6]][:max_print].values)
print_divergence = np.ravel(file1[[7]][:max_print].values)
print_pattern = np.ravel(file1[[2]][:max_print].values)
time_leng = file1[0][0]
pattern_leng = file1[1][0]
                

fig = plt.figure(dpi=600)
ax1 = fig.add_subplot(111)
ax2 = ax1.twinx()
#ax = fig.gca()
x = np.arange(len(print_pattern))
w = 0.2


ax1.bar(x-w, print_probability1, width=w, color="red", label="after")
ax1.bar(x , print_probability2, width=w, color="blue", label="before")
ax2.bar(x+w, print_divergence, width=w, color="green", label="divergence")
ax1.set_xlim(-2*w, max_print)#-(w/2))
ax1.set_xlabel("pattern")
ax1.set_ylabel("probability")
ax2.set_ylabel("divergence")
ax1.set_xticks(x)#, print_pattern)
ax1.set_xticklabels(print_pattern, rotation=90)
ax1.legend()
plt.savefig(str(time_leng) + "-" + str(pattern_leng) + "-divergence.png", bbox_inches='tight')
plt.close()
