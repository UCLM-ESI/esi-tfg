MAIN ?= main.nw
TEX_MAIN = $(MAIN:.nw=.tex)
#TARGET = $(MAIN:.nw=.pdf)
SOURCE = $(MAIN)

include arco/latex.mk

.PRECIOUS: %.tex
%.tex: %.nw
	noweave -delay -index $< > $@

vclean::
	$(RM) $(TEX_MAIN)
