
SHELL=/bin/bash
PROJECT_DIR = $(shell \
	function get_root_dir() { \
		test -f $$1/config.mk && echo $$1 && return 0; \
		[ "$$1" == "/" ] && return 1; \
		get_root_dir "$$(dirname $$1)"; \
	}; \
	get_root_dir $$(pwd))

-include /home/$(USER)/userconfig.mk
include $(PROJECT_DIR)/config.mk

DESTDIR ?= /home/$(USER)
