InchLake11<-read.csv("InchLake1113.csv")

#Packages
library(FSA)
library(dplyr)
library(plotrix)



#Step1: filter data to get only 2011 fish for LMB
lmb11<-dplyr::filter(InchLake11,year==2011  &  species=="Largemouth Bass")

# calclulate the size distributions
psd.lmb11 <- psdCalc(~tl,data=lmb11,species="Largemouth Bass")

#Extract PSD-Q

psdQLM<-rbind(psd.lmb11["PSD-Q",])


#SAME FOR Bluegill

bg11<-dplyr::filter(InchLake11,year==2011  &  species=="Bluegill")

psdbg<-psdCalc(~tl,data=bg11_l,species="Bluegill")

psdQbg<-rbind(psdbg["PSD-Q",])



## PLOT TICATACTOE WITH OUR TARGET VALUES

tictactoe(predobj=c(50,80),predlab="Largemouth Bass PSD-Q",
          preyobj=c(10,50),preylab="Bluegill PSD-Q")


#ADD point.

plotCI(psdQLM[,"Estimate"],psdQbg[,"Estimate"],    #this plots the point
       li=psdQLM[,"95% LCI"],ui=psdQLM[,"95% UCI"],#plots the CI for LMB
       err="x" ,add=TRUE,pch=19)                  #need to tell the error is in x axis

#Same thing but now y error:

plotCI(psdQLM[,"Estimate"],psdQbg[,"Estimate"],
       li=psdQbg[,"95% LCI"],ui=psdQbg[,"95% UCI"],
       err="y" ,pch=19 , add=TRUE)


library(FSA)
rec<-read.csv("recruitdatadataexam.csv")



