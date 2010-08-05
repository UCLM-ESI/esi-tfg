#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

clean:
	$(RM) $(shell find -name *~)

install:
	install -vd $(DESTDIR)/usr/bin
	install -vd $(DESTDIR)/usr/share/arco-tools/
	install -v -m 444 make/*.mk  $(DESTDIR)/usr/share/arco-tools/
	install -v -m 555 tex/*.sh  $(DESTDIR)/usr/share/arco-tools/

	install -vd $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/python-mode
	install -v -m 444 emacs/yasnippet/text-mode/*.yasnippet $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/
	install -v -m 444 emacs/yasnippet/text-mode/python-mode/*.yasnippet $(DESTDIR)/usr/share/emacs/site-lisp/yasnippet/snippets/text-mode/python-mode/

#	@for i in $(basename $(shell find bin -name "*.sh")); do \
#		install -v -m 755 $$i.sh $(DESTDIR)/usr/bin/$$(basename $$i); \
#	done
