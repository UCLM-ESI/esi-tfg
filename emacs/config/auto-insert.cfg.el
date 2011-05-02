; -*- mode:lisp -*-
; http://www.emacswiki.org/emacs/AutoInsertMode

(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "/usr/share/arco-tools/emacs/template/")  ; where the templates are
(setq auto-insert-query nil)  ; don't ask about insertions

(define-auto-insert "\.py" "header.py")
(define-auto-insert "\.rb" "header.rb")
(define-auto-insert "\.sh" "header.sh")
(define-auto-insert "\.cpp" "header.cpp")
(define-auto-insert "\.cc" "header.cpp")
(define-auto-insert "\.tex" "header.tex")
(define-auto-insert "main.tex" "main.tex.tmpl")

