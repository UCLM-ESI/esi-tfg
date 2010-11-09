
SUBDIRS ?= $(filter-out $(wildcard .*),\
							$(foreach d,$(shell find . -maxdepth 1 -type d ),$(notdir $(d))))

all:       RULE = all
install:   RULE = install
uninstall: RULE = uninstall
clean:     RULE = clean

all clean install uninstall:: subdirs

.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(RULE)

