library(readr)
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

mygapminder <- read.delim("gapminder.tsv")

plot_1 <- ggplot(mygapminder, aes(x = year, y = lifeExp)) + geom_point(aes(color = continent)) 
ggsave('lifeExp_vs_year_by_continent.png', plot = plot_1)

plot_2 <- ggplot(mygapminder, aes(x = continent, y = lifeExp)) +
	scale_y_log10() +
	geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/2) +
	stat_summary(fun.y = min, colour = "green", geom = "point", size = 4) +
	stat_summary(fun.y = max, colour = "purple", geom = "point", size = 4)
ggsave('max_min_lifeExp_vs_continent.png', plot = plot_2)

bdat <- tbl_df(droplevels(subset(mygapminder, continent != "Oceania")))
write_csv(bdat, "data_without_oceania.csv")

min_life_no_oceania <- bdat %>% group_by(continent) %>% 
	summarize(min_life_exp = min(lifeExp)) %>%
	arrange(min_life_exp)
write_csv(min_life_no_oceania, 'min_life_exp_no_oceania.csv')

plot_3 <- ggplot(bdat, aes(x = reorder(continent, lifeExp), y = lifeExp)) +
	geom_boxplot(aes(fill = continent), outlier.shape = NA) + geom_jitter(alpha = 1/4, position = position_jitter(width = 0.1)) +
	xlab("continent") + ylab("Life Expectancy")
ggsave('min_life_exp_no_oceania.png', plot = plot_3)

lifeExp_min <- bdat %>% group_by(country) %>%
	summarize(min_life_expectancy = min(lifeExp)) %>% 
	arrange(min_life_expectancy)
write_csv(lifeExp_min, "minimum_life_expectancy_country.csv")
