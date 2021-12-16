(defun custom/setup-general ()
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-response-timeout 1))

(defun custom/setup-rust ()
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-parameter-hints)
  (lsp-rust-analyzer-max-inlay-hint-length 15)
  (lsp-rust-server 'rust-analyzer))

(defun custom/setup-fsharp ()
  
  )

(defun custom/setup-lsp-hook ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . custom/setup-lsp-hook)
  :custom
  (setup-general)
  (setup-rust)
  (setup-fsharp)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil)
  :bind
  ("C-c r" . lsp-ui-sideline-apply-code-actions))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy
  :after lsp)

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.5))

(use-package flycheck)

(use-package haskell-mode)
