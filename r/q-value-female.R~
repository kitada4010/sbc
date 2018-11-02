####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#restraint#---------------------------------------------
#A30L
restraintA30Lbase=read.table("./restraint/A30Lbase.txt")
restraintA30L10=read.table("./restraint/A30L10.txt")
restraintA30L30=read.table("./restraint/A30L30.txt")
#A30R
restraintA30Rbase=read.table("./restraint/A30Rbase.txt")
restraintA30R10=read.table("./restraint/A30R10.txt")
restraintA30R30=read.table("./restraint/A30R30.txt")
#B31R
restraintB31Rbase=read.table("./restraint/B31Rbase.txt")
restraintB31R10=read.table("./restraint/B31R10.txt")
restraintB31R30=read.table("./restraint/B31R30.txt")
#B32L
restraintB32Lbase=read.table("./restraint/B32Lbase.txt")
restraintB32L10=read.table("./restraint/B32L10.txt")
restraintB32L30=read.table("./restraint/B32L30.txt")
#B38L
restraintB38Lbase=read.table("./restraint/B38Lbase.txt")
restraintB38L10=read.table("./restraint/B38L10.txt")
restraintB38L30=read.table("./restraint/B38L30.txt")
#B38R
restraintB38Rbase=read.table("./restraint/B38Rbase.txt")
restraintB38R10=read.table("./restraint/B38R10.txt")
restraintB38R30=read.table("./restraint/B38R30.txt")
#B39R
restraintB39Rbase=read.table("./restraint/B39Rbase.txt")
restraintB39R10=read.table("./restraint/B39R10.txt")
restraintB39R30=read.table("./restraint/B39R30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#A30L
mean(restraintA30Lbase[1:10,1])
mean(restraintA30L10[1:10,1])
mean(restraintA30L30[1:10,1])
#A30R
mean(restraintA30Rbase[1:10,1])
mean(restraintA30R10[1:10,1])
mean(restraintA30R30[1:10,1])
#B31R
mean(restraintB31Rbase[1:10,1])
mean(restraintB31R10[1:10,1])
mean(restraintB31R30[1:10,1])
#B32L
mean(restraintB32Lbase[1:10,1])
mean(restraintB32L10[1:10,1])
mean(restraintB32L30[1:10,1])
#B38L
mean(restraintB38Lbase[1:10,1])
mean(restraintB38L10[1:10,1])
mean(restraintB38L30[1:10,1])
#B38R
mean(restraintB38Rbase[1:10,1])
mean(restraintB38R10[1:10,1])
mean(restraintB38R30[1:10,1])
#B39R
mean(restraintB39Rbase[1:10,1])
mean(restraintB39R10[1:10,1])
mean(restraintB39R30[1:10,1])




######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(restraintA30Lbase[1:10,1]) + var(restraintA30L10[1:10,1]) + var(restraintA30L30[1:10,1]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(restraintA30L10[1:10,1]) - mean(restraintA30Lbase[1:10,1])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(restraintA30Lbase[1:10,1]) - mean(restraintA30L10[1:10,1])) / A30LSE
A30Lq2 <- abs(mean(restraintA30L10[1:10,1]) - mean(restraintA30L30[1:10,1])) / A30LSE
A30Lq3 <- abs(mean(restraintA30L30[1:10,1]) - mean(restraintA30Lbase[1:10,1])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(restraintA30Rbase[1:10,1]) + var(restraintA30R10[1:10,1]) + var(restraintA30R30[1:10,1]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(restraintA30R30[1:10,1]) - mean(restraintA30Rbase[1:10,1])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(restraintA30Rbase[1:10,1]) - mean(restraintA30R10[1:10,1])) / A30RSE
A30Rq2 <- abs(mean(restraintA30R10[1:10,1]) - mean(restraintA30R30[1:10,1])) / A30RSE
A30Rq3 <- abs(mean(restraintA30R30[1:10,1]) - mean(restraintA30Rbase[1:10,1])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(restraintB31Rbase[1:10,1]) + var(restraintB31R10[1:10,1]) + var(restraintB31R30[1:10,1]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(restraintB31R30[1:10,1]) - mean(restraintB31R10[1:10,1])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(restraintB31Rbase[1:10,1]) - mean(restraintB31R10[1:10,1])) / B31RSE
B31Rq2 <- abs(mean(restraintB31R10[1:10,1]) - mean(restraintB31R30[1:10,1])) / B31RSE
B31Rq3 <- abs(mean(restraintB31R30[1:10,1]) - mean(restraintB31Rbase[1:10,1])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(restraintB32Lbase[1:10,1]) + var(restraintB32L10[1:10,1]) + var(restraintB32L30[1:10,1]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(restraintB32L30[1:10,1]) - mean(restraintB32L10[1:10,1])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(restraintB32Lbase[1:10,1]) - mean(restraintB32L10[1:10,1])) / B32LSE
B32Lq2 <- abs(mean(restraintB32L10[1:10,1]) - mean(restraintB32L30[1:10,1])) / B32LSE
B32Lq3 <- abs(mean(restraintB32L30[1:10,1]) - mean(restraintB32Lbase[1:10,1])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(restraintB38Lbase[1:10,1]) + var(restraintB38L10[1:10,1]) + var(restraintB38L30[1:10,1]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(restraintB38L30[1:10,1]) - mean(restraintB38L10[1:10,1])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(restraintB38Lbase[1:10,1]) - mean(restraintB38L10[1:10,1])) / B38LSE
B38Lq2 <- abs(mean(restraintB38L10[1:10,1]) - mean(restraintB38L30[1:10,1])) / B38LSE
B38Lq3 <- abs(mean(restraintB38L30[1:10,1]) - mean(restraintB38Lbase[1:10,1])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(restraintB38Rbase[1:10,1]) + var(restraintB38R10[1:10,1]) + var(restraintB38R30[1:10,1]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(restraintB38R10[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(restraintB38Rbase[1:10,1]) - mean(restraintB38R10[1:10,1])) / B38RSE
B38Rq2 <- abs(mean(restraintB38R10[1:10,1]) - mean(restraintB38R30[1:10,1])) / B38RSE
B38Rq3 <- abs(mean(restraintB38R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(restraintB39Rbase[1:10,1]) + var(restraintB39R10[1:10,1]) + var(restraintB39R30[1:10,1]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(restraintB39Rbase[1:10,1]) - mean(restraintB39R10[1:10,1])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(restraintB39Rbase[1:10,1]) - mean(restraintB39R10[1:10,1])) / B39RSE
B39Rq2 <- abs(mean(restraintB39R10[1:10,1]) - mean(restraintB39R30[1:10,1])) / B39RSE
B39Rq3 <- abs(mean(restraintB39R30[1:10,1]) - mean(restraintB39Rbase[1:10,1])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(datarestraintbase[,1],datarestraint10[,1],datarestraint30[,1]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(datarestraintbase[,1],datarestraint10[,1],datarestraint30[,1]))


#####全体##########----------------------------------------------------------------
##標準誤差の導出##

SMe <-(var(restraintA30Lbase[1:10,1]) + var(restraintA30L10[1:10,1]) + var(restraintA30L30[1:10,1]) 
     + var(restraintA30Rbase[1:10,1]) + var(restraintA30R10[1:10,1]) + var(restraintA30R30[1:10,1])
     + var(restraintB31Rbase[1:10,1]) + var(restraintB31R10[1:10,1]) + var(restraintB31R30[1:10,1])
     + var(restraintB32Lbase[1:10,1]) + var(restraintB32L10[1:10,1]) + var(restraintB32L30[1:10,1])
     + var(restraintB38Lbase[1:10,1]) + var(restraintB38L10[1:10,1]) + var(restraintB38L30[1:10,1])
     + var(restraintB38Rbase[1:10,1]) + var(restraintB38R10[1:10,1]) + var(restraintB38R30[1:10,1])
     + var(restraintB39Rbase[1:10,1]) + var(restraintB39R10[1:10,1]) + var(restraintB39R30[1:10,1]))/21

SE <- sqrt(SMe/10)
print(SE)

##q値の導出##

q <- (mean(restraintB31R30[1:10,1]) - mean(restraintB38Rbase[1:10,1])) / SE
print(q)


####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#A30L
mean(restraintA30Lbase[1:10,2])
mean(restraintA30L10[1:10,2])
mean(restraintA30L30[1:10,2])
#A30R
mean(restraintA30Rbase[1:10,2])
mean(restraintA30R10[1:10,2])
mean(restraintA30R30[1:10,2])
#B31R
mean(restraintB31Rbase[1:10,2])
mean(restraintB31R10[1:10,2])
mean(restraintB31R30[1:10,2])
#B32L
mean(restraintB32Lbase[1:10,2])
mean(restraintB32L10[1:10,2])
mean(restraintB32L30[1:10,2])
#B38L
mean(restraintB38Lbase[1:10,2])
mean(restraintB38L10[1:10,2])
mean(restraintB38L30[1:10,2])
#B38R
mean(restraintB38Rbase[1:10,2])
mean(restraintB38R10[1:10,2])
mean(restraintB38R30[1:10,2])
#B39R
mean(restraintB39Rbase[1:10,2])
mean(restraintB39R10[1:10,2])
mean(restraintB39R30[1:10,2])



######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(restraintA30Lbase[1:10,2]) + var(restraintA30L10[1:10,2]) + var(restraintA30L30[1:10,2]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(restraintA30L10[1:10,2]) - mean(restraintA30Lbase[1:10,2])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(restraintA30Lbase[1:10,2]) - mean(restraintA30L10[1:10,2])) / A30LSE
A30Lq2 <- abs(mean(restraintA30L10[1:10,2]) - mean(restraintA30L30[1:10,2])) / A30LSE
A30Lq3 <- abs(mean(restraintA30L30[1:10,2]) - mean(restraintA30Lbase[1:10,2])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(restraintA30Rbase[1:10,2]) + var(restraintA30R10[1:10,2]) + var(restraintA30R30[1:10,2]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(restraintA30R30[1:10,2]) - mean(restraintA30Rbase[1:10,2])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(restraintA30Rbase[1:10,2]) - mean(restraintA30R10[1:10,2])) / A30RSE
A30Rq2 <- abs(mean(restraintA30R10[1:10,2]) - mean(restraintA30R30[1:10,2])) / A30RSE
A30Rq3 <- abs(mean(restraintA30R30[1:10,2]) - mean(restraintA30Rbase[1:10,2])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(restraintB31Rbase[1:10,2]) + var(restraintB31R10[1:10,2]) + var(restraintB31R30[1:10,2]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(restraintB31R30[1:10,2]) - mean(restraintB31R10[1:10,2])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(restraintB31Rbase[1:10,2]) - mean(restraintB31R10[1:10,2])) / B31RSE
B31Rq2 <- abs(mean(restraintB31R10[1:10,2]) - mean(restraintB31R30[1:10,2])) / B31RSE
B31Rq3 <- abs(mean(restraintB31R30[1:10,2]) - mean(restraintB31Rbase[1:10,2])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(restraintB32Lbase[1:10,2]) + var(restraintB32L10[1:10,2]) + var(restraintB32L30[1:10,2]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(restraintB32L30[1:10,2]) - mean(restraintB32L10[1:10,2])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(restraintB32Lbase[1:10,2]) - mean(restraintB32L10[1:10,2])) / B32LSE
B32Lq2 <- abs(mean(restraintB32L10[1:10,2]) - mean(restraintB32L30[1:10,2])) / B32LSE
B32Lq3 <- abs(mean(restraintB32L30[1:10,2]) - mean(restraintB32Lbase[1:10,2])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(restraintB38Lbase[1:10,2]) + var(restraintB38L10[1:10,2]) + var(restraintB38L30[1:10,2]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(restraintB38L30[1:10,2]) - mean(restraintB38L10[1:10,2])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(restraintB38Lbase[1:10,2]) - mean(restraintB38L10[1:10,2])) / B38LSE
B38Lq2 <- abs(mean(restraintB38L10[1:10,2]) - mean(restraintB38L30[1:10,2])) / B38LSE
B38Lq3 <- abs(mean(restraintB38L30[1:10,2]) - mean(restraintB38Lbase[1:10,2])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(restraintB38Rbase[1:10,2]) + var(restraintB38R10[1:10,2]) + var(restraintB38R30[1:10,2]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(restraintB38R10[1:10,2]) - mean(restraintB38Rbase[1:10,2])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(restraintB38Rbase[1:10,2]) - mean(restraintB38R10[1:10,2])) / B38RSE
B38Rq2 <- abs(mean(restraintB38R10[1:10,2]) - mean(restraintB38R30[1:10,2])) / B38RSE
B38Rq3 <- abs(mean(restraintB38R30[1:10,2]) - mean(restraintB38Rbase[1:10,2])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(restraintB39Rbase[1:10,2]) + var(restraintB39R10[1:10,2]) + var(restraintB39R30[1:10,2]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(restraintB39Rbase[1:10,2]) - mean(restraintB39R10[1:10,2])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(restraintB39Rbase[1:10,2]) - mean(restraintB39R10[1:10,2])) / B39RSE
B39Rq2 <- abs(mean(restraintB39R10[1:10,2]) - mean(restraintB39R30[1:10,2])) / B39RSE
B39Rq3 <- abs(mean(restraintB39R30[1:10,2]) - mean(restraintB39Rbase[1:10,2])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(datarestraintbase[,2],datarestraint10[,2],datarestraint30[,2]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(datarestraintbase[,2],datarestraint10[,2],datarestraint30[,2]))




####中央########---------------------------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#A30L
mean(restraintA30Lbase[1:10,3])
mean(restraintA30L10[1:10,3])
mean(restraintA30L30[1:10,3])
#A30R
mean(restraintA30Rbase[1:10,3])
mean(restraintA30R10[1:10,3])
mean(restraintA30R30[1:10,3])
#B31R
mean(restraintB31Rbase[1:10,3])
mean(restraintB31R10[1:10,3])
mean(restraintB31R30[1:10,3])
#B32L
mean(restraintB32Lbase[1:10,3])
mean(restraintB32L10[1:10,3])
mean(restraintB32L30[1:10,3])
#B38L
mean(restraintB38Lbase[1:10,3])
mean(restraintB38L10[1:10,3])
mean(restraintB38L30[1:10,3])
#B38R
mean(restraintB38Rbase[1:10,3])
mean(restraintB38R10[1:10,3])
mean(restraintB38R30[1:10,3])
#B39R
mean(restraintB39Rbase[1:10,3])
mean(restraintB39R10[1:10,3])
mean(restraintB39R30[1:10,3])



######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(restraintA30Lbase[1:10,3]) + var(restraintA30L10[1:10,3]) + var(restraintA30L30[1:10,3]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(restraintA30L10[1:10,3]) - mean(restraintA30Lbase[1:10,3])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(restraintA30Lbase[1:10,3]) - mean(restraintA30L10[1:10,3])) / A30LSE
A30Lq2 <- abs(mean(restraintA30L10[1:10,3]) - mean(restraintA30L30[1:10,3])) / A30LSE
A30Lq3 <- abs(mean(restraintA30L30[1:10,3]) - mean(restraintA30Lbase[1:10,3])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(restraintA30Rbase[1:10,3]) + var(restraintA30R10[1:10,3]) + var(restraintA30R30[1:10,3]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(restraintA30R30[1:10,3]) - mean(restraintA30Rbase[1:10,3])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(restraintA30Rbase[1:10,3]) - mean(restraintA30R10[1:10,3])) / A30RSE
A30Rq2 <- abs(mean(restraintA30R10[1:10,3]) - mean(restraintA30R30[1:10,3])) / A30RSE
A30Rq3 <- abs(mean(restraintA30R30[1:10,3]) - mean(restraintA30Rbase[1:10,3])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(restraintB31Rbase[1:10,3]) + var(restraintB31R10[1:10,3]) + var(restraintB31R30[1:10,3]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(restraintB31R30[1:10,3]) - mean(restraintB31R10[1:10,3])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(restraintB31Rbase[1:10,3]) - mean(restraintB31R10[1:10,3])) / B31RSE
B31Rq2 <- abs(mean(restraintB31R10[1:10,3]) - mean(restraintB31R30[1:10,3])) / B31RSE
B31Rq3 <- abs(mean(restraintB31R30[1:10,3]) - mean(restraintB31Rbase[1:10,3])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(restraintB32Lbase[1:10,3]) + var(restraintB32L10[1:10,3]) + var(restraintB32L30[1:10,3]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(restraintB32L30[1:10,3]) - mean(restraintB32L10[1:10,3])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(restraintB32Lbase[1:10,3]) - mean(restraintB32L10[1:10,3])) / B32LSE
B32Lq2 <- abs(mean(restraintB32L10[1:10,3]) - mean(restraintB32L30[1:10,3])) / B32LSE
B32Lq3 <- abs(mean(restraintB32L30[1:10,3]) - mean(restraintB32Lbase[1:10,3])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(restraintB38Lbase[1:10,3]) + var(restraintB38L10[1:10,3]) + var(restraintB38L30[1:10,3]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(restraintB38L30[1:10,3]) - mean(restraintB38L10[1:10,3])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(restraintB38Lbase[1:10,3]) - mean(restraintB38L10[1:10,3])) / B38LSE
B38Lq2 <- abs(mean(restraintB38L10[1:10,3]) - mean(restraintB38L30[1:10,3])) / B38LSE
B38Lq3 <- abs(mean(restraintB38L30[1:10,3]) - mean(restraintB38Lbase[1:10,3])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(restraintB38Rbase[1:10,3]) + var(restraintB38R10[1:10,3]) + var(restraintB38R30[1:10,3]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(restraintB38R10[1:10,3]) - mean(restraintB38Rbase[1:10,3])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(restraintB38Rbase[1:10,3]) - mean(restraintB38R10[1:10,3])) / B38RSE
B38Rq2 <- abs(mean(restraintB38R10[1:10,3]) - mean(restraintB38R30[1:10,3])) / B38RSE
B38Rq3 <- abs(mean(restraintB38R30[1:10,3]) - mean(restraintB38Rbase[1:10,3])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(restraintB39Rbase[1:10,3]) + var(restraintB39R10[1:10,3]) + var(restraintB39R30[1:10,3]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(restraintB39Rbase[1:10,3]) - mean(restraintB39R10[1:10,3])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(restraintB39Rbase[1:10,3]) - mean(restraintB39R10[1:10,3])) / B39RSE
B39Rq2 <- abs(mean(restraintB39R10[1:10,3]) - mean(restraintB39R30[1:10,3])) / B39RSE
B39Rq3 <- abs(mean(restraintB39R30[1:10,3]) - mean(restraintB39Rbase[1:10,3])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



