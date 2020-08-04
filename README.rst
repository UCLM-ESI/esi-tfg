esi-tfg
=======

esi-tfg es una clase LaTeX para escribir cómodamente la memoria del TFG (Trabajo Fin de
Grado). Corresponde con la especificación de formato de la Escuela Superior de Informática
de Ciudad Real, pero es sencillo adaptarla si estudias en otro sitio.

La normativa actual de la ESI de CR se puede encontrar en:

* https://pruebasaluuclm.sharepoint.com/sites/esicr/tfg/SitePages/Inicio.aspx

Esta clase LaTeX asume que dispones del paquete texlive_, que es el que se distribuye por
defecto en la mayoría de las distribuciones GNU/Linux, y que también está disponible para
Windows y Mac OSX.

Puedes utilizar la clase **esi-tfg** descargando el fichero esi-tfg.cls_, pero es
altamente recomendado **instalar el paquete debian** (también válido para ubuntu y otros
derivados de debian). Para descargar el paquete, sigue las instrucciones de
https://uclm-arco.github.io/debian/

E instala con::

  # apt-get install esi-tfg

Utilizar el paquete debian tiene varias ventajas muy interesantes:

* Instala todas las dependencias necesarias, con las versiones correctas, incluyendo el fichero `atbeginend.sty <https://github.com/UCLM-ARCO/arco-authors/blob/master/tex/atbeginend.sty>`_.
* Convierte automáticamente las figuras al formato que pongas en tus ``\includegraphics``
* Recompila el documento si cambia alguna de las partes (ficheros incluidos con ``\input``).
* Incluye el logo de la ESI en formato escalable (no se pixela).
* Incluye un ejemplo completo del documento, listo para adaptar y usar.


Si optas por **NO USAR** el paquete debian, tendrás que instalar los siguientes paquetes:

* latex-xcolor
* texlive-latex-extra
* texlive-lang-spanish
* texlive-latex-recommended
* cm-super
* texlive-binaries
* texlive-latex-extra
* texlive-extra-utils
* dblatex
* rubber
* netpbm
* aspell-en

y descargar el fichero atbeginend.sty antes mencionado.


Overleaf
--------

También puedes editar tu proyecto utilizando el editor online overleaf_. Simplemente:

* Crea una cuenta gratuita.
* Pulsa "New Project".
* Elige "Upload Project" y selecciona el fichero `tfg-overleaf-template.zip <https://github.com/UCLM-ESI/esi-tfg/releases/download/latest/tfg-overleaf-template.zip>`_ de este repositorio.
* Modifica el contenido directamente.

O puedes aplicar directamente la plantilla `ESI TFG <https://www.overleaf.com/latex/templates/esi-tfg/zqxnfvqxgtdw>`_ pulsando en "Open as template".

.. _overleaf:       http://www.overleaf.com

__ escudo_
.. _escudo:         https://crysol.org/2009-03-10/el-autntico-emblema-de-informtica.html


pre-tfg
-------

Es la clase pre-tfg.cls_ para preparar el anteproyecto, conforme a la normativa.


tfm
---

También se incluye la clase esi-tfm.cls_ para preparar el documento relativo al Trabajo Fin de Máster, conforme a la normativa existente.


Ejemplos
--------

Hay ejemplos disponibles que pueden servir como punto de partida:

* Fuente del anteproyecto_,
* Fuente de la memoria de TFG_, y
* Fuente de la memoria de TFM_.

.. _texlive:        http://www.tug.org/texlive/
.. _pre-tfg.cls:    https://github.com/UCLM-ESI/esi-tfg/blob/master/tex/pre-tfg.cls
.. _esi-tfg.cls:    https://github.com/UCLM-ESI/esi-tfg/blob/master/tex/esi-tfg.cls
.. _esi-tfm.cls:    https://github.com/UCLM-ESI/esi-tfg/blob/master/tex/esi-tfm.cls
.. _anteproyecto:   https://github.com/UCLM-ESI/esi-tfg/tree/master/examples/anteproyecto
.. _TFG:            https://github.com/UCLM-ESI/esi-tfg/tree/master/examples/tfg
.. _TFM:            https://github.com/UCLM-ESI/esi-tfg/tree/master/examples/tfm

.. Local Variables:
.. fill-column: 90
.. End:
