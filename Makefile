#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

BASE=$(DESTDIR)/usr/share/arco
LATEXSITE=$(DESTDIR)/usr/share/texmf/tex/latex/arco
DOCDIR=$(DESTDIR)/usr/share/doc

all:


wiki:
	hg clone ssh://hg@bitbucket.org/arco_group/arco-pfc/wiki

clean:
	$(RM) $(shell find -name *~)
	$(MAKE) -C example clean


install:
	install -vd $(BASE)

	install -vd $(LATEXSITE)
	install -v -m 444 tex/*.cls $(LATEXSITE)

	install -vd $(DOCDIR)/arco-pfc
	tar cvfz $(DOCDIR)/arco-pfc/example.tgz example
