library(readr)
LF <- read_csv("LF.csv")
library (ggplot2)
library(FSA)
library (dplyr)

head (LF)
unique (LF$lake)

lake1<-filter (LF, lake=="Island" )
lake1$length
hist(lake1$length)

lake2<-filter(LF, lake=="Mitchell")
lake2$length
hist(lake2$length)

lake3<-filter (LF, lake=="Thompson")
lake3$length
hist(lake3$length)

hist(lake1$length,bins=1,units="cm")
hist(lake2$length,binwidth=1,units="cm")
hist(lake3$length,binwidth=1,units="cm" )

hist(lakel$length,binwidth=2, units="cm")
hist(lake2$length,binwidth=2,units="cm" )
hist(lake3$length,binwidth=2,units="cm")

hist(lakelSlength,binwidth=4,units="cm")
hist(lake2$length,binwidth=4, units="cm" )
hist(lake3$length,binwidth=4, units="cm")

library (FSAdata)
psdVal ("Black Crappie")
psdvalbc<-psdVal("Black Crappie", units="in") 

bc<-subset (LF, lake=="Island")

bcsubstock<-dplyr:: filter (bc, length<3)
bcquality<-dplyr:: filter (bc, length>200)
#PSD-Q is 200
