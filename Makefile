#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LATEXSITE=$(DESTDIR)/usr/share/texmf/tex/latex/arco
DOCDIR=$(DESTDIR)/usr/share/doc

.PHONY: examples test

all:


wiki:
	hg clone ssh://hg@bitbucket.org/arco_group/esi-tfg/wiki

test:
	atheist -f -i2  test

examples:
	$(MAKE) -C examples

clean:
	$(RM) $(shell find -name *~)
	$(MAKE) -C examples clean


install:
	install -vd $(LATEXSITE)
	install -v -m 444 tex/*.cls $(LATEXSITE)

	install -vd $(DOCDIR)/esi-tfg
	tar cvfz $(DOCDIR)/esi-tfg/examples.tgz examples
