#
#	MAKEFILE
#	
# 	Autor: 	Dominik Horky
# 	Datum: 	21.3.2020
#
# 	Urceno pro prekladani projektu do predmetu ITY (s jedinym zdrojovym .tex souborem!)
#	(pozn.: Pro funkcni odkazy - reference je nutne zdrojovy soubor prekladat 2x)

INPUT := $(shell ls *.tex | cut -d "." -f 1)

pdf: $(INPUT).pdf
	rm -rf *.dvi && make $(INPUT).pdf
	
$(INPUT).pdf: $(INPUT).ps
	ps2pdf $(INPUT).ps

$(INPUT).ps: $(INPUT).dvi
	dvips -sPAPERSIZE=a4 $(INPUT).dvi

$(INPUT).dvi: $(INPUT).tex
	latex $(INPUT).tex
clean:
	rm -rf *.aux *.dvi *.log *.out *.pdf *.ps
