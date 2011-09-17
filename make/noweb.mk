TOOLDIR=/usr/share/arco-tools

MAIN ?= main.nw
TEX_MAIN = $(MAIN:.nw=.tex)
#TARGET = $(MAIN:.nw=.pdf)
SOURCE = $(MAIN)

include $(TOOLDIR)/latex.mk

.PRECIOUS: %.tex
%.tex: %.nw
	noweave -delay -index $< > $@

vclean::
	$(RM) $(TEX_MAIN)

