catchdata<-read.table("box3_1.txt",header=T)
write.csv(catchdata,"catchdataexam.csv",row.names = F)

recruitdata<-read.table("box4_7.txt",header=T)
write.csv(recruitdata,"recruitdatadataexam.csv",row.names = F)


VonB<-read.table("box5_1_Aged.txt",header=T)
write.csv(VonB,"VonBertexam.csv",row.names = F)

LF<-read.table("box9_1.txt",header=T)
write.csv(LF,"LF.csv",row.names = F)
