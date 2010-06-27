#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~

clean:
	$(RM) $(shell find -name *~)

install:
	install -vd $(DESTDIR)/usr/share/arco-tools/
	install -v -m 555 $(shell find -name *.sh)  $(DESTDIR)/usr/share/arco-tools/
	install -v -m 444 make/*.mk  $(DESTDIR)/usr/share/arco-tools/

