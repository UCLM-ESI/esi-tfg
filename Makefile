#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

BASE=$(DESTDIR)/usr/share/arco-tools
LATEXSITE=$(DESTDIR)/usr/share/texmf-texlive/tex/latex
DOCDIR=$(DESTDIR)/usr/share/doc

all:


clean:
	$(RM) $(shell find -name *~)


install:
	install -vd $(BASE)

	install -vd $(LATEXSITE)/arco
	install -v -m 444 tex/*.cls $(LATEXSITE)/arco

	install -vd $(DOCDIR)/arco-pfc
	tar cvfz $(DOCDIR)/arco-pfc/example.tgz example
