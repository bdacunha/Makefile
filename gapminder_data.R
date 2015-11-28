library(downloader)
download(url ="https://raw.githubusercontent.com/jennybc/gapminder/master/inst/gapminder.tsv", quiet = FALSE, destfile = "gapminder.tsv")
mygapminder <- read.delim("gapminder.tsv")

