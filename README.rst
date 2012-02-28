
arco-pfc
========

Puedes utilizar la clase **arco-pfc** descargando el fichero arco-pfc.cls_, pero es mucho
más útil y práctico instalar el paquete debian/ubuntu. Para descargar el paquete, añade el
repo ejecutando (como root)::

  # echo "deb http://babel.esi.uclm.es/arco sid main" > /etc/apt/sources.list.d/babel.list
  # apt-get update
  # apt-get install arco-archive-keyring

E instala con::

  # apt-get install arco-pfc

Utilizar el paquete debian tiene varias ventajas:

* Automáticamente convierte las figuras al formato que pontas en tus \includegraphics
* Recompila el documento si cambia alguna de las partes (ficheros incluidos con \input).
* Descarga automáticamente y utiliza el autentico escudo de informática.
* Incluye un ejemplo de memoria completo, listo para adaptar y usar.


Ejemplo
-------

Tienes un ejemplo_ de memoria de proyecto y el resultado_ correspondiente en PDF.


.. _arco-pfc.cls:   /arco_group/arco-pfc/src/tip/tex/arco-pfc.cls
.. _ejemplo:        https://bitbucket.org/arco_group/arco-pfc/src/tip/example
.. _resultado:      https://fowler.esi.uclm.es/job/arco-pfc/ws/example/main.pdf
