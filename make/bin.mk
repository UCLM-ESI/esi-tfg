# -*- coding:utf-8; mode:make -*-

BIN_OBJS ?= $(patsubst %.c,%.o,$(wildcard *.c)) $(patsubst %.cpp,%.o,$(wildcard *.cpp))

all: check $(PROJECT_BINDIR) $(PROJECT_BINDIR)/$(BIN_TARGET)

check:
ifndef BIN_TARGET
	$(error "Variable 'BIN_TARGET' not defined")
endif

$(PROJECT_BINDIR)/$(BIN_TARGET): $(BIN_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

$(PROJECT_BINDIR):
	@mkdir -p $(PROJECT_BINDIR)

install:: all
	install -dv $(DESTDIR)/usr/bin
	install -m 755 $(addprefix $(PROJECT_BINDIR)/,$(BIN_TARGET)) $(DESTDIR)/usr/bin

uninstall::
	$(RM) $(addprefix $(DESTDIR)/usr/bin/,$(BIN_TARGET))

clean:
	$(RM) *.o $(addprefix $(PROJECT_BINDIR)/,$(BIN_TARGET)) *~ \#*
