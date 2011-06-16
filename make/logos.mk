
URL=https://arco.esi.uclm.es/svn/public/doc/logos
LOGOSDIR=figures/logos

.PRECIOUS: $(LOGOSDIR)/%.svg
 
$(LOGOSDIR)/%.svg: | $(LOGOSDIR)
	$(shell wget $(URL)/$(notdir $@) -O $@)

$(LOGOSDIR)/%.png: | $(LOGOSDIR)
	$(shell wget $(URL)/$(notdir $@) -O $@)

$(LOGOSDIR)/%.pdf: | $(LOGOSDIR)
	$(shell wget $(URL)/$(notdir $@) -O $@)

$(LOGOSDIR):
	@mkdir -p figures/logos



preview_logo_emblema_informatica.svg:
	$(shell eog $(URL)/emblema_informatica.svg)

preview_logo_arco.svg:
	$(shell eog $(URL)/arco.svg)

preview_logo_escudo_uclm.svg:
	$(shell eog $(URL)/escudo_uclm.svg)

preview_logo_escudo_tsi.svg:
	$(shell eog $(URL)/tsi.svg)


# Para usar la redirección
#	curl -L http://arco.esi.uclm.es/logos/$(notdir $@) -o $@
