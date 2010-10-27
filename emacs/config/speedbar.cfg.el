(require 'speedbar)

(speedbar-add-supported-extension ".ice")
(speedbar-add-supported-extension ".test")

(global-set-key [f9] 'speedbar)

(setq speedbar-default-position (quote right))
