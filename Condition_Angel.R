library(FSAdata)
library(FSA)
library(dplyr)
library(ggplot2)
df<-data(InchLake2)

#Q1
lmb08<-dplyr::filter(InchLake2, year==2008 & species=="Largemouth Bass")
lmb08$Length.mm <- lmb08$length * 25 

x <- lmb08$Length.mm
y <- lmb08$weight
plot(x,y, pch=25, col= "green")

#Q2
wsVal(species= "Largemouth Bass")
B0 <- -5.528
B1 <- 3.273
lmb08$Ws <- 10^(B0 + B1 * log10(lmb08$Length.mm))
lmb08$Wr <- (lmb08$weight/lmb08$Ws) * 100
psdVal("Largemouth Bass")

#Q3
SSLMB08 <- dplyr::filter(lmb08, Length.mm >=0, Length.mm <200)
SLMB08 <- dplyr::filter(lmb08, Length.mm >=200, Length.mm <300)
QLMB08 <- dplyr::filter(lmb08, Length.mm >=300, Length.mm <380)
MLMB08 <- dplyr::filter(lmb08, Length.mm >=380, Length.mm <510)
PLMB08 <- dplyr::filter(lmb08, Length.mm >=510, Length.mm <630)
TLMB08 <- dplyr::filter(lmb08, Length.mm >=630)

t.test(SSLMB08$Wr)
#mean =  87.7159, LCI =74.0208, UCI =101.4110
t.test(SLMB08$Wr)
#mean = 91.22089, LCI= 86.65915, UCI=95.78264
t.test(QLMB08$Wr)
#mean = 87.27758, LCI= 85.53102, UCI= 89.02414
t.test(MLMB08$Wr)
#mean= 80.57812, LCI= 68.80801, UCI= 92.34823
t.test(PLMB08$Wr)
#not enough observations
t.test(TLMB08$Wr)
#not enough observations

#Both Preferred and Trophy lengths have no observations, 
#implying that most LMB only reach up to quality length 
#and do not get much bigger
#Quality and Stock Length have the most, implying that recruitment is okay, 
#But the fish are limited in growth and start dying off or stagnating after they reach about 380mm in Length
#This could imply over-competition for resources or overcrowding, our sub-stock numbers are also pretty low 
#but that could mean they are fully recruited to the gear, and not lack of recruitment in particular

