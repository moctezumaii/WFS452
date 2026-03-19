library(FSA)
library(FSAdata)
library(plotrix)

tictactoe(
    predlab = "Largemouth Bass",
    preylab = "Bluegill PSD",
    predobj = c(50, 80),
    preyobj = c(10, 50)
)

plotCI(55, 40, li = 35, ui = 45, err = "x", pch = 16, add = TRUE)
plotCI(55, 55, li = 50, ui = 60, err = "y", pch = 16, add = TRUE)
