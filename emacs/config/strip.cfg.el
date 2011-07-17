; -*- mode:lisp -*-
; author: David.Villa@uclm.es

;| On save, automatically:
;|
;| - remove trailing spaces at end of lines,
;| - assure an empty line at end of buffer

(custom-set-variables '(whitespace-style (quote (trailing spaces tabs lines newline empty))))

; assure the file ends with newline at save
(setq require-final-newline t)

;; remove trailing blanks at end of lines and empty lines at begin and end of buffer
(add-hook 'before-save-hook 'whitespace-cleanup)
