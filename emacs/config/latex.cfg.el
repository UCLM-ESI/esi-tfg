; -*- tab-width:4; fill-column:90; mode:lisp -*-

; Activate and connect RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(defun flymake-get-tex-args (file-name)
  (list "/usr/share/arco-tools/flymake-latex-checker" (list file-name)))
