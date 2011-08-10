
all: modular-emacs-conf.html

%.html: %.rst gen-doc.py
	rst2html --generator --date --stylesheet ./style.css $< $@

%.1: $.rst gen-doc.py
	rst2man $< $@

modular-emacs-conf.rst: $(wildcard *.conf.el) Makefile
	./gen-doc.py $@

clean:
	$(RM) *.html *.1 modular-emacs-conf.rst
