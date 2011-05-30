; -*- mode:lisp -*-

(defvar sgml-set-face)
(defvar sgml-markup-faces)
(defvar sgml-auto-activate-dtd)

(defun psgml-ext ()
(setq sgml-set-face t)  ; without this, all SGML text is in same color
(setq sgml-markup-faces
      '((comment   . font-lock-comment-face)
        (start-tag . font-lock-keyword-face)
        (end-tag   . font-lock-keyword-face)
        (doctype   . font-lock-builtin-face)
        (entity    . font-lock-constant-face))))

(setq-default sgml-indent-data t)
(add-hook 'sgml-mode-hook 'psgml-ext)

; immediate syntax coloring
(setq sgml-auto-activate-dtd t)
