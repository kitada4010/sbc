####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#female#---------------------------------------------
#B34L
femaleB34Lbase=read.table("./female/B34Lbase.txt")
femaleB34L10=read.table("./female/B34L10.txt")
femaleB34L30=read.table("./female/B34L30.txt")
#B39R
femaleB39Rbase=read.table("./female/B39Rbase.txt")
femaleB39R10=read.table("./female/B39R10.txt")
femaleB39R30=read.table("./female/B39R30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#B34L
mean(femaleB34Lbase[1:10,1])
mean(femaleB34L10[1:10,1])
mean(femaleB34L30[1:10,1])
#B39R
mean(femaleB39Rbase[1:10,1])
mean(femaleB39R10[1:10,1])
mean(femaleB39R30[1:10,1])




######個体ごとの比較########------------------------------------------------------------------------------------------
##B34L##-------------------------
B34LSMe <-(var(femaleB34Lbase[1:10,1]) + var(femaleB34L10[1:10,1]) + var(femaleB34L30[1:10,1]))/3
B34LSE <- sqrt(B34LSMe/10)
B34Lq <- (mean(femaleB34L10[1:10,1]) - mean(femaleB34Lbase[1:10,1])) / B34LSE
print(B34Lq)

B34Lq1 <- abs(mean(femaleB34Lbase[1:10,1]) - mean(femaleB34L10[1:10,1])) / B34LSE
B34Lq2 <- abs(mean(femaleB34L10[1:10,1]) - mean(femaleB34L30[1:10,1])) / B34LSE
B34Lq3 <- abs(mean(femaleB34L30[1:10,1]) - mean(femaleB34Lbase[1:10,1])) / B34LSE
print(B34Lq1)
print(B34Lq2)
print(B34Lq3)


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

SMe <-(var(femaleB34Lbase[1:10,1]) + var(femaleB34L10[1:10,1]) + var(femaleB34L30[1:10,1]) 
     + var(femaleA30Rbase[1:10,1]) + var(femaleA30R10[1:10,1]) + var(femaleA30R30[1:10,1])
     + var(femaleB31Rbase[1:10,1]) + var(femaleB31R10[1:10,1]) + var(femaleB31R30[1:10,1])
     + var(femaleB32Lbase[1:10,1]) + var(femaleB32L10[1:10,1]) + var(femaleB32L30[1:10,1])
     + var(femaleB38Lbase[1:10,1]) + var(femaleB38L10[1:10,1]) + var(femaleB38L30[1:10,1])
     + var(femaleB39Rbase[1:10,1]) + var(femaleB39R10[1:10,1]) + var(femaleB39R30[1:10,1])
     + var(femaleB39Rbase[1:10,1]) + var(femaleB39R10[1:10,1]) + var(femaleB39R30[1:10,1]))/21

SE <- sqrt(SMe/10)
print(SE)

##q値の導出##

q <- (mean(femaleB31R30[1:10,1]) - mean(femaleB39Rbase[1:10,1])) / SE
print(q)


####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#B34L
mean(femaleB34Lbase[1:10,2])
mean(femaleB34L10[1:10,2])
mean(femaleB34L30[1:10,2])
#B39R
mean(femaleB39Rbase[1:10,2])
mean(femaleB39R10[1:10,2])
mean(femaleB39R30[1:10,2])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B34L##-------------------------
B34LSMe <-(var(femaleB34Lbase[1:10,2]) + var(femaleB34L10[1:10,2]) + var(femaleB34L30[1:10,2]))/3
B34LSE <- sqrt(B34LSMe/10)
B34Lq <- (mean(femaleB34L10[1:10,2]) - mean(femaleB34Lbase[1:10,2])) / B34LSE
print(B34Lq)

B34Lq1 <- abs(mean(femaleB34Lbase[1:10,2]) - mean(femaleB34L10[1:10,2])) / B34LSE
B34Lq2 <- abs(mean(femaleB34L10[1:10,2]) - mean(femaleB34L30[1:10,2])) / B34LSE
B34Lq3 <- abs(mean(femaleB34L30[1:10,2]) - mean(femaleB34Lbase[1:10,2])) / B34LSE
print(B34Lq1)
print(B34Lq2)
print(B34Lq3)


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
#B34L
mean(femaleB34Lbase[1:10,3])
mean(femaleB34L10[1:10,3])
mean(femaleB34L30[1:10,3])
#B39R
mean(femaleB39Rbase[1:10,3])
mean(femaleB39R10[1:10,3])
mean(femaleB39R30[1:10,3])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B34L##-------------------------
B34LSMe <-(var(femaleB34Lbase[1:10,3]) + var(femaleB34L10[1:10,3]) + var(femaleB34L30[1:10,3]))/3
B34LSE <- sqrt(B34LSMe/10)
B34Lq <- (mean(femaleB34L10[1:10,3]) - mean(femaleB34Lbase[1:10,3])) / B34LSE
print(B34Lq)

B34Lq1 <- abs(mean(femaleB34Lbase[1:10,3]) - mean(femaleB34L10[1:10,3])) / B34LSE
B34Lq2 <- abs(mean(femaleB34L10[1:10,3]) - mean(femaleB34L30[1:10,3])) / B34LSE
B34Lq3 <- abs(mean(femaleB34L30[1:10,3]) - mean(femaleB34Lbase[1:10,3])) / B34LSE
print(B34Lq1)
print(B34Lq2)
print(B34Lq3)


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



