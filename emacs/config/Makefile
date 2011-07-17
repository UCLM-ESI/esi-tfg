
all: modular-emacs-conf.html

%.html: %.rst gen-doc.py
	rst2html --link-stylesheet --stylesheet ./style.css $< $@

%.1: $.rst gen-doc.py
	rst2man $< $@

modular-emacs-conf.rst: $(wildcard *.conf.el)
	./gen-doc.py $@

clean:
	$(RM) *.html *.1 modular-emacs-conf.rst
