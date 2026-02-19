library(ggplot2)
library(dplyr)


LengthFreq <-read.csv("LF.csv")
Island <- dplyr::filter(LengthFreq, lake== "Island")
Mitchell <- dplyr::filter(LengthFreq, lake== "Mitchell")
Thompson <- dplyr::filter(LengthFreq, lake== "Thompson")

hist(Island$length, breaks=25)
hist(Mitchell$length, breaks=25)
hist(Thompson$length, breaks=25)

#Histograms by 1cm
hist(Island$length, main = paste("Length Frequency for Island Lake"),
     xlab = "Length (cm)", ylab = "Frequency",
     breaks = seq(min(Island$length), max(Island$length), by = 1))
hist(Mitchell$length, main = paste("Length Frequency for Mitchell Lake"),
     xlab = "Length (cm)", ylab = "Frequency",
     breaks = seq(min(Mitchell$length), max(Mitchell$length), by = 1))
hist(Thompson$length, main = paste("Length Frequency for Thompson Lake"),
     xlab = "Length (cm)", ylab = "Frequency",
     breaks = seq(min(Thompson$length), max(Thompson$length), by = 1))

#Histograms by 2cm
hist(Island$length, main = paste("Length Frequency for Island Lake"),
     xlab = "Length (cm)", ylab = "Frequency",
     breaks = seq(min(Island$length), max(Island$length)+1, by = 2))





#Histograms by 4cm

