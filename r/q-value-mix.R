####個体ごとの比較に変更####---------------------------------------------------------------------------
##データの読み込み
#エピソード#---------------------------------------------
#restraint
restraintbase=read.table("./restraint/base.txt")
restraint10=read.table("./restraint/10.txt")
restraint30=read.table("./restraint/30.txt")
#female
femalebase=read.table("./female/base.txt")
female10=read.table("./female/10.txt")
female30=read.table("./female/30.txt")
#male
malebase=read.table("./male/base.txt")
male10=read.table("./male/10.txt")
male30=read.table("./male/30.txt")
#object
objectbase=read.table("./object/base.txt")
object10=read.table("./object/10.txt")
object30=read.table("./object/30.txt")


####解析####--------------------

##平均の導出##


####開始########---------------------------------------------------------------------------------
#エピソード平均#---------------------------------------------
#restraint
mean(restraintbase[,1])
mean(restraint10[,1])
mean(restraint30[,1])
#female
mean(femalebase[,1])
mean(female10[,1])
mean(female30[,1])
#male
mean(malebase[,1])
mean(male10[,1])
mean(male30[,1])
#object
mean(objectbase[,1])
mean(object10[,1])
mean(object30[,1])





######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintbase[,1]) + var(restraint10[,1]) + var(restraint30[,1]))/3
restraintSE <- sqrt(restraintSMe/length(restraintbase[,1]))
restraintq <- (mean(restraint10[,1]) - mean(restraintbase[,1])) / restraintSE
print(length(restraintbase[,1]))
print(restraintq)

