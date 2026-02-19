#Q1
initial_population <-2000
final_population <-1200

absolute_mortality <- initial_population - final_population
absolute_mortality


#Q2
N0 <- 2000
Nt <- 1200
mortality_rate <- (N0 - Nt) / N0
mortality_rate
#Q3
N0<-2000
Nt <- 1200

Z <-log(N0/Nt)
Z

#Q4
Z_yearly <- log(2000 / 1200)
Z_monthly <- Z_yearly / 12
Z_monthly

#Q5
N0 <- 2000
Nt <- 1200
Z_annual <- log(N0/ Nt)

Z_4months <- Z_annual * (4 / 12)
Z_4months

#Q6
N0 <- 2000
Nt <- 1200
M_4months <- 1 - (Nt / N0)

M_4months
#Q7
N0 <- 2000
Nt <- 1200

deaths <- N0 - Nt

survivors <- Nt 
deaths
survivors

#Q8
N9 <- 1500  # Example population at month 9
N11 <- 1300 # Example population at month 11
deaths_9_to_11 <- N9 - N11
deaths_9_to_11
#Calculate F, M, Z 
N0 <- 2000
Nt <- 1200
harvest <- 600
# Estimate F (fishing mortality rate)
F<- harvest / N0
# Estimate Z (total mortality rate)
Z <- (N0 - Nt) / N0
# Estimate M (natural mortality rate)
M<-Z-F
F
M
Z
