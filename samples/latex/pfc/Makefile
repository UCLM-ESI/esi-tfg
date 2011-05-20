# Requiere:
# - arco-authors (deb http://babel.esi.uclm.es/arco/ unstable main)
# - curl         (paquete debian oficial)

include /usr/share/arco-tools/latex.mk

main.pdf: figures/emblema_informatica.pdf

figures/emblema_informatica.svg:
	curl -L http://arco.esi.uclm.es/logos/$(notdir $@) -o $@
