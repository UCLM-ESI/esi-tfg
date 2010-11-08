SUBDIRS = library-rules

all:       RULE = all
install:   RULE = install
uninstall: RULE = uninstall
clean:     RULE = clean

all clean install uninstall: subdirs

clean:
	$(RM) *~

.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(RULE)
