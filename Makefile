#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~
LOGOS=http://arco.esi.uclm.es/svn/public/doc/logos/

clean:
	$(RM) $(shell find -name *~)

install:
	install -vd $(DESTDIR)/usr/bin
	install -vd $(DESTDIR)/usr/share/arco-tools/figures
	install -vd $(DESTDIR)/usr/share/texmf-texlive/tex/latex/arco
	install -v -m 444 make/*.mk  $(DESTDIR)/usr/share/arco-tools/
	install -v -m 555 tex/*.sh  $(DESTDIR)/usr/share/arco-tools/
	install -v -m 555 docbook/*.sh  $(DESTDIR)/usr/share/arco-tools/
	install -v -m 444 tex/*.cls  $(DESTDIR)/usr/share/texmf-texlive/tex/latex/arco
	install -v -m 444 bash/*.sh  $(DESTDIR)/usr/share/arco-tools/

	install -vd $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/python-mode
	install -v -m 444 emacs/yasnippet/text-mode/*.yasnippet $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/
	install -v -m 444 emacs/yasnippet/text-mode/python-mode/*.yasnippet $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/python-mode/

	install -v -m 755 bin/* $(DESTDIR)/usr/bin/

	@wget $(LOGOS)/uclm-A4.pdf -O $(DESTDIR)/usr/share/arco-tools/figures/uclm-A4.pdf --no-check-certificate -nv
	@wget $(LOGOS)/arco.white.pdf -O $(DESTDIR)/usr/share/arco-tools/figures/arco-white.pdf --no-check-certificate -nv

#	@for i in $(basename $(shell find bin -name "*.sh")); do \
#		install -v -m 755 $$i.sh $(DESTDIR)/usr/bin/$$(basename $$i); \
#	done
