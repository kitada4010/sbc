import sys
file = open(sys.argv[1], 'r')
line = file.readline()
#string = file.readline()   #readlineで1行だけ読み込む

while line:
    print(line.strip())
    line = file.readline()

file.close()
