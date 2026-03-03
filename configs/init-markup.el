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


;;; Texinfo

(require 'texinfo)

(defun yet-texinfo-mode ()
  (setq-local fill-column 70
              sentence-end-double-space t)
  (auto-fill-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'texinfo-mode-hook 'yet-texinfo-mode)
