#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LOGOS=http://arco.esi.uclm.es/svn/public/doc/logos/
BASE=$(DESTDIR)/usr/share/arco-tools
LATEXSITE=$(DESTDIR)/usr/share/texmf-texlive/tex/latex
YASNIPPET=$(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode
FIGURES=$(DESTDIR)/usr/share/arco-tools/figures
EMACS=$(DESTDIR)/usr/share/arco-tools/emacs

all:
	sed s/CLASS/book/g tex/arco.cls.tmpl > tex/arco-book.cls
	sed s/CLASS/report/g tex/arco.cls.tmpl > tex/arco-report.cls

clean:
	$(RM) $(shell find -name *~)

install:
	install -vd $(BASE)
	install -v -m 444 make/*.mk $(BASE)/
	install -v -m 555 tex/*.sh  $(BASE)/
	install -v -m 555 docbook/*.sh  $(BASE)/
	install -v -m 444 bash/*.sh  $(BASE)/

	install -vd $(LATEXSITE)/arco
	install -v -m 444 tex/*.cls $(LATEXSITE)/arco

	install -vd $(YASNIPPET)/python-mode
	install -v -m 444 emacs/yasnippet/text-mode/*.yasnippet $(YASNIPPET)/
	install -v -m 444 emacs/yasnippet/text-mode/python-mode/*.yasnippet $(YASNIPPET)/python-mode/

	install -vd $(YASNIPPET)/latex-mode
	install -v -m 444 emacs/yasnippet/text-mode/latex-mode/*.yasnippet $(YASNIPPET)/latex-mode/

	install -vd $(DESTDIR)/usr/bin
	install -v -m 755 bin/* $(DESTDIR)/usr/bin/

	install -vd $(DESTDIR)/usr/share/arco-tools/figures
	@wget $(LOGOS)/uclm-A4.pdf -O $(FIGURES)/uclm-A4.pdf --no-check-certificate -nv
	@wget $(LOGOS)/arco.white.pdf -O $(FIGURES)/arco-white.pdf --no-check-certificate -nv
	@wget $(LOGOS)/arco.watermark.pdf -O $(FIGURES)/arco-watermark.pdf --no-check-certificate -nv

	install -vd $(EMACS)
	install -vm 444 emacs/config/*.cfg.el $(EMACS)/


#	@for i in $(basename $(shell find bin -name "*.sh")); do \
#		install -v -m 755 $$i.sh $(DESTDIR)/usr/bin/$$(basename $$i); \
#	done
