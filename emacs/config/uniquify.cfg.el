; -*- mode:lisp -*-

;| uniquify customization to use directory instead of a number to differentiate
;| buffers with the same filename.
;|
;| Keystrokes: None

;; differentiate buffer with same name using its directory instead of a number
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
