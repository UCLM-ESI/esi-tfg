#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

import glob


def gen_title(text, level='='):
    return text + '\n' + level * len(text) + '\n\n'


doc = file('doc.rst', 'w')

doc.write('''\
===========================
Modular emacs configuration
===========================

It is a set of configuration "fragments" that you may use independently.

To use one of these in your Emacs you must install the arco-devel debian package
and write down something like that in your ~/.emacs::

  (add-to-list 'load-path "/usr/share/arco-tools/emacs")
  (load "tabbar.cfg")
  (load "maximize.cfg")

''')

for fname in sorted(glob.glob('*.cfg.el')):
    print fname
    doc.write(gen_title(fname[:-3]))

    with file(fname) as fd:
        for line in fd:
            if not line.startswith(';|'):
                continue

            doc.write(line[3:].strip('\n') + '\n')
        doc.write('\n')

doc.close()
