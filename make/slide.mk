# requires: unovonv, pdfjam, pdftk
#
# SRC=$(wildcard *.odp)
# PDF1=$(notdir $(patsubst %.odp, %.pdf, $(SRC)))
# PDF3=$(patsubst %.pdf, %.1x3.pdf, $(PDF1))
# PDFM=$(patsubst %.pdf, %.mor.pdf, $(PDF1))
#
# PDF=$(PDF1) $(PDF3) $(PDFM)
#
# all:  $(PDF)

%.pdf: %.odp
	odt2pdf $<

%.1x3.pdf: %.pdf
	pdfnup --nup 1x3 --offset "-3cm 0" --trim "-2cm -2cm -2cm -2cm" $< --outfile $@

%.first.pdf: %.pdf
	pdfnup --pages 1 --paper a4paper --delta "0.8cm 0.8cm" --frame true --nup 1x1 $< --outfile $@

%.2x2.pdf: %.pdf
	pdfnup --pages 2- --paper a4paper --delta "0.8cm 0.8cm" --frame true --nup 2x2 $< --outfile $@

%.mor.pdf: %.first.pdf %.2x2.pdf
	pdftk $^ cat output aux-$@
	pdfnup --nup 1x2 --paper a4paper --scale 0.9 --delta "0.45cm 0.45cm" aux-$@ --outfile $@
	$(RM) aux-$@

# clean:
# 	$(RM) temp *~ $(PDF)
