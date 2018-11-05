####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#male#---------------------------------------------
#B26R
maleB26Rbase=read.table("./male/B26Rbase.txt")
maleB26R10=read.table("./male/B26R10.txt")
maleB26R30=read.table("./male/B26R30.txt")
#B30R
maleB30Rbase=read.table("./male/B30Rbase.txt")
maleB30R10=read.table("./male/B30R10.txt")
maleB30R30=read.table("./male/B30R30.txt")
#B31R
maleB31Rbase=read.table("./male/B31Rbase.txt")
maleB31R10=read.table("./male/B31R10.txt")
maleB31R30=read.table("./male/B31R30.txt")
#B38R
maleB38Rbase=read.table("./male/B38Rbase.txt")
maleB38R10=read.table("./male/B38R10.txt")
maleB38R30=read.table("./male/B38R30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#B26R
mean(maleB26Rbase[1:10,1])
mean(maleB26R10[1:10,1])
mean(maleB26R30[1:10,1])
#B30R
mean(maleB30Rbase[1:10,1])
mean(maleB30R10[1:10,1])
mean(maleB30R30[1:10,1])
#B31R
mean(maleB31Rbase[1:10,1])
mean(maleB31R10[1:10,1])
mean(maleB31R30[1:10,1])
#B38R
mean(maleB38Rbase[1:10,1])
mean(maleB38R10[1:10,1])
mean(maleB38R30[1:10,1])




######個体ごとの比較########------------------------------------------------------------------------------------------
##B26R##-------------------------
B26RSMe <-(var(maleB26Rbase[1:10,1]) + var(maleB26R10[1:10,1]) + var(maleB26R30[1:10,1]))/3
B26RSE <- sqrt(B26RSMe/10)
B26Rq <- (mean(maleB26R10[1:10,1]) - mean(maleB26Rbase[1:10,1])) / B26RSE
print(B26Rq)

B26Rq1 <- abs(mean(maleB26Rbase[1:10,1]) - mean(maleB26R10[1:10,1])) / B26RSE
B26Rq2 <- abs(mean(maleB26R10[1:10,1]) - mean(maleB26R30[1:10,1])) / B26RSE
B26Rq3 <- abs(mean(maleB26R30[1:10,1]) - mean(maleB26Rbase[1:10,1])) / B26RSE
print(B26Rq1)
print(B26Rq2)
print(B26Rq3)


##B30R##-------------------------
B30RSMe <-(var(maleB30Rbase[1:10,1]) + var(maleB30R10[1:10,1]) + var(maleB30R30[1:10,1]))/3
B30RSE <- sqrt(B30RSMe/10)
B30Rq <- (mean(maleB30Rbase[1:10,1]) - mean(maleB30R10[1:10,1])) / B30RSE
print(B30Rq)

B30Rq1 <- abs(mean(maleB30Rbase[1:10,1]) - mean(maleB30R10[1:10,1])) / B30RSE
B30Rq2 <- abs(mean(maleB30R10[1:10,1]) - mean(maleB30R30[1:10,1])) / B30RSE
B30Rq3 <- abs(mean(maleB30R30[1:10,1]) - mean(maleB30Rbase[1:10,1])) / B30RSE
print(B30Rq1)
print(B30Rq2)
print(B30Rq3)


##B31R##-------------------------
B31RSMe <-(var(maleB31Rbase[1:10,1]) + var(maleB31R10[1:10,1]) + var(maleB31R30[1:10,1]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(maleB31Rbase[1:10,1]) - mean(maleB31R10[1:10,1])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(maleB31Rbase[1:10,1]) - mean(maleB31R10[1:10,1])) / B31RSE
B31Rq2 <- abs(mean(maleB31R10[1:10,1]) - mean(maleB31R30[1:10,1])) / B31RSE
B31Rq3 <- abs(mean(maleB31R30[1:10,1]) - mean(maleB31Rbase[1:10,1])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B38R##-------------------------
B38RSMe <-(var(maleB38Rbase[1:10,1]) + var(maleB38R10[1:10,1]) + var(maleB38R30[1:10,1]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(maleB38Rbase[1:10,1]) - mean(maleB38R10[1:10,1])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(maleB38Rbase[1:10,1]) - mean(maleB38R10[1:10,1])) / B38RSE
B38Rq2 <- abs(mean(maleB38R10[1:10,1]) - mean(maleB38R30[1:10,1])) / B38RSE
B38Rq3 <- abs(mean(maleB38R30[1:10,1]) - mean(maleB38Rbase[1:10,1])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)






####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#B26R
mean(maleB26Rbase[1:10,2])
mean(maleB26R10[1:10,2])
mean(maleB26R30[1:10,2])
#B30R
mean(maleB30Rbase[1:10,2])
mean(maleB30R10[1:10,2])
mean(maleB30R30[1:10,2])
#B31R
mean(maleB31Rbase[1:10,2])
mean(maleB31R10[1:10,2])
mean(maleB31R30[1:10,2])
#B38R
mean(maleB38Rbase[1:10,2])
mean(maleB38R10[1:10,2])
mean(maleB38R30[1:10,2])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B26R##-------------------------
B26RSMe <-(var(maleB26Rbase[1:10,2]) + var(maleB26R10[1:10,2]) + var(maleB26R30[1:10,2]))/3
B26RSE <- sqrt(B26RSMe/10)
B26Rq <- (mean(maleB26R10[1:10,2]) - mean(maleB26Rbase[1:10,2])) / B26RSE
print(B26Rq)

B26Rq1 <- abs(mean(maleB26Rbase[1:10,2]) - mean(maleB26R10[1:10,2])) / B26RSE
B26Rq2 <- abs(mean(maleB26R10[1:10,2]) - mean(maleB26R30[1:10,2])) / B26RSE
B26Rq3 <- abs(mean(maleB26R30[1:10,2]) - mean(maleB26Rbase[1:10,2])) / B26RSE
print(B26Rq1)
print(B26Rq2)
print(B26Rq3)


##B30R##-------------------------
B30RSMe <-(var(maleB30Rbase[1:10,2]) + var(maleB30R10[1:10,2]) + var(maleB30R30[1:10,2]))/3
B30RSE <- sqrt(B30RSMe/10)
B30Rq <- (mean(maleB30Rbase[1:10,2]) - mean(maleB30R10[1:10,2])) / B30RSE
print(B30Rq)

B30Rq1 <- abs(mean(maleB30Rbase[1:10,2]) - mean(maleB30R10[1:10,2])) / B30RSE
B30Rq2 <- abs(mean(maleB30R10[1:10,2]) - mean(maleB30R30[1:10,2])) / B30RSE
B30Rq3 <- abs(mean(maleB30R30[1:10,2]) - mean(maleB30Rbase[1:10,2])) / B30RSE
print(B30Rq1)
print(B30Rq2)
print(B30Rq3)


##B31R##-------------------------
B31RSMe <-(var(maleB31Rbase[1:10,2]) + var(maleB31R10[1:10,2]) + var(maleB31R30[1:10,2]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(maleB31Rbase[1:10,2]) - mean(maleB31R10[1:10,2])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(maleB31Rbase[1:10,2]) - mean(maleB31R10[1:10,2])) / B31RSE
B31Rq2 <- abs(mean(maleB31R10[1:10,2]) - mean(maleB31R30[1:10,2])) / B31RSE
B31Rq3 <- abs(mean(maleB31R30[1:10,2]) - mean(maleB31Rbase[1:10,2])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)


##B38R##-------------------------
B38RSMe <-(var(maleB38Rbase[1:10,2]) + var(maleB38R10[1:10,2]) + var(maleB38R30[1:10,2]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(maleB38Rbase[1:10,2]) - mean(maleB38R10[1:10,2])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(maleB38Rbase[1:10,2]) - mean(maleB38R10[1:10,2])) / B38RSE
B38Rq2 <- abs(mean(maleB38R10[1:10,2]) - mean(maleB38R30[1:10,2])) / B38RSE
B38Rq3 <- abs(mean(maleB38R30[1:10,2]) - mean(maleB38Rbase[1:10,2])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)






####中央########---------------------------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#B26R
mean(maleB26Rbase[1:10,3])
mean(maleB26R10[1:10,3])
mean(maleB26R30[1:10,3])
#B30R
mean(maleB30Rbase[1:10,3])
mean(maleB30R10[1:10,3])
mean(maleB30R30[1:10,3])
#B31R
mean(maleB31Rbase[1:10,3])
mean(maleB31R10[1:10,3])
mean(maleB31R30[1:10,3])
#B38R
mean(maleB38Rbase[1:10,3])
mean(maleB38R10[1:10,3])
mean(maleB38R30[1:10,3])



######個体ごとの比較########------------------------------------------------------------------------------------------
##B26R##-------------------------
B26RSMe <-(var(maleB26Rbase[1:10,3]) + var(maleB26R10[1:10,3]) + var(maleB26R30[1:10,3]))/3
B26RSE <- sqrt(B26RSMe/10)
B26Rq <- (mean(maleB26R10[1:10,3]) - mean(maleB26Rbase[1:10,3])) / B26RSE
print(B26Rq)

B26Rq1 <- abs(mean(maleB26Rbase[1:10,3]) - mean(maleB26R10[1:10,3])) / B26RSE
B26Rq2 <- abs(mean(maleB26R10[1:10,3]) - mean(maleB26R30[1:10,3])) / B26RSE
B26Rq3 <- abs(mean(maleB26R30[1:10,3]) - mean(maleB26Rbase[1:10,3])) / B26RSE
print(B26Rq1)
print(B26Rq2)
print(B26Rq3)


##B30R##-------------------------
B30RSMe <-(var(maleB30Rbase[1:10,3]) + var(maleB30R10[1:10,3]) + var(maleB30R30[1:10,3]))/3
B30RSE <- sqrt(B30RSMe/10)
B30Rq <- (mean(maleB30Rbase[1:10,3]) - mean(maleB30R10[1:10,3])) / B30RSE
print(B30Rq)

B30Rq1 <- abs(mean(maleB30Rbase[1:10,3]) - mean(maleB30R10[1:10,3])) / B30RSE
B30Rq2 <- abs(mean(maleB30R10[1:10,3]) - mean(maleB30R30[1:10,3])) / B30RSE
B30Rq3 <- abs(mean(maleB30R30[1:10,3]) - mean(maleB30Rbase[1:10,3])) / B30RSE
print(B30Rq1)
print(B30Rq2)
print(B30Rq3)


##B31R##-------------------------
B31RSMe <-(var(maleB31Rbase[1:10,3]) + var(maleB31R10[1:10,3]) + var(maleB31R30[1:10,3]))/3
B31RSE <- sqrt(B31RSMe/10)
B31Rq <- (mean(maleB31Rbase[1:10,3]) - mean(maleB31R10[1:10,3])) / B31RSE
print(B31Rq)

B31Rq1 <- abs(mean(maleB31Rbase[1:10,3]) - mean(maleB31R10[1:10,3])) / B31RSE
B31Rq2 <- abs(mean(maleB31R10[1:10,3]) - mean(maleB31R30[1:10,3])) / B31RSE
B31Rq3 <- abs(mean(maleB31R30[1:10,3]) - mean(maleB31Rbase[1:10,3])) / B31RSE
print(B31Rq1)
print(B31Rq2)
print(B31Rq3)



##B38R##-------------------------
B38RSMe <-(var(maleB38Rbase[1:10,3]) + var(maleB38R10[1:10,3]) + var(maleB38R30[1:10,3]))/3
B38RSE <- sqrt(B38RSMe/10)
B38Rq <- (mean(maleB38Rbase[1:10,3]) - mean(maleB38R10[1:10,3])) / B38RSE
print(B38Rq)

B38Rq1 <- abs(mean(maleB38Rbase[1:10,3]) - mean(maleB38R10[1:10,3])) / B38RSE
B38Rq2 <- abs(mean(maleB38R10[1:10,3]) - mean(maleB38R30[1:10,3])) / B38RSE
B38Rq3 <- abs(mean(maleB38R30[1:10,3]) - mean(maleB38Rbase[1:10,3])) / B38RSE
print(B38Rq1)
print(B38Rq2)
print(B38Rq3)


