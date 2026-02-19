S1<- 63
S2<- 42
S3<- 29
S4 <- 29 
S5<- 18
#estimate abundnace and catchability 
Q5<-data.frame(catch=c(63,42,29,29,18),effort=c(10,10,10,10,10))
head(Q5)
Q5$CPUE<-Q5$catch/Q5$effort
Q5$k<-cumsum(Q5$catch)-(Q5$catch)
lm1<-lm(CPUE~k,data=Q5)
coef(lm1)
abundance<-(6.0898660/0.03019312)
Catchability<--coef(lm1)[2]
Catchability
#abundance is 201.697
#catchability is 0.0265577