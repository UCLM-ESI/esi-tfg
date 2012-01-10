; -*- mode:lisp -*-

;| It provides zoom on emacs in a similar way to web browsers or text processors suites.
;|
;| Keystrokes:
;|
;| - C-<plus> or C-mousewheel-up: increases font size.
;| - C-<minus> or C-mousewheel-down: decreases font size.
;| - C-0 reverts font size to default.
;|
;| In contrast to zoom.cfg this version persists across multiple areas
;| of the document with specific minor modes (e.g. noweb documents)

; http://www.emacswiki.org/emacs/GlobalTextScaleMode

(define-globalized-minor-mode
    global-text-scale-mode
    text-scale-mode
  (lambda () (text-scale-mode 1)))

(defun global-text-scale-adjust (inc) (interactive)
       (text-scale-set 1)
       (kill-local-variable 'text-scale-mode-amount)
       (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
       (global-text-scale-mode 1))

(global-set-key [C-mouse-4] '(lambda () (interactive)
			      (global-text-scale-adjust 1)))
(global-set-key [(control ?+)] '(lambda () (interactive)
				 (global-text-scale-adjust 1)))
(global-set-key [C-mouse-5] '(lambda () (interactive)
			      (global-text-scale-adjust -1)))
(global-set-key [(control ?-)] '(lambda () (interactive)
				 (global-text-scale-adjust -1)))
(global-set-key (kbd "C-0") '(lambda () (interactive)
			      (global-text-scale-adjust
			       (- text-scale-mode-amount))
			      (global-text-scale-mode -1)))
