
include ../../../../make/install.mk

all: mainA mainB mainC

mainA: LDFLAGS += -la

mainB: LDFLAGS += -lb

mainC: LDFLAGS += -lce -lb -la

install: all
	install -dv $(DESTDIR)/usr/bin
	install -m 755 mainA mainB mainC $(DESTDIR)/usr/bin

uninstall:
	$(RM) $(DESTDIR)/usr/bin/mainA
	$(RM) $(DESTDIR)/usr/bin/mainB
	$(RM) $(DESTDIR)/usr/bin/mainC

clean:
	$(RM) *.o mainA mainB mainC *~ \#*
