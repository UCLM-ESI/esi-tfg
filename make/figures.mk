
#-- dia	 ----------------------------------------------------

%.eps: %.dia
	dia -n -e $@ -t eps $<

%.png: %.dia
	dia -n -e $@ -t png $<


#-- inkscape -----------------------------------------------

PNGPPP=150
# If you want other quality put next in your Makefile:
#
# include figures.mk
# PNGPPP = <your quality>

%.png: %.svg
	inkscape -d $(PNGPPP) -e $@ $<

%.pdf: %.svg
	inkscape -A  $@ --export-text-to-path $<
