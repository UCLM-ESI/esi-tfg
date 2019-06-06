#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LATEXSITE=$(DESTDIR)/usr/share/texmf/tex/latex/arco
DOCDIR=$(DESTDIR)/usr/share/doc

.PHONY: examples test

all:

test:
	atheist -f -i2  test

examples:
	$(MAKE) -C examples

push:
	git push
	git push git@github.com:arco-group/esi-tfg.git

clean:
	$(RM) $(shell find -name *~)
	$(MAKE) -C examples clean


install:
	install -vd $(LATEXSITE)
	install -v -m 444 tex/*.cls $(LATEXSITE)

	install -vd $(DOCDIR)/esi-tfg
	tar cvfz $(DOCDIR)/esi-tfg/examples.tgz examples
