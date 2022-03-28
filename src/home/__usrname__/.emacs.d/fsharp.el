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

(defun mdot/dotnet-is-source-file (src-file)
  (let ((src-ext (f-ext src-file)))
    (or
     (equal src-ext "fs")
     (equal src-ext "cs"))))

(defun mdot/dotnet-check-proj ()
  "Checks the current file for presence in the closest fsproj. Add prompts user to add it to fsproj if it is not found there."
  (when-let* ((file-long (f-this-file))
              (is-source (mdot/dotnet-is-source-file file-long))
              (project (fsharp-mode/find-fsproj file-long))
              (file-relative (f-relative file-long (f-dirname project))))
    (with-current-buffer (find-file-noselect project)
      (goto-char (point-min))
      (unless (re-search-forward file-relative nil t)
        (setq use-dialog-box nil)
        (if (y-or-n-p "Current file is not in project. Add? ")
            (mdot/dotnet-add-to-proj file-long project file-relative))))))

(add-hook 'after-save-hook 'mdot/dotnet-check-proj)

(defun mdot/dotnet-add-to-proj (file-long project file-relative)
  "Attempts to add given file to a project with file-relative compile path"

  (with-current-buffer (find-file-noselect project)
      (goto-char (point-min))
      (unless (re-search-forward file-relative nil t)
        (when (and (re-search-forward "<Compile Include=" nil t)
                   (re-search-backward "<" nil t))
          (insert (format "<Compile Include=\"%s\" />\n    " file-relative))
          (save-buffer)
          (projectile-invalidate-cache nil)))))

(defun dotnet-add-this-file-to-proj ()
  (interactive)
    (when-let* ((file-long (f-this-file))
                (project (fsharp-mode/find-fsproj file-long))
                (file-relative (f-relative file-long (f-dirname project))))

      (mdot/dotnet-add-to-proj file-long project file-relative)))

(defun dotnet-remove-this-file-from-proj ()
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
        (save-buffer)
        (projectile-invalidate-cache nil)))))

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

