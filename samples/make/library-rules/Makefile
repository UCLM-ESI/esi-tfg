
include ../../../make/default-flags.mk

LDFLAGS += -ltest

all: main

install: all
	$(MAKE) -C lib install

clean:
	$(RM) *.o main *~ \#*
	$(MAKE) -C lib clean
