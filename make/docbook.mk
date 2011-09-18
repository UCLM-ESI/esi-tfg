TOOLDIR=/usr/share/arco-tools
FIGDIR=figures

MAIN  ?= main.xml
TARGET = $(MAIN:.xml=.pdf)
XMLSRC = $(shell $(TOOLDIR)/db-parts.sh $(MAIN))
DBLATEX_FLAGS ?= -T simple

FIGURES = $(addprefix $(FIGDIR)/, $(shell $(TOOLDIR)/db-figures.sh $(MAIN)))

all: $(TARGET)

$(TARGET): $(XMLSRC) $(FIGURES)

%.pdf: %.xml
	xmllint --xinclude --noout $<
	dblatex -I figures $(DBLATEX_FLAGS) $< -o $@


help:
	@echo "- The filename for the master DocBook file should be: 'main.xml'"
	@echo "  But you can change that defining: 'MAIN = your_master.xml' in your Makefile"
	@echo "- Put your image sources in the subdirectory 'figures'."
	@echo

clean::
	$(RM) $(TARGET) *~
	$(RM) *.aux *.cb *.cb2 *.out *.lof *.glo *.log *.idx *.toc

vclean:: clean
	$(RM) $(addsuffix .png, \
	    $(filter $(basename $(wildcard $(FIGDIR)/*.svg $(FIGDIR)/*.dia)), \
		         $(basename $(wildcard $(FIGDIR)/*.png))) \
		)

include arco/figures.mk


## Local Variables:
##  coding: utf-8
##  mode: makefile
##  mode: flyspell
##  ispell-local-dictionary: "american"
## End:
