(use-package fsharp-mode
  :hook (fsharp-mode . lsp-deferred)
  :defer t
  :ensure t)

(use-package highlight-indentation
  :defer t
  :ensure t
  :config
  (setq highlight-indentation-blank-lines t))

(add-hook 'fsharp-mode-hook 'highlight-indentation-mode)

(defun fsharp-add-this-file-to-proj ()
  (interactive)
    (when-let* ((file-long (f-this-file))
                (project (fsharp-mode/find-fsproj file-long))
                (file (f-relative file-long (f-dirname project))))
    (with-current-buffer (find-file-noselect project)
      (goto-char (point-min))
      (unless (re-search-forward file nil t)
        (when (and (re-search-forward "<Compile Include=" nil t)
                   (re-search-backward "<" nil t))
          (insert (format "<Compile Include=\"%s\" />\n    " file))
          (save-buffer))))))

(defun fsharp-remove-this-file-from-proj ()
  (interactive)
  (when-let* ((file-long (f-this-file))
              (project (fsharp-mode/find-fsproj file-long))
              (file (f-relative file-long (f-dirname project))))
    (with-current-buffer (find-file-noselect project)
      (goto-char (point-min))
      (when (re-search-forward (format "<Compile Include=\"%s\" />" file) nil t)
        (move-beginning-of-line 1)
        (kill-line)
        (kill-line)
        (save-buffer)))))

(defun fsharp-compile-project ()
  "Compile project using fake or dotnet."
  (interactive)
  (let ((fake-dir (locate-dominating-file default-directory "build.fsx"))
        (proj (fsharp-mode/find-sln-or-fsproj (or (f-this-file) ""))))
    (cond (fake-dir (let ((default-directory fake-dir)
                          (compile-command "fake build"))
                      (call-interactively 'compile)))
          (proj (let ((compile-command (format "dotnet build \"%s\"" proj)))
                  (call-interactively 'compile)))
          (t (call-interactively 'compile)))))

(defun fsharp-test-project ()
  "Test project using fake or dotnet."
  (interactive)
  (let ((fake-dir (locate-dominating-file default-directory "build.fsx"))
        (proj (fsharp-mode/find-sln-or-fsproj (or (f-this-file) ""))))
    (cond (fake-dir (let ((default-directory fake-dir)
                          (compile-command "fake test"))
                      (call-interactively 'compile)))
          (proj (let ((compile-command (format "dotnet test \"%s\"" proj)))
                  (call-interactively 'compile)))
          (t (call-interactively 'compile)))))


