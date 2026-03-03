;;; init-markup.el --- Human-readable text formats   -*- lexical-binding: t -*-

;;; XML

(require 'sgml-mode)

(with-eval-after-load 'sgml-mode
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . sgml-mode))
  (define-key sgml-mode-map (kbd "C-M-\\") #'sgml-pretty-print))


;;; YAML

(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . conf-mode))


;;; Markdown

(require 'markdown-mode)

(defun yet-markdown-mode ()
  (goto-address-mode 1)
  (auto-fill-mode -1)
  (let ((commands '("markdown" "multimarkdown" "pandoc")))
    (when-let* ((executable (seq-some #'executable-find commands)))
      (setq markdown-command executable))))

(add-hook 'markdown-mode-hook 'yet-markdown-mode)

(defun yet-markdown-to-org ()
  "Export current Markdown file to new .org file via pandoc."
  (interactive)
  (unless buffer-file-name
    (user-error "Buffer is not visiting a file"))
  (unless (executable-find "pandoc")
    (user-error "Executable `pandoc' not found"))
  (let* ((input buffer-file-name)
         (output (concat (file-name-sans-extension input) ".org"))
         (cmd (format
               "pandoc -f markdown -t org --wrap=preserve -o %s %s"
               (shell-quote-argument output)
               (shell-quote-argument input))))
    (shell-command cmd)
    (message "Created %s" output)
    (find-file output)))

;;; Texinfo

(require 'texinfo)

(defun yet-texinfo-mode ()
  (setq-local fill-column 70
              sentence-end-double-space t)
  (auto-fill-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'texinfo-mode-hook 'yet-texinfo-mode)
