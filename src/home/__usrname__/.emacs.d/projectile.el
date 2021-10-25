(use-package projectile
  :config
  (projectile-mode 1)
  (setq projectile-completion-system 'ivy
        projectile-enable-caching t
        projectile-globally-ignored-files
        (append '("~"
                  "#")              
                projectile-globally-ignored-files))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/src")
    (setq projectile-project-search-path '("~/src")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode 1))

(use-package treemacs)

(use-package treemacs-projectile
  :config
  (treemacs-project-follow-mode)
  (treemacs-display-current-project-exclusively)
  :after (treemacs projectile))
