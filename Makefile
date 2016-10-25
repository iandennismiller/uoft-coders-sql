# uoft-coders-sql
# (cc) 2016 Ian Dennis Miller

presentation:
	cd presentation && Rscript -e "library(rmarkdown); rmarkdown::render('databases-and-sql.Rmd')"
	cp presentation/databases-and-sql.html docs/index.html
	cp -r presentation/databases-and-sql_files docs
	cp -r presentation/assets docs

open:
	open docs/index.html

clean:
	rm -rf docs
	mkdir docs
	rm -f presentation/databases-and-sql.md
	rm -f presentation/databases-and-sql.pdf
	rm -f presentation/databases-and-sql.html
	rm -rf presentation/databases-and-sql_files
	rm -rf presentation/_bookdown_files
	rm -rf presentation/_book

release: clean presentation
	git commit -am "release"
	git push

serve:
	cd docs && python -m SimpleHTTPServer

.PHONY: presentation release open clean serve
