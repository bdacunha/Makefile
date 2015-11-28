library(readr)
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

bdat <- read_csv("data_without_oceania.csv")


le_lin_fit <- function(dat, offset = 1952) {
	the_fit1 <- lm(lifeExp ~ I(year - offset), dat)
	rse <- sqrt(deviance(the_fit1)/df.residual(the_fit1))
	setNames(data.frame(t(c(coef(the_fit1), rse))), c("intercept", "slope", "rse"))
}

fit_1 <- bdat %>% 
	group_by(country, continent) %>% 
	do(le_lin_fit(.)) 

linear_regression <- tbl_df(fit_1)
lin_reg_ordered <- linear_regression %>% arrange(desc(rse))
write_csv(lin_reg_ordered, "ordered_linear_regression.csv")

### the best and worst for each country according to the linear fit

# Africa

africa_best_fit <- linear_regression %>% filter(continent == "Africa") %>% 
	arrange(rse) %>% 
	do(head(., n = 4))
write_csv(africa_best_fit, "africa_best_fit.csv")

africa_worst_fit <- linear_regression %>% filter(continent == "Africa") %>% 
	arrange(desc(rse)) %>% 
	do(head(., n = 4))
write_csv(africa_worst_fit, "africa_worst_fit.csv")

# Americas

americas_best_fit <- linear_regression %>% filter(continent == "Americas") %>% 
	arrange(rse) %>% 
	do(head(., n = 4))
write_csv(americas_best_fit, "americas_best_fit.csv")

americas_worst_fit <- linear_regression %>% filter(continent == "Americas") %>% 
	arrange(desc(rse)) %>% 
	do(head(., n = 4))
write_csv(americas_worst_fit, "americas_worst_fit.csv")

# Europe

europe_best_fit <- linear_regression %>% filter(continent == "Europe") %>% 
	arrange(rse) %>% 
	do(head(., n = 4))
write_csv(europe_best_fit, "europe_best_fit.csv")

europe_worst_fit <- linear_regression %>% filter(continent == "Europe") %>% 
	arrange(desc(rse)) %>% 
	do(head(., n = 4))
write_csv(europe_worst_fit, "europe_worst_fit.csv")

# Asia

asia_best_fit <- linear_regression %>% filter(continent == "Asia") %>% 
	arrange(rse) %>% 
	do(head(., n = 4))
write_csv(asia_best_fit, "asia_best_fit.csv")

asia_worst_fit <- linear_regression %>% filter(continent == "Asia") %>% 
	arrange(desc(rse)) %>% 
	do(head(., n = 4))
write_csv(asia_worst_fit, "asia_worst_fit.csv")