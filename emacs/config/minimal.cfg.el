; -*- tab-width:4; fill-column:90; mode:lisp -*-

;| Basic customization useful for most of users. It does not provide any keystroke or
;| command.

; do not show welcome screen
(setq inhibit-splash-screen t)

; put scroll-bar at right
(set-scroll-bar-mode 'right)

; answer 'y/n' instead of 'yes/no'
(fset 'yes-or-no-p 'y-or-n-p)

; show column
(setq column-number-mode t)

; highlight matching parenthesis and other
(show-paren-mode 1)

; soft scrolling
(setq scroll-conservatively 1)  ; only one line when cursor goes outside
(setq scroll-step 1)			; down at bottom scrolls only a single line

; highlight selected region
(setq transient-mark-mode t)

; set exec permisions to scripts (files with shebangs)
(setq after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))

; init goal-column (C-x C-n)
; http://www.gnu.org/software/emacs/manual/html_node/emacs/Moving-Point.html#Moving-Point
(put 'set-goal-column 'disabled nil)

; dabbrev expansion is always copied verbatim
; http://www.gnu.org/software/libtool/manual/emacs/Dabbrev-Customization.html
(setq dabbrev-case-replace nil)

; use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

; kill (and thus paste) text from read-only buffer
(setq kill-read-only-ok 1)

; disable C-z on X11 sessions
(when window-system
  (global-unset-key "\C-z")
  (global-unset-key "\C-x\C-z")
  )

; Remember cursor position in edited files
(require 'saveplace)
(setq-default save-place t)

; put file name as frame-title
(setq frame-title-format
  '("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b")) " [%*]"))
