esi-tfg
========

esi-tfg es una clase LaTeX para escribir cómodamente el PFC. Corresponde con la
especificación de formato de la Escuela Superior de Informática de Ciudad Real, pero es
sencillo adaptarla si estudias en otro sitio.

La normativa actual de la ESI de CR se puede encontrar en:

http://webpub.esi.uclm.es/archivos/216/NormativaTFG

Puedes utilizar la clase **esi-tfg** descargando el fichero esi-tfg.cls_, pero es mucho
más útil y práctico instalar el paquete debian (también válido para ubuntu y otros
derivados de debian). Para descargar el paquete, añade el repo ejecutando (como root)::

  # echo "deb http://babel.esi.uclm.es/arco sid main" > /etc/apt/sources.list.d/babel.list
  # apt-get update
  # apt-get install arco-archive-keyring

E instala con::

  # apt-get install esi-tfg

Utilizar el paquete debian tiene varias ventajas:

* Automáticamente convierte las figuras al formato que pongas en tus \includegraphics
* Recompila el documento si cambia alguna de las partes (ficheros incluidos con \input).
* Automáticamente descarga y utiliza el auténtico escudo de informática.
* Incluye un ejemplo completo del documento, listo para adaptar y usar.


Ejemplo
-------

Tienes un ejemplo_ de memoria de proyecto y el resultado_ correspondiente en PDF.


.. _esi-tfg.cls:   /arco_group/esi-tfg/src/tip/tex/esi-tfg.cls
.. _ejemplo:        https://bitbucket.org/arco_group/esi-tfg/src/tip/example
.. _resultado:      http://arco.esi.uclm.es/~david.villa/esi-tfg/main.pdf
