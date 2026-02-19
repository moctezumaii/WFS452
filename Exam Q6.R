S1<- 61
S2<- 36
S3<- 29
S4 <- 32
S5<- 10
S6<- 12
#estimate abundnace and catchability 
Q6<-data.frame(catch=c(61,36,29,32,10,12),effort=c(10,10,10,10,10,10))
head(Q6)
Q6$CPUE<-Q6$catch/Q6$effort
Q6$k<-cumsum(Q6$catch)-(Q6$catch)
lm1<-lm(CPUE~k,data=Q6)
coef(lm1)
abundance<-( 5.85339159/0.02806615) = 208.557
Catchability<--coef(lm1)[2]
#abundance is 208.557
#catchability is 0.0281