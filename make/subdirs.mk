
.DEFAULT_GOAL=all

# SUBDIRS ?= $(filter-out $(wildcard .*),\
# 	$(foreach d,$(shell find . -maxdepth 1 -type d ),$(notdir $(d))))

SUBDIR_MAX_DEPTH=5
SUBDIRS ?= $(sort $(dir $(shell find . -mindepth 2 -maxdepth $(SUBDIR_MAX_DEPTH) -name Makefile)))


all:       RULE = all
install:   RULE = install
uninstall: RULE = uninstall
clean:     RULE = clean
vclean:    RULE = vclean


all clean install uninstall:: subdirs

.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(RULE)
