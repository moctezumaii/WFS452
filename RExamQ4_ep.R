#24 Brown Trout are caught in the first sampling pass, 17 in the second sampling pass, and 8 in the third sampling pass.
C1<-24
C2<-17
C3<-8
#Estimate abundance and catchability
Browns<-data.frame(catch=c(24,17,8),effort=c(10,10,10))
head(Browns)
Browns$CPUE<-Browns$catch/Browns$effort
Browns$k<-cumsum(Browns$catch)-(Browns$catch)
lm1<-lm(CPUE~k,data=Browns)
coef(lm1)
abundance<-(2.26276826/0.03019312)
Catchability<--coef(lm1)[2]
#abundance is 74.94 aka 75
#catchability is 0.0384