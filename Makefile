#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LOGOS=http://arco.esi.uclm.es/svn/public/doc/logos/
BASE=$(DESTDIR)/usr/share/arco-tools
LATEXSITE=$(DESTDIR)/usr/share/texmf-texlive/tex/latex
YASNIPPET=$(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode
FIGURES=$(DESTDIR)/usr/share/arco-tools/figures
EMACS=$(DESTDIR)/usr/share/arco-tools/emacs
SAMPLES=$(DESTDIR)/usr/share/doc/arco-tools/samples

all:
	sed s/CLASS/book/g tex/arco.cls.tmpl > tex/arco-book.cls
	sed s/CLASS/report/g tex/arco.cls.tmpl > tex/arco-report.cls

	find emacs/config -name "*.el" | awk '{print "(byte-compile-file \"" $$1 "\")";}' > compile.el
	/usr/bin/emacs -batch -l compile.el -kill

clean:
	$(RM) $(shell find -name *~)
	find . -name "*.elc" -delete
	$(RM) compile.el tex/arco-book.cls tex/arco-report.cls

install:
	install -vd $(BASE)
	install -v -m 444 make/*.mk $(BASE)/
	install -v -m 555 tex/*.sh  $(BASE)/
	install -v -m 555 docbook/*.sh  $(BASE)/
	install -v -m 444 bash/*.sh  $(BASE)/

	install -vd $(LATEXSITE)/arco
	install -v -m 444 tex/*.cls $(LATEXSITE)/arco

	install -vd $(YASNIPPET)
	install -v -m 444 emacs/yasnippet/text-mode/*.yasnippet $(YASNIPPET)/

	install -vd $(YASNIPPET)/python-mode
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
	install -vm 444 emacs/config/*.cfg.elc $(EMACS)/

	install -vm 444 emacs/config/schemas.xml $(EMACS)/
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/docbook.rnc -O $(EMACS)/docbook.rnc
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/dbnotnx.rnc -O $(EMACS)/dbnotnx.rnc
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/dbpoolx.rnc -O $(EMACS)/dbpoolx.rnc
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/htmltblx.rnc -O $(EMACS)/htmltblx.rnc
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/calstblx.rnc -O $(EMACS)/calstblx.rnc
	@wget -nv http://www.oasis-open.org/docbook/rng/4.5/dbhierx.rnc -O $(EMACS)/dbhierx.rnc

	install -vd $(EMACS)/template
	install -vm 444 emacs/template/* $(EMACS)/template/

	install -vd $(SAMPLES)
	cp -a samples/* $(SAMPLES)
