install.packages("FSAdata")
install.packages("AquaticLifeHistory")
library(FSAdata)
library(FSA)
library(AquaticLifeHistory)
recruitdata <- recruitdatadataexam
spawner <- recruitdatadataexam$spawner
recruit <- recruitdatadataexam$recruit
plot(spawner~recruit, pch=9, col="lightpink")
bh1s <- srStarts(spawner~recruit, data=recruitdata, type=c("BevertonHolt"),param=1)
unlist(bh1s)
#a= 1.522357031 b= 0.001166243 
a <- 1.522357031
b <- 0.001166243 
recruitdata$logR <- log(recruitdata$recruit)
bh1 <- logR~log((a*spawner)/(1+b*spawner))
bh1nls <- nls(bh1,data=LakeTroutGIS,start=bh1s)
#would not run rest of model, turned in for partial credit per Dr. Molina
