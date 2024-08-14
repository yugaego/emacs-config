;;; init-markup.el --- Markup languages initialization   -*- lexical-binding: t -*-

(require 'sgml-mode)

(with-eval-after-load 'sgml-mode
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . sgml-mode))
  (define-key sgml-mode-map (kbd "C-M-\\") #'sgml-pretty-print))


(add-to-list 'auto-mode-alist '("\\.yml\\'" . conf-mode))


(require 'markdown-mode)

(with-eval-after-load 'markdown-mode
  (when (executable-find "multimarkdown")
    (setq markdown-command "multimarkdown")))

(defun yet-markdown-mode ()
  (goto-address-mode 1)
  (auto-fill-mode 1))

(add-hook 'markdown-mode-hook 'yet-markdown-mode)


(require 'texinfo)

(defun yet-texinfo-mode ()
  (setq-local fill-column 70
              sentence-end-double-space t)
  (auto-fill-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'texinfo-mode-hook 'yet-texinfo-mode)

