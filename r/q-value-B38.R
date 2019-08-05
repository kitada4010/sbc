####エピソードごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#B38Rの比較#---------------------------------------------
#restraint
restraintB38Rbase=read.table("./restraint/B38Rbase.txt")
restraintB38R10=read.table("./restraint/B38R10.txt")
restraintB38R30=read.table("./restraint/B38R30.txt")
#male
maleB38Rbase=read.table("./male/B38Rbase.txt")
maleB38R10=read.table("./male/B38R10.txt")
maleB38R30=read.table("./male/B38R30.txt")
#object
objectB38Rbase=read.table("./object/B38Rbase.txt")
objectB38R10=read.table("./object/B38R10.txt")
objectB38R30=read.table("./object/B38R30.txt")



####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#restraint
mean(restraintB38Rbase[1:10,1])
mean(restraintB38R10[1:10,1])
mean(restraintB38R30[1:10,1])
#male
mean(maleB38Rbase[1:10,1])
mean(maleB38R10[1:10,1])
mean(maleB38R30[1:10,1])
#object
mean(objectB38Rbase[1:10,1])
mean(objectB38R10[1:10,1])
mean(objectB38R30[1:10,1])


######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintB38Rbase[1:10,1]) + var(restraintB38R10[1:10,1]) + var(restraintB38R30[1:10,1]))/3
restraintSE <- sqrt(restraintSMe/10)
restraintq <- (mean(restraintB38R10[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,1]) - mean(restraintB38R10[1:10,1])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,1]) - mean(restraintB38R30[1:10,1])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##male##-------------------------
maleSMe <-(var(maleB38Rbase[1:10,1]) + var(maleB38R10[1:10,1]) + var(maleB38R30[1:10,1]))/3
maleSE <- sqrt(maleSMe/10)
maleq <- (mean(maleB38Rbase[1:10,1]) - mean(maleB38R10[1:10,1])) / maleSE
print(maleq)

maleq1 <- abs(mean(maleB38Rbase[1:10,1]) - mean(maleB38R10[1:10,1])) / maleSE
maleq2 <- abs(mean(maleB38R10[1:10,1]) - mean(maleB38R30[1:10,1])) / maleSE
maleq3 <- abs(mean(maleB38R30[1:10,1]) - mean(maleB38Rbase[1:10,1])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)


##object##-------------------------
objectSMe <-(var(objectB38Rbase[1:10,1]) + var(objectB38R10[1:10,1]) + var(objectB38R30\
[1:10,1]))/3
objectSE <- sqrt(objectSMe/10)
objectq <- (mean(objectB38Rbase[1:10,1]) - mean(objectB38R10[1:10,1])) / objectSE
print(objectq)

objectq1 <- abs(mean(objectB38Rbase[1:10,1]) - mean(objectB38R10[1:10,1])) / objectSE
objectq2 <- abs(mean(objectB38R10[1:10,1]) - mean(objectB38R30[1:10,1])) / objectSE
objectq3 <- abs(mean(objectB38R30[1:10,1]) - mean(objectB38Rbase[1:10,1])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)


##base##-------------------------
allSMe <-(var(restraintB38Rbase[1:10,1]) + var(maleB38Rbase[1:10,1]) + var(objectB38Rbase[1:10,1]))/3
allSE <- sqrt(allSMe/10)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,1]) - mean(restraintB38R10[1:10,1])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,1]) - mean(restraintB38R30[1:10,1])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##restraint##-------------------------
restraintSMe <-(var(restraintB38Rbase[1:10,1]) + var(restraintB38R10[1:10,1]) + var(restraintB38R30[1:10,1]))/3
restraintSE <- sqrt(restraintSMe/10)
restraintq <- (mean(restraintB38R10[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,1]) - mean(restraintB38R10[1:10,1])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,1]) - mean(restraintB38R30[1:10,1])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##restraint##-------------------------
restraintSMe <-(var(restraintB38Rbase[1:10,1]) + var(restraintB38R10[1:10,1]) + var(restraintB38R30[1:10,1]))/3
restraintSE <- sqrt(restraintSMe/10)
restraintq <- (mean(restraintB38R10[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,1]) - mean(restraintB38R10[1:10,1])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,1]) - mean(restraintB38R30[1:10,1])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)



####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#restraint
mean(restraintB38Rbase[1:10,2])
mean(restraintB38R10[1:10,2])
mean(restraintB38R30[1:10,2])
#male
mean(maleB38Rbase[1:10,2])
mean(maleB38R10[1:10,2])
mean(maleB38R30[1:10,2])
#object
mean(objectB38Rbase[1:10,2])
mean(objectB38R10[1:10,2])
mean(objectB38R30[1:10,2])


