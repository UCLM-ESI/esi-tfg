; -*- tab-width:4; fill-column:90; mode:lisp -*-

(load "flymake.cfg")

; avoid warnings
(declare-function flymake-init-create-temp-buffer-copy "flymake.el")

(when (load "flymake" t)
  (defun flymake-python-checker-init ()
	(let* ((temp-file (flymake-init-create-temp-buffer-copy
					   'flymake-create-temp-inplace))
		   (local-file (file-relative-name temp-file
						(file-name-directory buffer-file-name))))

      (list "/usr/share/arco-tools/flymake-python-checker" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.py\\'" flymake-python-checker-init)))


(add-hook 'python-mode-hook 'flymake-find-file-hook)


(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)


(setq python-check-command "pyflakes")
