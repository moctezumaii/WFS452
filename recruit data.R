library(readr)
recruitdata <- read_csv("recruitdata.csv")
head(recruitdata)

install.packages("FSA")
library(FSA)

bh1s<-srStarts(spawner~recruit,data=recruitdata,type="BevertonHolt",param=1)
unlist(bh1s)
a<-152
b<-0.117

recruitdata$logR<-log(recruitdata$spawner)

bh1 <- logR~log ((a*recruit) /(1+b*recruit))
bh1nls<- nls (bh1, data=recruitdata, start=bh1s)
bh0 <- logR~log(a*recruit)
bh0s <- bh1s [1]
bh0nls <- nls(bh0,data=recruitdata,start=bh0s)
bh2 <- logR~log(a*recruit*exp(-b*recruit))
bh2nls <- nls(bh2, data=recruitdata,start=bh1s)
anova (bh0nls, bh1nls,bh2nls)

plot (spawner~recruit, data=recruitdata)
curve((coef(bh1nls) [1]*x) /(1+coef(bh1nls)[2]*x), from=0, to=120, col="red",lwd=2,add=TRUE)
curve(coef(bh0nls) [1] *x, from=0, to=120, col="black", lwd=2, add=TRUE) 
curve((coef(bh2nls) [1]*x) / (1+coef (bh2nls) [2] *x), from=0, to=120, col="blue", lwd=2, add=TRUE)
legend ("topleft", legend=c ("black line","blue line","red line"),
col=c ("black","blue","red"), lwd=2, cex=0.6)

