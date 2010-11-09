# -*- coding:utf-8; mode:make -*-

LIBNAME_VERSION = lib$(LIB_NAME).so.$(LIB_VERSION)
LIBNAME_SONAME = $(subst $(LIB_VERSION),$(LIB_SONAME),$(LIBNAME_VERSION))
LIBNAME_SO     = lib$(LIB_NAME).so
LIBNAME_A      = lib$(LIB_NAME).a

LIB_LDFLAGS ?= -fPIC --shared -Wl,-soname=$(LIBNAME_SONAME)
LIB_TARGETS ?= $(LIBNAME_SO) $(LIBNAME_A)

LIB_HEADERS ?= $(LIB_OBJS:.o=.h)

INSTALL_HEADERS_DIR ?= $(LIB_NAME)

all: check $(LIB_TARGETS)

check:
ifndef LIB_NAME
	$(error "Variable 'LIB_NAME' not defined")
endif

ifndef LIB_SONAME
	$(error "Variable 'LIB_SONAME' not defined")
endif

ifndef LIB_VERSION
	$(error "Variable 'LIB_VERSION' not defined")
endif

ifndef LIB_OBJS
	$(error "Variable 'LIB_OBJS' not defined")
endif

$(LIBNAME_SO): $(LIBNAME_SONAME)
	@ln -fs $< $@

$(LIBNAME_SONAME): $(LIBNAME_VERSION)
	@ln -fs $< $@

$(LIBNAME_VERSION): LDFLAGS += $(LIB_LDFLAGS)
$(LIBNAME_VERSION): $(LIB_OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

$(LIBNAME_A): $(LIB_OBJS)
	$(AR) rcs $@ $^

install:: $(LIBNAME_VERSION) $(LIBNAME_SONAME) $(LIBNAME_SO) $(LIBNAME_A)
	install -dv $(DESTDIR)/usr/lib/
	install -dv $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)
	install -m 644 $(LIBNAME_VERSION) $(LIBNAME_A) $(DESTDIR)/usr/lib/
	cd $(DESTDIR)/usr/lib/; \
		ln -sf $(LIBNAME_VERSION) $(LIBNAME_SONAME); \
		ln -sf $(LIBNAME_SONAME) $(LIBNAME_SO)

	install -vm 644 $(LIB_HEADERS) $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)

uninstall::
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_VERSION)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SONAME)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SO)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_A)
	$(RM) -r $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)

clean::
	$(RM) *~ *.o $(LIBNAME_VERSION) $(LIBNAME_SONAME) $(LIBNAME_SO) $(LIBNAME_A)
