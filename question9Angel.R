femaleSS <-subset(VonBertexam, sex== "F")
maleSS <-subset(VonBertexam, sex== "M")
library(AquaticLifeHistory)
Estimate_Growth(femaleSS,models = c("Log"))
?Estimate_Growth #VONB gave error, could be a Mac issue. 
Estimate_Growth(maleSS,models = c("Log"))
