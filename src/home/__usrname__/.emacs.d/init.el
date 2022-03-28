(defun load-cfg (cfg-name)
    (load (expand-file-name cfg-name user-emacs-directory)))

(load-cfg "package")
(load-cfg "keys")
(load-cfg "style")
(load-cfg "modeline")
(load-cfg "indent")
(load-cfg "counsel")
(load-cfg "lsp")
(load-cfg "rust")
(load-cfg "fsharp")
(load-cfg "which-key")
(load-cfg "projectile")
(load-cfg "org")

;; We are ready, man!
(message "Welcome back!")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" default))
 '(org-agenda-files '("~/src/fprospect/doc/Features.org"))
 '(package-selected-packages
   '(ligature highlight-indentation r lsp-ivy lsp-treemacs fsharp-mode all-the-icons solaire-mode doom-themes treemacs-projectile treemacs haskell-mode terraform-mode rustic flycheck lsp-ui lsp-mode ivy-rich rich-ivy rainbow-delimiters which-ley projectile mood-line company use-package counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
