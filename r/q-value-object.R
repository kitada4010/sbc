####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#object#---------------------------------------------
#B36R
objectB36Rbase=read.table("./object/B36Rbase.txt")
objectB36R10=read.table("./object/B36R10.txt")
objectB36R30=read.table("./object/B36R30.txt")
#B38R
objectB38Rbase=read.table("./object/B38Rbase.txt")
objectB38R10=read.table("./object/B38R10.txt")
objectB38R30=read.table("./object/B38R30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#B36R
mean(objectB36Rbase[1:10,1])
mean(objectB36R10[1:10,1])
mean(objectB36R30[1:10,1])
#B38R
mean(objectB38Rbase[1:10,1])
mean(objectB38R10[1:10,1])
mean(objectB38R30[1:10,1])




######個体ごとの比較########------------------------------------------------------------------------------------------
##B36R##-------------------------
B36RSMe <-(var(objectB36Rbase[1:10,1]) + var(objectB36R10[1:10,1]) + var(objectB36R30[1:10,1]))/3
B36RSE <- sqrt(B36RSMe/10)
B36Rq <- (mean(objectB36R10[1:10,1]) - mean(objectB36Rbase[1:10,1])) / B36RSE
print(B36Rq)

B36Rq1 <- abs(mean(objectB36Rbase[1:10,1]) - mean(objectB36R10[1:10,1])) / B36RSE
B36Rq2 <- abs(mean(objectB36R10[1:10,1]) - mean(objectB36R30[1:10,1])) / B36RSE
B36Rq3 <- abs(mean(objectB36R30[1:10,1]) - mean(objectB36Rbase[1:10,1])) / B36RSE
print(B36Rq1)
print(B36Rq2)
print(B36Rq3)


##B38R##-------------------------
B38RSMe <-(var(objectB38Rbase[1:10,1]) + var(objectB38R10[1:10,1]) + var(objectB38R30[1:10,1]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(objectB38Rbase[1:10,1]) - mean(objectB38R10[1:10,1])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(objectB38Rbase[1:10,1]) - mean(objectB38R10[1:10,1])) / B38RSE
B38Rq2 <- abs(mean(objectB38R10[1:10,1]) - mean(objectB38R30[1:10,1])) / B38RSE
B38Rq3 <- abs(mean(objectB38R30[1:10,1]) - mean(objectB38Rbase[1:10,1])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(dataobjectbase[,1],dataobject10[,1],dataobject30[,1]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(dataobjectbase[,1],dataobject10[,1],dataobject30[,1]))


#####全体##########----------------------------------------------------------------
##標準誤差の導出##

SMe <-(var(objectB36Rbase[1:10,1]) + var(objectB36R10[1:10,1]) + var(objectB36R30[1:10,1]) 
     + var(objectA30Rbase[1:10,1]) + var(objectA30R10[1:10,1]) + var(objectA30R30[1:10,1])
     + var(objectB31Rbase[1:10,1]) + var(objectB31R10[1:10,1]) + var(objectB31R30[1:10,1])
     + var(objectB32Lbase[1:10,1]) + var(objectB32L10[1:10,1]) + var(objectB32L30[1:10,1])
     + var(objectB38Lbase[1:10,1]) + var(objectB38L10[1:10,1]) + var(objectB38L30[1:10,1])
     + var(objectB38Rbase[1:10,1]) + var(objectB38R10[1:10,1]) + var(objectB38R30[1:10,1])
     + var(objectB38Rbase[1:10,1]) + var(objectB38R10[1:10,1]) + var(objectB38R30[1:10,1]))/21

SE <- sqrt(SMe/10)
print(SE)

##q値の導出##

q <- (mean(objectB31R30[1:10,1]) - mean(objectB38Rbase[1:10,1])) / SE
print(q)


####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#B36R
mean(objectB36Rbase[1:10,2])
mean(objectB36R10[1:10,2])
mean(objectB36R30[1:10,2])
#B38R
mean(objectB38Rbase[1:10,2])
mean(objectB38R10[1:10,2])
mean(objectB38R30[1:10,2])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B36R##-------------------------
B36RSMe <-(var(objectB36Rbase[1:10,2]) + var(objectB36R10[1:10,2]) + var(objectB36R30[1:10,2]))/3
B36RSE <- sqrt(B36RSMe/10)
B36Rq <- (mean(objectB36R10[1:10,2]) - mean(objectB36Rbase[1:10,2])) / B36RSE
print(B36Rq)

B36Rq1 <- abs(mean(objectB36Rbase[1:10,2]) - mean(objectB36R10[1:10,2])) / B36RSE
B36Rq2 <- abs(mean(objectB36R10[1:10,2]) - mean(objectB36R30[1:10,2])) / B36RSE
B36Rq3 <- abs(mean(objectB36R30[1:10,2]) - mean(objectB36Rbase[1:10,2])) / B36RSE
print(B36Rq1)
print(B36Rq2)
print(B36Rq3)


##B38R##-------------------------
B38RSMe <-(var(objectB38Rbase[1:10,2]) + var(objectB38R10[1:10,2]) + var(objectB38R30[1:10,2]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(objectB38Rbase[1:10,2]) - mean(objectB38R10[1:10,2])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(objectB38Rbase[1:10,2]) - mean(objectB38R10[1:10,2])) / B38RSE
B38Rq2 <- abs(mean(objectB38R10[1:10,2]) - mean(objectB38R30[1:10,2])) / B38RSE
B38Rq3 <- abs(mean(objectB38R30[1:10,2]) - mean(objectB38Rbase[1:10,2])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)



#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(dataobjectbase[,2],dataobject10[,2],dataobject30[,2]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(dataobjectbase[,2],dataobject10[,2],dataobject30[,2]))




####中央########---------------------------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#B36R
mean(objectB36Rbase[1:10,3])
mean(objectB36R10[1:10,3])
mean(objectB36R30[1:10,3])
#B38R
mean(objectB38Rbase[1:10,3])
mean(objectB38R10[1:10,3])
mean(objectB38R30[1:10,3])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B36R##-------------------------
B36RSMe <-(var(objectB36Rbase[1:10,3]) + var(objectB36R10[1:10,3]) + var(objectB36R30[1:10,3]))/3
B36RSE <- sqrt(B36RSMe/10)
B36Rq <- (mean(objectB36R10[1:10,3]) - mean(objectB36Rbase[1:10,3])) / B36RSE
print(B36Rq)

B36Rq1 <- abs(mean(objectB36Rbase[1:10,3]) - mean(objectB36R10[1:10,3])) / B36RSE
B36Rq2 <- abs(mean(objectB36R10[1:10,3]) - mean(objectB36R30[1:10,3])) / B36RSE
B36Rq3 <- abs(mean(objectB36R30[1:10,3]) - mean(objectB36Rbase[1:10,3])) / B36RSE
print(B36Rq1)
print(B36Rq2)
print(B36Rq3)


##B38R##-------------------------
B38RSMe <-(var(objectB38Rbase[1:10,3]) + var(objectB38R10[1:10,3]) + var(objectB38R30[1:10,3]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(objectB38Rbase[1:10,3]) - mean(objectB38R10[1:10,3])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(objectB38Rbase[1:10,3]) - mean(objectB38R10[1:10,3])) / B38RSE
B38Rq2 <- abs(mean(objectB38R10[1:10,3]) - mean(objectB38R30[1:10,3])) / B38RSE
B38Rq3 <- abs(mean(objectB38R30[1:10,3]) - mean(objectB38Rbase[1:10,3])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)