restraintq1 <- abs(mean(restraintbase[,1]) - mean(restraint10[,1])) / restraintSE
restraintq2 <- abs(mean(restraint10[,1]) - mean(restraint30[,1])) / restraintSE
restraintq3 <- abs(mean(restraint30[,1]) - mean(restraintbase[,1])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##female##-------------------------
femaleSMe <-(var(femalebase[,1]) + var(female10[,1]) + var(female30[,1]))/3
femaleSE <- sqrt(femaleSMe/length(femalebase[,1]))
femaleq <- (mean(female10[,1]) - mean(femalebase[,1])) / femaleSE
print(length(femalebase[,1]))
print(femaleq)

femaleq1 <- abs(mean(femalebase[,1]) - mean(female10[,1])) / femaleSE
femaleq2 <- abs(mean(female10[,1]) - mean(female30[,1])) / femaleSE
femaleq3 <- abs(mean(female30[,1]) - mean(femalebase[,1])) / femaleSE
print(femaleq1)
print(femaleq2)
print(femaleq3)

##male##-------------------------
maleSMe <-(var(malebase[,1]) + var(male10[,1]) + var(male30[,1]))/3
maleSE <- sqrt(maleSMe/length(malebase[,1]))
maleq <- (mean(male10[,1]) - mean(malebase[,1])) / maleSE
print(length(malebase[,1]))
print(maleq)

maleq1 <- abs(mean(malebase[,1]) - mean(male10[,1])) / maleSE
maleq2 <- abs(mean(male10[,1]) - mean(male30[,1])) / maleSE
maleq3 <- abs(mean(male30[,1]) - mean(malebase[,1])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)

##object##-------------------------
objectSMe <-(var(objectbase[,1]) + var(object10[,1]) + var(object30[,1]))/3
objectSE <- sqrt(objectSMe/length(objectbase[,1]))
objectq <- (mean(object10[,1]) - mean(objectbase[,1])) / objectSE
print(length(objectbase[,1]))
print(objectq)

objectq1 <- abs(mean(objectbase[,1]) - mean(object10[,1])) / objectSE
objectq2 <- abs(mean(object10[,1]) - mean(object30[,1])) / objectSE
objectq3 <- abs(mean(object30[,1]) - mean(objectbase[,1])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)




####終了########----------------------------------------------------------------------------------------------
#####平均の導出####----------------------------------
#エピソード平均#---------------------------------------------
#restraint
mean(restraintbase[,2])
mean(restraint10[,2])
mean(restraint30[,2])
#female
mean(femalebase[,2])
mean(female10[,2])
mean(female30[,2])
#male
mean(malebase[,2])
mean(male10[,2])
mean(male30[,2])
#object
mean(objectbase[,2])
mean(object10[,2])
mean(object30[,2])





######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintbase[,2]) + var(restraint10[,2]) + var(restraint30[,2]))/3
restraintSE <- sqrt(restraintSMe/length(restraintbase[,2]))
restraintq <- (mean(restraint10[,2]) - mean(restraintbase[,2])) / restraintSE
print(length(restraintbase[,2]))
print(restraintq)

restraintq1 <- abs(mean(restraintbase[,2]) - mean(restraint10[,2])) / restraintSE
restraintq2 <- abs(mean(restraint10[,2]) - mean(restraint30[,2])) / restraintSE
restraintq3 <- abs(mean(restraint30[,2]) - mean(restraintbase[,2])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##female##-------------------------
femaleSMe <-(var(femalebase[,2]) + var(female10[,2]) + var(female30[,2]))/3
femaleSE <- sqrt(femaleSMe/length(femalebase[,2]))
femaleq <- (mean(female10[,2]) - mean(femalebase[,2])) / femaleSE
print(femaleq)

femaleq1 <- abs(mean(femalebase[,2]) - mean(female10[,2])) / femaleSE
femaleq2 <- abs(mean(female10[,2]) - mean(female30[,2])) / femaleSE
femaleq3 <- abs(mean(female30[,2]) - mean(femalebase[,2])) / femaleSE
print(femaleq1)
print(femaleq2)
print(femaleq3)

##male##-------------------------
maleSMe <-(var(malebase[,2]) + var(male10[,2]) + var(male30[,2]))/3
maleSE <- sqrt(maleSMe/length(malebase[,2]))
maleq <- (mean(male10[,2]) - mean(malebase[,2])) / maleSE
print(maleq)

maleq1 <- abs(mean(malebase[,2]) - mean(male10[,2])) / maleSE
maleq2 <- abs(mean(male10[,2]) - mean(male30[,2])) / maleSE
maleq3 <- abs(mean(male30[,2]) - mean(malebase[,2])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)

##object##-------------------------
objectSMe <-(var(objectbase[,2]) + var(object10[,2]) + var(object30[,2]))/3
objectSE <- sqrt(objectSMe/length(objectbase[,2]))
objectq <- (mean(object10[,2]) - mean(objectbase[,2])) / objectSE
print(objectq)

objectq1 <- abs(mean(objectbase[,2]) - mean(object10[,2])) / objectSE
objectq2 <- abs(mean(object10[,2]) - mean(object30[,2])) / objectSE
objectq3 <- abs(mean(object30[,2]) - mean(objectbase[,2])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)

####中央########---------------------------------------------------------------------------------------------------------------
#エピソード平均#---------------------------------------------
#restraint
mean(restraintbase[,3])
mean(restraint10[,3])
mean(restraint30[,3])
#female
mean(femalebase[,3])
mean(female10[,3])
mean(female30[,3])
#male
mean(malebase[,3])
mean(male10[,3])
mean(male30[,3])
#object
mean(objectbase[,3])
mean(object10[,3])
mean(object30[,3])





######個体ごとの比較########------------------------------------------------------------------------------------------
##restraint##-------------------------
restraintSMe <-(var(restraintbase[,3]) + var(restraint10[,3]) + var(restraint30[,3]))/3
restraintSE <- sqrt(restraintSMe/length(restraintbase[,3]))
restraintq <- (mean(restraint10[,3]) - mean(restraintbase[,3])) / restraintSE
print(restraintq)

restraintq1 <- abs(mean(restraintbase[,3]) - mean(restraint10[,3])) / restraintSE
restraintq2 <- abs(mean(restraint10[,3]) - mean(restraint30[,3])) / restraintSE
restraintq3 <- abs(mean(restraint30[,3]) - mean(restraintbase[,3])) / restraintSE
print(restraintq1)
print(restraintq2)
print(restraintq3)


##female##-------------------------
femaleSMe <-(var(femalebase[,3]) + var(female10[,3]) + var(female30[,3]))/3
femaleSE <- sqrt(femaleSMe/length(femalebase[,3]))
femaleq <- (mean(female10[,3]) - mean(femalebase[,3])) / femaleSE
print(femaleq)

femaleq1 <- abs(mean(femalebase[,3]) - mean(female10[,3])) / femaleSE
femaleq2 <- abs(mean(female10[,3]) - mean(female30[,3])) / femaleSE
femaleq3 <- abs(mean(female30[,3]) - mean(femalebase[,3])) / femaleSE
print(femaleq1)
print(femaleq2)
print(femaleq3)

##male##-------------------------
maleSMe <-(var(malebase[,3]) + var(male10[,3]) + var(male30[,3]))/3
maleSE <- sqrt(maleSMe/length(malebase[,3]))
maleq <- (mean(male10[,3]) - mean(malebase[,3])) / maleSE
print(maleq)

maleq1 <- abs(mean(malebase[,3]) - mean(male10[,3])) / maleSE
maleq2 <- abs(mean(male10[,3]) - mean(male30[,3])) / maleSE
maleq3 <- abs(mean(male30[,3]) - mean(malebase[,3])) / maleSE
print(maleq1)
print(maleq2)
print(maleq3)

##object##-------------------------
objectSMe <-(var(objectbase[,3]) + var(object10[,3]) + var(object30[,3]))/3
objectSE <- sqrt(objectSMe/length(objectbase[,3]))
objectq <- (mean(object10[,3]) - mean(objectbase[,3])) / objectSE
print(objectq)

objectq1 <- abs(mean(objectbase[,3]) - mean(object10[,3])) / objectSE
objectq2 <- abs(mean(object10[,3]) - mean(object30[,3])) / objectSE
objectq3 <- abs(mean(object30[,3]) - mean(objectbase[,3])) / objectSE
print(objectq1)
print(objectq2)
print(objectq3)