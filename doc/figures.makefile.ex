# -*- coding:utf-8; mode:makefile -*-

# TEX_SRC_DIR  = .
# TEX_FIG_DIR  = ./figures

include /usr/share/arco-tools/figures.mk

TEX_SRC_DIR += $(wildcard sections/*.tex)
FIGURES = $(addprefix $(TEX_FIG_DIR)/, $(shell figures `pwd`))

all: main.pdf biblio.bib

main.pdf: main.tex $(TEX_SRC_DIR) $(FIGURES) biblio.bib
	rubber --pdf $<

clean:
	rubber --pdf --clean main.tex
	$(RM) *.log *.aux *.pdf *.bbl *.blg *.dvi *~ *.eps *.out
	$(RM) sections/*~ sections/*.aux

vclean: clean
	$(RM) $(FIGURES)

%.pdf: %.tex
	rubber --pdf $<

