
all: modular-emacs-conf.html

SOURCES=$(wildcard *.cfg.el)

install: all
	scp modular-emacs-conf.html develsite:web/static

%.html: %.rst $(SOURCES) gen-doc.py
	rst2html --generator --date --stylesheet ./style.css $< $@

%.1: $.rst $(SOURCES) gen-doc.py
	rst2man $< $@

modular-emacs-conf.rst: $(SOURCES) Makefile
	./gen-doc.py $@

clean:
	$(RM) *.html *.1 modular-emacs-conf.rst
