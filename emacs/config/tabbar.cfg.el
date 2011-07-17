; -*- mode:lisp -*-
; author: David.Villa@uclm.es

;| A very good customization for tabbar-mode.
;|
;| - Better faces for tabs.
;| - Separate buffers in three independent groups: user files, dired and messages.
;|
;| It provides next keystrokes:
;|
;| - C-S-left and C-S-right to change among buffers in the same group.
;| - C-S-up and C-S-down to change among groups.


(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "gray94" :foreground "gray25" :height 0.8))))
 '(tabbar-highlight ((t (:foreground "blue"))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "white" :weight bold)))))

(require 'tabbar)
(tabbar-mode 1)
(setq tabbar-separator (quote (1)))
(setq tabbar-background-color "gray75")
(setq tabbar-cycle-scope (quote tabs))
(setq tabbar-use-images t)
;
(global-set-key [(control shift t)] 'tabbar-mode)
(global-set-key [(control shift up)] 'tabbar-backward-group)
(global-set-key [(control shift down)] 'tabbar-forward-group)
(global-set-key [(control shift left)] 'tabbar-backward)
(global-set-key [(control shift right)] 'tabbar-forward)
;(global-set-key [(control tab)] 'tabbar-last-selected-tab)
;
(setq tabbar-buffer-groups-function
      (lambda ()
	(list (cond
	       ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs Buffer")
	       ((eq major-mode 'dired-mode) "Dired")
	       (t "User Buffer")
	       ))))
