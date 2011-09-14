TOOLDIR=/usr/share/arco-tools

MAIN ?= main.nw
TARGET = $(MAIN:.nw=.pdf)

all:: $(TARGET)

%.tex: %.nw
	noweave -delay -index $< > $@

include $(TOOLDIR)/latex.mk