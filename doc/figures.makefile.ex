# -*- coding:utf-8; mode:makefile -*-

include /usr/share/arco-tools/figures.mk

TEX_SRC = $(wildcard *.tex)

all: main.pdf biblio.bib

main.pdf: $(TEX_SRC) $(FIGURES) biblio.bib
	rubber --pdf $<

clean:
	rubber --pdf --clean main.tex
	$(RM) *.log *.aux *.pdf *.bbl *.blg *.dvi *~ *.eps *.out
	$(RM) sections/*~ sections/*.aux

vclean: clean
	$(RM) $(FIGURES)

%.pdf: %.tex
	rubber --pdf $<
