####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#female#---------------------------------------------
#A30L
femaleA30Lbase=read.table("./female/A30Lbase.txt")
femaleA30L10=read.table("./female/A30L10.txt")
femaleA30L30=read.table("./female/A30L30.txt")
#A30R
femaleA30Rbase=read.table("./female/A30Rbase.txt")
femaleA30R10=read.table("./female/A30R10.txt")
femaleA30R30=read.table("./female/A30R30.txt")
#B31R
femaleB31Rbase=read.table("./female/B31Rbase.txt")
femaleB31R10=read.table("./female/B31R10.txt")
femaleB31R30=read.table("./female/B31R30.txt")
#B32L
femaleB32Lbase=read.table("./female/B32Lbase.txt")
femaleB32L10=read.table("./female/B32L10.txt")
femaleB32L30=read.table("./female/B32L30.txt")
#B38L
femaleB38Lbase=read.table("./female/B38Lbase.txt")
femaleB38L10=read.table("./female/B38L10.txt")
femaleB38L30=read.table("./female/B38L30.txt")
#B38R
femaleB38Rbase=read.table("./female/B38Rbase.txt")
femaleB38R10=read.table("./female/B38R10.txt")
femaleB38R30=read.table("./female/B38R30.txt")
#B39R
femaleB39Rbase=read.table("./female/B39Rbase.txt")
femaleB39R10=read.table("./female/B39R10.txt")
femaleB39R30=read.table("./female/B39R30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#A30L
mean(femaleA30Lbase[1:10,1])
mean(femaleA30L10[1:10,1])
mean(femaleA30L30[1:10,1])
#A30R
mean(femaleA30Rbase[1:10,1])
mean(femaleA30R10[1:10,1])
mean(femaleA30R30[1:10,1])
#B31R
mean(femaleB31Rbase[1:10,1])
mean(femaleB31R10[1:10,1])
mean(femaleB31R30[1:10,1])
#B32L
mean(femaleB32Lbase[1:10,1])
mean(femaleB32L10[1:10,1])
mean(femaleB32L30[1:10,1])
#B38L
mean(femaleB38Lbase[1:10,1])
mean(femaleB38L10[1:10,1])
mean(femaleB38L30[1:10,1])
#B38R
mean(femaleB38Rbase[1:10,1])
mean(femaleB38R10[1:10,1])
mean(femaleB38R30[1:10,1])
#B39R
mean(femaleB39Rbase[1:10,1])
mean(femaleB39R10[1:10,1])
mean(femaleB39R30[1:10,1])




######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(femaleA30Lbase[1:10,1]) + var(femaleA30L10[1:10,1]) + var(femaleA30L30[1:10,1]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(femaleA30L10[1:10,1]) - mean(femaleA30Lbase[1:10,1])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(femaleA30Lbase[1:10,1]) - mean(femaleA30L10[1:10,1])) / A30LSE
A30Lq2 <- abs(mean(femaleA30L10[1:10,1]) - mean(femaleA30L30[1:10,1])) / A30LSE
A30Lq3 <- abs(mean(femaleA30L30[1:10,1]) - mean(femaleA30Lbase[1:10,1])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(femaleA30Rbase[1:10,1]) + var(femaleA30R10[1:10,1]) + var(femaleA30R30[1:10,1]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(femaleA30R30[1:10,1]) - mean(femaleA30Rbase[1:10,1])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(femaleA30Rbase[1:10,1]) - mean(femaleA30R10[1:10,1])) / A30RSE
A30Rq2 <- abs(mean(femaleA30R10[1:10,1]) - mean(femaleA30R30[1:10,1])) / A30RSE
A30Rq3 <- abs(mean(femaleA30R30[1:10,1]) - mean(femaleA30Rbase[1:10,1])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(femaleB31Rbase[1:10,1]) + var(femaleB31R10[1:10,1]) + var(femaleB31R30[1:10,1]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(femaleB31R30[1:10,1]) - mean(femaleB31R10[1:10,1])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(femaleB31Rbase[1:10,1]) - mean(femaleB31R10[1:10,1])) / B31RSE
B31Rq2 <- abs(mean(femaleB31R10[1:10,1]) - mean(femaleB31R30[1:10,1])) / B31RSE
B31Rq3 <- abs(mean(femaleB31R30[1:10,1]) - mean(femaleB31Rbase[1:10,1])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(femaleB32Lbase[1:10,1]) + var(femaleB32L10[1:10,1]) + var(femaleB32L30[1:10,1]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(femaleB32L30[1:10,1]) - mean(femaleB32L10[1:10,1])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(femaleB32Lbase[1:10,1]) - mean(femaleB32L10[1:10,1])) / B32LSE
B32Lq2 <- abs(mean(femaleB32L10[1:10,1]) - mean(femaleB32L30[1:10,1])) / B32LSE
B32Lq3 <- abs(mean(femaleB32L30[1:10,1]) - mean(femaleB32Lbase[1:10,1])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(femaleB38Lbase[1:10,1]) + var(femaleB38L10[1:10,1]) + var(femaleB38L30[1:10,1]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(femaleB38L30[1:10,1]) - mean(femaleB38L10[1:10,1])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(femaleB38Lbase[1:10,1]) - mean(femaleB38L10[1:10,1])) / B38LSE
B38Lq2 <- abs(mean(femaleB38L10[1:10,1]) - mean(femaleB38L30[1:10,1])) / B38LSE
B38Lq3 <- abs(mean(femaleB38L30[1:10,1]) - mean(femaleB38Lbase[1:10,1])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(femaleB38Rbase[1:10,1]) + var(femaleB38R10[1:10,1]) + var(femaleB38R30[1:10,1]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(femaleB38R10[1:10,1]) - mean(femaleB38Rbase[1:10,1])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(femaleB38Rbase[1:10,1]) - mean(femaleB38R10[1:10,1])) / B38RSE
B38Rq2 <- abs(mean(femaleB38R10[1:10,1]) - mean(femaleB38R30[1:10,1])) / B38RSE
B38Rq3 <- abs(mean(femaleB38R30[1:10,1]) - mean(femaleB38Rbase[1:10,1])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(femaleB39Rbase[1:10,1]) + var(femaleB39R10[1:10,1]) + var(femaleB39R30[1:10,1]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(femaleB39Rbase[1:10,1]) - mean(femaleB39R10[1:10,1])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(femaleB39Rbase[1:10,1]) - mean(femaleB39R10[1:10,1])) / B39RSE
B39Rq2 <- abs(mean(femaleB39R10[1:10,1]) - mean(femaleB39R30[1:10,1])) / B39RSE
B39Rq3 <- abs(mean(femaleB39R30[1:10,1]) - mean(femaleB39Rbase[1:10,1])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(datafemalebase[,1],datafemale10[,1],datafemale30[,1]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(datafemalebase[,1],datafemale10[,1],datafemale30[,1]))


#####全体##########----------------------------------------------------------------
##標準誤差の導出##

SMe <-(var(femaleA30Lbase[1:10,1]) + var(femaleA30L10[1:10,1]) + var(femaleA30L30[1:10,1]) 
     + var(femaleA30Rbase[1:10,1]) + var(femaleA30R10[1:10,1]) + var(femaleA30R30[1:10,1])
     + var(femaleB31Rbase[1:10,1]) + var(femaleB31R10[1:10,1]) + var(femaleB31R30[1:10,1])
     + var(femaleB32Lbase[1:10,1]) + var(femaleB32L10[1:10,1]) + var(femaleB32L30[1:10,1])
     + var(femaleB38Lbase[1:10,1]) + var(femaleB38L10[1:10,1]) + var(femaleB38L30[1:10,1])
     + var(femaleB38Rbase[1:10,1]) + var(femaleB38R10[1:10,1]) + var(femaleB38R30[1:10,1])
     + var(femaleB39Rbase[1:10,1]) + var(femaleB39R10[1:10,1]) + var(femaleB39R30[1:10,1]))/21

SE <- sqrt(SMe/10)
print(SE)

##q値の導出##

q <- (mean(femaleB31R30[1:10,1]) - mean(femaleB38Rbase[1:10,1])) / SE
print(q)


####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#A30L
mean(femaleA30Lbase[1:10,2])
mean(femaleA30L10[1:10,2])
mean(femaleA30L30[1:10,2])
#A30R
mean(femaleA30Rbase[1:10,2])
mean(femaleA30R10[1:10,2])
mean(femaleA30R30[1:10,2])
#B31R
mean(femaleB31Rbase[1:10,2])
mean(femaleB31R10[1:10,2])
mean(femaleB31R30[1:10,2])
#B32L
mean(femaleB32Lbase[1:10,2])
mean(femaleB32L10[1:10,2])
mean(femaleB32L30[1:10,2])
#B38L
mean(femaleB38Lbase[1:10,2])
mean(femaleB38L10[1:10,2])
mean(femaleB38L30[1:10,2])
#B38R
mean(femaleB38Rbase[1:10,2])
mean(femaleB38R10[1:10,2])
mean(femaleB38R30[1:10,2])
#B39R
mean(femaleB39Rbase[1:10,2])
mean(femaleB39R10[1:10,2])
mean(femaleB39R30[1:10,2])



######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(femaleA30Lbase[1:10,2]) + var(femaleA30L10[1:10,2]) + var(femaleA30L30[1:10,2]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(femaleA30L10[1:10,2]) - mean(femaleA30Lbase[1:10,2])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(femaleA30Lbase[1:10,2]) - mean(femaleA30L10[1:10,2])) / A30LSE
A30Lq2 <- abs(mean(femaleA30L10[1:10,2]) - mean(femaleA30L30[1:10,2])) / A30LSE
A30Lq3 <- abs(mean(femaleA30L30[1:10,2]) - mean(femaleA30Lbase[1:10,2])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(femaleA30Rbase[1:10,2]) + var(femaleA30R10[1:10,2]) + var(femaleA30R30[1:10,2]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(femaleA30R30[1:10,2]) - mean(femaleA30Rbase[1:10,2])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(femaleA30Rbase[1:10,2]) - mean(femaleA30R10[1:10,2])) / A30RSE
A30Rq2 <- abs(mean(femaleA30R10[1:10,2]) - mean(femaleA30R30[1:10,2])) / A30RSE
A30Rq3 <- abs(mean(femaleA30R30[1:10,2]) - mean(femaleA30Rbase[1:10,2])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(femaleB31Rbase[1:10,2]) + var(femaleB31R10[1:10,2]) + var(femaleB31R30[1:10,2]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(femaleB31R30[1:10,2]) - mean(femaleB31R10[1:10,2])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(femaleB31Rbase[1:10,2]) - mean(femaleB31R10[1:10,2])) / B31RSE
B31Rq2 <- abs(mean(femaleB31R10[1:10,2]) - mean(femaleB31R30[1:10,2])) / B31RSE
B31Rq3 <- abs(mean(femaleB31R30[1:10,2]) - mean(femaleB31Rbase[1:10,2])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(femaleB32Lbase[1:10,2]) + var(femaleB32L10[1:10,2]) + var(femaleB32L30[1:10,2]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(femaleB32L30[1:10,2]) - mean(femaleB32L10[1:10,2])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(femaleB32Lbase[1:10,2]) - mean(femaleB32L10[1:10,2])) / B32LSE
B32Lq2 <- abs(mean(femaleB32L10[1:10,2]) - mean(femaleB32L30[1:10,2])) / B32LSE
B32Lq3 <- abs(mean(femaleB32L30[1:10,2]) - mean(femaleB32Lbase[1:10,2])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(femaleB38Lbase[1:10,2]) + var(femaleB38L10[1:10,2]) + var(femaleB38L30[1:10,2]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(femaleB38L30[1:10,2]) - mean(femaleB38L10[1:10,2])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(femaleB38Lbase[1:10,2]) - mean(femaleB38L10[1:10,2])) / B38LSE
B38Lq2 <- abs(mean(femaleB38L10[1:10,2]) - mean(femaleB38L30[1:10,2])) / B38LSE
B38Lq3 <- abs(mean(femaleB38L30[1:10,2]) - mean(femaleB38Lbase[1:10,2])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(femaleB38Rbase[1:10,2]) + var(femaleB38R10[1:10,2]) + var(femaleB38R30[1:10,2]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(femaleB38R10[1:10,2]) - mean(femaleB38Rbase[1:10,2])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(femaleB38Rbase[1:10,2]) - mean(femaleB38R10[1:10,2])) / B38RSE
B38Rq2 <- abs(mean(femaleB38R10[1:10,2]) - mean(femaleB38R30[1:10,2])) / B38RSE
B38Rq3 <- abs(mean(femaleB38R30[1:10,2]) - mean(femaleB38Rbase[1:10,2])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(femaleB39Rbase[1:10,2]) + var(femaleB39R10[1:10,2]) + var(femaleB39R30[1:10,2]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(femaleB39Rbase[1:10,2]) - mean(femaleB39R10[1:10,2])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(femaleB39Rbase[1:10,2]) - mean(femaleB39R10[1:10,2])) / B39RSE
B39Rq2 <- abs(mean(femaleB39R10[1:10,2]) - mean(femaleB39R30[1:10,2])) / B39RSE
B39Rq3 <- abs(mean(femaleB39R30[1:10,2]) - mean(femaleB39Rbase[1:10,2])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(datafemalebase[,2],datafemale10[,2],datafemale30[,2]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(datafemalebase[,2],datafemale10[,2],datafemale30[,2]))




####中央########---------------------------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#A30L
mean(femaleA30Lbase[1:10,3])
mean(femaleA30L10[1:10,3])
mean(femaleA30L30[1:10,3])
#A30R
mean(femaleA30Rbase[1:10,3])
mean(femaleA30R10[1:10,3])
mean(femaleA30R30[1:10,3])
#B31R
mean(femaleB31Rbase[1:10,3])
mean(femaleB31R10[1:10,3])
mean(femaleB31R30[1:10,3])
#B32L
mean(femaleB32Lbase[1:10,3])
mean(femaleB32L10[1:10,3])
mean(femaleB32L30[1:10,3])
#B38L
mean(femaleB38Lbase[1:10,3])
mean(femaleB38L10[1:10,3])
mean(femaleB38L30[1:10,3])
#B38R
mean(femaleB38Rbase[1:10,3])
mean(femaleB38R10[1:10,3])
mean(femaleB38R30[1:10,3])
#B39R
mean(femaleB39Rbase[1:10,3])
mean(femaleB39R10[1:10,3])
mean(femaleB39R30[1:10,3])



######個体ごとの比較########------------------------------------------------------------------------------------------
##A30L##-------------------------
A30LSMe <-(var(femaleA30Lbase[1:10,3]) + var(femaleA30L10[1:10,3]) + var(femaleA30L30[1:10,3]))/3
A30LSE <- sqrt(A30LSMe/10)
A30Lq <- (mean(femaleA30L10[1:10,3]) - mean(femaleA30Lbase[1:10,3])) / A30LSE
print(A30Lq)

A30Lq1 <- abs(mean(femaleA30Lbase[1:10,3]) - mean(femaleA30L10[1:10,3])) / A30LSE
A30Lq2 <- abs(mean(femaleA30L10[1:10,3]) - mean(femaleA30L30[1:10,3])) / A30LSE
A30Lq3 <- abs(mean(femaleA30L30[1:10,3]) - mean(femaleA30Lbase[1:10,3])) / A30LSE
print(A30Lq1)
print(A30Lq2)
print(A30Lq3)

##A30R##-------------------------
A30RSMe <-(var(femaleA30Rbase[1:10,3]) + var(femaleA30R10[1:10,3]) + var(femaleA30R30[1:10,3]))/3
A30RSE <- sqrt(A30RSMe/10)
A30Rq <- (mean(femaleA30R30[1:10,3]) - mean(femaleA30Rbase[1:10,3])) / A30RSE
print(A30Rq)


A30Rq1 <- abs(mean(femaleA30Rbase[1:10,3]) - mean(femaleA30R10[1:10,3])) / A30RSE
A30Rq2 <- abs(mean(femaleA30R10[1:10,3]) - mean(femaleA30R30[1:10,3])) / A30RSE
A30Rq3 <- abs(mean(femaleA30R30[1:10,3]) - mean(femaleA30Rbase[1:10,3])) / A30RSE
print(A30Rq1)
print(A30Rq2)
print(A30Rq3)


##B31R##-------------------------
B31RSMe <-(var(femaleB31Rbase[1:10,3]) + var(femaleB31R10[1:10,3]) + var(femaleB31R30[1:10,3]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(femaleB31R30[1:10,3]) - mean(femaleB31R10[1:10,3])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(femaleB31Rbase[1:10,3]) - mean(femaleB31R10[1:10,3])) / B31RSE
B31Rq2 <- abs(mean(femaleB31R10[1:10,3]) - mean(femaleB31R30[1:10,3])) / B31RSE
B31Rq3 <- abs(mean(femaleB31R30[1:10,3]) - mean(femaleB31Rbase[1:10,3])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B32L##-------------------------
B32LSMe <-(var(femaleB32Lbase[1:10,3]) + var(femaleB32L10[1:10,3]) + var(femaleB32L30[1:10,3]))/3
B32LSE <- sqrt(B32LSMe/10)
B32Lq <- (mean(femaleB32L30[1:10,3]) - mean(femaleB32L10[1:10,3])) / B32LSE
print(B32Lq)

B32Lq1 <- abs(mean(femaleB32Lbase[1:10,3]) - mean(femaleB32L10[1:10,3])) / B32LSE
B32Lq2 <- abs(mean(femaleB32L10[1:10,3]) - mean(femaleB32L30[1:10,3])) / B32LSE
B32Lq3 <- abs(mean(femaleB32L30[1:10,3]) - mean(femaleB32Lbase[1:10,3])) / B32LSE
print(B32Lq1)
print(B32Lq2)
print(B32Lq3)


##B38L##-------------------------
B38LSMe <-(var(femaleB38Lbase[1:10,3]) + var(femaleB38L10[1:10,3]) + var(femaleB38L30[1:10,3]))/3
B38LSE <- sqrt(B38LSMe/10)
B38Lq <- (mean(femaleB38L30[1:10,3]) - mean(femaleB38L10[1:10,3])) / B38LSE
print(B38Lq)

B38Lq1 <- abs(mean(femaleB38Lbase[1:10,3]) - mean(femaleB38L10[1:10,3])) / B38LSE
B38Lq2 <- abs(mean(femaleB38L10[1:10,3]) - mean(femaleB38L30[1:10,3])) / B38LSE
B38Lq3 <- abs(mean(femaleB38L30[1:10,3]) - mean(femaleB38Lbase[1:10,3])) / B38LSE
print(B38Lq1)
print(B38Lq2)
print(B38Lq3)


##B38R##-------------------------
B38RSMe <-(var(femaleB38Rbase[1:10,3]) + var(femaleB38R10[1:10,3]) + var(femaleB38R30[1:10,3]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(femaleB38R10[1:10,3]) - mean(femaleB38Rbase[1:10,3])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(femaleB38Rbase[1:10,3]) - mean(femaleB38R10[1:10,3])) / B38RSE
B38Rq2 <- abs(mean(femaleB38R10[1:10,3]) - mean(femaleB38R30[1:10,3])) / B38RSE
B38Rq3 <- abs(mean(femaleB38R30[1:10,3]) - mean(femaleB38Rbase[1:10,3])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


##B39R##-------------------------
B39RSMe <-(var(femaleB39Rbase[1:10,3]) + var(femaleB39R10[1:10,3]) + var(femaleB39R30[1:10,3]))/3
B39RSE <- sqrt(B39RSMe/10)
B39Rq <- (mean(femaleB39Rbase[1:10,3]) - mean(femaleB39R10[1:10,3])) / B39RSE
print(B39Rq)

B39Rq1 <- abs(mean(femaleB39Rbase[1:10,3]) - mean(femaleB39R10[1:10,3])) / B39RSE
B39Rq2 <- abs(mean(femaleB39R10[1:10,3]) - mean(femaleB39R30[1:10,3])) / B39RSE
B39Rq3 <- abs(mean(femaleB39R30[1:10,3]) - mean(femaleB39Rbase[1:10,3])) / B39RSE
print(B39Rq1)
print(B39Rq2)
print(B39Rq3)



