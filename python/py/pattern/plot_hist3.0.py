import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import math
import collections
import matplotlib.ticker as tick

file1 = pd.read_csv(sys.argv[1], header=None)
#top_print = int(sys.argv[2])

print_hist1 = np.ravel(file1[[3]][:].values)
print_hist2 = np.ravel(file1[[4]][:].values)
#print_pattern = np.ravel(file1[[2]][:20].values)
time_leng = file1[0][0]
pattern_leng = file1[1][0]



#if (len(file1[0]) < top_print) :
#    max_print = len(file1[0])
#else :
#    max_print =top_print
                
min_grid = 1

x1 = np.arange(max(print_hist1)+1)
x2 = np.arange(max(print_hist2)+1)
w = 0.4

print(x2)
print_x1 = collections.Counter(print_hist1)
print_x2 = collections.Counter(print_hist2)
#print(print_x1)
#exit(0)

def plot_hist(x, print_x, w, time_leng, pattern_leng, graph_color, graph_label, min_grid) :

    fig = plt.figure(dpi=600)
    ax = fig.gca()
    plt.gca().xaxis.set_minor_locator(tick.MultipleLocator(min_grid))
    plt.grid(which='minor',color='lightgray',linestyle='--', alpha = 0.4)
    plt.grid(which='major',color='black',linestyle='-')
    plt.bar(print_x.keys(), print_x.values(), width=w, color=graph_color, label=graph_label)
    plt.xlim(-(w/2), max(print_x.keys())+(w/2))
    plt.xlabel("number of occurrences")
    plt.ylabel("number of pattern")
#    plt.xticks(x)
#    ax.set_xtickqlabels(x)
    plt.legend()

    plt.savefig(str(time_leng) + "-" + str(pattern_leng) + "-" + graph_label + "-hist.png", bbox_inches='tight')
    plt.close()


plot_hist(x1, print_x1, w, time_leng, pattern_leng, "red", "after", min_grid)
plot_hist(x2, print_x2, w, time_leng, pattern_leng, "blue", "before", min_grid)
