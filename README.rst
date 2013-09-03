arco-pfc
========

arco-pfc es una clase LaTeX para escribir cómodamente el PFC. Corresponde con la
especificación de formato de la Escuela Superior de Informática de Ciudad Real, pero es
sencillo adaptarla si estudias en otro sitio.

La normativa actual de la ESI de CR se puede encontrar en:

http://webpub.esi.uclm.es/archivos/89/NormativaPFC2007

Puedes utilizar la clase **arco-pfc** descargando el fichero arco-pfc.cls_, pero es mucho
más útil y práctico instalar el paquete debian (también válido para ubuntu y otros
derivados de debian). Para descargar el paquete, añade el repo ejecutando (como root)::

  # echo "deb http://babel.esi.uclm.es/arco sid main" > /etc/apt/sources.list.d/babel.list
  # apt-get update
  # apt-get install arco-archive-keyring

E instala con::

  # apt-get install arco-pfc

Utilizar el paquete debian tiene varias ventajas:

* Automáticamente convierte las figuras al formato que pongas en tus \includegraphics
* Recompila el documento si cambia alguna de las partes (ficheros incluidos con \input).
* Automáticamente descarga y utiliza el auténtico escudo de informática.
* Incluye un ejemplo completo del documento, listo para adaptar y usar.


Ejemplo
-------

Tienes un ejemplo_ de memoria de proyecto y el resultado_ correspondiente en PDF.


.. _arco-pfc.cls:   /arco_group/arco-pfc/src/tip/tex/arco-pfc.cls
.. _ejemplo:        https://bitbucket.org/arco_group/arco-pfc/src/tip/example
.. _resultado:      http://arco.esi.uclm.es/~david.villa/arco-pfc/main.pdf
