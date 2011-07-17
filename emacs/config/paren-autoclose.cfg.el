; -*- mode:lisp -*-

;| Automatic close for parentheses (and other pair stuff) when you write the
;| opening one.

;; Auto-insert clossing pair
(defvar skeleton-pair)
(setq skeleton-pair t)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "«" 'skeleton-pair-insert-maybe)
