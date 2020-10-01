import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import math


file1 = pd.read_csv(sys.argv[1], header=None)
top_print = int(sys.argv[2])

print_probability1 = np.ravel(file1[[3]][:20].values)
print_probability2 = np.ravel(file1[[4]][:20].values)
print_pattern = np.ravel(file1[[2]][:20].values)
time_leng = file1[0][0]
pattern_leng = file1[1][0]



if (len(file1[0]) < top_print) :
    max_print = len(file1[0])
else :
    max_print =top_print
                

fig = plt.figure(dpi=600)
ax = fig.gca()
x = np.arange(len(print_pattern))
w = 0.4


plt.bar(x+w, print_probability1, width=w, color="red", label="after")
plt.bar(x, print_probability2, width=w, color="blue", label="before")
plt.xlim(-(w/2), max_print-(w/2))
plt.xlabel("pattern")
plt.ylabel("number")
plt.xticks(x + w/2, print_pattern)
ax.set_xticklabels(print_pattern, rotation=90)
plt.legend()
plt.savefig(str(time_leng) + "-" + str(pattern_leng) + "-num.png", bbox_inches='tight')
plt.close()
