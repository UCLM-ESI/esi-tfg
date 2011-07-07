; -*- mode:lisp -*-
; http://www.emacswiki.org/emacs/AutoInsertMode

(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "/usr/share/arco-tools/emacs/template/")  ; where the templates are
(setq auto-insert-query nil)  ; don't ask about insertions

(define-auto-insert "\.py" "empty.py.tmpl")
(define-auto-insert "\.rb" "empty.rb.tmpl")
(define-auto-insert "\.sh" "empty.sh.tmpl")
(define-auto-insert "\.cpp" "empty.cpp.tmpl")
(define-auto-insert "\.cc" "empty.cpp.tmpl")
(define-auto-insert "\.tex" "empty.tex.tmpl")
(define-auto-insert "main.tex" "main.tex.tmpl")
