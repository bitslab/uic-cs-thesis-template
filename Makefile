extensions_to_clean := out aux log bbl blg fls fdb_latexmk glg gls lof glo glsdefs lot toc dvi ist acn acr synctex.gz alg xdy

all: thesis

clean:
	@if [[ -f thesis.pdf ]]; then \
		rm thesis.pdf;\
	fi;
	@for extension in $(extensions_to_clean); do \
		find . -type f -name "*.$$extension" -delete;\
	done;

thesis:
	latexmk -bibtex -pdf thesis
	makeglossaries thesis
	pdflatex -bibtex thesis
