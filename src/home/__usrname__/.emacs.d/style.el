;; Disable the toolbars and such
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq inhibit-startup-message t)

;; Use the beautiful purple theme
;; and custom treemacs iconset
(use-package all-the-icons)
(use-package doom-themes
  :ensure t
  :config
    (setq doom-themes-enable-bold t)
    (setq doom-themes-enable-italic t)
    (load-theme 'doom-horizon t)
    (doom-themes-visual-bell-config)
    (doom-themes-treemacs-config)
    (setq doom-themes-treemacs-theme "doom-atom")
)

(use-package solaire-mode)
(solaire-global-mode +5)

;; Setup font face
(set-face-attribute 'default nil
                :family "Iosevka Term SS08"
                :weight 'light
                :slant 'normal
                :height 130)

;; Setup line nums
(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Setup rainbow delims
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
