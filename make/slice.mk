# -*- coding:utf-8; mode:make -*-

SHELL=/bin/bash
SLICE_DIR = $(shell \
	function get_root_dir() { \
		test -d $$1/slice && echo $$1/slice && return 0; \
		[ "$$1" == "/" ] && return 1; \
		get_root_dir "$$(dirname $$1)"; \
	}; \
	get_root_dir $$(pwd))

SLICE_LIB  = lib$(SLICE_LIB_NAME).la

SLICES      ?= $(wildcard *.ice)
SLICE_FLAGS ?= -I /usr/share/Ice/slice -I $(SLICE_DIR)
SLICE_INCLUDE_DIR ?= $(notdir $(CURDIR))
SLICE_HEADERS = $(SLICES:%.ice=%.h)
SLICE_HEADERS_DIR = $(PROJECT_HDRDIR)/$(SLICE_INCLUDE_DIR)
SLICE_TARGETS ?= $(addprefix $(SLICE_HEADERS_DIR)/,$(SLICE_HEADERS)) $(PROJECT_LIBDIR)/$(SLICE_LIB)

CXX = g++

all: check $(PROJECT_LIBDIR) $(SLICE_HEADERS_DIR) $(SLICE_TARGETS)

check:
ifndef SLICE_LIB_NAME
	$(error "Variable 'SLICE_LIB_NAME' not defined")
endif

$(PROJECT_LIBDIR):
	@mkdir -p $(PROJECT_LIBDIR)

$(SLICE_HEADERS_DIR):
	@mkdir -p $(SLICE_HEADERS_DIR)

$(PROJECT_LIBDIR)/$(SLICE_LIB): $(SLICES:%.ice=$(SLICE_HEADERS_DIR)/%.o)
	ld -Ur -o $@ $^

$(SLICE_HEADERS_DIR)/%.h $(SLICE_HEADERS_DIR)/%.cpp: %.ice
	slice2cpp $(SLICE_FLAGS) -I $(SLICE_DIR) --include-dir=$(SLICE_INCLUDE_DIR) --output-dir=$(SLICE_HEADERS_DIR) $^

install:: all
	install -dv $(DESTDIR)/usr/lib/
	install -dv $(DESTDIR)/usr/include/$(SLICE_INCLUDE_DIR)
	install -m 644 $(PROJECT_LIBDIR)/$(SLICE_LIB) $(DESTDIR)/usr/lib/
	install -vm 644 $(SLICE_HEADERS_DIR)/*.h $(DESTDIR)/usr/include/$(SLICE_INCLUDE_DIR)


uninstall::
	$(RM) $(addprefix $(DESTDIR)/usr/include/, $(SLICE_HEADERS))
	$(RM) $(DESTDIR)/usr/lib/$(SLICE_LIB)

clean::
	$(RM) *~ *.o *.cpp *.h $(PROJECT_LIBDIR)/$(SLICE_LIB)
	$(RM) $(shell find $(SLICE_HEADERS_DIR) -name "*.o")
	$(RM) $(shell find $(SLICE_HEADERS_DIR) -name "*.cpp")
	$(RM) $(addprefix $(SLICE_HEADERS_DIR)/, $(SLICE_HEADERS))
