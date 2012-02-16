# -*- mode:makefile -*-
# ----------------------------------------------------------------------
# Required pkgs: unovonv, pdfjam, pdftk
# Optional vars: ODP ODP-IGNORE
# Provided vars: PDF PDF1 PDF3 PDFM
# ----------------------------------------------------------------------

.INTERMEDIATE: *.first.pdf *.2x2.pdf

ODP-IGNORE~=

ODP~=$(filter-out $(ODP-IGNORE), $(wildcard *.odp))
PDF1=$(patsubst %.odp, %.pdf, $(ODP))
PDF3=$(patsubst %.odp, %.1x3.pdf, $(ODP))
PDFM=$(patsubst %.odp, %.2x4.pdf, $(ODP))

PDF=$(PDF1) $(PDF3) $(PDFM)

all:  $(PDF)

%.pdf: %.odp
	odp2pdf $<

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
