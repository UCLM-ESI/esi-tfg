; -*- mode:lisp -*-
; http://emacsblog.org/2007/04/09/highlight-the-current-line/

;| Highlight the current line.
;|
;| - Deactivate temporally::
;|
;|     M-x global-hl-line-mode
;|
;| - Deactivate per major-mode::
;|
;|     (add-hook 'ruby-mode-hook 'local-hl-line-mode-off)


(defun local-hl-line-mode-off ()
  (interactive)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

(global-hl-line-mode 1)
(set-face-background 'hl-line "#dfd")
