#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LATEXSITE=$(DESTDIR)/usr/share/texmf/tex/latex/arco
DOCDIR=$(DESTDIR)/usr/share/doc

all:


wiki:
	hg clone ssh://hg@bitbucket.org/arco_group/esi-tfg/wiki

clean:
	$(RM) $(shell find -name *~)
	$(MAKE) -C examples/tfg clean
	$(MAKE) -C examples/anteproyecto clean


install:
	install -vd $(LATEXSITE)
	install -v -m 444 tex/*.cls $(LATEXSITE)

	install -vd $(DOCDIR)/esi-tfg
	tar cvfz $(DOCDIR)/esi-tfg/example.tgz example
