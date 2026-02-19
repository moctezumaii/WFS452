library(FSA)
library(ggplot2)

N0 <- 2000
N12 <- 1200

internvalabsolutemorality <- N0-N12
A <- (N0-N12)/(N0) #12 month mortality rate
Z <- -log(1-A) #instanteuous morality rate

monthlyZ <- Z/12
fourmonthZ <- monthlyZ * 4
fourmonthZInterval <- (1-exp(-fourmonthZ))
Morality4Months <- round(N0*fourmonthZInterval,0)
Survival4Months <-round(N0-Morality4Months,0)
twomonthZInterval <- fourmonthZInterval/2
Morality911 <-round(N0*twomonthZInterval,0)

totalanglingmorality <- 600
#called it angling instead of fishing to keep things straight

#NAUTRAL 
ANat <- (2000-1800)/2000
ZNat <- -log(1-ANat)

#FISHING 
Afish <-(2000-1400)/2000
Zfish <- -log(1-Afish)

totalZ <- Zfish + ZNat
#combined Z instanteous rate with fishing and natural 


