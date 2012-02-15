#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

LOGOS=http://arco.esi.uclm.es/svn/public/doc/logos/

BASE=$(DESTDIR)/usr/share/arco-tools
EMACS=$(DESTDIR)/usr/share/arco-tools/emacs
MK=$(DESTDIR)/usr/include/arco
LATEXSITE=$(DESTDIR)/usr/share/texmf-texlive/tex/latex
BIBDIR=$(DESTDIR)/usr/share/texmf-texlive/bibtex/bst/es-bib
FIGURES=$(DESTDIR)/usr/share/arco-tools/figures
SAMPLES=$(DESTDIR)/usr/share/doc/arco-tools/samples
DOCDIR=$(DESTDIR)/usr/share/doc

WGET=wget --no-check-certificate -nv

all:
	sed s/CLASS/book/g tex/arco.cls.tmpl > tex/arco-book.cls
	sed s/CLASS/report/g tex/arco.cls.tmpl > tex/arco-report.cls

	find emacs/config -name "*.cfg.el" | awk '{print "(byte-compile-file \"" $$1 "\")";}' > compile.el
	/usr/bin/emacs -batch -l compile.el -kill

clean:
	$(RM) $(shell find -name *~)
	find . -name "*.elc" -delete
	$(RM) compile.el tex/arco-book.cls tex/arco-report.cls

install:
	install -vd $(BASE)
	install -v -m 555 tex/*.sh  $(BASE)/
	install -v -m 555 docbook/*.sh $(BASE)/
#	install -v -m 444 bash/*.sh  $(BASE)/

	install -vd $(MK)
	install -v -m 444 make/*.mk $(MK)/

	for i in $$(ls make); do \
	    echo  "\$$(warning Deprecation warning: '$$i' is now at /usr/include/arco. See samples and update your Makefiles)\ninclude arco/$$i" > $(BASE)/$$i; \
	done

	install -vd $(LATEXSITE)/arco
	install -v -m 444 tex/*.cls $(LATEXSITE)/arco
	install -v -m 444 tex/*.sty $(LATEXSITE)/arco
	install -vd $(BIBDIR)
	install -v -m 444 tex/*.bst $(BIBDIR)

	install -vd $(DESTDIR)/usr/bin
	install -v -m 755 bin/* $(DESTDIR)/usr/bin/

	install -v -m 755 bin.share/* $(BASE)/

	install -vd $(DESTDIR)/usr/share/arco-tools/figures
	@$(WGET) $(LOGOS)/uclm-A4.pdf        -O $(FIGURES)/uclm-A4.pdf
	@$(WGET) $(LOGOS)/arco-white.pdf     -O $(FIGURES)/arco-white.pdf
	@$(WGET) $(LOGOS)/arco-watermark.pdf -O $(FIGURES)/arco-watermark.pdf

#	install -vd $(SAMPLES)
#	cp -a samples/* $(SAMPLES)

	install -vd $(DOCDIR)/arco-authors
	tar cvfz $(DOCDIR)/arco-authors/samples.tgz --exclude \.svn --directory samples latex docbook

	install -vd $(DOCDIR)/arco-pfc
	tar cvfz $(DOCDIR)/arco-pfc/sample.tgz --exclude \.svn --directory samples pfc

	install -vd $(DOCDIR)/arco-devel
	tar cvfz $(DOCDIR)/arco-devel/sample.tgz --exclude \.svn --directory samples make
