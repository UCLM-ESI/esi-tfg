; -*- mode:lisp -*-

;| It provides zoom on emacs in a similar way to web browsers or document
;| suites. In provides next keystrokes:
;|
;| - C-minus or C-mousewheel-down: decrease font size.
;| - C-plus or C-mousewheel-up: increase font size.
;| - C-0 revert font size to default.


; http://www.gnu.org/s/emacs/manual/html_node/elisp/Key-Binding-Commands.html
; http://hexmode.openweblog.com/532156.html
; http://stackoverflow.com/questions/4120334/emacs-is-it-possible-to-get-the-action-of-c-x-c-reduce-buffer-font-size-in-e
; http://stackoverflow.com/questions/2091881/emacs-font-sizing-with-ctrl-key-and-mouse-scroll

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [(control ?+)] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(global-set-key [(control ?-)] 'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-increase 0)))
