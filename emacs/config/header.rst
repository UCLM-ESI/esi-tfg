===========================
Modular emacs configuration
===========================

It is a set of configuration "fragments" that you may use independently.

To use one of these in your Emacs you must install the ``arco-devel`` debian
package adding next line to your ``/etc/apt/sources.list``::

  deb http://babel.esi.uclm.es/arco sid main

And running::

  $ sudo apt-get install arco-devel

Them, write down something like that in your ``~/.emacs``::

  (add-to-list 'load-path "/usr/share/arco-tools/emacs")
  (load "tabbar.cfg")
  (load "maximize.cfg")