######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintB38Rbase[1:10,2]) + var(restraintB38R10[1:10,2]) + var(restraintB38R30[1:10,2]))/3
restraintSE <- sqrt(restraintSMe/10)
restraintq <- (mean(restraintB38R10[1:10,2]) - mean(restraintB38Rbase[1:10,2])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,2]) - mean(restraintB38R10[1:10,2])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,2]) - mean(restraintB38R30[1:10,2])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,2]) - mean(restraintB38Rbase[1:10,2])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##male##-------------------------
maleSMe <-(var(maleB38Rbase[1:10,2]) + var(maleB38R10[1:10,2]) + var(maleB38R30[1:10,2]))/3
maleSE <- sqrt(maleSMe/10)
maleq <- (mean(maleB38Rbase[1:10,2]) - mean(maleB38R10[1:10,2])) / maleSE
print(maleq)

maleq1 <- abs(mean(maleB38Rbase[1:10,2]) - mean(maleB38R10[1:10,2])) / maleSE
maleq2 <- abs(mean(maleB38R10[1:10,2]) - mean(maleB38R30[1:10,2])) / maleSE
maleq3 <- abs(mean(maleB38R30[1:10,2]) - mean(maleB38Rbase[1:10,2])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)


##object##-------------------------
objectSMe <-(var(objectB38Rbase[1:10,2]) + var(objectB38R10[1:10,2]) + var(objectB38R30\
[1:10,2]))/3
objectSE <- sqrt(objectSMe/10)
objectq <- (mean(objectB38Rbase[1:10,2]) - mean(objectB38R10[1:10,2])) / objectSE
print(objectq)

objectq1 <- abs(mean(objectB38Rbase[1:10,2]) - mean(objectB38R10[1:10,2])) / objectSE
objectq2 <- abs(mean(objectB38R10[1:10,2]) - mean(objectB38R30[1:10,2])) / objectSE
objectq3 <- abs(mean(objectB38R30[1:10,2]) - mean(objectB38Rbase[1:10,2])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)





####中央########---------------------------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#restraint
mean(restraintB38Rbase[1:10,3])
mean(restraintB38R10[1:10,3])
mean(restraintB38R30[1:10,3])
#male
mean(maleB38Rbase[1:10,3])
mean(maleB38R10[1:10,3])
mean(maleB38R30[1:10,3])
#objenct
mean(objectB38Rbase[1:10,3])
mean(objectB38R10[1:10,3])
mean(objectB38R30[1:10,3])


######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintB38Rbase[1:10,3]) + var(restraintB38R10[1:10,3]) + var(restraintB38R30[1:10,3]))/3
restraintSE <- sqrt(restraintSMe/10)
restraintq <- (mean(restraintB38R10[1:10,3]) - mean(restraintB38Rbase[1:10,3])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintB38Rbase[1:10,3]) - mean(restraintB38R10[1:10,3])) / restraintSE
restraintq2 <- abs(mean(restraintB38R10[1:10,3]) - mean(restraintB38R30[1:10,3])) / restraintSE
restraintq3 <- abs(mean(restraintB38R30[1:10,3]) - mean(restraintB38Rbase[1:10,3])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##male##-------------------------
maleSMe <-(var(maleB38Rbase[1:10,3]) + var(maleB38R10[1:10,3]) + var(maleB38R30[1:10,3]))/3
maleSE <- sqrt(maleSMe/10)
maleq <- (mean(maleB38Rbase[1:10,3]) - mean(maleB38R10[1:10,3])) / maleSE
print(maleq)

maleq1 <- abs(mean(maleB38Rbase[1:10,3]) - mean(maleB38R10[1:10,3])) / maleSE
maleq2 <- abs(mean(maleB38R10[1:10,3]) - mean(maleB38R30[1:10,3])) / maleSE
maleq3 <- abs(mean(maleB38R30[1:10,3]) - mean(maleB38Rbase[1:10,3])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)


##object##-------------------------
objectSMe <-(var(objectB38Rbase[1:10,3]) + var(objectB38R10[1:10,3]) + var(objectB38R30[1:10,3]))/3
objectSE <- sqrt(objectSMe/10)
objectq <- (mean(objectB38Rbase[1:10,3]) - mean(objectB38R10[1:10,3])) / objectSE
print(objectq)

objectq1 <- abs(mean(objectB38Rbase[1:10,3]) - mean(objectB38R10[1:10,3])) / objectSE
objectq2 <- abs(mean(objectB38R10[1:10,3]) - mean(objectB38R30[1:10,3])) / objectSE
objectq3 <- abs(mean(objectB38R30[1:10,3]) - mean(objectB38Rbase[1:10,3])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)
