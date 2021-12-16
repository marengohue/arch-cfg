;; Enables emacs to use accented chars on non-english keyboard
(require 'iso-transl)

;; Disable suspend on ctrl-Z to avoid frustration
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
