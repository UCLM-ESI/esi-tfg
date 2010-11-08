
CXXFLAGS = -I.
LDFLAGS  = -L.

LIB_NAME = test
LIB_VERSION = 2.3
LIB_SONAME  = 23
LIB_OBJS = test.o

include ../../../../make/library-rules.mk

install::
	install -dv $(DESTDIR)/usr/include
	install -m 644 test.h $(DESTDIR)/usr/include
	@echo "End install"

uninstall::
	$(RM) $(DESTDIR)/usr/include/test.h
	@echo "End uninstall"

clean::
	@echo "End clean"
