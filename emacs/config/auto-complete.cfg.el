; -*- mode:lisp -*-

;| Minimal configuration for auto-complete mode. This minor mode is not
;| activated by default. Your must run::
;|
;|   M-x auto-complete-mode


(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
(require 'auto-complete-config)
(ac-config-default)
