
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

clean:
	$(RUBBER) --clean --pdf $(MAIN)
	$(RM) *~

vclean: clean
	$(RM) $(addsuffix .png, \
	    $(filter $(basename $(wildcard $(FIGDIR)/*.svg $(FIGDIR)/*.dia)), \
		         $(basename $(wildcard $(FIGDIR)/*.png))) \
		)

include $(TOOLDIR)/figures.mk
