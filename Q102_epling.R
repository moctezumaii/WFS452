LF<-read.csv('/Users/claireepling/Desktop/RExam/LF.csv')
library("FSA")
library("FSAdata")
library("dplyr")
#Create a Length-Frequency histogram for each Lake. 
Island<-filter(LF, lake=="Island")
Mitchell<-filter(LF, lake=="Mitchell")
Thompson<- filter(LF, lake=="Thompson")
hist(Island$length, breaks=35)
hist(Mitchell$length, breaks=35)
hist(Thompson$length, breaks=35)
#Create one histogram for each lake with a 1-cm width length frequency
ggplot(LF, aes(x = length)) +
  geom_histogram(binwidth=1, fill = "darkgreen", color = "black") +
  facet_wrap(~ lake, scales = "free_x") +  # allows x-axis to adjust for each species
  labs(title = "Q10 -1-cm bins",
       x = "Length (cm)",
       y = "Count") +
  theme_minimal()
#Create one histogram for each lake with a 2-cm width length frequency
ggplot(LF, aes(x = length)) +
  geom_histogram(binwidth=1, fill = "darkgreen", color = "black") +
  facet_wrap(~ lake, scales = "free_x") +  # allows x-axis to adjust for each species
  labs(title = "Q10 -2-cm bins",
       x = "Length (cm)",
       y = "Count") +
  theme_minimal()
#Create one histogram for each lake with a 4-cm width length frequency
ggplot(LF, aes(x = length)) +
  geom_histogram(binwidth=1, fill = "darkgreen", color = "black") +
  facet_wrap(~ lake, scales = "free_x") +  # allows x-axis to adjust for each species
  labs(title = "Q10 -4-cm bins",
       x = "Length (cm)",
       y = "Count") +
  theme_minimal()
#Estimate the PSD-Q and confidence interval for each population. Look at the values. Do you consider them to have different significant differences?

#Yes they do have significant t value differences

head(LF)
psdVal("Black Crappie")
stock_size <- 130  
quality_size <- 200 
psdq_results <- LF %>%
  group_by(lake) %>%
  summarise(
    stock_n = sum(length >= stock_size),
    quality_n = sum(length >= quality_size),
    psd_q = ifelse(stock_n > 0, (quality_n / stock_n) * 100, NA),
    .groups = "drop"
  )
install.packages("DescTools")
library(DescTools)
psdq_results <- LF %>%
  group_by(lake) %>%
  summarise(
    stock_n = sum(length >= 130),
    quality_n = sum(length >= 200),
    .groups = "drop"
  ) %>%
  mutate(
    psd_q = (quality_n / stock_n) * 100,
    ci = BinomCI(quality_n, stock_n, conf.level = 0.95, method = "wilson"),
    lower_ci = ci[, "lwr.ci"] * 100,
    upper_ci = ci[, "upr.ci"] * 100
  ) %>%
  select(lake, psd_q, lower_ci, upper_ci)

print(psdq_results)