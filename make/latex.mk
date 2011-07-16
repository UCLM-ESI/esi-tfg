TOOLDIR=/usr/share/arco-tools
FIGDIR=figures

RUBBER_WARN ?= ref
RUBBER=rubber -m hyperref -m graphics $(RUBBER_FLAGS) --warn $(RUBBER_WARN)

MAIN  ?= main.tex
TARGET = $(MAIN:.tex=.pdf)
TEXSRC = $(shell $(TOOLDIR)/latex-parts.sh $(MAIN))

FIGURES = $(addprefix $(FIGDIR)/, $(foreach tex, $(TEXSRC), $(shell $(TOOLDIR)/latex-figures.sh $(tex))))

all:: $(TARGET)

$(TARGET): $(TEXSRC) $(FIGURES)

%.pdf: %.tex
	$(RUBBER) --pdf $<
	-@ ! grep Citation $(basename $(MAIN)).log

help:
	@echo "- The name for the master TeX file should be: 'main.tex'"
	@echo "  But you can changed defining: 'MAIN = your_master.tex' in your Makefile"
	@echo "- Put your image sources in the subdirectory 'figures'."
	@echo "- 'vclean' target remove automatically converted images."
	@echo

clean::
	$(RUBBER) --clean --pdf $(MAIN)
	$(RM) *~ *.maf *.mtc *.lol
	$(RM) $(addprefix $(basename $(notdir $(MAIN))), .blg .bbl)


vclean:: clean
	$(RM) $(foreach figure,\
		$(FIGURES),\
		$(shell test "1" != `ls $(basename $(figure)).* | wc -l` && echo $(figure)))

include $(TOOLDIR)/figures.mk


## Local Variables:
##  coding: utf-8
##  mode: makefile
## End:
