
BASEDIR=/usr/share/arco-tools

RUBBER_WARN ?= refs
RUBBER=rubber -m hyperref -m graphics --warn $(RUBBER_WARN)

MAIN   ?= main.tex
TARGET = $(MAIN:.tex=.pdf)
TEXSRC = $(MAIN) $(shell $(BASEDIR)/tex/parts.sh $$(MAIN))

include $(BASEDIR)/figures.mk

FIGURES = $(shell $(BASEDIR)/figures.sh)

all: $(TARGET)

$(MAIN): $(FIGURES)
$(TARGET): $(TEXSRC)

%.pdf: %.tex
	$(RUBBER) --pdf $<

clean:
	$(RUBBER) --clean --pdf $(MAIN)
	$(RM) *~
