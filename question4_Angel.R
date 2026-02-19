BrownTrout<-data.frame(catch=c(24, 17, 8), effort=c(1,1,1))
BrownTrout$CPUE <- BrownTrout$catch/BrownTrout$effort
totalcatch <- sum(BrownTrout$catch)
totaleffort <-sum(BrownTrout$effort)
ABUNDANCE <- (totalcatch/totaleffort)
Catchability <- totalcatch/(totaleffort*ABUNDANCE)
#this one is weird because this implies that we are completely emptying the stream by our chosen method
#Which a three pass removal method seeks to literally catch everything, so they are doing a very good job!

?mvrnorm
