; -*- mode:lisp -*-

; assure the file ends with newline at save
(setq require-final-newline t)

;; remove trailing blanks at end of lines and empty lines at end of buffer
(add-hook 'before-save-hook 'whitespace-cleanup)
