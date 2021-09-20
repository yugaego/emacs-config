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

