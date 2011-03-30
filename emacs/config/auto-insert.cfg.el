; -*- mode:lisp -*-
; http://www.emacswiki.org/emacs/AutoInsertMode

(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "/usr/share/arco-tools/emacs/template/")  ; where the templates are
(setq auto-insert-query nil)  ; don't ask about insertions
(define-auto-insert "\.py" "header.py.tmpl")
(define-auto-insert "\.rb" "header.rb.tmpl")
(define-auto-insert "\.sh" "header.sh.tmpl")
(define-auto-insert "\.cpp" "header.cpp.tmpl")
(define-auto-insert "\.cc" "header.cpp.tmpl")
(define-auto-insert "main.tex" "main.tex.tmpl")
