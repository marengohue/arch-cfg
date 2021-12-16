(use-package fsharp-mode
  :hook (fsharp-mode . lsp-deferred)
  :defer t
  :ensure t)
