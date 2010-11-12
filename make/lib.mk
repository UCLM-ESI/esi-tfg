# -*- coding:utf-8; mode:make -*-

LIBNAME_VERSION = lib$(LIB_NAME).so.$(LIB_VERSION)
LIBNAME_SONAME  = $(subst $(LIB_VERSION),$(LIB_SONAME),$(LIBNAME_VERSION))
LIBNAME_SO      = lib$(LIB_NAME).so
LIBNAME_A       = lib$(LIB_NAME).a

LIB_LDFLAGS ?= -fPIC --shared -Wl,-soname=$(LIBNAME_SONAME)
LIB_TARGETS ?= $(PROJECT_LIBDIR)/$(LIBNAME_SO) $(PROJECT_LIBDIR)/$(LIBNAME_A)
INSTALL_HEADERS_DIR ?= $(LIB_NAME)

all: check $(PROJECT_LIBDIR) $(PROJECT_HDRDIR) $(LIB_TARGETS)

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

$(PROJECT_LIBDIR):
	@mkdir -p $(PROJECT_LIBDIR)

$(PROJECT_HDRDIR):
	@mkdir -p $(PROJECT_HDRDIR)

$(PROJECT_LIBDIR)/$(LIBNAME_SO): $(PROJECT_LIBDIR)/$(LIBNAME_SONAME)
	$(RM) $@
	ln -fs $(notdir $<) $@

$(PROJECT_LIBDIR)/$(LIBNAME_SONAME): $(PROJECT_LIBDIR)/$(LIBNAME_VERSION)
	$(RM) $@
	ln -fs $(notdir $<) $@

$(PROJECT_LIBDIR)/$(LIBNAME_VERSION): LDFLAGS += $(LIB_LDFLAGS)
$(PROJECT_LIBDIR)/$(LIBNAME_VERSION): $(LIB_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) $^ -o $@

ifneq "$(LIB_HEADERS)" ""
	$(RM) $(addprefix $(PROJECT_HDRDIR)/$(INSTALL_HEADERS_DIR)/,$(LIB_HEADERS))
	install -dv $(PROJECT_HDRDIR)/$(INSTALL_HEADERS_DIR)
	install -vm 644 $(LIB_HEADERS) $(PROJECT_HDRDIR)/$(INSTALL_HEADERS_DIR)
endif

$(PROJECT_LIBDIR)/$(LIBNAME_A): $(LIB_OBJS)
	$(AR) rcs $@ $^

install:: all
	install -dv $(DESTDIR)/usr/lib/
	install -m 644 $(PROJECT_LIBDIR)/$(LIBNAME_VERSION) $(PROJECT_LIBDIR)/$(LIBNAME_A) $(DESTDIR)/usr/lib/
	@cd $(DESTDIR)/usr/lib/; \
		ln -sf $(LIBNAME_VERSION) $(LIBNAME_SONAME); \
		ln -sf $(LIBNAME_SONAME) $(LIBNAME_SO);

ifneq "$(LIB_HEADERS)" ""
	install -dv $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)
	install -vm 644 $(LIB_HEADERS) $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)
endif


uninstall::
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_VERSION)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SONAME)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SO)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_A)

ifneq "$(LIB_HEADERS)" ""
	$(RM) $(addprefix $(DESTDIR)/usr/include/$(INSTALL_HEADERS_DIR)/,$(LIB_HEADERS))
endif

clean::
	$(RM) *~ *.o $(PROJECT_LIBDIR)/$(LIBNAME_VERSION) \
			$(PROJECT_LIBDIR)/$(LIBNAME_SONAME) \
			$(PROJECT_LIBDIR)/$(LIBNAME_SO) \
			$(PROJECT_LIBDIR)/$(LIBNAME_A)

ifneq "$(LIB_HEADERS)" ""
	$(RM) $(addprefix $(PROJECT_HDRDIR)/$(INSTALL_HEADERS_DIR)/,$(LIB_HEADERS))
endif

