#!/usr/bin/make -f
# -*- coding:utf-8 -*-

DESTDIR?=~/bin
BINDIR=$(DESTDIR)/usr/bin


clean:
	$(RM) *~

install:
	install -vd $(DESTDIR)/usr/bin
	install -vd $(DESTDIR)/usr/share/arco-tools/

	@for i in $(basename $(shell find $(CURDIR) -name "*.sh")); do \
		install -v -m 755 $$i.sh $(DESTDIR)/usr/bin/$$(basename $$i);  \
	done

	install -v -m 644 make/*.mk  $(DESTDIR)/usr/share/arco-tools/

# hack
	ln -sf /usr/bin/gnesis-upload $(DESTDIR)/usr/bin/arcomandar
