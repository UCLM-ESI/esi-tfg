# requires: unovonv, pdfjam, pdftk

.INTERMEDIATE: *.first.pdf *.2x2.pdf

IGNORE~=

SRC=$(filter-out $(IGNORE), $(wildcard *.odp))
PDF1=$(notdir $(patsubst %.odp, %.pdf, $(SRC)))
PDF3=$(patsubst %.pdf, %.1x3.pdf, $(PDF1))
PDFM=$(patsubst %.pdf, %.2x4.pdf, $(PDF1))

PDF=$(PDF1) $(PDF3) $(PDFM)

all:  $(PDF)
	echo $(PDF)

%.pdf: %.odp
	odt2pdf $<

%.1x3.pdf: %.pdf
	pdfnup --no-landscape --paper a4paper --scale 0.9 --delta "0.8cm 0.8cm" --frame true --offset "-3cm 0" --nup 1x3 $< --outfile $@

%.first.pdf: %.pdf
	pdfnup --paper a4paper --delta "0.8cm 0.8cm" --frame true --nup 1x1 $< 1 --outfile $@

%.2x2.pdf: %.pdf
	pdfnup --paper a4paper --delta "0.8cm 0.8cm" --frame true --nup 2x2 $< 2- --outfile $@

%.2x4.pdf: %.first.pdf %.2x2.pdf
	pdftk $^ cat output aux-$@
	pdfnup --no-landscape --nup 1x2 --paper a4paper --scale 0.9 --delta "0.45cm 0.45cm" aux-$@ --outfile $@
	$(RM) aux-$@

clean:
	$(RM) temp *~ $(PDF)
