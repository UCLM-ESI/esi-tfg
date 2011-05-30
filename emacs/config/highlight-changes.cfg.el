; -*- tab-width:4; fill-column:90; mode:lisp -*-

; http://emacs-fu.blogspot.com/2009/05/tracking-changes.html

(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil); initially hide
(global-set-key (kbd "<f6>") 'highlight-changes-visible-mode)

(set-face-foreground 'highlight-changes "#0000ff")
(set-face-background 'highlight-changes "#e0e0ff")
(set-face-foreground 'highlight-changes-delete nil)
(set-face-background 'highlight-changes-delete "#ffcccc")
