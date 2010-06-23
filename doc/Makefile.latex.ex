# -*- coding:utf-8 -*-

FIGDIR = figures

VPATH   = $(FIGDIR)
TEXSRC  = $(wildcard *.tex)
TEXSRC += $(wildcard sections/*.tex)
FIGURES = $(addprefix $(FIGDIR)/, $(shell figures `pwd`))

all: main.pdf biblio.bib

main.pdf: main.tex $(TEXSRC) $(FIGURES) biblio.bib
	rubber --pdf $<

clean:
	rubber --pdf --clean main.tex
	$(RM) *.log *.aux *.pdf *.bbl *.blg *.dvi *~ *.eps *.out
	$(RM) sections/*~ sections/*.aux

vclean: clean
	$(RM) $(FIGURES)

%.pdf: %.tex
	rubber --pdf $<

include /usr/share/arco-tools/Makeconf.figures
