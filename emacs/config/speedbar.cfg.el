; -*- mode:lisp -*-
; author: David.Villa@uclm.es

;| It provides F9 to show/hide the speedbar, and set position to right.

(require 'speedbar)

(speedbar-add-supported-extension ".ice")
(speedbar-add-supported-extension ".test")

(global-set-key [f9] 'speedbar)

(setq speedbar-default-position (quote right))
