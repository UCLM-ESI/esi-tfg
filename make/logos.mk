

URL="https://arco.esi.uclm.es/svn/public/doc/logos"

figures/logos/esi.svg:
	@mkdir -p figures/logos
	$(shell wget $(URL)/emblema_informatica.svg -O $@)

preview_logo_esi.svg:
	$(shell eog $(URL)/emblema_informatica.svg)
