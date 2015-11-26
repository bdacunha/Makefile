all: gapminder.tsv

clean:
	rm -f gapminder.tsv

gapminder.tsv: gapminder_data.R
	Rscript gapminder_data.R