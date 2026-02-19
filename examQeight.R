N0 <- 2000    
Nt <- 1200    
harvest <- 600
interval_months <- 12

absolute_mortality <- N0 - Nt

interval_mortality_rate <- absolute_mortality / N0

Z <- -log(Nt / N0)

Z_monthly <- Z / interval_months

Z_4mo <- Z_monthly * 4

interval_mortality_4mo <- 1 - exp(-Z_4mo)

N_4mo <- N0 * exp(-Z_4mo)
deaths_4mo <- N0 - N_4mo

Z_3mo <- Z_monthly * 3
N_month9 <- N0 * exp(-Z_monthly * 8)
N_month11 <- N0 * exp(-Z_monthly * 11)  
deaths_9_11 <- N_month9 - N_month11

F_rate <- -log((Nt + harvest) / N0)
M_rate <- Z - F_rate