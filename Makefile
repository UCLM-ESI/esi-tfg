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

	@for i in $(basename $(shell find deb -name "*.sh")); do \
		install -v -m 755 $$i.sh $(DESTDIR)/usr/bin/$$(basename $$i); \
	done
