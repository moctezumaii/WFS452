library(readr)
eel <- read_csv("eel.csv")
head(eel)

#Q1
mean(eel$Length)
meanlength<-100

#Q2
sampled.eels5<-sample(eel$Length, 5)
sample_mean5<-mean (sampled.eels5)
Std.dev5<-sd (sampled.eels5)
crit5<-qt (0.975,df=5-1)
Std.Err5<-(Std.dev5) / (sqrt(5))
C_upper5<-(sample_mean5)+(crit5)*(Std.Err5)
CI_lower5<-(sample_mean5)-(crit5)*(Std.Err5)



#Q3
sampled.eels15<-sample (eel$Length,15)
sample_mean15<-mean (sampled.eels15)
Std.dev15<-sd(sampled.eels15)
crit15<-qt (0.975,df=15-1)
Std.Err15<-(Std.dev15)/(sqrt(15))
CI_upper15<-(sample_mean15)+(crit15)* (Std.Err15)
CI_lower15<-(sample_mean15) - (crit15)*(Std.Err15)

#Q4
sampled.eels25<-sample(eel$Length, 25)
sample_mean25<-mean (sampled.eels25)
Std.dev25<-sd(sampled.eels25)
crit25<-qt(0.975, df=25-1)
Std.Err25<-(Std.dev25)/ (sqrt(25))
CI_upper25<- (sample_mean25)+(crit25)*(Std.Err25)
CI_lower25<-(sample_mean25) - (crit25) * (Std.Err25)

#Q5
sampled.eels35<-sample (eel$Length, 35)
sample_mean35<-mean (sampled.eels35)
Std.dev35<-sd(sampled.eels35)
crit35<-qt (0.975, df=35-1)
Std.Err35<-(Std.dev35) / (sqrt(35))
CI_upper35<-(sample_mean35)+(crit35)*(Std.Err35)
CI_lower35<-(sample_mean35)-(crit35)*(Std.Err35)

#Q6
sampled.eels50<-sample (eel$Length, 50)
sample_mean50<-mean (sampled.eels50)
Std.dev50<-sd(sampled.eels50)
crit50<-qt (0.975, df=50-1)
Std.Err50<-(Std.dev50) /(sqrt(50))
CI_upper50<-(sample_mean50)+(crit50)* (Std.Err50)
CI_lower50<-(sample_mean50) -(crit50) *(Std.Err50)

#Q7
sampled.eels80<-sample (eel$Length, 80)
sample_mean80<-mean (sampled.eels80)
Std.dev80<-sd(sampled.eels80)
crit80<-qt(0.975, df=80-1)
Std.Err80<-(Std.dev80) / (sqrt(25))
CI_upper80<-(sample_mean80)+(crit80)*(Std.Err80)
CI_lower80<-(sample_mean8O)-(crit80)*(Std.Err80)
