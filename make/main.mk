
SUBDIRS ?= $(filter $(foreach d,$(shell find . -maxdepth 1 -type d ),$(notdir $(d))),\
							src doc test)

ARCO_MK ?= /usr/share/arco-tools

include $(ARCO_MK)/subdirs.mk
include $(ARCO_MK)/config.mk

distclean:: clean
	$(RM) -r lib bin include
