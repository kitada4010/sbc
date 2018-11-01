datarestraintbase=read.table("restraint_base.txt")
datarestraint10=read.table("restraint_10min.txt")
datarestraint30=read.table("restraint_30min.txt")
#datarestraintstart=c(datarestraintbase[,1],datarestraint10[,1],datarestraint10[,1])


datafemalebase=read.table("female_base.txt")
datafemale10=read.table("female_10min.txt")
datafemale30=read.table("female_30min.txt")

datamalebase=read.table("male_base.txt")
datamale10=read.table("male_10min.txt")
datamale30=read.table("male_30min.txt")

dataobjectbase=read.table("object_base.txt")
dataobject10=read.table("object_10min.txt")
dataobject30=read.table("object_30min.txt")


sd(datarestraintbase[,1])/sqrt(length(datarestraintbase[,1]))
sd(datarestraint10[,1])/sqrt(length(datarestraint10[,1]))
sd(datarestraint30[,1])/sqrt(length(datarestraint30[,1]))

#sd(datarestraintbase[,1])/sqrt(length(datarestraintbase[,1]))

#t.test(datarestraintbase[,1],datarestraint10[,1])
#t.test(datarestraint10[,1],datarestraint30[,1])
#t.test(datarestraintbase[,1],datarestraint30[,1])

#t.test(datafemalebase[,1],datafemale10[,1])
#t.test(datafemale10[,1],datafemale30[,1])
#t.test(datafemalebase[,1],datafemale30[,1])

#t.test(datamalebase[,1],datamale10[,1])
#t.test(datamale10[,1],datamale30[,1])
#t.test(datamalebase[,1],datamale30[,1])

#t.test(dataobjectbase[,1],dataobject10[,1])
#t.test(dataobject10[,1],dataobject30[,1])
#t.test(dataobjectbase[,1],dataobject30[,1])

bartlett.test(x=list(datarestraintbase[,1],datarestraint10[,1],datarestraint30[,1]))
bartlett.test(x=list(datafemalebase[,1],datafemale10[,1],datafemale30[,1]))
bartlett.test(x=list(datamalebase[,1],datamale10[,1],datamale30[,1]))
bartlett.test(x=list(dataobjectbase[,1],dataobject10[,1],dataobject30[,1]))

bartlett.test(x=list(datarestraintbase[,2],datarestraint10[,2],datarestraint30[,2]))
bartlett.test(x=list(datafemalebase[,2],datafemale10[,2],datafemale30[,2]))
bartlett.test(x=list(datamalebase[,2],datamale10[,2],datamale30[,2]))
bartlett.test(x=list(dataobjectbase[,2],dataobject10[,2],dataobject30[,2]))

bartlett.test(x=list(datarestraintbase[,3],datarestraint10[,3],datarestraint30[,3]))
bartlett.test(x=list(datafemalebase[,3],datafemale10[,3],datafemale30[,3]))
bartlett.test(x=list(datamalebase[,3],datamale10[,3],datamale30[,3]))
bartlett.test(x=list(dataobjectbase[,3],dataobject10[,3],dataobject30[,3]))

bartlett.test(x=list(datarestraintbase[,1],datafemalebase[,1],datamalebase[,1],dataobjectbase[,1]))
bartlett.test(x=list(datarestraint10[,1],datafemale10[,1],datamale10[,1],dataobject10[,1]))
bartlett.test(x=list(datarestraint30[,1],datafemale30[,1],datamale30[,1],dataobject30[,1]))

bartlett.test(x=list(datarestraintbase[,2],datafemalebase[,2],datamalebase[,2],dataobjectbase[,2]))
bartlett.test(x=list(datarestraint10[,2],datafemale10[,2],datamale10[,2],dataobject10[,2]))
bartlett.test(x=list(datarestraint30[,2],datafemale30[,2],datamale30[,2],dataobject30[,2]))

bartlett.test(x=list(datarestraintbase[,3],datafemalebase[,3],datamalebase[,3],dataobjectbase[,3]))
bartlett.test(x=list(datarestraint10[,3],datafemale10[,3],datamale10[,3],dataobject10[,3]))
bartlett.test(x=list(datarestraint30[,3],datafemale30[,3],datamale30[,3],dataobject30[,3]))

###----------

sum(var(datarestraintbase[,1])+var(datarestraint10[,1])+var(datarestraint30[,1]))/3
SE <- sqrt(sum(var(datarestraintbase[,1])+var(datarestraint10[,1])+var(datarestraint30[,1]))/(length(datarestraintbase[,1]+length(datarestraint10[,1]+length(datarestraint30[,1])))))

###-----------

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


##標準誤差の導出##

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

SE <- sqrt(sum(var(datarestraintbase[,1])+var(datarestraint10[,1])+var(datarestraint30[,1]))/(length(datarestraintbase[,1]+length(datarestraint10[,1]+length(datarestraint30[,1])))))
q <- (mean(datarestraint10[,1]) - mean(datarestraintbase[,1])) / SE
print(q)





#install.packages("gplots")
#library(gplots)
#plotmeans(x=list(datarestraintbase[,1],datarestraint10[,1],datarestraint30[,1]), data=x, connect=F, ylim=c(-180,180))

#plotmeans(x=list(datarestraintbase[,1],datarestraint10[,1],datarestraint30[,1]))




