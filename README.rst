
arco-pfc
========

Puedes utilizar la clase **arco-pfc** descargando el fichero arco-pfc.cls_, pero es mucho
más práctico instalar el paquete debian/ubuntu. Para descargar el paquete, añade el repo
ejecutando (como root)::

  # echo "deb http://babel.esi.uclm.es/arco sid main" > /etc/apt/sources.list.d/babel.list
  # apt-get update
  # apt-get install arco-archive-keyring

E instala con::

  # apt-get install arco-pfc

Tienes un ejemplo_ de memoria de proyecto y el resultado_ correspondiente en PDF.


.. _arco-pfc.cls:   /arco_group/arco-pfc/src/tip/tex/arco-pfc.cls
.. _ejemplo:        https://bitbucket.org/arco_group/arco-pfc/src/tip/example
.. _resultado:      https://fowler.esi.uclm.es/job/arco-pfc/ws/example/main.pdf
