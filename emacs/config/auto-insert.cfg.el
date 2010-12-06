; -*- mode:lisp -*-
; http://www.emacswiki.org/emacs/AutoInsertMode

(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "/usr/share/arco-tools/emacs/template/")  ; where de templates are
(setq auto-insert-query nil)  ; don't ask about insertions
(define-auto-insert "\.py" "header.py")
(define-auto-insert "\.sh" "header.sh")
(define-auto-insert "\.tex" "template.tex")
