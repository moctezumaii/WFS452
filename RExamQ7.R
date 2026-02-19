Q7data<-read.csv("recruitdatadataexam.csv")
library("FSA")
head(Q7data)
str(Q7data)
summary(Q7data)
plot(recruit~spawner,data=Q7data)
bh1s <- srStarts(spawner~recruit,data=Q7data,type="BevertonHolt",param=1)
unlist(bh1s)
# a: 152.24 b:0.17
library(ggplot2)
library(minpack.lm)
library(dplyr)
Q7data$recruit<-Q7data$recruit*100
Q7data$logR<-log(Q7data$recruit)
#write.csv(Q7data, file="examfile1.csv", row.names = F)

bh1 <- logR~log((a*spawner)/(1+b*spawner))
bh1nls<- nls(bh1, data=Q7data, start=bh1s)

curve((coef(bh1nls)[1]*x)/(1+coef(bh1nls)[2]*x),from=0,to=1100,col="red",lwd=2,add=TRUE)

write.csv(Q7data,"recruitdatadataexam.csv",row.names = F)
