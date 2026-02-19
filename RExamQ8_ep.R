install.packages("ggplot2")      
library("FSA")     
library(ggplot2)      
N0 <- 2000                       # Initial population
N1 <- 1200                       # Final population
# the interval absolute mortality (number of deaths) is 800 
N0-N1

#The interval (12 month) mortality rate is 0.4
A<-(N0-N1)/N0

#The instantaneous mortality rate is 0.51
z<- -(log(1-A))

#Monthly instantaneous mortality rate is 0.04
zmonthly<--(log(1-A))/12

#Four-month Z estimate is 0.17
z4month<--(log(1-A))/(12)*(4)

#Interval (4-month) mortality rate is 0.16
A4<- 1-exp(-z4month)

#Number of deaths is 313 and survivors is 1687 after the first 4 months
deaths4months<-round(N0*A4,0)
survival4months<- N0-deaths4months

#Number of deaths from month 9 to month 11 is -111, the population grew by 111 fish
z9month<--(log(1-A))/(12)*(9)
A9<- 1-exp(-z9month)
deaths9months<-round(N0*A9,0)
z11month<--(log(1-A))/(12)*(11)
A11<- 1-exp(-z11month)
deaths11months<-round(N0*A11,0)
deathsduring911<- deaths9months-deaths11months
#Now assume that you have very reliable harvest data. And from this, you know that during this 12-month interval 600 individuals were harvested. Estimate F, M and Z
#F=0.8, M= 0.4, Z= 1.2 (F+M)
800+600=1400
2000-1400=600
#initial pop is 2000, final pop is 600, total deaths is 1400
A2<-(N0-600)/N0
z2<- -(log(1-A2))
