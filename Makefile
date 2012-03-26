#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

BASE=$(DESTDIR)/usr/share/arco
FIGURES=$(DESTDIR)/usr/share/arco/figures
LATEXSITE=$(DESTDIR)/usr/share/texmf-texlive/tex/latex
DOCDIR=$(DESTDIR)/usr/share/doc

LOGOS=http://arco.esi.uclm.es/svn/public/doc/logos/
WGET=wget --no-check-certificate -nv

all:


wiki:
	hg clone ssh://hg@bitbucket.org/arco_group/arco-pfc/wiki

clean:
	$(RM) $(shell find -name *~)
	$(MAKE) -C example clean


install:
	install -vd $(BASE)

	install -vd $(LATEXSITE)/arco
	install -v -m 444 tex/*.cls $(LATEXSITE)/arco

	install -vd $(DOCDIR)/arco-pfc
	tar cvfz $(DOCDIR)/arco-pfc/example.tgz example

	install -vd $(FIGURES)
	@$(WGET) $(LOGOS)/emblema_informatica-gray.pdf -O $(FIGURES)/emblema_informatica-gray.pdf
