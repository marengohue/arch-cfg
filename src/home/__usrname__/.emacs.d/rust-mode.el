(use-package rust-mode)
(use-package racer)
(use-package company)

;; Activate racer when rust mode starts
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; Add company integration with racer
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Setup automatic completion attempt abandon when racer is unresponsive (e.g. while indexing)
(setq racer-command-timeout 1.0)

;; Setup some automatic completion defaults for company
(setq company-idle-delay 1.0)
(setq company-minimum-prefix-length 2)
