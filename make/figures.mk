
#-- netpbm ----------------------------------------------------

%.jpg: %.png
	pngtopnm $< | pnmtojpeg > $@

#-- dia	 ----------------------------------------------------

%.eps: %.dia
	dia -n -e $@ -t eps $<

%.png: %.dia
	dia -n -e $@ -t png $<


#-- inkscape -----------------------------------------------

PNGPPP?=150
# If you want other quality put next in your Makefile:
#
# include figures.mk
# PNGPPP = <your quality>

%.pdf: %.dia
	inkscape -A $@ --export-text-to-path $<

%.png: %.svg
	inkscape -d $(PNGPPP) -e $@ $<

%.300.png: %.svg
	inkscape -d 300 -e $@ $<

%.pdf: %.svg
	inkscape -A  $@ --export-text-to-path $<

#-- libreoffice -----------------------------------------------

%.jpg: %.ods
	unoconv -f html $<
	mv $*_html_*.jpg $@
	rm $*.html
