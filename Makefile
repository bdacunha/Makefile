all: report.html

clean:
	rm -f gapminder.tsv lifeExp_vs_year_by_continent.png max_min_lifeExp_vs_continent.png min_life_exp_no_oceania.csv min_life_exp_no_oceania.png data_without_oceania.csv minimum_life_expectancy_country.csv ordered_linear_regression.csv africa_best_fit.csv africa_worst_fit.csv americas_best_fit.csv americas_worst_fit.csv europe_best_fit.csv europe_worst_fit.csv asia_best_fit.csv asia_worst_fit.csv Best_and_worst_linear_fits_africa.png Best_and_worst_linear_fits_for_the_Americas.png Best_and_worst_linear_fits_for_Europe.png Best_and_worst_linear_fits_asia.png

gapminder.tsv: gapminder_data.R
	Rscript gapminder_data.R
	
lifeExp_vs_year_by_continent.png: gapminder.tsv
	Rscript exploratory_analysis.R
	rm Rplots.pdf
	
max_min_lifeExp_vs_continent.png: gapminder.tsv
	Rscript exploratory_analysis.R
	rm Rplots.pdf

min_life_exp_no_oceania.csv: gapminder.tsv
	Rscript exploratory_analysis.R
	
min_life_exp_no_oceania.png: gapminder.tsv
	Rscript exploratory_analysis.R
	rm Rplots.pdf

minimum_life_expectancy_country.csv: gapminder.tsv
	Rscript exploratory_analysis.R

data_without_oceania.csv: gapminder.tsv
	Rscript exploratory_analysis.R

ordered_linear_regression.csv: gapminder.tsv
	Rscript exploratory_analysis.R

africa_best_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

africa_worst_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

americas_best_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

americas_worst_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

europe_best_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

europe_worst_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

asia_best_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

asia_worst_fit.csv: gapminder.tsv
	Rscript statistical_analysis.R

Best_and_worst_linear_fits_africa.png: gapminder.tsv data_without_oceania.csv
	Rscript making_plots.R
	rm Rplots.pdf

Best_and_worst_linear_fits_for_the_Americas.png: gapminder.tsv data_without_oceania.csv
	Rscript making_plots.R
	rm Rplots.pdf

Best_and_worst_linear_fits_for_Europe.png: gapminder.tsv data_without_oceania.csv
	Rscript making_plots.R
	rm Rplots.pdf

Best_and_worst_linear_fits_asia.png: gapminder.tsv data_without_oceania.csv
	Rscript making_plots.R
	rm Rplots.pdf

report.html: gapminder.tsv lifeExp_vs_year_by_continent.png max_min_lifeExp_vs_continent.png min_life_exp_no_oceania.csv min_life_exp_no_oceania.png minimum_life_expectancy_country.csv data_without_oceania.csv ordered_linear_regression.csv africa_best_fit.csv africa_worst_fit.csv americas_best_fit.csv americas_worst_fit.csv europe_best_fit.csv europe_worst_fit.csv asia_best_fit.csv asia_worst_fit.csv Best_and_worst_linear_fits_africa.png Best_and_worst_linear_fits_for_the_Americas.png Best_and_worst_linear_fits_for_Europe.png Best_and_worst_linear_fits_asia.png
Rscript -e "rmarkdown::render('report.Rmd')"