;;; init-markdown.el --- Configure markdown-mode package   -*- lexical-binding: t -*-

(when (executable-find "multimarkdown")
  (setq markdown-command "multimarkdown"))

