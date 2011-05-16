# Requiere:
# - arco-authors (deb http://babel.esi.uclm.es/arco/ unstable main)
# - curl         (paquete debian oficial)

include /usr/share/arco-tools/latex.mk

main.pdf: figures/emblema_informatica.pdf

figures/emblema_informatica.svg:
	curl https://arco.esi.uclm.es/svn/public/doc/logos/emblema_informatica.unstable.svg -o $@
