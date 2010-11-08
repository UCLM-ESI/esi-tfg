
LIBNAME_VERSION = lib$(LIB_NAME).so.$(LIB_VERSION)
LIBNAME_SONAME = $(subst $(LIB_VERSION),$(LIB_SONAME),$(LIBNAME_VERSION))
LIBNAME_SO     = lib$(LIB_NAME).so
LIBNAME_A = lib$(LIB_NAME).a

LIB_LDFLAGS ?= -fPIC --shared -Wl,-soname=$(LIBNAME_SONAME)
LIB_TARGETS ?= $(LIBNAME_SO) $(LIBNAME_A)

all: $(LIB_TARGETS)

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
	install -m 644 $(LIBNAME_VERSION) $(LIBNAME_A) $(DESTDIR)/usr/lib/
	cd $(DESTDIR)/usr/lib/; \
		ln -sf $(LIBNAME_VERSION) $(LIBNAME_SONAME); \
		ln -sf $(LIBNAME_SONAME) $(LIBNAME_SO)

uninstall::
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_VERSION)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SONAME)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_SO)
	$(RM) $(DESTDIR)/usr/lib/$(LIBNAME_A)

clean::
	$(RM) *~ *.o $(LIBNAME_VERSION) $(LIBNAME_SONAME) $(LIBNAME_SO) $(LIBNAME_A)