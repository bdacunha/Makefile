# creating figures
library(readr)
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

bdat3 <- read_csv("data_without_oceania.csv")

africa_country <- c("Equatorial Guinea", "Mauritania", "Comoros", "Mali", "Zimbabwe", "Swaziland", "Rwanda", "Botswana")
africa_plot <- ggplot(subset(bdat3, country %in% africa_country), aes(x = year, y = lifeExp, color = country)) + 
	geom_line() + 
	geom_point() +
	geom_smooth(method = "lm", color = "black") +
	facet_wrap(~ country, ncol = 4) + 
	theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
	ggtitle("Best and worst linear fits for Africa")
ggsave("Best_and_worst_linear_fits_africa.png", plot = africa_plot)

america_country <- c("Canada", "Argentina", "Brazil", "Paraguay", "Jamaica", "El Salvador", "Cuba", "Trinidad and Tobago")
america_plot <- ggplot(subset(bdat3, country %in% america_country), aes(x = year, y = lifeExp, color = country)) + 
	geom_line() + 
	geom_point() +
	geom_smooth(method = "lm", color = "black") +
	facet_wrap(~ country, ncol = 4) + 
	theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
	ggtitle("Best and worst linear fits for the Americas")
ggsave("Best_and_worst_linear_fits_for_the_Americas.png", plot = america_plot)

europe_country <- c("Sweden", "Switzerland", "France", "Belgium", "Montenegro", "Bulgaria", "Bosnia and Herzegovina", "Albania")
europe_plot <- ggplot(subset(bdat3, country %in% europe_country), aes(x = year, y = lifeExp, color = country)) + 
	geom_line() + 
	geom_point() +
	geom_smooth(method = "lm", color = "black") +
	facet_wrap(~ country, ncol = 4) + 
	theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
	ggtitle("Best and worst linear fits for Europe")
ggsave("Best_and_worst_linear_fits_for_Europe.png", plot = europe_plot)

asia_country <- c("Israel", "Pakistan", "Indonesia", "Iran", "Cambodia", "Iraq", "China", "Korea, Dem. Rep.")
asia_plot <- ggplot(subset(bdat3, country %in% asia_country), aes(x = year, y = lifeExp, color = country)) + 
	geom_line() + 
	geom_point() +
	geom_smooth(method = "lm", color = "black") +
	facet_wrap(~ country, ncol = 4) + 
	theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
	ggtitle("Best and worst linear fits for Asia")
ggsave("Best_and_worst_linear_fits_asia.png", plot = asia_plot)
