(use-package counsel
  :bind
  (("C-s" . swiper)
   ("M-x" . counsel-M-x)))

(use-package ivy
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))
