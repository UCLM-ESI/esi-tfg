
RUBBER_WARN ?= refs
RUBBER=rubber -m hyperref -m graphics --warn $(RUBBER_WARN)

MAIN   ?= main.tex
TARGET = $(MAIN:.tex=.pdf)
TEXSRC = $(MAIN) $(shell ../../tex/parts.sh $$(MAIN))

include ../../make/figures.mk

FIGURES = $(shell ../../tex/figures.sh)

all: $(TARGET)

$(MAIN): $(FIGURES)
$(TARGET): $(TEXSRC)

%.pdf: %.tex
	$(RUBBER) --pdf $<

clean:
	$(RUBBER) --clean --pdf $(MAIN)
	$(RM) *~
