export DESTDIR ?= /home/$(USER)

export LDFLAGS    += -L$(DESTDIR)/usr/lib
export CXXFLAGS   += -I$(DESTDIR)/usr/include
export CFLAGS     += -I$(DESTDIR)/usr/include

-include /home/$(USER)/userconfig.mk
-include config.mk
