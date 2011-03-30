

URL=https://arco.esi.uclm.es/svn/public/doc/logos
LOGOSDIR=figures/logos

$(LOGOSDIR)/emblema_informatica.svg: | $(LOGOSDIR)
	$(shell wget $(URL)/$(notdir $@) -O $@)

$(LOGOSDIR)/arco.svg: | $(LOGOSDIR)
	$(shell wget $(URL)/$(notdir $@) -O $@)

$(LOGOSDIR):
	@mkdir -p figures/logos

preview_logo_emblema_informatica.svg:
	$(shell eog $(URL)/emblema_informatica.svg)

preview_logo_arco.svg:
	$(shell eog $(URL)/arco.svg)
