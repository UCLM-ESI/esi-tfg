
SHELL=/bin/bash
PROJECT_DIR = $(shell \
	function get_root_dir() { \
		test -f $$1/config.mk && echo $$1 && return 0; \
		[ "$$1" == "/" ] && return 1; \
		get_root_dir "$$(dirname $$1)"; \
	}; \
	get_root_dir $$(pwd))

PROJECT_LIBDIR := $(PROJECT_DIR)/lib
PROJECT_BINDIR := $(PROJECT_DIR)/bin
PROJECT_INCLUDEDIR := $(PROJECT_DIR)/include

CC ?= gcc

LDFLAGS    += -L$(PROJECT_LIBDIR)
CXXFLAGS   += -I$(PROJECT_INCLUDEDIR)
CFLAGS     += -I$(PROJECT_INCLUDEDIR)

