
TOOLDIR=/usr/share/arco-tools
FIGDIR=figures

RUBBER_WARN ?= refs
RUBBER=rubber -m hyperref -m graphics --warn $(RUBBER_WARN)

MAIN  ?= main.tex
TARGET = $(MAIN:.tex=.pdf)
TEXSRC = $(shell $(TOOLDIR)/parts.sh $(MAIN))



FIGURES = $(addprefix $(FIGDIR)/, $(shell $(TOOLDIR)/figures.sh $(MAIN)))

all: $(TARGET)

$(TARGET): $(TEXSRC) $(FIGURES)

%.pdf: %.tex
	$(RUBBER) --pdf $<

help:
	@echo "- The filename for the master TeX file should be: 'main.tex'"
	@echo "  But you can change that defining: 'MAIN = your_master.tex' in your Makefile"
	@echo "- Put your image sources in the subdirectory 'figures'."
	@echo

clean:
	$(RUBBER) --clean --pdf $(MAIN)
	$(RM) *~

vclean: clean
	$(RM) $(addsuffix .png, \
	    $(filter $(basename $(wildcard $(FIGDIR)/*.svg $(FIGDIR)/*.dia)), \
		         $(basename $(wildcard $(FIGDIR)/*.png))) \
		)

include $(TOOLDIR)/figures.mk


## Local Variables:
##  coding: utf-8
##  mode: makefile
##  mode: flyspell
##  ispell-local-dictionary: "american"
## End:

