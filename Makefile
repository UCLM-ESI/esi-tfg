#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LATEXSITE=$(DESTDIR)/usr/share/texmf/tex/latex/arco
DOCDIR=$(DESTDIR)/usr/share/doc

.PHONY: examples test

all: tfg-overleaf-template.zip

tfg-overleaf-template.zip: $(shell ls -1d overleaf/tfg)
	(cd overleaf/tfg && zip -r - .) > $@

test:
	atheist -f -i2  test

examples:
	$(MAKE) -C examples

push:
	git push
	git push git@github.com:arco-group/esi-tfg.git

clean:
	$(RM) $(shell find -name *~)
	$(RM) *-overleaf-template.zip
	$(MAKE) -C examples clean


install:
	install -vd $(LATEXSITE)
	install -v -m 444 tex/*.cls $(LATEXSITE)

	install -vd $(DOCDIR)/esi-tfg
	tar cvfz $(DOCDIR)/esi-tfg/examples.tgz examples
