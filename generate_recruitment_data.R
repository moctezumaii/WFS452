# Generate realistic recruitment data for a freshwater species
# Species: Walleye (Sander vitreus)
# Data represents spawner-recruit observations from a hypothetical
# Midwestern reservoir over 25 years.

set.seed(452)

# Number of years of data
n_years <- 25

# Generate stock (spawner) values
# Spawner abundance measured as CPUE (fish per net night)
# Ranges roughly 5 to 150, with some variability
stock <- round(runif(n_years, min = 5, max = 150), 2)

# Generate recruits using a Beverton-Holt relationship with noise
# True parameters: alpha = 1.2, beta = 0.01
alpha_true <- 1.2
beta_true  <- 0.01

# Beverton-Holt predicted recruits
predicted_R <- (alpha_true * stock) / (1 + beta_true * stock)

# Add lognormal noise to make it realistic
recruits <- round(predicted_R * exp(rnorm(n_years, mean = 0, sd = 0.35)), 2)

# Construct the data frame
year <- 2000:(2000 + n_years - 1)
recruitment_data <- data.frame(year = year, stock = stock, recruits = recruits, pop=rep("pop1",25))

# Write to CSV
#write.csv(recruitment_data, file = "recruitment_data.csv", row.names = FALSE)

cat("Data generated and saved to recruitment_data.csv\n")
print(head(recruitment_data))

## SECOND POPULATION
# Generate realistic recruitment data for a freshwater species
# Species: Walleye (Sander vitreus)
# Data represents spawner-recruit observations from a hypothetical
# Midwestern reservoir over 25 years.

set.seed(452)

# Number of years of data
n_years <- 25

# Generate stock (spawner) values
# Spawner abundance measured as CPUE (fish per net night)
# Ranges roughly 5 to 150, with some variability
stock <- round(runif(n_years, min = 10, max = 160), 2)

# Generate recruits using a Beverton-Holt relationship with noise
# True parameters: alpha = 1.2, beta = 0.01
alpha_true <- 1.3
beta_true  <- 0.015

# Beverton-Holt predicted recruits
predicted_R <- (alpha_true * stock) / (1 + beta_true * stock)

# Add lognormal noise to make it realistic
recruits <- round(predicted_R * exp(rnorm(n_years, mean = 0, sd = 0.4)), 2)

# Construct the data frame
year <- 2000:(2000 + n_years - 1)
recruitment_data2 <- data.frame(year = year, stock = stock, recruits = recruits, pop=rep("pop2",25))


recruitment_data<-rbind(recruitment_data,recruitment_data2)

# Write to CSV
write.csv(recruitment_data, file = "recruitment_data.csv", row.names = FALSE)

cat("Data generated and saved to recruitment_data.csv\n")
print(head(recruitment_data))
