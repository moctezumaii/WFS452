# 12 month interval, age group is 2000 individuals. At the end it is reduced to 1200
install.packages("ggplot2")
library("FSA")
library(ggplot2)
N0<- 2000
N12<- 1200
#1
2000 - 1200 = 800 # interval absolute mortality = 800
#2
A<-(N0-N12)/N0 #interval 12 month mortality = 0.4
#3
Z<--(log(1-A)) #instantaneous mortality rate = 0.510825623765991
#4
Zmonthly<--(log(1-A))/12 #monthly instantaneous mortality = 0.0425688019804990
#5
Z4month<--(log(1-A))/(12)*(4) #four month Z estimate = 0.170275207921997
#6
A4<- 1-exp(-Z4month) #interval four month mortality rate = 0.156567334698251
#7
death4<-round(N0*A4,0) #deaths after first four months = 313
survival4<-N0-death4 #survivors after first four months = 1687
#8
Z9month<--(log(1-A))/(12)*(9)
A9<- 1-exp(-Z9month)
death9<-round(N0*A9,0)
survival9<-N0-death9
Z11month<--(log(1-A))/(12)*(11)
A11<- 1-exp(-Z11month)
death11<-round(N0*A11,0)
survival11<-N0-death11
deathsduring911<-death11-death9 #number of deaths from month 9 to 11 = 111

Z <- -log(N12 / N0) #Z = 0.511

F <- (C * Z) / (N0 * (1 - exp(-Z))) #F = 0.3831

M <- Z - F #M = 0.5108


